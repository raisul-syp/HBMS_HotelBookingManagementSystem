<?php

namespace App\Http\Livewire\Admin\Booking;

use App\Models\Booking;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $booking_id;

    public function deleteRecord($booking_id)
    {
        $this->booking_id = $booking_id;
    }

    public function destroyRecord()
    {
        $booking =  Booking::find($this->booking_id);
        $booking->is_delete = '0';
        $booking->update();
        return redirect('admin/booking')->with('message','Booking Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $bookings = Booking::where('is_delete','1')->orderBy('created_at','DESC')->paginate(10);
        $serialNo = ($bookings->perPage() * ($bookings->currentPage() - 1)) + 1;
        return view('livewire.admin.booking.index', compact('bookings', 'serialNo'));
    }
}
