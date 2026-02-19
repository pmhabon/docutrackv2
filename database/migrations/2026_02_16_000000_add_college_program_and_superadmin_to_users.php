<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('college')->nullable()->after('campus');
            $table->string('program')->nullable()->after('college');
        });

        // Try to add 'superadmin' to role enum for MySQL/Postgres. If it fails on sqlite, ignore.
        try {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql', 'pgsql'])) {
                DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('superadmin','campus_director','dean','program_head') NULL");
            }
        } catch (\Throwable $e) {
            // ignore — developer can adjust enum manually for their DB
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['college', 'program']);
        });

        // Revert role enum change is DB-specific; skip here.
    }
};
