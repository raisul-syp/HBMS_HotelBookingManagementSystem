<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Booking;
use App\Models\Facility;
use App\Models\Roomtype;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");

        return view('frontend.index', compact('available_rooms'));
    }

    public function checkAvailability(Request $request)
    {
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");
        
        return view('frontend.available-rooms', compact('available_rooms'));
    }

    // public function availableRooms(Request $request, $checkin_date)
    // {
    //     $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' BETWEEN checkin_date AND checkout_date)");
    //     return view('frontend.available-rooms', compact('available_rooms'));
    // }
}
