@extends('layouts.guest')
@section('title', 'Available Rooms')

@section('content')
<section id="roomAvailability_section" class="roomAvailability_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="roomAvailability-form">
                    <div class="card">
                        <div class="card-header">
                            <h4>Check Room Availability</h4>
                        </div>
                        <div class="card-body">
                            <form action="{{ url('available-rooms') }}" method="GET">
                                <div class="row">
                                    <div class="form_input col-12 mb-3">
                                        <div class="date-box">
                                            <input type="text" class="form-control check-in-out" id="checkin_date" name="checkin_date" value="{{ $todayDate }}">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <div class="date-box">
                                            <input type="text" class="form-control check-in-out" id="checkout_date" name="checkout_date" value="{{ $tomorrowDate }}">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="hotel_location" name="hotel_location">
                                            <option value="Dhaka">Dhaka</option>
                                          </select>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="adults" name="adults">
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                          </select>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="children" name="children">
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                        </select>
                                    </div>
                                    <div class="form_input submit_btn col-12">
                                        <button type="submit" class="btn btn-primary btn-block">Check Availability</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="availableRoom-div">
                    <div class="row">
                        <div class="col-lg-12">
                            @forelse ($available_rooms as $room)
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="availableRoom-card">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <div class="room-img">
                                                    <img src="{{ asset('uploads/rooms/Suite-1669023019-1.jpg') }}" alt="">
                                                </div>
                                            </div>

                                            <div class="col-lg-7">
                                                <div class="room-info">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="room-title">
                                                                <a href="{{ url('rooms/room-details/'.$room->id) }}">
                                                                    {{ $room->name }}
                                                                </a>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div class="room-dscrp">
                                                                {{ $room->short_description }}
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 mb-2">
                                                            <div class="room-capacity">
                                                                <strong>Max. Adults: </strong>{{ $room->max_adults }}
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 mb-2">
                                                            <div class="room-capacity">
                                                                <strong>Max. Childs: </strong>{{ $room->max_childs }}
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 mb-2">
                                                            <div class="room-location">
                                                                <strong>Location: </strong>{{ $room->hotel_location }}
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <div class="room-pricing">
                                                                <h5>৳{{ $room->price }}</h5> <span>/ night</span>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-6">
                                                            @if (Auth::user())
                                                            <div class="booking-btn">
                                                                <button type="submit" class="btn btn-primary">Book Now</button>
                                                            </div>
                                                            @else
                                                            <div class="booking-btn">
                                                                <a href="{{ route('login') }}" class="btn btn-primary">Book Now</a>
                                                            </div>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @empty
                            No Rooms Found
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
