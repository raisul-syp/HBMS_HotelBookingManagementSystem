<div class="card">
    <div class="card-header">
        <h4 class="card-title">User Table</h4>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover table-responsive-sm">
                <thead class="text-center bg-primary text-white">
                    <tr>
                        <th>#</th>
                        <th colspan="2">Name</th>
                        <th>Role</th>
                        <th>Date of Birth</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    @forelse ($users as $user)
                    <tr>
                        <td>{{ $serialNo++ }}</td>
                        <td>
                            @if ($user->profile_photo != null)
                            <img src="{{ asset('uploads/users/profile_photo/'.$user->profile_photo) }}" class="user-data-table-image">
                            @else
                            <img src="{{ asset('admin/images/no-photo.png') }}" class="user-data-table-image">
                            @endif
                        </td>
                        <td>{{ $user->first_name.' '.$user->last_name }}</td>
                        <td>
                            @if ($user->role_as == 0)
                            <strong>Admin</strong>
                            @else
                            <strong>Staff</strong>
                            @endif
                        </td>
                        <td>
                            @if ($user->date_of_birth)
                            {{ $user->date_of_birth }}
                            @else
                            <small class="text-danger">No Data</small>
                            @endif
                        </td>
                        <td>{{ $user->email }}</td>
                        <td>
                            @if ($user->phone)
                            {{ $user->phone }}
                            @else
                            <small class="text-danger">No Data</small>
                            @endif</td>
                        <td>
                            @if ($user->is_active == '1')
                                <span class="badge badge-success text-white">Active</span>
                            @else
                                <span class="badge badge-danger">Deactive</span>
                            @endif
                        </td>
                        <td>
                            <span>
                                <a href="{{ url('admin/user/edit/'.$user->id) }}" class="btn btn-icon btn-square btn-outline-warning list-button"><i class="fa fa-pencil-square-o"></i></a>
                            </span>
                            <span>
                                <a href="#" wire:click="deleteRecord({{ $user->id }})" class="btn btn-icon btn-square btn-outline-danger list-button" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o"></i></a>
                            </span>
                            @include('modal.admin.delete')
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="9">
                            <h4 class="mb-0">{{ __('No Records Available!') }}</h4>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="pagination-section">
            {{ $users->links() }}
        </div>
    </div>

</div>
