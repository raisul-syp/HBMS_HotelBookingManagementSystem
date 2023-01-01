@extends('layouts.guest')
@section('title', 'Booking History')

@section('content')
<section id="about_section" class="about_section content_section" style="padding: 40px 0;">
    <div class="about_section_inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title">
                        <h4>Booking History</h4>
                    </div>
                    <div class="section_breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Guest</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Booking History</a></li>
                        </ol>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-lg-12">
                    <div class="card profile-card">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card-header">
                                    <div class="header-title">
                                        <h4>Previous Booking History</h4>
                                        <a href="{{ url('/') }}" class="btn btn-outline-primary">
                                            <i data-feather="chevron-left"></i>
                                            <span>Back To Home</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Room Name</th>
                                                    <th>Guests</th>
                                                    <th>Check-In</th>
                                                    <th>Check-Out</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse ($bookings as $booking)
                                                <td>{{ $serialNo++ }}</td>
                                                <td>{{ $booking->rooms->name }}</td>
                                                <td>
                                                    <strong>Adults: </strong>{{ $booking->total_adults }} <br>
                                                    <strong>Childs: </strong>{{ $booking->total_childs }}
                                                </td>
                                                <td>
                                                    {{ date('d M Y', strtotime($booking->checkin_date)) }} <br>
                                                    {{ date('h:i A', strtotime($booking->checkin_time)) }}
                                                </td>
                                                <td>
                                                    {{ date('d M Y', strtotime($booking->checkout_date)) }} <br>
                                                    {{ date('h:i A', strtotime($booking->checkout_time)) }}
                                                </td>
                                                <td>{{ '$'.$booking->rooms->price }}</td>
                                                @empty
                                                <td colspan="6">No Bookings History</td>
                                                @endforelse
                                            </tbody>
                                        </table>
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
