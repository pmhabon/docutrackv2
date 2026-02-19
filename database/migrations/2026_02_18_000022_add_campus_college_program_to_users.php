<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            if (! Schema::hasColumn('users', 'campus')) {
                $table->string('campus')->nullable()->after('address');
            }
            if (! Schema::hasColumn('users', 'college')) {
                $table->string('college')->nullable()->after('campus');
            }
            if (! Schema::hasColumn('users', 'program')) {
                $table->string('program')->nullable()->after('college');
            }
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            if (Schema::hasColumn('users', 'program')) {
                $table->dropColumn('program');
            }
            if (Schema::hasColumn('users', 'college')) {
                $table->dropColumn('college');
            }
            if (Schema::hasColumn('users', 'campus')) {
                $table->dropColumn('campus');
            }
        });
    }
};
