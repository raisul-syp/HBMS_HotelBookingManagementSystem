<?php

namespace App\Providers;

use App\Models\Website\NavigationMenu;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $menuItems = NavigationMenu::where('is_active','1')->get();
        view()->share('menuItems', $menuItems);
    }
}
