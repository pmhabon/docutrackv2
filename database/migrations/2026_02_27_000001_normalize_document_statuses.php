<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Normalize legacy human-readable status values to canonical snake_case keys
        DB::table('documents')->where('status', 'no commenters assigned')->update(['status' => 'no_reviewers_assigned']);
        DB::table('documents')->where('status', 'pending formatting')->update(['status' => 'pending_formatting']);
        // If needed, ensure 'reviews_done' is already the canonical key (no-op otherwise)
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Revert canonical keys back to legacy human-readable values (only if you want rollback to previous state)
        DB::table('documents')->where('status', 'no_reviewers_assigned')->update(['status' => 'no commenters assigned']);
        DB::table('documents')->where('status', 'pending_formatting')->update(['status' => 'pending formatting']);
    }
};
