@extends('layouts.admin')
@section('title', 'Edit Hotel')

@section('content')
<div class="container-fluid">
    <div class="row page-titles mx-0">
        <div class="col-sm-6 p-md-0">
            <div class="welcome-text">
                <h2 class="page-header-title">{{ __('Edit Hotel') }}</h2>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">{{ __('Dashboard') }}</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">{{ __('Hotels') }}</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Edit Hotel') }}</a></li>
                </ol>
            </div>
        </div>
        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <a href="{{ url('admin/hotels') }}" class="btn btn-dark text-white">{{ __('Back To List') }}</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <form action="{{ url('admin/hotels/edit/'.$hotel->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="card">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <div class="form-title">
                            <h4>{{ __('Hotel Form') }}</h4>
                        </div>
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#hotel_info">
                                    <span>
                                        <strong>
                                            <i class="ti-info"></i>
                                            <span class="ml-2">{{ __('Facility Info') }}</span>
                                        </strong>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#hotel_seo">
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
                            <div class="tab-pane fade active show" id="hotel_info" role="tabpanel">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="name">
                                        {{ __('Name') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name" value="{{ $hotel->name }}" placeholder="Add Name...">
                                        @error('name')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="slug">
                                        {{ __('Slug') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="slug" name="slug" value="{{ $hotel->slug }}" placeholder="Add Slug...">
                                        @error('slug')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="hotel_location">
                                        {{ __('Hotel Location') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <select class="form-control js-basic-single" id="hotel_location" name="hotel_location">
                                            <option value="Dhaka" {{ old('hotel_location', $hotel->hotel_location) == 'Dhaka' ? 'selected' : '' }}>Dhaka</option>
                                            <option value="Jashore" {{ old('hotel_location', $hotel->hotel_location) == 'Jashore' ? 'selected' : '' }}>Jashore</option>
                                        </select>
                                        @error('hotel_location')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="display_order">{{ __('Display Order') }}</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="display_order" name="display_order" value="{{ $hotel->display_order }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="description">{{ __('Description') }}</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Add Description...">{{ $hotel->description }}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-sm-2 col-form-label text-right" for="is_active">{{ __('Status') }}</div>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="is_active" name="is_active" {{ $hotel->is_active == '1' ? 'checked':'' }}>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="hotel_seo" role="tabpanel">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_title">
                                        {{ __('Meta Title') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="meta_title" name="meta_title" value="{{ $hotel->meta_title }}" placeholder="Add Meta Title...">
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
                                        <input type="text" class="form-control" id="meta_keyword" name="meta_keyword" value="{{ $hotel->meta_keyword }}" placeholder="Add Meta Keyword...">
                                        @error('meta_keyword')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_decription">{{ __('Meta Decription') }}</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="meta_decription" name="meta_decription" rows="4" placeholder="Add Meta Description...">{{ $hotel->meta_decription }}</textarea>
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
