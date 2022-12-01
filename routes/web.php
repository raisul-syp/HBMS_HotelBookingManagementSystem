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
    Route::get('/available-rooms', 'checkAvailability');
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

    // Website/Menu
    Route::prefix('/admin/website/menu')->controller(App\Http\Controllers\Admin\Website\NavigationController::class)->group(function (){
        Route::get('/', 'index');
        Route::get('/create', 'create');
        Route::post('/', 'store');
        // Route::get('/edit/{room}', 'edit');
        // Route::put('/edit/{room}', 'update');
    });
});
