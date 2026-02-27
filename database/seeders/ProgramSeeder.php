<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Program;
use App\Models\College;

class ProgramSeeder extends Seeder
{
    public function run()
    {
        $coe = College::where('code', 'COE')->orWhere('code', 'CTE')->orWhere('name','College of Education')->first();
        $cas = College::where('code', 'CAS')->orWhere('name','College of Arts & Sciences')->first();
        // CBME may already exist; prefer code lookup, fallback to id 6 as user indicated
        $cbme = College::where('code', 'CBME')->orWhere('name', 'College of Business, Management & Entrepreneurship')->first();
        if (! $cbme) {
            $cbme = College::find(6);
        }

        $programs = [];

        // CTE / College of Education programs
        if ($coe) {
            $programs = array_merge($programs, [
                ['name' => 'Bachelor of Secondary Education', 'code' => 'BSED', 'college_id' => $coe->id],
                ['name' => 'Bachelor of Elementary Education', 'code' => 'BEED', 'college_id' => $coe->id],
                ['name' => 'Bachelor of Physical Education', 'code' => 'BPED', 'college_id' => $coe->id],
            ]);
        }

        // CBME programs
        if ($cbme) {
            $programs = array_merge($programs, [
                ['name' => 'Bachelor of Science in Business Administration', 'code' => 'BSBA', 'college_id' => $cbme->id],
                ['name' => 'Bachelor of Science in Entrepreneurship', 'code' => 'BSENT', 'college_id' => $cbme->id],
            ]);
        }

        // CAS programs
        if ($cas) {
            $programs = array_merge($programs, [
                ['name' => 'Bachelor of Science in Mathematics', 'code' => 'BSMATH', 'college_id' => $cas->id],
                ['name' => 'Bachelor of Arts in English Language', 'code' => 'BAEL', 'college_id' => $cas->id],
                ['name' => 'Bachelor of Arts in Psychology', 'code' => 'BAPSY', 'college_id' => $cas->id],
                ['name' => 'Bachelor of Arts in Social Science', 'code' => 'BASS', 'college_id' => $cas->id],
                ['name' => 'Bachelor of Science in Information Technology', 'code' => 'BSIT', 'college_id' => $cas->id],
                ['name' => 'Bachelor of Science in Public Administration', 'code' => 'BSPA', 'college_id' => $cas->id],
            ]);
        }

        foreach ($programs as $p) {
            Program::firstOrCreate(['name' => $p['name'], 'college_id' => $p['college_id']], $p);
        }
    }
}
