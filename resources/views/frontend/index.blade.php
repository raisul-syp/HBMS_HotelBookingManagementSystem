@extends('layouts.guest')
@section('title', 'Home')

@section('content')
<section id="heroSlider_section" class="heroSlider_section">
    <div class="heroSlider_section_inner desktop-view">
        <div class="owl-carousel owl-theme home-slider">
            @foreach ($sliders as $slider)
            @if ($slider->hotel_id == '1')
            <div class="item">
                <img src="{{ asset('frontend/images/sliders/'.$slider->desktop_image) }}" alt="" width="100%" height="603px">
                <div class="cover">
                    <div class="cover-inner">
                        <div class="container">
                            <div class="header-content">
                                <h3>{{ $slider->content_1 }}</h3>
                                <h1>{{ $slider->content_2 }}</h1>
                                <hr>
                                <h4>{{ $slider->content_3 }}</h4>
                                <a href="/" class="btn btn-primary btn-read-more">The Zabeer Dhaka</a>
                                <a href="/Jashore" class="btn btn-primary btn-read-more">The Zabeer Jashore</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                
            @endif
            @endforeach
        </div>
    </div>
    <div class="heroSlider_section_inner mobile-view">
        <div class="owl-carousel owl-theme home-slider">
            @foreach ($sliders as $slider)
            @if ($slider->hotel_id == '1')
            <div class="item">
                <img src="{{ asset('frontend/images/sliders/'.$slider->mobile_image) }}" alt="" width="1320px" height="1000px">
                <div class="cover">
                    <div class="cover-inner">
                        <div class="container">
                            <div class="header-content">
                                <h3>{{ $slider->content_1 }}</h3>
                                <h1>{{ $slider->content_2 }}</h1>
                                <hr>
                                <h4>{{ $slider->content_3 }}</h4>
                                <a href="{{ $slider->button_1_url }}" class="btn btn-primary btn-read-more">{{ $slider->button_1 }}</a>
                                <a href="{{ $slider->button_2_url }}" class="btn btn-primary btn-read-more">{{ $slider->button_2 }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>          
            @endif
            @endforeach
        </div>
    </div>

    <div class="availability_sec">
        <div class="container">
            <div class="availability_sec_inner">
                <form action="{{ url('available-rooms') }}" method="GET">
                    <div class="availability_form">
                        <div class="form_input col-12">
                            <label for="checkin_date" class="form-label text-white">Check-In:</label>
                            <div class="date-box">
                                <input type="date" class="form-control" id="checkin_date" name="checkin_date" value="{{ $todayDate }}">
                                <span class="lnr lnr-calendar-full icon"></span>
                            </div>
                        </div>
                        <div class="form_input col-12">
                            <label for="checkout_date" class="form-label text-white">Check-Out:</label>
                            <div class="date-box">
                                <input type="date" class="form-control" id="checkout_date" name="checkout_date" value="{{ $tomorrowDate }}">
                                <span class="lnr lnr-calendar-full icon"></span>
                            </div>
                        </div>
                        <div class="form_input col-12">
                            <label for="hotel_location" class="form-label text-white">Hotel Location:</label>
                            <select class="form-select" id="hotel_location" name="hotel_location">
                                @forelse ($hotels as $hotel)
                                <option value="{{ $hotel->id }}">{{ $hotel->hotel_location }}</option>
                                @empty
                                <option>No Data</option>
                                @endforelse
                              </select>
                        </div>
                        <div class="form_input col-12">
                            <label for="adults" class="form-label text-white">Adults:</label>
                            <select class="form-select" id="adults" name="adults">
                                <option selected>0</option>
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
                        <div class="form_input col-12">
                            <label for="children" class="form-label text-white">Children:</label>
                            <select class="form-select" id="children" name="children">
                                <option selected>0</option>
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
                        <div class="form_input col-12 submit_btn">
                            <button type="submit" class="btn btn-primary">Check Availability</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<section id="about_section" class="about_section">
    <div class="about_section_inner">
        <div class="container">
            @foreach ($aboutUs as $about)
            @if ($about->hotel_id == '1')
            <div class="row">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <div class="image_box">
                        <div class="card">
                            <div class="card-body">
                                <div class="image">
                                    <img src="{{ asset('frontend/images/pages/'.$about->image) }}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 mb-0 mb-lg-0">
                    <div class="content_box">
                        <div class="card">
                            <div class="card-body">
                                <div class="content">
                                    <h2>{{ $about->title }}</h2>
                                    <h4><span class="decor-1"></span> {{ $about->sub_title }}</h4>
                                    <p>{!! html_entity_decode($about->long_description) !!}</p>
                                    <a href="{{ $about->url }}" class="btn btn-primary btn-read">
                                        <span>Read more</span>
                                        <i class="fas fa-long-arrow-alt-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>      
            @endif
            @endforeach
        </div>
    </div>
</section>

<section id="rooms_section" class="rooms_section">
    <div class="rooms_section_inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title">
                        <h4>Rooms & Suits</h4>
                        <div class="decor-1"></div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                @foreach ($rooms->slice(0, 3) as $room)
                <div class="col-lg-4 col-mob-6 mb-4">
                    <div class="rooms_sec">
                        <div class="card">
                            <div class="card-image">
                                @if (count($room->roomImages) > 0)
                                @foreach ($room->roomImages as $roomImage)
                                <img src="{{ asset($roomImage->image) }}" alt="">
                                @break
                                @endforeach
                                @endif
                            </div>
                            <div class="card-body">
                                <div class="content">
                                    <div class="content_inner">
                                        <h4>{{ $room->name }}</h4>
                                        <div class="room-proce">
                                            <p><strong>${{ $room->price }}++</strong>/night</p>
                                            <small>Rack Rate</small>
                                        </div>
                                    </div>
                                    <a href="{{ url('rooms/room-details/'.$room->id) }}" class="btn-view">
                                        <span>View details</span>
                                        <i class="fas fa-long-arrow-alt-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</section>

<section id="facility_section" class="facility_section">
    <div class="facility_section_inner">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="facility_image">
                    <img src="{{ asset('frontend/images/wellness/restaurent.png') }}" alt="">
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="facility_content">
                    <h4>Restaurent <span class="decor-1"></span></h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the when an unknown printer took a galley of type and scrambled. It to make a type specimen book.</p>
                    <a href="#" class="btn btn-primary btn-book">Book now</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="facility_content">
                    <h4>Wellness <span class="decor-1"></span></h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the when an unknown printer took a galley of type and scrambled. It to make a type specimen book.</p>
                    <a href="#" class="btn btn-primary btn-book">Book now</a>
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="facility_image">
                    <img src="{{ asset('frontend/images/wellness/wellness.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="facility_image">
                    <img src="{{ asset('frontend/images/wellness/meeting.png') }}" alt="">
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="facility_content">
                    <h4>Meeting & Events <span class="decor-1"></span></h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the when an unknown printer took a galley of type and scrambled. It to make a type specimen book.</p>
                    <a href="#" class="btn btn-primary btn-book">Book now</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="offer_section" class="offer_section">
    <div class="offer_section_inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="offer_sec">
                        <div class="content">
                            <h5>Need a vacation? We offered you the</h5>
                            <h4>Best Holiday Offer</h4>
                        </div>
                        <div class="offer_btn">
                            <a href="#" class="btn btn-book">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div id="testimonials_section" class="testimonials_section">
    <div class="testimonials_section_inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title">
                        <h4>Testimonials</h4>
                        <div class="decor-1"></div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="owl-carousel owl-theme testimonials-slider">
                    @foreach ($testimonials as $testimonial)
                    <div class="item">
                        <div class="image">
                            <img src="{{ asset('frontend/images/testimonials/'.$testimonial->image) }}" alt="">
                        </div>
                        <div class="content">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="title">{{ $testimonial->name }}</h4>
                                    <h6 class="position">{{ $testimonial->designation }}</h6>
                                    <h5 class="company">{{ $testimonial->company }}</h5>

                                    <p class="message">{{ $testimonial->message }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>

<section id="coreFacility_section" class="coreFacility_section">
    <div class="coreFacility_section_inner">
        <div class="container">
            <div class="row">
                @foreach ($facilities as $facility)
                <div class="col-lg-3 col-mob-6 mb-2 mb-lg-4">
                    <div class="coreFacilities_sec">
                        <div class="card">
                            <div class="card-body">
                                <div class="icon">
                                    <img src="{{ asset('frontend/images/facilities/'.$facility->image) }}" alt="">
                                </div>
                                <div class="content">
                                    <h4>{{ $facility->name }}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
@endsection
