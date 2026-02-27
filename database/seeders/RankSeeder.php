<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RankSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $names = ['Professor','Associate Professor','Assistant Professor','Lecturer','Instructor','Student'];
        foreach ($names as $n) {
            DB::table('ranks')->insertOrIgnore(['name' => $n]);
        }
    }
}