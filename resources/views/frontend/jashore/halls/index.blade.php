@extends('layouts.guestJashore')
@section('title', 'Halls')

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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Halls') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            @foreach ($hallList as $hall)
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
                        <a href="{{ url('halls/hall-details/'.$hall->id) }}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
@endsection
