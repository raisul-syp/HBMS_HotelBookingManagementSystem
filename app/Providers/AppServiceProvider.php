<?php

namespace App\Providers;

use App\Models\Website\NavigationMenu;
use App\Models\Website\Page;
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
        $menuItems = NavigationMenu::where('is_active','1')->where('is_delete','1')->orderBy('display_order','ASC')->get();
        $footerItems = Page::where('footer_item','1')->where('is_active','1')->where('is_delete','1')->orderBy('display_order','ASC')->get();
        view()->share(compact('menuItems', 'footerItems'));
    }
}
