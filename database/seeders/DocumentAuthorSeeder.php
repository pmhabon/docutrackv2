<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\DocumentAuthor;
use App\Models\Document;

class DocumentAuthorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create sample authors
        $authors = [
            [
                'first_name' => 'Dr. Maria',
                'last_name' => 'Santos',
                'email' => 'maria.santos@university.edu',
                'affiliation' => 'College of Engineering',
            ],
            [
                'first_name' => 'Prof. Juan',
                'last_name' => 'Reyes',
                'email' => 'juan.reyes@university.edu',
                'affiliation' => 'College of Arts and Sciences',
            ],
            [
                'first_name' => 'Dr. Ana',
                'last_name' => 'Garcia',
                'email' => 'ana.garcia@university.edu',
                'affiliation' => 'College of Engineering',
            ],
            [
                'first_name' => 'Prof. Carlos',
                'last_name' => 'Mendoza',
                'email' => 'carlos.mendoza@university.edu',
                'affiliation' => 'College of Business',
            ],
            [
                'first_name' => 'Dr. Rosa',
                'last_name' => 'Fernandez',
                'email' => 'rosa.fernandez@university.edu',
                'affiliation' => 'College of Education',
            ],
            [
                'first_name' => 'Prof. Miguel',
                'last_name' => 'Lopez',
                'email' => 'miguel.lopez@university.edu',
                'affiliation' => 'College of Arts and Sciences',
            ],
            [
                'first_name' => 'Dr. Patricia',
                'last_name' => 'Navarro',
                'email' => 'patricia.navarro@university.edu',
                'affiliation' => 'College of Engineering',
            ],
            [
                'first_name' => 'Prof. Alfonso',
                'last_name' => 'Ruiz',
                'email' => 'alfonso.ruiz@university.edu',
                'affiliation' => 'College of Business',
            ],
        ];

        foreach ($authors as $authorData) {
            DocumentAuthor::firstOrCreate(
                ['email' => $authorData['email']],
                $authorData
            );
        }

        // Attach random authors to existing documents
        $documents = Document::all();
        $allAuthors = DocumentAuthor::all();

        if ($allAuthors->count() > 0 && $documents->count() > 0) {
            foreach ($documents as $document) {
                // Skip if already has authors
                if ($document->authors()->count() === 0) {
                    // Attach 1-3 random authors
                    $randomAuthors = $allAuthors->random(min(3, $allAuthors->count()))->pluck('id')->toArray();
                    $document->authors()->attach($randomAuthors);
                }
            }
        }
    }
}
