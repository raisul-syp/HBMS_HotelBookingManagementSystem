@extends('layouts.guest')
@section('title', 'Hall Details')

@section('content')
<section id="page_details_section_frontend" class="page_details_section_frontend content_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_title">
                    <h4>Hall Details</h4>
                </div>
                <div class="section_breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item"><a href="{{ url('halls') }}">{{ __('Halls') }}</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Hall Details') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-9">
                <div class="page-details-inner">
                    <div class="card">
                        <div class="owl-carousel owl-theme page-details-carousel">
                            @if (count($hallDetail->hallImages) > 0)
                            @foreach ($hallDetail->hallImages as $hallImage)
                            <div class="item">
                                <img src="{{ asset($hallImage->image) }}" alt="">
                            </div>
                            @endforeach
                            @endif
                        </div>

                        <div class="card-body">
                            <div class="page-header">
                                <div class="page-title">
                                    {{ $hallDetail->name }}
                                </div>
                            </div>

                            <div class="page-description">
                                <div class="short-descrp">
                                    {{ $hallDetail->short_description }}
                                </div>
                                <div class="long-descrp">
                                    {!! html_entity_decode($hallDetail->long_description) !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                                        <div class="input-wrapper">
                                            <input type="date" class="form-control check-in-out" id="checkin_date" name="checkin_date" value="{{ $todayDate }}">
                                            <span class="lnr lnr-calendar-full icon"></span>
                                        </div>
                                    </div>
                                    <div class="form_input col-12 mb-3">
                                        <div class="input-wrapper">
                                            <input type="date" class="form-control check-in-out" id="checkout_date" name="checkout_date" value="{{ $tomorrowDate }}">
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
