@extends('layouts.guest')
@section('title', 'Booking Success')

@section('content')
<section id="about_section" class="about_section content_section" style="padding: 40px 0;">
    <div class="about_section_inner" style="padding: 40px 0;">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="success-page">
                        <div class="success-icon">
                            <i class="fas fa-check"></i>
                        </div>
                        <div class="success-message">
                            <h4>Your booking has been completed successfully!</h4>
                        </div>
                        <div class="success-btn">
                            <a href="{{ url('/') }}" class="btn btn-primary">Go Back Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




@endsection
