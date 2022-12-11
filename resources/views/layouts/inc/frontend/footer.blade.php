<div class="footer_section_inner">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="footer_logo">
                        <img src="{{ asset('frontend/images/logos/png/logo-dhaka.png') }}" alt="">
                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="footer_links">
                        <h4>
                            <span>Useful Links</span>
                            <div class="decor-1"></div>
                        </h4>
                        <ul>
                            @foreach ($footerItems as $item)
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ $item->slug }}">{{ $item->name }}</a>
                            </li>
                            @endforeach
                            {{-- <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/about-us') }}">About Us</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/contact-us') }}">Contact Us</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/offers') }}">Offers</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/news') }}">News</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/rooms') }}">Rooms</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/about-us') }}">Restaurant</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/meeting-rooms') }}">Meeting & Events</a>
                            </li>
                            <li>
                                <i data-feather="chevron-right"></i>
                                <a href="{{ url('/wellness') }}">Wellness</a>
                            </li> --}}
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="footer_contact">
                        <h4>
                            <span>Contact Us</span>
                            <div class="decor-1"></div>
                        </h4>
                        <ul class="contact">
                            <li>
                                <i data-feather="map-pin"></i>
                                <a href="#">1256 M M Ali Road, Jashore</a>
                            </li>
                            <li>
                                <i data-feather="phone"></i>
                                <a href="#">sm@zabeerhotel.com</a>
                            </li>
                            <li>
                                <i data-feather="mail"></i>
                                <a href="#">(+88) 01885-000-555</a>
                            </li>
                        </ul>

                        <ul class="social">
                            <li>
                                <a href="http://www.facebook.com/#">
                                    <i data-feather="facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://twitter.com/#">
                                    <i data-feather="twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/#">
                                    <i data-feather="instagram"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.youtube.com/user/#">
                                    <i data-feather="youtube"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer_bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer_bottom_inner">
                        <p>Zabeer Hotel International © 2022 | Developed By <a href="https://sypsolutions.com.bd/">SYP Solutions Ltd.</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
