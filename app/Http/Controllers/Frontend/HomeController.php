<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Hotel;
use App\Models\Website\Slider;
use App\Models\Website\Testimonial;
use App\Models\Website\Facility;
use App\Models\Website\Page;

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

        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        $sliders = Slider::all()->where('is_active','1')->where('is_delete','1');
        $aboutUs = Page::all()->where('name','About Us')->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1');
        $testimonials = Testimonial::all()->where('is_active','1')->where('is_delete','1');
        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');

        // $available_rooms = DB::select("SELECT * FROM hb_rooms WHERE id NOT IN (SELECT room_id FROM hb_bookings WHERE '$checkin_date' AND '$checkout_date' BETWEEN checkin_date AND checkout_date) AND hotel_id = '$hotel_location' AND max_adults >= '$total_adults' AND max_childs >= '$total_childs' AND is_active = 1");

        $available_rooms = Room::whereNotIn('id', function($query) use ($checkin_date, $checkout_date) {
            $query->select('room_id')->from('hb_bookings')
            ->whereBetween('checkin_date', [$checkin_date, $checkout_date])
            ->orWhereBetween('checkout_date', [$checkin_date, $checkout_date]);
        })
        ->where('hotel_id', $hotel_location)
        ->where('max_adults', '>=', (int) $total_adults)
        ->where('max_childs', '>=', (int) $total_childs)
        ->where('is_active', 1)
        ->get();

        return view('frontend.index', compact('hotels','sliders','aboutUs','rooms','testimonials','facilities','todayDate','tomorrowDate','available_rooms'));
    }

    public function jashoreIndex(Request $request)
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $hotel_location = $request->hotel_location;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        $sliders = Slider::all()->where('is_active','1')->where('is_delete','1');
        $aboutUs = Page::all()->where('name','About Us')->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1');
        $testimonials = Testimonial::all()->where('is_active','1')->where('is_delete','1');
        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');

        $available_rooms = Room::whereNotIn('id', function($query) use ($checkin_date, $checkout_date) {
            $query->select('room_id')->from('hb_bookings')
            ->whereBetween('checkin_date', [$checkin_date, $checkout_date])
            ->orWhereBetween('checkout_date', [$checkin_date, $checkout_date]);
        })
        ->where('hotel_id', $hotel_location)
        ->where('max_adults', '>=', (int) $total_adults)
        ->where('max_childs', '>=', (int) $total_childs)
        ->where('is_active', 1)
        ->get();

        return view('frontend.jashore.index', compact('hotels','sliders','aboutUs','rooms','testimonials','facilities','todayDate','tomorrowDate','available_rooms'));
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

        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');

        $available_rooms = Room::whereNotIn('id', function($query) use ($checkin_date, $checkout_date) {
            $query->select('room_id')->from('hb_bookings')
            ->whereBetween('checkin_date', [$checkin_date, $checkout_date])
            ->orWhereBetween('checkout_date', [$checkin_date, $checkout_date]);
        })
        ->where('quantity', '<=', 10)
        ->where('hotel_id', $hotel_location)
        ->where('max_adults', '>=', (int) $total_adults)
        ->where('max_childs', '>=', (int) $total_childs)
        ->where('is_active', 1)
        ->get();
          

        return view('frontend.available-rooms', compact('hotels', 'available_rooms', 'todayDate', 'tomorrowDate'));
    }

    public function roomDetails(int $room_id)
    {
        $roomDetail = Room::findOrFail($room_id);
        return view('frontend.rooms.room-details', compact('roomDetail'));
    }
}
