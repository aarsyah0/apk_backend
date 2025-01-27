<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@admin.com',
            'password' => Hash::make('password123'),
            'photo_url' => 'https://example.com/photo.jpg',
        ]);

        User::create([
            'name' => 'User One',
            'email' => 'user1@example.com',
            'password' => Hash::make('password123'),
            'photo_url' => 'https://example.com/photo.jpg',
        ]);

        User::create([
            'name' => 'User Two',
            'email' => 'user2@example.com',
            'password' => Hash::make('password123'),
            'photo_url' => 'https://example.com/photo.jpg',
        ]);
    }
}

