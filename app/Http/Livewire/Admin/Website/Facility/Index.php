<?php

namespace App\Http\Livewire\Admin\Website\Facility;

use App\Models\Website\Facility;
use Livewire\Component;
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
        $facilities =  Facility::find($this->facility_id);
        $facilities->is_delete = '0';
        $facilities->update();

        return redirect('admin/website/facilities')->with('message','Facility Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $facilities = Facility::where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.facility.index', ['facilities' => $facilities]);
    }
}
