<?php

namespace App\Http\Controllers\Admin;

use App\Models\Room;
use App\Models\User;
use App\Models\Offer;
use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function index()
    {
        $serialNo = '1';
        $todayDate = Carbon::today()->format('Y-m-d');
        $rooms = Room::orderBy('created_at', 'desc')->where('is_active','1')->where('is_delete','1')->get();
        $offers = Offer::orderBy('created_at', 'asc')->where('start_date', '>', $todayDate)->where('is_active', '1')->where('is_delete', '1')->get();
        $guests = User::orderBy('created_at', 'desc')->where('is_active','1')->where('is_delete','1')->get();
        $bookings = Booking::orderBy('created_at', 'desc')->where('is_delete','1')->get();
        return view('admin.dashboard', compact('serialNo','todayDate','rooms','offers','guests','bookings'));
    }
}
