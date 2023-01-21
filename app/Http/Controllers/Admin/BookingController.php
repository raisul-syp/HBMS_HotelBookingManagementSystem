<?php

namespace App\Http\Controllers\Admin;

use App\Models\Room;
use App\Models\User;
use App\Models\Admin;
use App\Models\Booking;
use Illuminate\Http\Request;
use App\Mail\BookingMailable;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
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
        try {
            $validatedData = $request->validated();

            $guest = User::find($request->guest_id);
            $room = Room::find($request->room_id);
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
                'guest_name' => $guest->first_name.' '.$guest->last_name,
                'guest_email' => $guest->email,
                'guest_phone' => $guest->phone,
                'room_name' => $room->name,
                'room_price' => $room->price,
                'checkin_date' => $booking->checkin_date,
                'checkin_time' => $booking->checkin_time,
                'checkout_date' => $booking->checkout_date,
                'checkout_time' => $booking->checkout_time,
                'booking_date' => $booking->created_at,
                'booking_status' => $booking->booking_status,
                'payment_mode' => $booking->payment_mode,
            );

            Mail::send(new BookingMailable($data));
            return redirect('admin/booking')->with('message','Congratulations! New Booking Has Been Created Successfully. Email Has been sent to the Guest.');
        }
        catch(\Exception $e) {
            return redirect('admin/booking')->with('message','Something Went Wrong!');
        }
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
        try {
            $validatedData = $request->validated();
        
            $guest = User::find($request->guest_id);
            $room = Room::find($request->room_id);
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
            $booking->payment_mode = $validatedData['payment_mode'];
            $booking->booking_comment = $validatedData['booking_comment'];
            $booking->updated_by = $validatedData['updated_by'];
            $booking->update();
            
            $data = array(
                'guest_name' => $guest->first_name.' '.$guest->last_name,
                'guest_email' => $guest->email,
                'guest_phone' => $guest->phone,
                'room_name' => $room->name,
                'room_price' => $room->price,
                'checkin_date' => $booking->checkin_date,
                'checkin_time' => $booking->checkin_time,
                'checkout_date' => $booking->checkout_date,
                'checkout_time' => $booking->checkout_time,
                'booking_date' => $booking->created_at,
                'booking_status' => $booking->booking_status,
                'payment_mode' => $booking->payment_mode,
            );

            Mail::send(new BookingMailable($data));
            return redirect('admin/booking')->with('message','Congratulations! New Booking Has Been Updated Successfully. Email Has been sent to the Guest.');
        }
        catch(\Exception $e) {
            return redirect('admin/booking')->with('message','Something Went Wrong!');
        }
        
        
        // $validatedData = $request->validated();
        
        // $booking = Booking::findOrFail($booking);

        // $booking->guest_id = $validatedData['guest_id'];
        // $booking->room_id = $validatedData['room_id'];
        // $booking->staff_id = $validatedData['staff_id'];
        // $booking->checkin_date = $validatedData['checkin_date'];
        // $booking->checkout_date = $validatedData['checkout_date'];
        // $booking->checkin_time = $validatedData['checkin_time'];
        // $booking->checkout_time = $validatedData['checkout_time'];
        // $booking->total_adults = $validatedData['total_adults'];
        // $booking->total_childs = $validatedData['total_childs'];
        // $booking->booking_status = $validatedData['booking_status'];
        // $booking->payment_mode = $validatedData['payment_mode'];
        // $booking->booking_comment = $validatedData['booking_comment'];
        // $booking->updated_by = $validatedData['updated_by'];
        // $booking->update();

        // return redirect('admin/booking')->with('message','Congratulations! New Booking Has Been Updated Successfully.');
    }

    public function details(Booking $booking)
    {
        $serialNo = 1;
        $guests = User::all()->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1');
        $staffs = Admin::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.booking.details', compact('booking', 'guests', 'rooms', 'staffs', 'serialNo'));
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
