@extends('layouts.guest')
@section('title', 'Confirm Booking')

@section('content')
<section id="about_section" class="about_section content_section" style="padding: 40px 0;">
    <div class="about_section_inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title">
                        <h4>Confirm Booking</h4>
                    </div>
                    <div class="section_breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Confirm Booking</a></li>
                        </ol>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    @if (session('message'))
                        <div class="alert alert-success solid alert-right-icon alert-dismissible fade show mb-0 mt-3">
                            <span><i class="fas fa-check"></i></span>
                            {{ session('message') }}
                        </div>
                    @endif
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-lg-12">
                    <form action="{{ url('/confirm-booking') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="booking-form-inner">
                            <div class="card">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <div class="form-title">
                                        <h4>{{ __('Booking Details') }}</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-12 mb-4">
                                            <h4 class="confirm-booking-card-header">Booking Schedule</h4>

                                            <div class="form-group row mb-3">
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Checkin Date') }}
                                                    </label>
                                                    <div class="input-wrapper">
                                                        <input type="date" class="form-control checkin-date" id="checkin_date" name="checkin_date" value="{{ $checkin_date }}">
                                                        <span class="lnr lnr-calendar-full icon"></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Checkout Date') }}
                                                    </label>
                                                    <div class="input-wrapper">
                                                        <input type="date" class="form-control checkout-date" id="checkout_date" name="checkout_date" value="{{ $checkout_date }}">
                                                        <span class="lnr lnr-calendar-full icon"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mb-3">
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Checkin Time') }}
                                                    </label>
                                                    <div class="input-wrapper">
                                                        <input type="time" class="form-control" id="checkin_time" name="checkin_time" value="14:00">
                                                        <span class="lnr lnr-clock icon"></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Checkout Time') }}
                                                    </label>
                                                    <div class="input-wrapper">
                                                        <input type="time" class="form-control" id="checkout_time" name="checkout_time" value="12:00">
                                                        <span class="lnr lnr-clock icon"></span>
                                                    </div>
                                                </div>
                                            </div><div class="form-group row mb-3">
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Total Adults') }}
                                                    </label>
                                                    <select class="form-control" id="total_adults" name="total_adults">
                                                        <option value="1" {{ old('total_adults', $total_adults) == '1' ? 'selected' : '' }}>1</option>
                                                        <option value="2" {{ old('total_adults', $total_adults) == '2' ? 'selected' : '' }}>2</option>
                                                        <option value="3" {{ old('total_adults', $total_adults) == '3' ? 'selected' : '' }}>3</option>
                                                        <option value="4" {{ old('total_adults', $total_adults) == '4' ? 'selected' : '' }}>4</option>
                                                        <option value="5" {{ old('total_adults', $total_adults) == '5' ? 'selected' : '' }}>5</option>
                                                        <option value="6" {{ old('total_adults', $total_adults) == '6' ? 'selected' : '' }}>6</option>
                                                        <option value="7" {{ old('total_adults', $total_adults) == '7' ? 'selected' : '' }}>7</option>
                                                        <option value="8" {{ old('total_adults', $total_adults) == '8' ? 'selected' : '' }}>8</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Total Childs') }}
                                                    </label>
                                                    <select class="form-control" id="total_childs" name="total_childs">
                                                        <option value="1" {{ old('total_childs', $total_childs) == '1' ? 'selected' : '' }}>1</option>
                                                        <option value="2" {{ old('total_childs', $total_childs) == '2' ? 'selected' : '' }}>2</option>
                                                        <option value="3" {{ old('total_childs', $total_childs) == '3' ? 'selected' : '' }}>3</option>
                                                        <option value="4" {{ old('total_childs', $total_childs) == '4' ? 'selected' : '' }}>4</option>
                                                        <option value="5" {{ old('total_childs', $total_childs) == '5' ? 'selected' : '' }}>5</option>
                                                        <option value="6" {{ old('total_childs', $total_childs) == '6' ? 'selected' : '' }}>6</option>
                                                        <option value="7" {{ old('total_childs', $total_childs) == '7' ? 'selected' : '' }}>7</option>
                                                        <option value="8" {{ old('total_childs', $total_childs) == '8' ? 'selected' : '' }}>8</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <h4 class="confirm-booking-card-header">Room Details</h4>
                                            <input type="text" id="room_id" name="room_id" value="{{ $room_id }}" hidden>
                                            
                                            {{-- <div class="form-group row mb-3">
                                                <div class="col-sm-6">
                                                    <label class="form-label text-right">
                                                        {{ __('Room Name') }}
                                                    </label>
                                                    @foreach ($rooms as $room)
                                                    @if ($room->id == $room_id)
                                                    <select class="form-control" id="room_id" name="room_id">
                                                        <option value="{{ $room_id }}">{{ $room->name }}</option>
                                                    </select>                                                     
                                                    @endif
                                                    @endforeach
                                                </div>
                                            </div>    --}}
                                            
                                            @foreach ($rooms as $room)
                                            @if ($room->id == $room_id)
                                            <div class="form-group row mb-2">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Room Name') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ $room->name }}</p>
                                                </div>
                                            </div>      
                                            
                                            <div class="form-group row mb-2">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Max. Childs') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ $room->max_childs }} person(s)</p>
                                                </div>
                                            </div>     
                                            
                                            <div class="form-group row mb-2">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Max. Adults') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ $room->max_adults }} person(s)</p>
                                                </div>
                                            </div>     
                                            
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Price') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ '$'.$room->price.'++ /night' }}</p>
                                                </div>
                                            </div>                                         
                                            @endif
                                            @endforeach                                        
                                        </div>

                                        <div class="col-lg-6">
                                            <h4 class="confirm-booking-card-header">Guest Details</h4>
                                            <input type="text" id="guest_id" name="guest_id" value="{{ Auth::user()->id }}" hidden>
                                            
                                            <div class="form-group row mb-2">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Name') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ Auth::user()->first_name.' '.Auth::user()->last_name }}</p>
                                                </div>
                                            </div>  
                                            
                                            <div class="form-group row mb-2">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Email') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ Auth::user()->email }}</p>
                                                </div>
                                            </div>  
                                            
                                            <div class="form-group row mb-2">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Phone') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ Auth::user()->phone }}</p>
                                                </div>
                                            </div>   
                                            
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">
                                                    {{ __('Address') }}
                                                </label>
                                                <div class="col-sm-9">
                                                    <p class="confirm-booking-text">{{ Auth::user()->address.', '.Auth::user()->city.', '.Auth::user()->state.'-'.Auth::user()->postal_code.', '.Auth::user()->country }}</p>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary front-btn-booking text-uppercase">
                                            {{ __('Book') }}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>




@endsection
