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
        // For any document that has no assigned commenters and is not pending_formatting,
        // set a canonical status of 'no_reviewers_assigned'.
        DB::statement(<<<'SQL'
UPDATE `documents` d
LEFT JOIN (
  SELECT `document_id`, COUNT(*) AS cnt FROM `document_commenters` GROUP BY `document_id`
) dc ON d.id = dc.document_id
SET d.status = 'no_reviewers_assigned'
WHERE COALESCE(dc.cnt,0) = 0 AND d.status != 'pending_formatting';
SQL
        );
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // no-op: do not revert statuses on rollback
    }
};
