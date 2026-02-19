<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ActivityLog;
use App\Models\User;

class ActivityLogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();

        foreach ($users as $user) {
            ActivityLog::create([
                'user_id' => $user->id,
                'action' => 'login',
                'details' => 'User logged in',
                'campus' => $user->campus,
                'college' => $user->college,
                'program' => $user->program,
                'ip' => '127.0.0.1',
            ]);

            ActivityLog::create([
                'user_id' => $user->id,
                'action' => 'view_dashboard',
                'details' => 'User accessed dashboard',
                'campus' => $user->campus,
                'college' => $user->college,
                'program' => $user->program,
                'ip' => '127.0.0.1',
            ]);
        }
    }
}
