<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class DeanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $email = 'dean_cas_tagudin@docutrack.local';

        if (!User::where('email', $email)->exists()) {
            User::create([
                'firstName' => 'CAS',
                'lastName' => 'Dean',
                'email' => $email,
                'password' => Hash::make('Dean123!'),
                'role' => 'dean',
                'campus' => 'Tagudin',
                'college' => 'CAS',
                'program' => 'ETC',
            ]);
        }
    }
}
