<?php

namespace App\Providers;

use App\Models\Hall;
use App\Models\Room;
use App\Models\Wellness;
use App\Models\Restaurent;
use App\Models\Website\Page;
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
        $menuItems = NavigationMenu::where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->get();
        $footerItems = Page::where('footer_item','1')->where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->get();
        $rooms = Room::where('hotel_id','1')->where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->get();
        $restaurents = Restaurent::where('hotel_id','1')->where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->get();
        $halls = Hall::where('hotel_id','1')->where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->get();
        $wellnesses = Wellness::where('hotel_id','1')->where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->get();
        view()->share(compact('menuItems', 'footerItems', 'rooms', 'restaurents', 'halls', 'wellnesses'));
    }
}
