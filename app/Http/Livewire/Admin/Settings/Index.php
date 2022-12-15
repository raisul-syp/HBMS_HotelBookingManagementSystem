<?php

namespace App\Http\Livewire\Admin\Settings;

use Livewire\Component;
use App\Models\Settings;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $settings_id;

    public function deleteRecord($settings_id)
    {
        $this->settings_id = $settings_id;
    }

    public function destroyRecord()
    {
        $settings =  Settings::find($this->settings_id);
        $settings->is_delete = '0';
        $settings->update();
        return redirect('admin/settings')->with('message','Wellness Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $settings = Settings::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.settings.index', compact('settings'));
    }
}
