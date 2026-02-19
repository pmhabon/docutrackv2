<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\DocumentType;

class DocumentTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $types = [
            'Policy',
            'Form',
            'Guideline',
            'Report',
            'Curriculum',
            'Syllabus',
            'Thesis',
        ];

        foreach ($types as $t) {
            DocumentType::firstOrCreate(['name' => $t]);
        }
    }
}
