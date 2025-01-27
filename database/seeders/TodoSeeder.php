<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Todo;

class TodoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = User::all();

        foreach ($users as $user) {
            Todo::create([
                'title' => 'Tugas PCV ' . $user->name,
                'description' => 'Membuat agar gambar menjadi hex.',
                'user_id' => $user->id,
                'is_completed' => false,
            ]);

            Todo::create([
                'title' => 'Tugas Machine learning ' . $user->name,
                'description' => 'Deploy pada model agar bisa digunakan pada aplikasi mobile',
                'user_id' => $user->id,
                'is_completed' => true,
            ]);
        }
    }
}
