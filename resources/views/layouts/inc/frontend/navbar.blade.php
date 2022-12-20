<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar middle"></span>
            <span class="icon-bar"></span>
        </button>
        @foreach ($settings as $item)
        @if ($item->hotel_id == '1')
        <a class="navbar-brand" href="{{ url('/') }}">
            <img src="{{ asset('uploads/site/'.$item->logo) }}" alt="{{ $item->name }}">
        </a>                         
        @endif
        @endforeach
        <button class="search-toggler d-block d-lg-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#searchSupportedContent" aria-controls="searchSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <i data-feather="search"></i>
        </button>
        <div id="navbarSupportedContent" class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                @foreach ($menuItems as $item)
                @if ($item->name == 'Rooms')
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ $item->name }}</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        @foreach ($rooms as $room)
                        <li><a class="dropdown-item" href="{{ 'http://localhost:8000/rooms/room-details/'.$room->id }}">{{ $room->name }}</a></li>
                        @endforeach
                      </ul>
                </li>
                @elseif ($item->name == 'Restaurants')
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ $item->name }}</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        @foreach ($restaurents as $restaurent)
                        <li><a class="dropdown-item" href="{{ 'http://localhost:8000/restaurents/restaurent-details/'.$restaurent->id }}">{{ $restaurent->name }}</a></li>
                        @endforeach
                      </ul>
                </li>
                @elseif ($item->name == 'Halls')
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ $item->name }}</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        @foreach ($halls as $hall)
                        <li><a class="dropdown-item" href="{{ 'http://localhost:8000/halls/hall-details/'.$hall->id }}">{{ $hall->name }}</a></li>
                        @endforeach
                      </ul>
                </li>
                @elseif ($item->name == 'Wellness')
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ $item->name }}</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        @foreach ($wellnesses as $wellness)
                        <li><a class="dropdown-item" href="{{ 'http://localhost:8000/wellness/wellness-details/'.$wellness->id }}">{{ $wellness->name }}</a></li>
                        @endforeach
                      </ul>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link" href="{{ 'http://localhost:8000/'.$item->slug }}"><span>{{ $item->name }}</span></a>
                </li>
                @endif
                @endforeach

                @if (Auth::user())
                <li class="nav-item">
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <a class="nav-link btn btn-primary btn-golden" href="{{ route('logout') }}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Logout" onclick="event.preventDefault(); this.closest('form').submit();">
                            <i data-feather="power"></i>
                        </a>
                    </form>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link btn btn-primary btn-golden" href="{{ route('login') }}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Login">
                        <i data-feather="log-in"></i>
                    </a>
                </li>
                @endif

                @if (Auth::user())
                <li class="nav-item ms-2">
                    <a class="nav-link btn btn-primary btn-golden" href="{{ url('/booking') }}">
                        {{ _('Booking') }}
                    </a>
                </li>
                @else
                <li class="nav-item ms-2">
                    <a class="nav-link btn btn-primary btn-golden" href="{{ route('login') }}">
                        {{ _('Booking') }}
                    </a>
                </li>
                @endif

            </ul>
        </div>
        <div class="collapse search-collapse" id="searchSupportedContent">
            <div class="search-box">
                <form role="search">
                    <input class="form-control" type="search" placeholder="Search">
                    <button type="submit" class="btn btn-primary">
                        <i data-feather="search"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</nav>
