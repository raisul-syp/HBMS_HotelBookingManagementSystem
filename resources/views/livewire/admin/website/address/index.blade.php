<div class="card">
    <div class="card-header">
        <h4 class="card-title">Address Table</h4>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover table-responsive-sm">
                <thead class="text-center bg-primary text-white">
                    <tr>
                        <th>ID</th>
                        <th>Hotel</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Display Order</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    @forelse ($addresses as $address)
                    <tr>
                        <td>{{ $address->id }}</td>
                        <td>{{ $address->hotels->name }}</td>
                        <td>{{ $address->phone }}</td>
                        <td>{{ $address->email }}</td>
                        <td>{{ $address->address }}</td>
                        <td>{{ $address->display_order }}</td>
                        <td>
                            @if ($address->is_active == '1')
                                <span class="badge badge-success text-white">Active</span>
                            @else
                                <span class="badge badge-danger">Deactive</span>
                            @endif
                        </td>
                        <td>
                            <span data-toggle="tooltip" data-placement="top" title="Edit">
                                <a href="{{ url('admin/website/addresses/edit/'.$address->id) }}" class="btn btn-icon btn-square btn-outline-warning list-button"><i class="fa fa-pencil-square-o"></i></a>
                            </span>
                            <span data-toggle="tooltip" data-placement="top" title="Delete">
                                <a href="#" wire:click="deleteRecord({{ $address->id }})" class="btn btn-icon btn-square btn-outline-danger list-button" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o"></i></a>
                            </span>
                            @include('modal.admin.delete')
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="8">
                            <h4 class="mb-0">{{ __('No Records Available!') }}</h4>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="pagination-section">
            {{ $addresses->links() }}
        </div>
    </div>
</div>
