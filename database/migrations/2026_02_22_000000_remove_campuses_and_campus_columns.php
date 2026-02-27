<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Drop campus columns from various tables
        if (Schema::hasColumn('users', 'campus')) {
            Schema::table('users', function (Blueprint $table) {
                $table->dropColumn('campus');
            });
        }

        if (Schema::hasTable('documents') && Schema::hasColumn('documents', 'campus')) {
            Schema::table('documents', function (Blueprint $table) {
                $table->dropColumn(['campus']);
            });
        }

        if (Schema::hasTable('activity_logs') && Schema::hasColumn('activity_logs', 'campus')) {
            Schema::table('activity_logs', function (Blueprint $table) {
                $table->dropColumn(['campus']);
            });
        }

        if (Schema::hasTable('file_uploads') && Schema::hasColumn('file_uploads', 'campus')) {
            Schema::table('file_uploads', function (Blueprint $table) {
                $table->dropColumn(['campus']);
            });
        }

        // Remove campus_id foreign from colleges
        if (Schema::hasTable('colleges') && Schema::hasColumn('colleges', 'campus_id')) {
            Schema::table('colleges', function (Blueprint $table) {
                // drop foreign if exists
                try {
                    $table->dropForeign(['campus_id']);
                } catch (\Exception $e) {
                    // ignore if foreign not present
                }
                $table->dropColumn('campus_id');
            });
        }

        // Finally drop campuses table
        if (Schema::hasTable('campuses')) {
            Schema::dropIfExists('campuses');
        }
    }

    public function down(): void
    {
        // recreate a minimal campuses table
        if (! Schema::hasTable('campuses')) {
            Schema::create('campuses', function (Blueprint $table) {
                $table->id();
                $table->string('name')->unique();
                $table->string('location')->nullable();
                $table->text('description')->nullable();
                $table->timestamps();
            });
        }

        // add campus column back as nullable string (safe default)
        if (! Schema::hasColumn('users', 'campus')) {
            Schema::table('users', function (Blueprint $table) {
                $table->string('campus')->nullable();
            });
        }

        if (Schema::hasTable('documents') && ! Schema::hasColumn('documents', 'campus')) {
            Schema::table('documents', function (Blueprint $table) {
                $table->string('campus')->nullable();
            });
        }

        if (Schema::hasTable('activity_logs') && ! Schema::hasColumn('activity_logs', 'campus')) {
            Schema::table('activity_logs', function (Blueprint $table) {
                $table->string('campus')->nullable();
            });
        }

        if (Schema::hasTable('file_uploads') && ! Schema::hasColumn('file_uploads', 'campus')) {
            Schema::table('file_uploads', function (Blueprint $table) {
                $table->string('campus')->nullable();
            });
        }

        if (Schema::hasTable('colleges') && ! Schema::hasColumn('colleges', 'campus_id')) {
            Schema::table('colleges', function (Blueprint $table) {
                $table->foreignId('campus_id')->nullable()->constrained('campuses')->nullOnDelete();
            });
        }
    }
};
