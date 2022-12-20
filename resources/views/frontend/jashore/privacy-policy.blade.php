@extends('layouts.guestJashore')
@section('title', 'Privacy Policy')

@section('content')
<section id="about_section" class="about_section content_section" style="padding: 40px 0;">
    <div class="about_section_inner">
        <div class="container">
            @foreach ($pages as $page)
            @if ($page->name == 'Privacy Policy' && $page->hotel_id == '1')
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
            @endif
            @endforeach
        </div>
    </div>
</section>
@endsection
