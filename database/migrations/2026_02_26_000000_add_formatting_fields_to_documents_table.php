<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFormattingFieldsToDocumentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('documents', function (Blueprint $table) {
            $table->string('format_font')->nullable()->after('file_type');
            $table->string('line_spacing')->nullable()->after('format_font');
            $table->string('margin_preset')->nullable()->after('line_spacing');
            $table->decimal('margin_top', 5, 2)->nullable()->after('margin_preset');
            $table->decimal('margin_bottom', 5, 2)->nullable()->after('margin_top');
            $table->decimal('margin_left', 5, 2)->nullable()->after('margin_bottom');
            $table->decimal('margin_right', 5, 2)->nullable()->after('margin_left');
            $table->string('citation_style')->nullable()->after('margin_right');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('documents', function (Blueprint $table) {
            $table->dropColumn([
                'format_font', 'line_spacing', 'margin_preset',
                'margin_top', 'margin_bottom', 'margin_left', 'margin_right',
                'citation_style'
            ]);
        });
    }
}
