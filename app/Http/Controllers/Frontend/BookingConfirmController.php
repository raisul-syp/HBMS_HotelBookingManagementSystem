<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Room;
use Illuminate\Http\Request;

class BookingConfirmController extends Controller
{
    public function index(Request $request)
    {
        $checkin_date = $request->input('checkin_date');
        $checkout_date = $request->input('checkout_date');
        $total_adults = $request->input('total_adults');
        $total_childs = $request->input('total_childs');
        $room_id = $request->input('room_id');

        $rooms = Room::all();

        return view('frontend.confirm-booking', compact('checkin_date', 'checkout_date', 'total_adults', 'total_childs', 'room_id', 'rooms'));
    }
}
