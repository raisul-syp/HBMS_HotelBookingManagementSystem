<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Admin\DashboardController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::prefix('/')->controller(App\Http\Controllers\Frontend\HomeController::class)->group(function (){
    Route::get('/', 'index');
    Route::get('/available-rooms', 'checkAvailability');
    Route::get('/rooms/room-details/{slug}', 'roomDetails');
});

Route::prefix('/')->controller(App\Http\Controllers\Frontend\PagesController::class)->group(function (){
    Route::get('/about-us', 'aboutUs');
    Route::get('/contact-us', 'contactUs');
    Route::get('/{slug}', 'pages');
    Route::get('/offers/offer-details/{slug}', 'offerDetails');
    Route::get('/rooms/room-details/{slug}', 'roomDetails');
    Route::get('/restaurants/restaurant-details/{slug}', 'restaurantDetails');
    Route::get('/halls/hall-details/{slug}', 'hallDetails');
    Route::get('/wellness/wellness-details/{slug}', 'wellnessDetails');
});

Route::prefix('/booking')->controller(App\Http\Controllers\Frontend\BookingController::class)->group(function (){
    Route::get('/', 'index');
    Route::post('/', 'store');
});


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';


// Admin
Route::get('/admin/login', [AuthenticatedSessionController::class, 'create'])->name('admin.login')->middleware('guest:admin');
Route::post('/admin/login/store', [AuthenticatedSessionController::class, 'store'])->name('admin.login.store');

Route::group(['middleware' => 'isAdmin'], function() {
    Route::get('/admin/dashboard', [DashboardController::class, 'index'])->name('admin.dashboard');
    Route::post('/admin/logout', [AuthenticatedSessionController::class, 'destroy'])->name('admin.logout');

    // Hotel
    Route::prefix('/admin/hotels')->controller(App\Http\Controllers\Admin\HotelController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{hotel}', 'edit');
        Route::put('/edit/{hotel}', 'update');
    });

    // Room Type
    Route::prefix('/admin/roomtype')->controller(App\Http\Controllers\Admin\RoomtypeController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{roomtype}', 'edit');
        Route::put('/edit/{roomtype}', 'update');
    });

    // Facility
    Route::prefix('/admin/facility')->controller(App\Http\Controllers\Admin\FacilityController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{facility}', 'edit');
        Route::put('/edit/{facility}', 'update');
    });

    // Room
    Route::prefix('/admin/room')->controller(App\Http\Controllers\Admin\RoomController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{room}', 'edit');
        Route::put('/edit/{room}', 'update');
    });

    // Restaurent
    Route::prefix('/admin/restaurent')->controller(App\Http\Controllers\Admin\RestaurentController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{restaurent}', 'edit');
        Route::put('/edit/{restaurent}', 'update');
    });

    // Hall
    Route::prefix('/admin/hall')->controller(App\Http\Controllers\Admin\HallController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{hall}', 'edit');
        Route::put('/edit/{hall}', 'update');
    });

    // Wellness
    Route::prefix('/admin/wellness')->controller(App\Http\Controllers\Admin\WellnessController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{wellness}', 'edit');
        Route::put('/edit/{wellness}', 'update');
    });

    // Offer
    Route::prefix('/admin/offers')->controller(App\Http\Controllers\Admin\OfferController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{offer}', 'edit');
        Route::put('/edit/{offer}', 'update');
    });

    // Guest
    Route::prefix('/admin/guest')->controller(App\Http\Controllers\Admin\GuestController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{guest}', 'edit');
        Route::put('/edit/{guest}', 'update');
    });

    // User
    Route::prefix('/admin/user')->controller(App\Http\Controllers\Admin\UserController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{user}', 'edit');
        Route::put('/edit/{user}', 'update');
    });

    // Booking
    Route::prefix('/admin/booking')->controller(App\Http\Controllers\Admin\BookingController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{room}', 'edit');
        Route::put('/edit/{room}', 'update');
        Route::get('/available-rooms/{checkin_date}', 'availableRooms');
    });


    // Website
    Route::prefix('/admin/website')->group(function (){
        // Menu
        Route::prefix('/menu')->controller(App\Http\Controllers\Admin\Website\MenuController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{menu}', 'edit');
            Route::put('/edit/{menu}', 'update');
        });

        // Slider
        Route::prefix('/sliders')->controller(App\Http\Controllers\Admin\Website\SliderController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{slider}', 'edit');
            Route::put('/edit/{slider}', 'update');
        });

        // Testimonial
        Route::prefix('/testimonials')->controller(App\Http\Controllers\Admin\Website\TestimonialController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{testimonial}', 'edit');
            Route::put('/edit/{testimonial}', 'update');
        });

        // Facility
        Route::prefix('/facilities')->controller(App\Http\Controllers\Admin\Website\FacilityController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{facility}', 'edit');
            Route::put('/edit/{facility}', 'update');
        });

        // Page
        Route::prefix('/pages')->controller(App\Http\Controllers\Admin\Website\PageController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{page}', 'edit');
            Route::put('/edit/{page}', 'update');
        });

        // Address
        Route::prefix('/contactinfo')->controller(App\Http\Controllers\Admin\Website\ContactInfoController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{contacts}', 'edit');
            Route::put('/edit/{contacts}', 'update');
        });
    });

    // Settings
    Route::prefix('/admin/settings')->controller(App\Http\Controllers\Admin\SettingsController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        Route::get('/edit/{settings}', 'edit');
        Route::put('/edit/{settings}', 'update');
    });

});
