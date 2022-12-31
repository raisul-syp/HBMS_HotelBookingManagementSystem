@extends('layouts.guest')
@if ($page)
@section('title', $page->name)

@section('content')
<section id="pages_section" class="pages_section content_section">
    <div class="pages_section_frontend">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title">
                        <h4>{{ $page->name }}</h4>
                    </div>
                    <div class="section_breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ $page->name }}</a></li>
                        </ol>
                    </div>
                </div>
            </div>

            @if ($page->name == 'Offers')
            <div class="row mt-4">
                @forelse ($offers as $offer)
                <div class="col-lg-4 col-mob-6 mb-4">
                    <div class="page-inner">
                        <div class="card">
                            <div class="page-image">
                                <img src="{{ asset('uploads/offer/'.$offer->thumb) }}" alt="">
                            </div>
                            <div class="card-body">
                                <hr>
                                <div class="page-terminal d-flex align-items-center justify-content-between">
                                    <div class="datetime">
                                        <i class="fa fa-calendar me-1"></i>
                                        <span>{{ date('d M Y', strtotime($offer->start_date)).' - '.date('d M Y', strtotime($offer->end_date)) }}</span>
                                    </div>
                                </div>
                                <hr>
                                <div class="page-header">
                                    <div class="page-title">
                                        {{ $offer->name }}
                                    </div>
                                </div>
                                <div class="page-body">
                                    <div class="page-dscrp">
                                        {{ $offer->short_description }}
                                    </div>
                                </div>
                            </div>
                            <div class="page-details-btn">
                                <a href="{{ url('offers/offer-details/'.$offer->slug) }}" class="btn btn-primary">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                @empty
                <div class="row mt-4">
                    <div class="col-lg-12">
                        No Offers Record Available!
                    </div>
                </div>
                @endforelse
            </div>
            @endif

            @if ($page->name == 'News')
            <div class="row mt-4">
                <div class="col-lg-4 mb-4">
                    No News Record Available!
                </div>
            </div>
            @endif

            @if ($page->name == 'Rooms')
            <div class="row mt-4">
                @forelse ($rooms as $room)
                <div class="col-lg-6 mb-4">
                    <div class="card">
                        <div class="page-image">
                            @if (count($room->roomImages) > 0)
                            @foreach ($room->roomImages as $roomImage)
                            <img src="{{ asset($roomImage->image) }}" alt="">
                            @break
                            @endforeach
                            @endif
                        </div>
                        <div class="card-body">
                            <div class="page-header">
                                <div class="page-title">
                                    {{ $room->name }}
                                </div>
                                <div class="page-price">
                                    ${{ $room->price }}++<span>/ night</span>
                                </div>
                            </div>
                            <div class="page-body">
                                <div class="page-dscrp">
                                    {{ $room->short_description }}
                                </div>
                                <div class="page-detail">
                                    <div class="page-capacity">
                                        <span>
                                            <strong>Max. Guest:</strong>
                                        </span>
                                        <span  data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Adults">
                                            <i class="fas fa-user"></i>
                                            {{ $room->max_adults }}
                                        </span>
                                        <span  data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Childs">
                                            <i class="fas fa-baby"></i>
                                            {{ $room->max_childs }}
                                        </span>
                                    </div>
                                    <div class="page-availability">
                                        @if (count($room->bookings) > 0)
                                        <span class="badge bg-danger">Occupied</span>
                                        @else
                                        <span class="badge bg-success">Available</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="page-details-btn">
                            <a href="{{ url('rooms/room-details/'.$room->slug) }}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                @empty
                <div class="row mt-4">
                    <div class="col-lg-12">
                        No Rooms Record Available!
                    </div>
                </div>
                @endforelse
            </div>
            @endif

            @if ($page->name == 'Restaurants')
            <div class="row mt-4">
                @forelse ($restaurants as $restaurant)
                <div class="col-lg-3 mb-4">
                    <div class="card restaurant">
                        @if (!$restaurant->logo_image == NULL)
                        <div class="page-image logo">
                            <img src="{{ asset('uploads/restaurents/logo/'.$restaurant->logo_image) }}" alt="">
                        </div>
                        <div class="page-loaction">
                            {{ $restaurant->name }}
                        </div>
                        @else
                        <div class="page-image">
                            @if (count($restaurant->restaurantImages) > 0)
                            @foreach ($restaurant->restaurantImages as $restaurantImage)
                            <img src="{{ asset($restaurantImage->image) }}" alt="">
                            @break
                            @endforeach
                            @endif
                        </div>
                        <div class="page-loaction">
                            {{ $restaurant->name }}
                        </div>
                        @endif
                        <div class="page-details-btn">
                            <a href="{{ url('restaurants/restaurant-details/'.$restaurant->slug) }}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                @empty
                <div class="row mt-4">
                    <div class="col-lg-12">
                        No Restaurants Record Available!
                    </div>
                </div>
                @endforelse
            </div>
            @endif

            @if ($page->name == 'Halls')
            <div class="row mt-4">
                @forelse ($halls as $hall)
                <div class="col-lg-4 mb-4">
                    <div class="card hall">
                        @if (!$hall->logo_image == NULL)
                        <div class="page-image logo">
                            <img src="{{ asset('uploads/halls/logo/'.$hall->logo_image) }}" alt="">
                        </div>
                        @else
                        <div class="page-image">
                            @if (count($hall->hallImages) > 0)
                            @foreach ($hall->hallImages as $hallImage)
                            <img src="{{ asset($hallImage->image) }}" alt="">
                            @break
                            @endforeach
                            @endif
                        </div>
                        <div class="page-loaction">
                            {{ $hall->name }}
                        </div>
                        @endif

                        <div class="page-details-btn">
                            <a href="{{ url('halls/hall-details/'.$hall->slug) }}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                @empty
                <div class="row mt-4">
                    <div class="col-lg-12">
                        No Halls Record Available!
                    </div>
                </div>
                @endforelse
            </div>
            @endif

            @if ($page->name == 'Wellness')
            <div class="row mt-4">
                @forelse ($wellnesses as $wellness)
                <div class="col-lg-4 mb-4">
                    <div class="card wellness">
                        @if (!$wellness->logo_image == NULL)
                        <div class="page-image logo">
                            <img src="{{ asset('uploads/wellness/logo/'.$wellness->logo_image) }}" alt="">
                        </div>
                        <div class="page-loaction">
                            {{ $wellness->name }}
                        </div>
                        @else
                        <div class="page-image">
                            @if (count($wellness->wellnessImages) > 0)
                            @foreach ($wellness->wellnessImages as $wellnessImage)
                            <img src="{{ asset($wellnessImage->image) }}" alt="">
                            @break
                            @endforeach
                            @endif
                        </div>
                        <div class="page-loaction">
                            {{ $wellness->name }}
                        </div>
                        @endif

                        <div class="page-details-btn">
                            <a href="{{ url('wellness/wellness-details/'.$wellness->slug) }}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                @empty
                <div class="row mt-4">
                    <div class="col-lg-12">
                        No Restaurants Record Available!
                    </div>
                </div>
                @endforelse
            </div>
            @endif

            @if ($page->name == 'Certificates & Awards')
            <div class="row mt-4">
                <div class="col-lg-4 mb-4">
                    No Certificates & Awards Record Available!
                </div>
            </div>
            @endif

            @if ($page->name == 'Booking Cancelation Policy')
            <div class="row mt-4">
                <div class="col-lg-4 mb-4">
                    No Booking Cancelation Policy Record Available!
                </div>
            </div>
            @endif

            @if ($page->name == 'Privacy Policy')
            <div class="row mt-4">
                <div class="col-lg-4 mb-4">
                    No Privacy Policy Record Available!
                </div>
            </div>
            @endif

            @if ($page->name == 'Terms & Conditions')
            <div class="row mt-4">
                <div class="col-lg-4 mb-4">
                    No Terms & Conditions Record Available!
                </div>
            </div>
            @endif
        </div>
    </div>
</section>
@endsection

@endif
