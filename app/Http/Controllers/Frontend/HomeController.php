<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Hotel;
use App\Models\Offer;
use App\Models\Website\Page;
use Illuminate\Http\Request;
use App\Models\Website\Slider;
use Illuminate\Support\Carbon;
use App\Models\Website\Facility;
use Illuminate\Support\Facades\DB;
use App\Models\Website\Testimonial;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $sliders = Slider::all()->where('is_active','1')->where('is_delete','1');
        $aboutUs = Page::all()->where('name','About Us')->where('is_active','1')->where('is_delete','1');
        $rooms = Room::all()->where('is_active','1')->where('is_delete','1');
        $testimonials = Testimonial::all()->where('is_active','1')->where('is_delete','1');
        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');
        $offers = Offer::all()->where('start_date', '>', $todayDate)->where('is_active', '1')->where('is_delete', '1');

        $available_rooms = Room::whereNotIn('id', function($query) use ($checkin_date, $checkout_date) {
            $query->select('room_id')->from('hb_bookings')
            ->whereBetween('checkin_date', [$checkin_date, $checkout_date])
            ->orWhereBetween('checkout_date', [$checkin_date, $checkout_date]);
        })
        ->where('max_adults', '>=', (int) $total_adults)
        ->where('max_childs', '>=', (int) $total_childs)
        ->where('is_active', 1)
        ->get();

        return view('frontend.index', compact('sliders','aboutUs','rooms','testimonials','facilities','offers','todayDate','tomorrowDate','available_rooms'));
    }

    public function checkAvailability(Request $request)
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $total_adults = $request->adults;
        $total_childs = $request->children;

        $available_rooms = Room::whereNotIn('id', function($query) use ($checkin_date, $checkout_date) {
            $query->select('room_id')->from('hb_bookings')
            ->whereBetween('checkin_date', [$checkin_date, $checkout_date])
            ->orWhereBetween('checkout_date', [$checkin_date, $checkout_date]);
        })
        ->where('quantity', '<=', 10)
        ->where('max_adults', '>=', (int) $total_adults)
        ->where('max_childs', '>=', (int) $total_childs)
        ->where('is_active', 1)
        ->get();


        return view('frontend.available-rooms', compact('available_rooms', 'todayDate', 'tomorrowDate'));
    }

    public function roomDetails(int $room_id)
    {
        $roomDetail = Room::findOrFail($room_id);
        return view('frontend.rooms.room-details', compact('roomDetail'));
    }
}
