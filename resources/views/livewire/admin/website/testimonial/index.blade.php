<div class="card">
    <div class="card-header">
        <h4 class="card-title">Testimonial Table</h4>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover table-responsive-sm">
                <thead class="text-center bg-primary text-white">
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Designation</th>
                        <th>Company</th>
                        <th>Display Order</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    @forelse ($testimonials as $testimonial)
                    <tr>
                        <td>{{ $testimonial->id }}</td>
                        <td style="width: 6%;">
                            <div class="testimonial-list-img">
                                <img src="{{ asset('frontend/images/testimonials/'.$testimonial->image) }}" alt="{{ $testimonial->name }}">
                            </div>
                        </td>
                        <td>{{ $testimonial->name }}</td>
                        <td>{{ $testimonial->designation }}</td>
                        <td>{{ $testimonial->company }}</td>
                        <td>{{ $testimonial->display_order }}</td>
                        <td>
                            @if ($testimonial->is_active == '1')
                                <span class="badge badge-success text-white">Active</span>
                            @else
                                <span class="badge badge-danger">Deactive</span>
                            @endif
                        </td>
                        <td>
                            <span data-toggle="tooltip" data-placement="top" title="Edit">
                                <a href="{{ url('admin/website/testimonials/edit/'.$testimonial->id) }}" class="btn btn-icon btn-square btn-outline-warning list-button"><i class="fa fa-pencil-square-o"></i></a>
                            </span>
                            <span data-toggle="tooltip" data-placement="top" title="Delete">
                                <a href="#" wire:click="deleteRecord({{ $testimonial->id }})" class="btn btn-icon btn-square btn-outline-danger list-button" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o"></i></a>
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
            {{ $testimonials->links() }}
        </div>
    </div>
</div>
