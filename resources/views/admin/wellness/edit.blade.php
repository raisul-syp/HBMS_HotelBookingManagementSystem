@extends('layouts.admin')
@section('title', 'Edit Hall')

@section('content')
<div class="container-fluid">
    <div class="row page-titles mx-0">
        <div class="col-sm-6 p-md-0">
            <div class="welcome-text">
                <h2 class="page-header-title">{{ __('Edit Hall') }}</h2>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">{{ __('Dashboard') }}</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">{{ __('Halls') }}</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Edit Hall') }}</a></li>
                </ol>
            </div>
        </div>
        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <a href="{{ url('admin/hall') }}" class="btn btn-dark text-white">{{ __('Back To List') }}</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <form action="{{ url('admin/hall/edit/'.$hall->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="card">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <div class="form-title">
                            <h4>{{ __('Hall Form') }}</h4>
                        </div>
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#hall_info">
                                    <span>
                                        <strong>
                                            <i class="ti-info"></i>
                                            <span class="ml-2">{{ __('Hall Info') }}</span>
                                        </strong>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#hall_image">
                                    <span>
                                        <strong>
                                            <i class="ti-image"></i>
                                            <span class="ml-2">{{ __('Images') }}</span>
                                        </strong>
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#hall_seo">
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
                            <div class="tab-pane fade active show" id="hall_info" role="tabpanel">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="name">
                                        {{ __('Name') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name" value="{{ $hall->name }}" placeholder="Add Name...">
                                        @error('name')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="hotel_id">
                                        {{ __('Hotel') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <select class="form-control js-basic-single" id="hotel_id" name="hotel_id" >
                                            @forelse ($hotels as $hotel)
                                            <option value="{{ $hotel->id }}" {{ old('hotel_id', $hall->hotel_id) == $hotel->id ? 'selected' : '' }}>{{ $hotel->name }}</option>
                                            @empty
                                            <option>No Data</option>
                                            @endforelse
                                        </select>
                                        @error('hotel_id')
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
                                        <input type="text" class="form-control" id="slug" name="slug" value="{{ $hall->slug }}" placeholder="Add Slug...">
                                        @error('slug')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="short_description">
                                        {{ __('Short Description') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="short_description" name="short_description" rows="3" placeholder="Add Short Description...">{{ $hall->short_description }}</textarea>
                                        @error('short_description')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="long_description">{{ __('Long Description') }}</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="long_description" name="long_description">{{ $hall->long_description }}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-sm-2 col-form-label text-right" for="is_active">{{ __('Status') }}</div>
                                    <div class="col-sm-10">
                                        <label class="switch switch-square">
                                            <input type="checkbox" class="switch-input" id="is_active" name="is_active" {{ $hall->is_active == '1' ? 'checked':'' }}>
                                            <span class="switch-toggle-slider"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="hall_image" role="tabpanel">
                                <div class="form-group row">
                                    <div class="col-sm-2 col-form-label text-right" for="logo_image">{{ __('Logo') }}</div>
                                    <div class="col-sm-10">                                      
                                        <input type="file" class="dropify" id="logo_image" name="logo_image" data-default-file="{{ asset('uploads/halls/logo/'.$hall->logo_image) }}" />
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-sm-2 col-form-label text-right" for="image">{{ __('Images') }}</div>
                                    <div class="col-sm-10">
                                        <input type="file" class="dropify" id="image" name="image[]" multiple />

                                        <div class="image-preview">
                                            @if ($hall->hallImages)
                                            <div class="row">
                                                @foreach ($hall->hallImages as $image)
                                                <div class="col-lg-2">
                                                    <img src="{{ asset($image->image) }}" alt="" class="preview-img">
                                                </div>
                                                @endforeach
                                            </div>
                                            @else
                                            <h5>No Image found!</h5>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="hall_seo" role="tabpanel">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_title">
                                        {{ __('Meta Title') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="meta_title" name="meta_title" value="{{ $hall->meta_title }}" placeholder="Add Meta Title...">
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
                                        <input type="text" class="form-control" id="meta_keyword" name="meta_keyword" value="{{ $hall->meta_keyword }}" placeholder="Add Meta Keyword...">
                                        @error('meta_keyword')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <label class="col-sm-2 col-form-label text-right" for="meta_decription">{{ __('Meta Decription') }}</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="meta_decription" name="meta_decription" rows="4" placeholder="Add Meta Description...">{{ $hall->meta_decription }}</textarea>
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
