<?php

namespace App\Http\Livewire\Admin\Wellness;

use Livewire\Component;
use App\Models\Wellness;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $wellness_id;

    public function deleteRecord($wellness_id)
    {
        $this->wellness_id = $wellness_id;
    }

    public function destroyRecord()
    {
        $wellness =  Wellness::find($this->wellness_id);
        $wellness->is_delete = '0';
        $wellness->update();
        return redirect('admin/wellness')->with('message','Wellness Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $wellnesses = wellness::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.wellness.index', compact('wellnesses'));
    }
}
