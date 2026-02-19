<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class ProgramHeadSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $email = 'program_head_bsit@docutrack.local';

        if (!User::where('email', $email)->exists()) {
            User::create([
                'firstName' => 'Program',
                'lastName' => 'Head',
                'email' => $email,
                'password' => Hash::make('ProgramHead123!'),
                'role' => 'program_head',
                'campus' => 'Main Campus',
                'college' => 'CAS',
                'program' => 'BSIT',
            ]);
        }
    }
}
