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

// Route::get('/', function () {
//     return view('frontend.index');
// });

// Route::get('/', [App\Http\Controllers\Frontend\HomeController::class, 'index']);
Route::prefix('/')->controller(App\Http\Controllers\Frontend\HomeController::class)->group(function (){
    Route::get('/', 'index');
    Route::get('/Jashore', 'jashoreIndex');
    Route::get('/available-rooms', 'checkAvailability');
    Route::get('/rooms/room-details/{room}', 'roomDetails');
});

Route::prefix('/rooms')->controller(App\Http\Controllers\Frontend\RoomController::class)->group(function (){
    Route::get('/', 'index');
    Route::get('/room-details/{room}', 'roomDetails');
});

Route::get('/about-us', [App\Http\Controllers\Frontend\AboutusController::class, 'index']);
Route::get('/contact-us', [App\Http\Controllers\Frontend\ContactController::class, 'index']);

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

        // Submenu
        Route::prefix('/submenu')->controller(App\Http\Controllers\Admin\Website\SubmenuController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{submenu}', 'edit');
            Route::put('/edit/{submenu}', 'update');
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

        // Page
        Route::prefix('/addresses')->controller(App\Http\Controllers\Admin\Website\AddressController::class)->group(function (){
            Route::get('/', 'index');
            Route::get('/create', 'create');
            Route::post('/', 'store');
            Route::get('/edit/{address}', 'edit');
            Route::put('/edit/{address}', 'update');
        });
    });

});
