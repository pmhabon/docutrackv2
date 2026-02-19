<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Program;
use App\Models\College;

class ProgramSeeder extends Seeder
{
    public function run()
    {
        $coe = College::where('code', 'COE')->orWhere('name','College of Education')->first();
        $cas = College::where('code', 'CAS')->orWhere('name','College of Arts & Sciences')->first();

        $programs = [];
        if ($coe) {
            $programs = array_merge($programs, [
                ['name' => 'Bachelor of Elementary Education', 'code' => 'BEED', 'college_id' => $coe->id],
                ['name' => 'Bachelor of Secondary Education', 'code' => 'BSED', 'college_id' => $coe->id],
            ]);
        }

        if ($cas) {
            $programs = array_merge($programs, [
                ['name' => 'Bachelor of Science in Mathematics', 'code' => 'BSMATH', 'college_id' => $cas->id],
                ['name' => 'Bachelor of Arts in English', 'code' => 'BAENG', 'college_id' => $cas->id],
            ]);
        }

        foreach ($programs as $p) {
            Program::firstOrCreate(['name' => $p['name']], $p);
        }
    }
}
