<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Booking;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\BookingFormRequest;

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

    public function store(BookingFormRequest $request)
    {
        $validatedData = $request->validated();

        $booking = new Booking;

        $booking->guest_id = $validatedData['guest_id'];
        $booking->room_id = $validatedData['room_id'];
        $booking->staff_id = $validatedData['staff_id'];
        $booking->checkin_date = $validatedData['checkin_date'];
        $booking->checkout_date = $validatedData['checkout_date'];
        $booking->checkin_time = $validatedData['checkin_time'];
        $booking->checkout_time = $validatedData['checkout_time'];
        $booking->total_adults = $validatedData['total_adults'];
        $booking->total_childs = $validatedData['total_childs'];
        $booking->booking_status = $validatedData['booking_status'];
        $booking->booking_comment = $validatedData['booking_comment'];
        $booking->created_by = $validatedData['created_by'];

        $booking->save();

        return redirect('confirm-booking/success')->with('message','Congratulations! Your Booking Has Been Created Successfully.');
    }

    public function success()
    {
        return view('frontend.success.booking');
    }
}
