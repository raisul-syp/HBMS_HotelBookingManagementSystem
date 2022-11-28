<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index()
    {
        return view('frontend.index');
    }

    public function availableRoom(Request $request, $checkin_date)
    {
        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' BETWEEN checkin_date AND checkout_date)");
        return view('frontend.available-rooms', compact('available_rooms'));
    }
}
