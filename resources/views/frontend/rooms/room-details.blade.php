@extends('layouts.guest')
@section('title', 'Room Details')

@section('content')
<section id="rooms_details_section_frontend" class="rooms_details_section_frontend content_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_title">
                    <h4>Room Details</h4>
                </div>
                <div class="section_breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item"><a href="{{ url('rooms') }}">{{ __('Rooms') }}</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Room Details') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-9">
                <div class="room-details-inner">
                    <div class="card">
                        <div class="owl-carousel owl-theme room-details-carousel">
                            @if (count($roomDetail->roomImages) > 0)
                            @foreach ($roomDetail->roomImages as $roomImage)
                            <div class="item">
                                <img src="{{ asset($roomImage->image) }}" alt="">
                            </div>
                            @endforeach
                            @endif
                        </div>

                        <div class="card-body">
                            <div class="room-header">
                                <div class="room-title">
                                    {{ $roomDetail->name }}
                                </div>
                                <div class="room-price">
                                    ৳{{ $roomDetail->price }}<span>/ night</span>
                                </div>
                            </div>

                            <hr>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="room-capacity" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Max. Adult">
                                        <i class="fas fa-user"></i>
                                        {{ $roomDetail->max_adults }}
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="room-capacity" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Max. Child">
                                        <i class="fas fa-baby"></i>
                                        {{ $roomDetail->max_childs }}
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="room-location" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Location">
                                        <i class="fas fa-map-marked-alt"></i>
                                        {{ $roomDetail->hotel_location }}
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="room-availability">
                                        @if (count($roomDetail->bookings) > 0)
                                        <span class="badge bg-danger">Occupied</span>
                                        @else
                                        <span class="badge bg-success">Available</span>
                                    @endif
                                    </div>
                                </div>
                            </div>
                            <hr>

                            <div class="room-description">
                                <div class="short-descrp">
                                    {{ $roomDetail->short_description }}
                                </div>
                                <div class="long-descrp">
                                    {!! html_entity_decode($roomDetail->long_description) !!}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mt-5">
                        <div class="card-body">
                            <div class="room-facilities-sec">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <h4>Facilities</h4>
                                    </div>
                                    @forelse ($roomDetail->facilities as $roomFacility)
                                    <div class="col-lg-4">
                                        <div class="room-facilities mb-3">
                                            <img src="{{ asset('uploads/facilities/'.$roomFacility->image) }}">
                                            <span>{{ $roomFacility->name }}</span>
                                        </div>
                                    </div>
                                    @empty
                                    <div class="col-lg-12">
                                        <small class="text-danger">No Facilities Added!</small>
                                    </div>
                                    @endforelse
                                </div>
                                <div class="row mt-4">
                                    <div class="col-lg-12">
                                        <h4>Room View</h4>
                                    </div>
                                    @forelse ($roomDetail->roomViews as $roomView)
                                    <div class="col-lg-3">
                                        <div class="room-views" data-toggle="tooltip" data-placement="top" title="{{ $roomView->name }}">
                                            <span>{{ $roomView->name }}</span>
                                        </div>
                                    </div>
                                    @empty
                                    <div class="col-lg-12">
                                        <small class="text-danger">No Views Added!</small>
                                    </div>
                                    @endforelse
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="booking-btn mb-3">
                    <a href="#" class="btn btn-primary">Book Now</a>
                </div>
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
                                            <input type="text" class="form-control check-in-out" id="checkin_date" name="checkin_date" placeholder="Check-In">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <div class="date-box">
                                            <input type="text" class="form-control check-in-out" id="checkout_date" name="checkout_date" placeholder="Check-Out">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="hotel_location" name="hotel_location">
                                            <option selected disabled>Select Hotel Location</option>
                                            <option value="Dhaka">Dhaka</option>
                                            <option value="Jashore">Jashore</option>
                                          </select>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <select class="form-select" id="adults" name="adults">
                                            <option selected disabled>Select Adults</option>
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
                                            <option selected disabled>Select Childs</option>
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
        </div>
    </div>
</section>
@endsection
