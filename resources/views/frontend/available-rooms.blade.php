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
                                            <input type="text" class="form-control" id="checkin_date" name="checkin_date" placeholder="Check-In">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <div class="date-box">
                                            <input type="text" class="form-control" id="checkout_date" name="checkout_date" placeholder="Check-Out">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="location" name="location">
                                            <option selected disabled>--Select Location--</option>
                                            <option>All</option>
                                            <option value="Dhaka">Dhaka</option>
                                            <option value="Jashore">Jashore</option>
                                          </select>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="rooms" name="rooms">
                                            <option selected disabled>--Select Rooms--</option>
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
                                        <select class="form-select" id="adults" name="adults">
                                            <option selected disabled>--Select Adults--</option>
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
                                            <option selected disabled>--Select Childs--</option>
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
                                        <button class="btn btn-primary btn-block">Check Availability</button>
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


                            {{-- @foreach ($booked_rooms as $booked)
                                {{ $booked->rooms->name }}
                            @endforeach --}}


                            {{-- @foreach ($available_rooms as $room)
                                {{ $room->name }}
                            @endforeach --}}



                            @forelse ($available_rooms as $room)
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="availableRoom-card">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="room-img">
                                                    <img src="{{ asset('uploads/rooms/Suite-1669023019-1.jpg') }}" alt="">
                                                    {{-- <img src="{{ $room->roomImages->image }}" alt=""> --}}
                                                </div>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="room-info">
                                                    <div class="room-title">
                                                        <h4>{{ $room->name }}</h4>
                                                    </div>
                                                    <div class="room-dscrp">
                                                        <p>{{ $room->short_description }}</p>
                                                    </div>
                                                    <div class="room-facility">
                                                        <p>
                                                            <strong>Room View: </strong>
                                                            <span>
                                                                {{-- @forelse ($room->roomViews as $view)
                                                                <span class="badge badge-pill badge-primary">{{ $view->name }}</span>
                                                                @empty
                                                                <small class="text-danger">No Views Added!</small>
                                                                @endforelse  --}}
                                                                {{-- @foreach ($room->roomViews as $roomView)
                                                                    {{ $roomView->name }}
                                                                @endforeach --}}
                                                            </span>
                                                        </p>
                                                        <p>
                                                            <strong>Facilities: </strong><span>TV, Fridge</span>
                                                        </p>
                                                        <span class="me-4">
                                                            <strong>Max. Adults: </strong>{{ $room->max_adults }}
                                                        </span>
                                                        <span>
                                                            <strong>Max. Childs: </strong>{{ $room->max_childs }}
                                                        </span>
                                                    </div>
                                                    <div class="room-pricing">
                                                        <h4>{{ $room->price }} / night</h4>
                                                    </div>
                                                    <button class="btn btn-primary">
                                                        Book Now
                                                    </button>
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
