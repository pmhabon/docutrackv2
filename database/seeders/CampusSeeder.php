<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Campus;

class CampusSeeder extends Seeder
{
    public function run()
    {
        $campuses = [
            'Main Campus',
            'Candon',
            'Santa Maria',
            'Tagudin',
            'Cervantes',
            'Narvacan',
            'Santiago',
        ];

        foreach ($campuses as $name) {
            Campus::firstOrCreate(['name' => $name]);
        }
    }
}
