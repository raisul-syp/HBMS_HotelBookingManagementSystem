<?php

namespace App\Http\Controllers\Admin;

use App\Models\Room;
use App\Models\User;
use App\Models\Admin;
use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\BookingFormRequest;

class BookingController extends Controller
{
    public function index()
    {
        return view('admin.booking.index');
    }

    public function create()
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $guests = User::all()->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1');
        $staffs = Admin::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.booking.create', compact('todayDate','tomorrowDate','guests','rooms','staffs'));
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

        return redirect('admin/booking')->with('message','Congratulations! New Booking Has Been Created Successfully.');
    }

    public function edit(Booking $booking)
    {
        $guests = User::all()->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1');
        $staffs = Admin::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.booking.edit', compact('booking', 'guests', 'rooms', 'staffs'));
    }

    public function update(BookingFormRequest $request, $booking)
    {
        $validatedData = $request->validated();
        
        $booking = Booking::findOrFail($booking);

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
        $booking->updated_by = $validatedData['updated_by'];
        $booking->update();

        return redirect('admin/booking')->with('message','Congratulations! New Booking Has Been Updated Successfully.');
    }

    public function availableRooms(Request $request, $checkin_date)
    {
        $available_rooms = Room::whereDoesntHave('bookings', function($query) use ($checkin_date) {
            $query->where('checkin_date', '<=', $checkin_date)
                  ->where('checkout_date', '>=', $checkin_date);
        })->get();
        
        return response()->json(['data' => $available_rooms]);
    }
}
