<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\College;
use App\Models\Campus;

class CollegeSeeder extends Seeder
{
    public function run()
    {
        $main = Campus::where('name', 'Main Campus')->first();
        $colleges = [
            ['name' => 'College of Education', 'code' => 'COE', 'campus_id' => $main->id ?? null],
            ['name' => 'College of Arts & Sciences', 'code' => 'CAS', 'campus_id' => $main->id ?? null],
            ['name' => 'College of Engineering', 'code' => 'COEGR', 'campus_id' => $main->id ?? null],
        ];

        foreach ($colleges as $c) {
            College::firstOrCreate(['name' => $c['name']], $c);
        }
    }
}
