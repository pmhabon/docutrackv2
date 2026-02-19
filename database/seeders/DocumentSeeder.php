<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Document;
use App\Models\User;

class DocumentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::where('role', 'program_head')->first();

        if ($user) {
            Document::create([
                'title' => 'BSIT Program Curriculum',
                'description' => 'Updated curriculum for Bachelor of Science in Information Technology',
                'file_path' => 'bsit-curriculum.pdf',
                'file_type' => 'application/pdf',
                'user_id' => $user->id,
                'campus' => $user->campus,
                'college' => $user->college,
                'program' => $user->program,
                'status' => 'approved',
            ]);

            Document::create([
                'title' => 'Capstone Project Guidelines',
                'description' => 'Guidelines and requirements for final capstone project',
                'file_path' => 'capstone-guidelines.pdf',
                'file_type' => 'application/pdf',
                'user_id' => $user->id,
                'campus' => $user->campus,
                'college' => $user->college,
                'program' => $user->program,
                'status' => 'pending',
            ]);
        }
    }
}
