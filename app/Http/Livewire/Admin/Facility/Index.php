<?php

namespace App\Http\Livewire\Admin\Facility;

use Livewire\Component;
use App\Models\Facility;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $facility_id;

    public function deleteRecord($facility_id)
    {
        $this->facility_id = $facility_id;
    }

    public function destroyRecord()
    {
        $facility =  Facility::find($this->facility_id);
        $facility->is_delete = '0';
        $facility->update();
        return redirect('admin/facility')->with('message','Facility Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $facilities = Facility::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.facility.index', compact('facilities'));
    }
}
