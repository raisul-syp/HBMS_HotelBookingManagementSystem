<div class="footer_section_inner">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    @foreach ($settings as $item)
                    @if ($item->hotel_id == '1')
                    <div class="footer_logo">
                        <img src="{{ asset('uploads/site/'.$item->logo) }}" alt="{{ $item->name }}">
                    </div>                     
                    @endif
                    @endforeach
                </div>

                <div class="col-lg-7">
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
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="footer_contact">
                        <h4>
                            <span>Contact Us</span>
                            <div class="decor-1"></div>
                        </h4>
                        @foreach ($settings as $item)
                        @if ($item->hotel_id == '1')
                        <ul class="contact">
                            <li>
                                <i data-feather="map-pin"></i>
                                <a href="#">{{ $item->address }}</a>
                            </li>
                            <li>
                                <i data-feather="phone"></i>
                                <a href="#">{{ $item->phone }}</a>
                            </li>
                            <li>
                                <i data-feather="mail"></i>
                                <a href="#">{{ $item->email }}</a>
                            </li>
                        </ul>             
                        @endif
                        @endforeach

                        @foreach ($settings as $item)
                        @if ($item->hotel_id == '1')
                        <ul class="social">
                            <li>
                                <a href="{{ $item->social_fb }}">
                                    <i data-feather="facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="{{ $item->social_tw }}">
                                    <i data-feather="twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="{{ $item->social_insta }}">
                                    <i data-feather="instagram"></i>
                                </a>
                            </li>
                            <li>
                                <a href="{{ $item->social_yt }}">
                                    <i data-feather="youtube"></i>
                                </a>
                            </li>
                        </ul>     
                        @endif
                        @endforeach
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
