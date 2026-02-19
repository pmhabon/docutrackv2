<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up()
    {
        // Ensure the status enum contains 'reviews_done' before updating rows
        DB::statement("ALTER TABLE `documents` MODIFY `status` ENUM('pending','approved','rejected','reviews_done') NOT NULL DEFAULT 'pending'");

        // For each document that has assigned commenters, mark as 'reviews_done'
        // if every assigned commenter has at least one comment (any action); otherwise 'pending'.
        $documents = DB::table('documents')->select('id')->get();
        foreach ($documents as $d) {
            $docId = $d->id;
            $commenters = DB::table('document_commenters')->where('document_id', $docId)->pluck('user_id')->toArray();
            if (empty($commenters)) continue;

            $pending = false;
            foreach ($commenters as $uid) {
                $last = DB::table('comments')
                    ->where('document_id', $docId)
                    ->where('user_id', $uid)
                    ->orderBy('created_at', 'desc')
                    ->first();
                if (! $last) { $pending = true; break; }
            }

            DB::table('documents')->where('id', $docId)->update(['status' => $pending ? 'pending' : 'reviews_done']);
        }
    }

    public function down()
    {
        // no-op rollback
    }
};
