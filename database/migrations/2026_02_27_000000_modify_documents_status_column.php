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
        // Change `status` from ENUM to VARCHAR to allow values like 'pending formatting'
        DB::statement("ALTER TABLE `documents` MODIFY `status` VARCHAR(50) NOT NULL DEFAULT 'pending'");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Convert unknown statuses back to 'pending' then convert column to ENUM
        DB::statement("UPDATE `documents` SET `status` = 'pending' WHERE `status` NOT IN ('pending','approved','rejected')");
        DB::statement("ALTER TABLE `documents` MODIFY `status` ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending'");
    }
};
