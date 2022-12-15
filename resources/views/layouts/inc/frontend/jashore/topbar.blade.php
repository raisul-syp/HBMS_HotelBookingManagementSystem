<div class="container">
    <div class="row">
        <div class="col-lg-8">
            <div class="header_top_left">
                @foreach ($settings as $item)
                @if ($item->hotel_id == '2')
                <ul>
                    <li>
                        <i data-feather="map-pin"></i>
                        <span>{{ $item->address }}</span>
                    </li>
                    <li>
                        <i data-feather="mail"></i>
                        <span>{{ $item->email }}</span>
                    </li>
                    <li>
                        <i data-feather="phone"></i>
                        <span>{{ $item->phone }}</span>
                    </li>
                </ul>                     
                @endif
                @endforeach
            </div>
        </div>

        <div class="col-lg-4">
            <div class="header_top_right">
                @foreach ($settings as $item)
                @if ($item->hotel_id == '2')
                <ul>
                    <li class="facebook" data-bs-toggle="tooltip" data-bs-placement="bottom"
                        title="Facebook">
                        <a href="{{ $item->social_fb }}">
                            <i data-feather="facebook"></i>
                        </a>
                    </li>
                    <li class="twitter" data-bs-toggle="tooltip" data-bs-placement="bottom"
                        title="Twitter">
                        <a href="{{ $item->social_tw }}">
                            <i data-feather="twitter"></i>
                        </a>
                    </li>
                    <li class="instagram" data-bs-toggle="tooltip" data-bs-placement="bottom"
                        title="Instagram">
                        <a href="{{ $item->social_insta }}">
                            <i data-feather="instagram"></i>
                        </a>
                    </li>
                    <li class="youtube" data-bs-toggle="tooltip" data-bs-placement="bottom"
                        title="YouTube">
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
