@extends('layouts.guest')
@section('title', 'Restaurants')

@section('content')
<section id="pages_section_frontend" class="pages_section_frontend content_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_title">
                    <h4>Restaurants</h4>
                </div>
                <div class="section_breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Restaurants') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            @foreach ($restaurantList as $restaurant)
            <div class="col-lg-3 mb-4">
                <div class="card restaurant">
                    @if (!$restaurant->logo_image == NULL)
                    <div class="page-image logo">
                        <img src="{{ asset('uploads/restaurents/logo/'.$restaurant->logo_image) }}" alt="">
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
                        <a href="{{ url('restaurants/restaurant-details/'.$restaurant->id) }}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
@endsection
