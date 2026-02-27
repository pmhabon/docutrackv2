<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class CampusDirectorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $email = 'campus_director@docutrack.local';

        if (!User::where('email', $email)->exists()) {
            User::create([
                'firstName' => 'Campus',
                'lastName' => 'Director',
                'email' => $email,
                'password' => Hash::make('CampusDir123!'),
                'role' => 'campus_director',
                // campus field removed for single-campus deployment
                'college' => 'CAS',
                'program' => 'ETC',
            ]);
        }
    }
}
