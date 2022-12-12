<?php

namespace App\Http\Livewire\Admin\Hotel;

use App\Models\Hotel;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $hotel_id;

    public function deleteRecord($hotel_id)
    {
        $this->hotel_id = $hotel_id;
    }

    public function destroyRecord()
    {
        $hotel =  Hotel::find($this->hotel_id);
        $hotel->is_delete = '0';
        $hotel->update();
        return redirect('admin/hotels')->with('message','Hotel Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $hotels = Hotel::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.hotel.index', compact('hotels'));
    }
}
