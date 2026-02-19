<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Update existing data to ensure compatibility with the new enum values
        \DB::table('users')->whereNotIn('role', ['campus_director', 'dean', 'program_head'])->update(['role' => 'program_head']);

        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['campus_director', 'dean', 'program_head', 'faculty'])->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['campus_director', 'dean', 'program_head'])->change();
        });
    }
};