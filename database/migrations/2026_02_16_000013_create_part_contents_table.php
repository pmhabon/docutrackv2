<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('part_contents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('document_part_id')->constrained('document_parts')->onDelete('cascade');
            $table->text('content');
            $table->integer('page_number')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('part_contents');
    }
};
