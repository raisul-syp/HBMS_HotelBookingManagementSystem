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
                                                    <h5>sm@zabeerhotel.com</h5>
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
                                                    <h5>(+88) 01885-000-555</h5>
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
                                                    <h5>House # 01 Road No # 2, Dhaka - 1230</h5>
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
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3648.956907774987!2d90.4037768!3d23.855663900000007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c72f9daef9c5%3A0xe3bc6c9dcb0ba750!2sThe%20Zabeer%20Dhaka!5e0!3m2!1sen!2sbd!4v1670046986535!5m2!1sen!2sbd" width="100%" height="566" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
