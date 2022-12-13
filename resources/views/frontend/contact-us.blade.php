@extends('layouts.guest')
@section('title', 'Contact Us')

@section('content')
    <section id="contact_section_frontend" class="contact_section_frontend content_section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title">
                        <h4>Contact Us</h4>
                    </div>
                    <div class="section_breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Contact Us') }}</a></li>
                        </ol>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-lg-12">
                    <div class="contact-section-inner">
                        <ul class="nav nav-pills justify-content-center mb-5" id="pills-tab" role="tablist">
                            @foreach ($addresses as $address)
                            <li class="nav-item" role="presentation">
                              <button class="nav-link custom-nav-btn {{ $address->id == 1 ? 'active' : '' }}" type="button" data-bs-toggle="pill" data-bs-target="#{{ $address->slug }}">{{ $address->hotels->name }}</button>
                            </li>                                 
                            @endforeach
                        </ul>

                        <div class="tab-content" id="pills-tabContent">      
                            @foreach ($addresses as $address)
                            <div class="tab-pane fade show {{ $address->id == 1 ? 'active' : '' }}" id="{{ $address->slug }}">
                                <div class="contact-info">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="contact-info-inner">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="contact-info-icon">
                                                            <i class="fas fa-envelope-open"></i>
                                                        </div>
                                                        <div class="contact-info-detail">
                                                            <h5>{{ $address->email }}</h5>
                                                            @if ($address->email_sales != NULL)
                                                            <h5>{{ $address->email_sales }}</h5>  
                                                            @else
                                                            <h5 class="d-none">{{ $address->email_sales }}</h5>                                                              
                                                            @endif
                                                            @if ($address->email_reservation != NULL)
                                                            <h5>{{ $address->email_reservation }}</h5>  
                                                            @else
                                                            <h5 class="d-none">{{ $address->email_reservation }}</h5>                                                              
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="contact-info-inner">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="contact-info-icon">
                                                            <i class="fas fa-phone-alt"></i>
                                                        </div>
                                                        <div class="contact-info-detail">
                                                            <h5><strong>Tel: </strong>{{ $address->phone }}</h5>
                                                            @if ($address->phone_sales != NULL)
                                                            <h5><strong>Sales: </strong>{{ $address->phone_sales }}</h5>
                                                            @else
                                                            <h5 class="d-none"><strong>Sales: </strong>{{ $address->phone_sales }}</h5>                                                            
                                                            @endif
                                                            @if ($address->phone_reservation != NULL)
                                                            <h5><strong>Reservation: </strong>{{ $address->phone_reservation }}</h5>
                                                            @else
                                                            <h5 class="d-none"><strong>Reservation: </strong>{{ $address->phone_reservation }}</h5>                                                           
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="contact-info-inner">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="contact-info-icon">
                                                            <i class="fas fa-map-marked-alt"></i>
                                                        </div>
                                                        <div class="contact-info-detail">
                                                            <h5>{{ $address->address }}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="contact-form-map mt-5">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="contact-form">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="contact-form-header">
                                                            <h4>If you have any queries, please send us an email.<br>We will respond to you very soon.</h4>
                                                        </div>
                                                        <form>
                                                            <div class="mb-3">
                                                                <label for="name" class="form-label">Your Name</label>
                                                                <input type="text" class="form-control" id="name" name="name">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="email" class="form-label">Email Address</label>
                                                                <input type="email" class="form-control" id="email" name="email">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="subject" class="form-label">Subject</label>
                                                                <input type="text" class="form-control" id="subject" name="subject">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="message" class="form-label">Your Message</label>
                                                                <textarea class="form-control" name="message" id="message" rows="4"></textarea>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Submit</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
        
                                        <div class="col-lg-6">
                                            <div class="contact-map">
                                                <div class="card">
                                                    <iframe src="https://www.google.com/maps/embed?pb={{ $address->google_map }}" width="100%" height="566" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
