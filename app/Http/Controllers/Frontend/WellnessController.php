<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Room;
use App\Models\Wellness;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class WellnessController extends Controller
{
    public function index()
    {
        $wellnessList = Wellness::all()->where('is_active','1')->where('is_delete','1');
        return view('frontend.wellnesses.index', compact('wellnessList'));
    }

    public function wellnessDetails(int $wellness_id)
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $tomorrowDate = Carbon::tomorrow()->format('Y-m-d');
        $wellnessDetail = Wellness::findOrFail($wellness_id);
        return view('frontend.wellnesses.wellness-details', compact('todayDate','tomorrowDate','wellnessDetail'));
    }

    public function checkAvailability(Request $request)
    {
        $checkin_date = $request->checkin_date;
        $checkout_date = $request->checkout_date;
        $hotel_location = $request->hotel_location;
        $total_adults = $request->adults;
        $total_childs = $request->children;

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

        return view('frontend.available-rooms', compact('available_rooms'));
    }
}
