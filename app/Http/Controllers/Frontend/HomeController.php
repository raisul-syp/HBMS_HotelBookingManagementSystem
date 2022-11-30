<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Booking;
use App\Models\Facility;
use App\Models\Roomtype;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\RoomImage;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");

        return view('frontend.index', compact('available_rooms','facilities'));
    }

    public function checkAvailability(Request $request)
    {
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND max_adults >= '$total_adults' AND max_childs >= '$total_childs'");

        // $available_rooms = Room::whereNotIn('id', function($query) use ($checkin_date, $checkout_date) {
        //                     $query->from('hb_bookings')
        //                         ->select('room_id')
        //                         ->where('checkin_date', '<=', $checkout_date)
        //                         ->where('checkout_date', '>=', $checkin_date);
        //                     })
        //                     ->where('max_adults', '>=', $total_adults)
        //                     ->where('max_childs', '>=', $total_childs)
        //                     ->get();

        return view('frontend.available-rooms', compact('available_rooms'));
    }

    public function roomList()
    {
        $rooms = Room::where('is_active','1')->where('is_delete','1');
        return view('frontend.room-details', compact('room'));
    }

    public function roomView(string $room_slug)
    {
        $room = Room::where('slug', $room_slug)->where('is_active','1')->where('is_delete','1');
        // return view('frontend.room-details', compact('room'));

        if($room){
            return view('frontend.room-details', compact('room'));
        }
        else{
            return redirect()->back();
        }
    }
}
