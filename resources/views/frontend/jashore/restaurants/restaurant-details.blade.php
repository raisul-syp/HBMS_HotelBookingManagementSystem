@extends('layouts.guestJashore')
@section('title', 'Restaurants Details')

@section('content')
<section id="page_details_section_frontend" class="page_details_section_frontend content_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_title">
                    <h4>Restaurant Details</h4>
                </div>
                <div class="section_breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item"><a href="{{ url('restaurants') }}">{{ __('Restaurants') }}</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Restaurant Details') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-9">
                <div class="page-details-inner">
                    <div class="card">
                        <div class="owl-carousel owl-theme page-details-carousel">
                            @if (count($restaurantDetail->restaurentImages) > 0)
                            @foreach ($restaurantDetail->restaurentImages as $restaurentImage)
                            <div class="item">
                                <img src="{{ asset($restaurentImage->image) }}" alt="">
                            </div>
                            @endforeach
                            @endif
                        </div>

                        <div class="card-body">
                            <div class="page-header">
                                <div class="page-title">
                                    {{ $restaurantDetail->name }}
                                </div>
                            </div>

                            <div class="page-description">
                                <div class="short-descrp">
                                    {{ $restaurantDetail->short_description }}
                                </div>
                                <div class="long-descrp">
                                    {!! html_entity_decode($restaurantDetail->long_description) !!}
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
