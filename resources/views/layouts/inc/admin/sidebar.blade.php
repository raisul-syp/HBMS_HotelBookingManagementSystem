<div class="quixnav-scroll">
    <ul class="metismenu" id="menu">
        <li>
            <a href="{{ url('admin/dashboard') }}">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Dashboard') }}</span>
            </a>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Hotel') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/hotels/create') }}">{{ __('Add Hotel') }}</a></li>
                <li><a href="{{ url('admin/hotels') }}">{{ __('All Hotels') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Room Type') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/roomtype/create') }}">{{ __('Add Room Type') }}</a></li>
                <li><a href="{{ url('admin/roomtype') }}">{{ __('All Room Type') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Facilities') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/facility/create') }}">{{ __('Add Facility') }}</a></li>
                <li><a href="{{ url('admin/facility') }}">{{ __('All Facility') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Rooms') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/room/create') }}">{{ __('Add Room') }}</a></li>
                <li><a href="{{ url('admin/room') }}">{{ __('All Room') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Bookings') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/booking/create') }}">{{ __('Add Booking') }}</a></li>
                <li><a href="{{ url('admin/booking') }}">{{ __('All Booking') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Guests') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/guest/create') }}">{{ __('Add Guest') }}</a></li>
                <li><a href="{{ url('admin/guest') }}">{{ __('All Guest') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Users') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/user/create') }}">{{ __('Add User') }}</a></li>
                <li><a href="{{ url('admin/user') }}">{{ __('All User') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Website') }}</span>
            </a>
            <ul aria-expanded="false">
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Menu') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/menu/create') }}">{{ __('Add Menu') }}</a></li>
                        <li><a href="{{ url('admin/website/menu') }}">{{ __('All Menu') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Submenu') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/submenu/create') }}">{{ __('Add Submenu') }}</a></li>
                        <li><a href="{{ url('admin/website/submenu') }}">{{ __('All Submenu') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Pages') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/pages/create') }}">{{ __('Add Page') }}</a></li>
                        <li><a href="{{ url('admin/website/pages') }}">{{ __('All Page') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Sliders') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/sliders/create') }}">{{ __('Add Slider') }}</a></li>
                        <li><a href="{{ url('admin/website/sliders') }}">{{ __('All Slider') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Testimonials') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/testimonials/create') }}">{{ __('Add Testimonial') }}</a></li>
                        <li><a href="{{ url('admin/website/testimonials') }}">{{ __('All Testimonials') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Facilities') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/facilities/create') }}">{{ __('Add Facility') }}</a></li>
                        <li><a href="{{ url('admin/website/facilities') }}">{{ __('All Facilities') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Addresses') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/addresses/create') }}">{{ __('Add Address') }}</a></li>
                        <li><a href="{{ url('admin/website/addresses') }}">{{ __('All Addresses') }}</a></li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div>
