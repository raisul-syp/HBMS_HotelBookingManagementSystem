@extends('layouts.admin')
@section('title', 'Create A New Role')

@section('content')
<div class="container-fluid">
    <div class="row page-titles mx-0">
        <div class="col-sm-6 p-md-0">
            <div class="welcome-text">
                <h2 class="page-header-title">{{ __('Create A New Role') }}</h2>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">{{ __('Dashboard') }}</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">{{ __('Role & Permission') }}</a></li>
                    <li class="breadcrumb-item"><a href="{{ url('admin/role-permission/role') }}">{{ __('Manage Role') }}</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">{{ __('Add Role') }}</a></li>
                </ol>
            </div>
        </div>
        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <a href="{{ url('admin/role-permission/role') }}" class="btn btn-dark text-white">{{ __('Back To List') }}</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <form action="{{ url('admin/role-permission/role') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="card">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <div class="form-title">
                            <h4>{{ __('Role Form') }}</h4>
                        </div>
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#role_info">
                                    <span>
                                        <strong>
                                            <i class="ti-info"></i>
                                            <span class="ml-2">{{ __('Role Info') }}</span>
                                        </strong>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content tabcontent-border">
                            <div class="tab-pane fade active show" id="role_info" role="tabpanel">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right" for="name">
                                        {{ __('Role Name') }}
                                        <small class="text-danger">*</small>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Add Name...">
                                        @error('name')
                                            <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-2 col-form-label text-right" for="permissions">{{ __('Permissions') }}</div>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="permissionsAll" value="1">
                                            <label class="form-check-label" for="permissionsAll">All</label>
                                        </div> 

                                        {{-- @foreach ($permissions as $permission)
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input role-permission-checkbox" id="permissions{{ $permission->id }}" name="permissions[]" value="{{ $permission->name }}">
                                            <label class="form-check-label" for="permissions{{ $permission->id }}">{{ $permission->name }}</label>
                                        </div>            
                                        @endforeach --}}

                                        <hr>

                                        @php $i = 1; @endphp
                                        @foreach ($permission_groups as $group)
                                        <div class="row">
                                            <div class="col-4">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="{{ $i }}Management" name="permissions[]" value="{{ $group->name }}" onclick="checkPermissionByGroup('role-{{ $i }}-management-checkbox', this)">
                                                    <label class="form-check-label" for="permissions">{{ $group->name }}</label>
                                                </div>  
                                            </div>

                                            <div class="col-8 role-{{ $i }}-management-checkbox">
                                                @php 
                                                    $permissions = App\Models\Admin::getpermissionsByGroupName($group->name);
                                                    $j = 1; 
                                                @endphp
                                                @foreach ($permissions as $permission)
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input role-permission-checkbox" id="checkPermission{{ $permission->id }}" name="permissions[]" value="{{ $permission->name }}">
                                                    <label class="form-check-label" for="checkPermission{{ $permission->id }}">{{ $permission->name }}</label>
                                                </div>   
                                                @php $j++; @endphp  
                                                @endforeach
                                            </div>
                                        </div>
                                        @php $i++; @endphp  
                                        
                                        <hr>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-sm-2 col-form-label text-right" for="is_active">{{ __('Status') }}</div>
                                    <div class="col-sm-10">
                                        <label class="switch switch-square">
                                            <input type="checkbox" class="switch-input" id="is_active" name="is_active" checked>
                                            <span class="switch-toggle-slider"></span>
                                        </label>
                                    </div>
                                </div>

                                <input type="text" hidden id="created_by" name="created_by" value="{{ Auth::guard('admin')->user()->role_as }}">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary text-uppercase text-right">
                                {{ __('Save') }}
                            </button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
@endsection


@section('scripts')
    <script>
        $("#permissionsAll").click(function(){
            if($(this).is(':checked')) {
                $(".role-permission-checkbox").prop('checked', true);
            }
            else {
                $(".role-permission-checkbox").prop('checked', false);
            }
        });

        function checkPermissionByGroup(className, checkThis) {
            const groupIdName = $("#"+checkThis.id);
            const classCheckBox = $('.'+className+' input');
            
            if(groupIdName.is(':checked')) {
                classCheckBox.prop('checked', true);
            }
            else {
                classCheckBox.prop('checked', false);
            }
        }
    </script>
@endsection
