<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Rank;
use Illuminate\Support\Facades\Hash;

class FacultyUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $rank = Rank::first();
        $rankName = $rank ? $rank->name : null;

        User::updateOrCreate(
            ['email' => 'faculty@example.com'],
            [
                'firstName' => 'Faculty',
                'lastName' => 'User',
                'middleName' => null,
                'password' => Hash::make('Password123!'),
                'role' => 'faculty',
                'contactNumber' => null,
                'address' => null,
                'rank' => $rankName,
            ]
        );
    }
}
