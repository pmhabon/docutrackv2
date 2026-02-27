<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\College;

class CollegeSeeder extends Seeder
{
    public function run()
    {
        // Single-campus deployment: create colleges without campus relations
        $colleges = [
            ['name' => 'College of Education', 'code' => 'COE'],
            ['name' => 'College of Arts & Sciences', 'code' => 'CAS'],
            ['name' => 'College of Engineering', 'code' => 'COEGR'],
        ];

        foreach ($colleges as $c) {
            College::firstOrCreate(['name' => $c['name']], $c);
        }
    }
}
