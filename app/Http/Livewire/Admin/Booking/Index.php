<?php

namespace App\Http\Livewire\Admin\Booking;

use App\Models\Booking;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    
    public function render()
    {
        $bookings = Booking::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.booking.index',['bookings' => $bookings]);
    }
}
