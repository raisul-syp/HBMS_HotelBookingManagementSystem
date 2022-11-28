<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar middle"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">
            <img src="{{ asset('frontend/images/logo.png') }}" alt=" Al-Fatah International">
        </a>
        <button class="search-toggler d-block d-lg-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#searchSupportedContent" aria-controls="searchSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <i data-feather="search"></i>
        </button>
        <div id="navbarSupportedContent" class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.html"><span>Home</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="rooms.html" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Rooms</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Suite</a></li>
                        <li><a class="dropdown-item" href="#">Premium</a></li>
                        <li><a class="dropdown-item" href="#">Premium Twin</a></li>
                        <li><a class="dropdown-item" href="#">Deluxe</a></li>
                        <li><a class="dropdown-item" href="#">Deluxe Twin</a></li>
                      </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="restaurent.html" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Restaurents</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Cafe 24</a></li>
                        <li><a class="dropdown-item" href="#">Taste of Heaven</a></li>
                        <li><a class="dropdown-item" href="#">Sky Line</a></li>
                      </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="meeting.html" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Meeting & Events</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Board Room</a></li>
                        <li><a class="dropdown-item" href="#">Olive Hall</a></li>
                        <li><a class="dropdown-item" href="#">Tulip Hall</a></li>
                      </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="wellness.html" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Wellness</a>
                      <ul class="dropdown-menu fade-down" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Spa</a></li>
                        <li><a class="dropdown-item" href="#">Saloon</a></li>
                        <li><a class="dropdown-item" href="#">Gym</a></li>
                        <li><a class="dropdown-item" href="#">Swimming Pool</a></li>
                      </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="aboutus.html"><span>About</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactus.html"><span>Contact</span></a>
                </li>
                <li class="nav-item nav-icon d-none d-lg-block">
                    <button class="search-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#searchSupportedContent" aria-controls="searchSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i data-feather="search"></i>
                    </button>
                    <a href="cart.html" class="cart-list">
                        <i data-feather="shopping-bag"></i>
                        <span>0</span>
                    </a>
                </li>
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