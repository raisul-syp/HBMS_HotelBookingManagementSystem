<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = [
            'first_name' => 'Muhammad Raisul',
            'last_name' => 'Islam',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('123456789')
        ];
        Admin::create($admin);
    }
}
