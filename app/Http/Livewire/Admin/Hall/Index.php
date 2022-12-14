<?php

namespace App\Http\Livewire\Admin\Hall;

use App\Models\Hall;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $hall_id;

    public function deleteRecord($hall_id)
    {
        $this->hall_id = $hall_id;
    }

    public function destroyRecord()
    {
        $hall =  Hall::find($this->hall_id);
        $hall->is_delete = '0';
        $hall->update();
        return redirect('admin/hall')->with('message','Hall Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $halls = Hall::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.hall.index', compact('halls'));
    }
}
