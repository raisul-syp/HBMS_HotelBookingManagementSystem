@extends('layouts.guest')
@section('title', 'Rooms')

@section('content')
<section id="pages_section_frontend" class="pages_section_frontend content_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_title">
                    <h4>Rooms</h4>
                </div>
                <div class="section_breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Rooms') }}</a></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            @foreach ($roomList as $room)
            <div class="col-lg-4 mb-4">
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
                        <a href="{{ url('rooms/room-details/'.$room->id) }}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
@endsection
