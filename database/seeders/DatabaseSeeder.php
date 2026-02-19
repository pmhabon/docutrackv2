<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\SuperAdminSeeder;
use Database\Seeders\CampusDirectorSeeder;
use Database\Seeders\DeanSeeder;
use Database\Seeders\ProgramHeadSeeder;
use Database\Seeders\DocumentSeeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();
        // Create test user via factory if desired (adjust fields to match your User model)
        // User::factory()->create([...]);

        // Seed a pre-made superadmin and sample role accounts
        $this->call([
            SuperAdminSeeder::class,
            CampusDirectorSeeder::class,
            DeanSeeder::class,
            ProgramHeadSeeder::class,
            // document types should be seeded before documents
            \Database\Seeders\DocumentTypeSeeder::class,
            DocumentAuthorSeeder::class,
            DocumentSeeder::class,
            \Database\Seeders\CampusSeeder::class,
            \Database\Seeders\CollegeSeeder::class,
            \Database\Seeders\ProgramSeeder::class,
        ]);
    }
}
