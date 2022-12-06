@extends('layouts.guest')
@section('title', 'Home')

@section('content')
<section id="heroSlider_section" class="heroSlider_section">
    @foreach ($sliders as $slider)
    <div class="heroSlider_section_inner desktop-view">
        <div class="owl-carousel owl-theme home-slider">
            <div class="item">
                <img src="{{ asset('frontend/images/sliders/'.$slider->desktop_image) }}" alt="">
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
        </div>
    </div>
    <div class="heroSlider_section_inner mobile-view">
        <div class="owl-carousel owl-theme home-slider">
            <div class="item">
                <img src="{{ asset('frontend/images/sliders/'.$slider->mobile_image) }}" alt="">
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
        </div>
    </div>
    @endforeach

    <div class="availability_sec">
        <div class="container">
            <div class="availability_sec_inner">
                <form action="{{ url('available-rooms') }}" method="GET">
                    <div class="availability_form">
                        <div class="form_input col-12">
                            <label for="checkin_date" class="form-label text-white">Check-In:</label>
                            <div class="date-box">
                                <input type="text" class="form-control" id="checkin_date" name="checkin_date" value="{{ $todayDate }}">
                                <span class="lnr lnr-calendar-full icon"></span>
                            </div>
                        </div>
                        <div class="form_input col-12">
                            <label for="checkout_date" class="form-label text-white">Check-Out:</label>
                            <div class="date-box">
                                <input type="text" class="form-control" id="checkout_date" name="checkout_date" value="{{ $tomorrowDate }}">
                                <span class="lnr lnr-calendar-full icon"></span>
                            </div>
                        </div>
                        <div class="form_input col-12">
                            <label for="hotel_location" class="form-label text-white">Hotel Location:</label>
                            <select class="form-select" id="hotel_location" name="hotel_location">
                                <option value="Dhaka">Dhaka</option>
                                <option value="Jashore">Jashore</option>
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
            <div class="row">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <div class="image_box">
                        <div class="card">
                            <div class="card-body">
                                <div class="image">
                                    <img src="{{ asset('frontend/images/aboutus/building.jpg') }}" alt="">
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
                                    <h2>"A place that sparks creativity, fuels the imagination and welcomes reflection and relaxation."</h2>
                                    <h4><span class="decor-1"></span> Zabeer Hotel International</h4>
                                    <!-- <hr> -->
                                    <p>We Offer 5-Star Banquet Spaces, Complete With Catering And Event Management Facilities. Discover The International Favorites Grilled To Perfection In The Live Kitchen. Experiment With Choicest Of Accompaniments And Sauces.The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.The Ambience And Therapies At Our International Spa Offered By Experienced Professionals Ensure That You Are Rejuvenated.State Of The Art Gymnasium And With An Exercise Studio.Haircare And Beauty Treatments By Trained Stylists.The Elegant Att-Day Three Restaurant Provides A Stunning Atmosphere In Which To Sample Europian,Asian,Thai, Chinese Arabic And Our Own Local Cuisine.</p>
                                    <a href="{{ url('/about-us') }}" class="btn btn-primary btn-read">
                                        <span>Read more</span>
                                        <i class="fas fa-long-arrow-alt-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                @foreach ($rooms as $room)
                <div class="col-lg-4 col-mob-4">
                    <div class="rooms_sec">
                        <div class="card">
                            <div class="card-image">
                                {{-- <img src="{{ asset('frontend/images/rooms/suite-room.jpg') }}" alt=""> --}}
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
                                        <h6>৳{{ $room->price }} / Night</h6>
                                    </div>
                                    <a href="{{ url('rooms/room-details/'.$room->id) }}" class="btn-view">View more</a>
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
                    <img src="{{ asset('frontend/images/facilities/restaurent.png') }}" alt="">
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
                    <img src="{{ asset('frontend/images/facilities/wellness.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="facility_image">
                    <img src="{{ asset('frontend/images/facilities/meeting.png') }}" alt="">
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
                    <div class="item">
                        <div class="image">
                            <img src="frontend/images/testimonials/mr_matiur_rahman.jpg" alt="">
                        </div>
                        <div class="content">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="title">Mr. Matiur Rahman</h4>
                                    <h6 class="position">Owner</h6>
                                    <h5 class="company">Sarothi Enterprise</h5>

                                    <p class="message">Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                    <img src="{{ asset('uploads/facilities/'.$facility->image) }}" alt="">
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
