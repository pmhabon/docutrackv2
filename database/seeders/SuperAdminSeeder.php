<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $email = 'superadmin@docutrack.local';

        if (!User::where('email', $email)->exists()) {
            User::create([
                'firstName' => 'Super',
                'lastName' => 'Admin',
                'email' => $email,
                'password' => Hash::make('SuperAdmin123!'),
                'role' => 'superadmin',
                'campus' => 'Main Campus',
                'college' => 'CAS',
                'program' => 'ETC',
            ]);
        }
    }
}
