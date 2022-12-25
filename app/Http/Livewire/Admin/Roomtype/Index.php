<?php

namespace App\Http\Livewire\Admin\Roomtype;

use Livewire\Component;
use App\Models\Roomtype;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $roomtype_id;

    public function deleteRecord($roomtype_id)
    {
        $this->roomtype_id = $roomtype_id;
    }

    public function destroyRecord()
    {
        $roomtype =  Roomtype::find($this->roomtype_id);
        $roomtype->is_delete = '0';
        $roomtype->update();
        return redirect('admin/roomtype')->with('message','Room Type Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $roomtypes = Roomtype::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.roomtype.index', compact('roomtypes'));
    }
}
