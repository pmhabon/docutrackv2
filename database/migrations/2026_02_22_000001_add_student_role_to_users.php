<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        // Make sure existing roles are preserved; add 'student'
        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['superadmin','campus_director','dean','program_head','faculty','student'])->nullable()->change();
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['superadmin','campus_director','dean','program_head','faculty'])->nullable()->change();
        });
    }
};
