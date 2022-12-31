<a href="{{ url('/admin/dashboard') }}" class="brand-logo">
    @foreach ($settings as $item)
    <img class="logo-abbr" src="{{ asset('uploads/site/'.$item->logo) }}" alt="">
    @endforeach
</a>

<div class="nav-control">
    <div class="hamburger">
        <span class="line"></span><span class="line"></span><span class="line"></span>
    </div>
</div>
