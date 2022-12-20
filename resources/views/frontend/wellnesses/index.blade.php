@extends('layouts.guest')
@section('title', 'Wellness')

@section('content')
<section id="pages_section_frontend" class="pages_section_frontend content_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_title">
                    <h4>Wellness</h4>
                </div>
                <div class="section_breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Wellness') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            @foreach ($wellnessList as $wellness)
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
                        <a href="{{ url('wellnesses/wellness-details/'.$wellness->id) }}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
@endsection
