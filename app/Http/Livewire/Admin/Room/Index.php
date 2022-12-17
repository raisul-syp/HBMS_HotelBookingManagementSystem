<?php

namespace App\Http\Livewire\Admin\Room;

use App\Models\Room;
use App\Models\Booking;
use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $room_id;

    public function deleteRecord($room_id)
    {
        $this->room_id = $room_id;
    }

    public function destroyRecord()
    {
        $room =  Room::find($this->room_id);
        
        $room->is_delete = '0';
        $room->update();

        return redirect('admin/room')->with('message','Room Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $todayDate = Carbon::today()->format('Y-m-d');
        $rooms = Room::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        $bookedRooms = Booking::where('room_id')->count();
        
        return view('livewire.admin.room.index', compact('todayDate', 'rooms', 'bookedRooms'));
    }
}
