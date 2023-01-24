<div class="card">
    <div class="card-header">
        <h4 class="card-title">Role Table</h4>
    </div>
    <div class="card-body">   
        <div class="table-responsive">
            <table class="table table-hover table-responsive-sm">
                <thead class="text-center bg-primary text-white">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    @forelse ($roles as $role)
                    <tr>
                        <td>{{ $serialNo++ }}</td>
                        <td>{{ $role->name }}</td>
                        <td>
                            <span>
                                <a href="{{ url('admin/role-permission/role/edit/'.$role->id) }}" class="btn btn-icon btn-square btn-outline-warning list-button"><i class="fa fa-pencil-square-o"></i></a>
                            </span>
                            <span>
                                <a href="#" wire:click="deleteRecord({{ $role->id }})" class="btn btn-icon btn-square btn-outline-danger list-button" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o"></i></a>
                            </span>
                            @include('modal.admin.delete')
                        </td>
                    </tr>                        
                    @empty
                    <tr>
                        <td colspan="4">
                            <h4 class="mb-0">{{ __('No Records Available!') }}</h4>
                        </td>
                    </tr>                        
                    @endforelse
                </tbody>
            </table>
        </div>


        {{-- <div class="pagination-section">
            {{ $roles->links() }}
        </div> --}}
    </div>
</div>

