<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar middle"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{{ url('/') }}">
            <img src="{{ asset('frontend/images/logos/png/logo-dhaka.png') }}" alt="Zabeer Hotel International">
        </a>
        <button class="search-toggler d-block d-lg-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#searchSupportedContent" aria-controls="searchSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <i data-feather="search"></i>
        </button>
        <div id="navbarSupportedContent" class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                @foreach ($menuItems as $item)
                @if (count($item->submenus) > 0)
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ $item->name }}</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        @foreach ($item->submenus as $submenuItem)
                        <li><a class="dropdown-item" href="{{ $submenuItem->slug }}">{{ $submenuItem->name }}</a></li>
                        @endforeach
                      </ul>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link" href="{{ $item->slug }}"><span>{{ $item->name }}</span></a>
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
