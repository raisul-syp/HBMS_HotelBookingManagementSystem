<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Hall;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class HallController extends Controller
{
    public function index()
    {
        $hallList = Hall::all()->where('is_active','1')->where('is_delete','1');
        return view('frontend.halls.index', compact('hallList'));
    }

    public function hallDetails(int $hall_id)
    {
        $hallDetail = Hall::findOrFail($hall_id);
        return view('frontend.halls.hall-details', compact('hallDetail'));
    }

    public function checkAvailability(Request $request)
    {
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $hotel_location = $request->hotel_location;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND hotel_location = '$hotel_location' AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");

        return view('frontend.available-rooms', compact('available_rooms'));
    }
}