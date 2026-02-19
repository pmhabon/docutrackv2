<?php

namespace Database\Migrations;

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('file_uploads', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('document_id')->nullable()->constrained('documents')->onDelete('set null');
            $table->string('original_name');
            $table->string('stored_name');
            $table->string('file_path');
            $table->string('mime_type');
            $table->unsignedBigInteger('file_size');
            $table->string('campus')->nullable();
            $table->string('college')->nullable();
            $table->string('program')->nullable();
            $table->string('status')->default('uploaded');
            $table->text('metadata')->nullable();
            $table->timestamps();
            
            $table->index('user_id');
            $table->index('document_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('file_uploads');
    }
};
