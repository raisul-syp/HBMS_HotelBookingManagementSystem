@extends('layouts.admin')
@section('title', 'Edit Address')

@section('content')
<div class="container-fluid">
    <div class="row page-titles mx-0">
        <div class="col-sm-6 p-md-0">
            <div class="welcome-text">
                <h2 class="page-header-title">{{ __('Edit Address') }}</h2>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">{{ __('Dashboard') }}</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">{{ __('Website') }}</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">{{ __('Addresses') }}</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Edit Address') }}</a></li>
                </ol>
            </div>
        </div>
        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <a href="{{ url('admin/website/addresses') }}" class="btn btn-dark text-white">{{ __('Back To List') }}</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <form action="{{ url('admin/website/addresses/edit/'.$address->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="card">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <div class="form-title">
                            <h4>{{ __('Address Form') }}</h4>
                        </div>
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#address_info">
                                    <span>
                                        <strong>
                                            <i class="ti-info"></i>
                                            <span class="ml-2">{{ __('Address Info') }}</span>
                                        </strong>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#address_seo">
                                    <span>
                                        <strong>
                                            <i class="ti-search"></i>
                                            <span class="ml-2">{{ __('SEO') }}</span>
                                        </strong>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content tabcontent-border">
                            <div class="tab-pane fade active show" id="address_info" role="tabpanel">
                                <div class="row">
                                    <div class="form-group col-lg-4">
                                        <label for="hotel_id">
                                            {{ __('Hotel') }}
                                            <small class="text-danger">*</small>
                                        </label>
                                        <select class="form-control js-basic-single" id="hotel_id" name="hotel_id" >
                                            @forelse ($hotels as $hotel)
                                            <option value="{{ $hotel->id }}" {{ old('hotel_id', $address->hotel_id) == $hotel->id ? 'selected' : '' }}>{{ $hotel->name }}</option>
                                            @empty
                                            <option>No Data</option>
                                            @endforelse
                                        </select>
                                        @error('hotel_id')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="slug">
                                            {{ __('Slug') }}
                                        </label>
                                        <input type="text" class="form-control" id="slug" name="slug" value="{{ $address->slug }}" placeholder="Add Slug...">
                                    </div>
                                    <div class="form-group col-lg-3">
                                        <label for="display_order">
                                            {{ __('Display Order') }}
                                        </label>
                                        <input type="number" class="form-control" id="display_order" name="display_order" value="{{ $address->display_order }}">
                                    </div>                                
                                    <div class="form-group col-lg-1">
                                        <div for="is_active">
                                            {{ __('Status') }}
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="is_active" name="is_active" {{ $address->is_active == '1' ? 'checked':'' }}>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="phone">
                                            {{ __('Phone') }}
                                            <small class="text-danger">*</small>
                                        </label>
                                        <input type="tel" class="form-control" id="phone" name="phone" value="{{ $address->phone }}" placeholder="Add Phone...">
                                        @error('phone')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="phone_sales">
                                            {{ __('Phone (Sales)') }}
                                        </label>
                                        <input type="tel" class="form-control" id="phone_sales" name="phone_sales" value="{{ $address->phone_sales }}" placeholder="Add Phone (Sales)...">
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="phone_reservation">
                                            {{ __('Phone (Reservation)') }}
                                        </label>
                                        <input type="tel" class="form-control" id="phone_reservation" name="phone_reservation" value="{{ $address->phone_reservation }}" placeholder="Add Email (Reservation)...">
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="email">
                                            {{ __('Email') }}
                                            <small class="text-danger">*</small>
                                        </label>
                                        <input type="tel" class="form-control" id="email" name="email" value="{{ $address->email }}" placeholder="Add Email...">
                                        @error('email')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="email_sales">
                                            {{ __('Email (Sales)') }}
                                        </label>
                                        <input type="tel" class="form-control" id="email_sales" name="email_sales" value="{{ $address->email_sales }}" placeholder="Add Email (Sales)...">
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label for="email_reservation">
                                            {{ __('Email (Reservation)') }}
                                        </label>
                                        <input type="tel" class="form-control" id="email_reservation" name="email_reservation" value="{{ $address->email_reservation }}" placeholder="Add Email (Reservation)...">
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label for="address">
                                            {{ __('Address') }}
                                            <small class="text-danger">*</small>
                                        </label>
                                        <textarea class="form-control" name="address" id="address" rows="3" placeholder="Add Address...">{{ $address->address }}</textarea>
                                        @error('title')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label for="google_map">
                                            {{ __('Google Map Key') }}
                                        </label>
                                        <textarea class="form-control" name="google_map" id="google_map" rows="3" placeholder="Add Google Map Key...">{{ $address->google_map }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="address_seo" role="tabpanel">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_title">
                                        {{ __('Meta Title') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="meta_title" name="meta_title" value="{{ $address->meta_title }}" placeholder="Add Meta Title...">
                                        @error('meta_title')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_keyword">
                                        {{ __('Meta Keyword') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="meta_keyword" name="meta_keyword" value="{{ $address->meta_keyword }}" placeholder="Add Meta Keyword...">
                                        @error('meta_keyword')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_decription">{{ __('Meta Decription') }}</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="meta_decription" name="meta_decription" rows="4" placeholder="Add Meta Description...">{{ $address->meta_decription }}</textarea>
                                    </div>
                                </div>

                                <input type="text" hidden id="updated_by" name="updated_by" value="{{ Auth::guard('admin')->user()->role_as }}">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary text-uppercase text-right">
                                {{ __('Update') }}
                            </button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
@endsection
