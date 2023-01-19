<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\BookingFormRequest;

class BookingController extends Controller
{
    public function index()
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        return view('frontend.booking', compact('todayDate','tomorrowDate'));
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
        $booking->payment_mode = $validatedData['payment_mode'];
        $booking->booking_comment = $validatedData['booking_comment'];
        $booking->created_by = $validatedData['created_by'];
        $booking->save();

        $data = array(
            'guest_id' => $request->guest_id,
            'room_id' => $request->room_id,
            'staff_id' => $request->staff_id,
            'checkin_date' => $request->checkin_date,
            'checkout_date' => $request->checkout_date,
            'checkin_time' => $request->checkin_time,
            'checkout_time' => $request->checkout_time,
            'total_adults' => $request->total_adults,
            'total_childs' => $request->total_childs,
            'booking_status' => $request->booking_status,
        );

        Mail::send('frontend.mail-template.booking', $data, function ($message) {
            $message->from('raisul.syp@gmail.com', 'The Zabeer Dhaka');
            $message->to(Auth::user()->email, Auth::user()->first_name.' '.Auth::user()->last_name)->subject('Reservation');
        });

        return redirect('booking/success')->with('message','Congratulations! Your Booking Has Been Created Successfully.');
    }

    public function availableRooms(Request $request, $checkin_date)
    {
        $available_rooms = Room::whereDoesntHave('bookings', function($query) use ($checkin_date) {
            $query->where('checkin_date', '<=', $checkin_date)
                  ->where('checkout_date', '>=', $checkin_date);
        })->get();
        
        return response()->json(['data' => $available_rooms]);
    }

    public function success()
    {
        return view('frontend.success.booking');
    }
}
