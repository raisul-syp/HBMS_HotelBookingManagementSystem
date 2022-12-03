<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Booking;
use App\Models\Facility;
use App\Models\Roomtype;
use App\Models\RoomImage;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $hotel_location = $request->hotel_location;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1')->whereIn('id',[1,2,4]);

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND hotel_location = '$hotel_location' AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");

        return view('frontend.index', compact('available_rooms','facilities','rooms','todayDate','tomorrowDate'));
    }

    public function checkAvailability(Request $request)
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $hotel_location = $request->hotel_location;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND hotel_location = '$hotel_location' AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");

        return view('frontend.available-rooms', compact('available_rooms','todayDate','tomorrowDate'));
    }



    public function roomDetails(int $room_id)
    {
        $roomDetail = Room::findOrFail($room_id);
        return view('frontend.rooms.room-details', compact('roomDetail'));
    }
}
