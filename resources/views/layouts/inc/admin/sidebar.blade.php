<div class="quixnav-scroll">
    <ul class="metismenu" id="menu">
        <li>
            <a href="{{ url('admin/dashboard') }}">
                <i class="icon icon-home"></i>
                <span class="nav-text">{{ __('Dashboard') }}</span>
            </a>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-bell-53"></i>
                <span class="nav-text">{{ __('Role & Permission') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/role-permission/role') }}">{{ __('Manage Role') }}</a></li>
                <li><a href="{{ url('admin/role-permission/permission') }}">{{ __('Manage Permission') }}</a></li>
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
                <i class="icon icon-coffee"></i>
                <span class="nav-text">{{ __('Restaurants') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/restaurent/create') }}">{{ __('Add Restaurant') }}</a></li>
                <li><a href="{{ url('admin/restaurent') }}">{{ __('All Restaurant') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Halls') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/hall/create') }}">{{ __('Add Hall') }}</a></li>
                <li><a href="{{ url('admin/hall') }}">{{ __('All Hall') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Wellness') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/wellness/create') }}">{{ __('Add Wellness') }}</a></li>
                <li><a href="{{ url('admin/wellness') }}">{{ __('All Wellness') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Offers') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/offers/create') }}">{{ __('Add Offer') }}</a></li>
                <li><a href="{{ url('admin/offers') }}">{{ __('All Offer') }}</a></li>
                <li><a href="{{ url('admin/offer-category') }}">{{ __('Offer Category') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('FAQ') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/faq/create') }}">{{ __('Add FAQ') }}</a></li>
                <li><a href="{{ url('admin/faq') }}">{{ __('All FAQ') }}</a></li>
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
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">{{ __('Contact Infos') }}</a>
                    <ul aria-expanded="false">
                        <li><a href="{{ url('admin/website/contactinfo/create') }}">{{ __('Add Contact Info') }}</a></li>
                        <li><a href="{{ url('admin/website/contactinfo') }}">{{ __('All Contact Infos') }}</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Profile Settings') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/profile-settings/my-profile') }}">{{ __('My Profile') }}</a></li>
                <li><a href="{{ url('admin/profile-settings/change-password') }}">{{ __('Change Password') }}</a></li>
            </ul>
        </li>
        <li>
            <a href="{{ url('admin/settings') }}">
                <i class="icon icon-settings-gear-64"></i>
                <span class="nav-text">{{ __('Settings') }}</span>
            </a>
        </li>
    </ul>
</div>
