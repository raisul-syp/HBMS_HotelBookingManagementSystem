@extends('layouts.guest')
@section('title', 'Offers')

@section('content')
<section id="pages_section" class="pages_section content_section">
    <div class="pages_section_frontend">
        <div class="container">
            <div class="row">
                @foreach ($pages as $page)
                @if ($page->name == 'Offers')
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
                @endif
                @endforeach
            </div>

            <div class="row mt-4">
                @foreach ($offers as $offer)
                <div class="col-lg-4 mb-4">
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
                                <a href="{{ url('offers/offer-details/'.$offer->id) }}" class="btn btn-primary">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
@endsection
