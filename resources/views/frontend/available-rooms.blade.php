@extends('layouts.guest')
@section('title', 'Available Rooms')

@section('content')
    <section id="roomAvailability_section" class="roomAvailability_section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="roomAvailability-form mb-4 mb-lg-0">
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true">Check Room Availability</button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                    data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <form action="{{ url('available-rooms') }}" method="GET">
                                            <div class="row">
                                                <div class="form_input col-12 mb-3">
                                                    <div class="input-wrapper">
                                                        <input type="date" class="form-control check-in-out"
                                                            id="checkin_date" name="checkin_date"
                                                            value="{{ $todayDate }}">
                                                        <span class="lnr lnr-calendar-full icon"></span>
                                                    </div>
                                                </div>
                                                <div class="form_input col-12 mb-3">
                                                    <div class="input-wrapper">
                                                        <input type="date" class="form-control check-in-out"
                                                            id="checkout_date" name="checkout_date"
                                                            value="{{ $tomorrowDate }}">
                                                        <span class="lnr lnr-calendar-full icon"></span>
                                                    </div>
                                                </div>
                                                <div class="form_input col-12 mb-3">
                                                    <div class="input-wrapper">
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
                                                        <span class="lnr lnr-chevron-down icon"></span>
                                                    </div>
                                                </div>
                                                <div class="form_input col-12 mb-3">
                                                    <div class="input-wrapper">
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
                                                        <span class="lnr lnr-chevron-down icon"></span>
                                                    </div>
                                                </div>
                                                <div class="form_input submit_btn col-12">
                                                    <button type="submit" class="btn btn-primary btn-block">Check
                                                        Availability</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
                                                    <div class="col-lg-4">
                                                        <div class="room-img">
                                                            @foreach ($room->roomImages as $roomImage)
                                                                <img src="{{ asset($roomImage->image) }}" alt="">
                                                            @break
                                                        @endforeach
                                                    </div>
                                                </div>

                                                <div class="col-lg-8">
                                                    <div class="room-info">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="room-title">
                                                                    <a
                                                                        href="{{ url('rooms/room-details/' . $room->id) }}">
                                                                        {{ $room->name }}
                                                                    </a>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-12">
                                                                <div class="room-dscrp">
                                                                    {{ $room->short_description }}
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="room-capacity">
                                                                    <strong>Max. Adults:
                                                                    </strong>{{ $room->max_adults }} <br>
                                                                    <strong>Max. Childs:
                                                                    </strong>{{ $room->max_childs }}
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="room-availability-count text-end">
                                                                    <span
                                                                        class="badge rounded-pill bg-success available-badge">{{ $room->quantity - $room->bookings->where('room_id', $room->id)->count() }}
                                                                        rooms are available out of
                                                                        {{ $room->quantity }}</span>
                                                                </div>
                                                                <div class="room-pricing">
                                                                    <h5>${{ $room->price }}++<span>/night</span></h5>
                                                                    <small class="text-danger">Rack Rate</small>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-12">
                                                                @if (Auth::user())
                                                                    <div class="booking-btn">
                                                                        <button type="submit"
                                                                            class="btn btn-primary">Book Now</button>
                                                                    </div>
                                                                @else
                                                                    <div class="booking-btn">
                                                                        <a href="{{ route('login') }}"
                                                                            class="btn btn-primary">Book Now</a>
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
