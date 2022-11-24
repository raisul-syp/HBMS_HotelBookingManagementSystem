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
                <span class="nav-text">{{ __('Room Type') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/roomtype/create') }}">{{ __('Add Room Type') }}</a></li>
                <li><a href="{{ url('admin/roomtype') }}">{{ __('Room Type List') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Rooms') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/room/create') }}">{{ __('Add Room') }}</a></li>
                <li><a href="{{ url('admin/room') }}">{{ __('Room List') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Facilities') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/facility/create') }}">{{ __('Add Facility') }}</a></li>
                <li><a href="{{ url('admin/facility') }}">{{ __('Facility List') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Guests') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/guest/create') }}">{{ __('Add Guest') }}</a></li>
                <li><a href="{{ url('admin/guest') }}">{{ __('Guest List') }}</a></li>
            </ul>
        </li>
        <li>
            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                <i class="icon icon-single-04"></i>
                <span class="nav-text">{{ __('Users') }}</span>
            </a>
            <ul aria-expanded="false">
                <li><a href="{{ url('admin/user/create') }}">{{ __('Add User') }}</a></li>
                <li><a href="{{ url('admin/user') }}">{{ __('User List') }}</a></li>
            </ul>
        </li>
    </ul>
</div>
