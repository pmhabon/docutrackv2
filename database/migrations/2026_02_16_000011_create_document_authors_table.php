<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('document_authors', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('email')->nullable();
            $table->string('affiliation')->nullable();
            $table->timestamps();
        });

        Schema::create('document_author_document', function (Blueprint $table) {
            $table->id();
            $table->foreignId('document_id')->constrained('documents')->onDelete('cascade');
            $table->foreignId('document_author_id')->constrained('document_authors')->onDelete('cascade');
            $table->string('role')->nullable();
            $table->timestamps();

            $table->unique(['document_id','document_author_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('document_author_document');
        Schema::dropIfExists('document_authors');
    }
};
