<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class StudentSeeder extends Seeder
{
    public function run()
    {
        $email = 'student@example.com';
        if (!User::where('email', $email)->exists()) {
            User::create([
                'firstName' => 'Sample',
                'lastName' => 'Student',
                'email' => $email,
                'password' => bcrypt('password'),
                'role' => 'student',
                'college' => null,
                'program' => null,
            ]);
        }
    }
}
