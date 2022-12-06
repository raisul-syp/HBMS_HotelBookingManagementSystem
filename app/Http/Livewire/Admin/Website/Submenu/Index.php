<?php

namespace App\Http\Livewire\Admin\Website\Submenu;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Website\NavigationSubmenu;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $submenu_id;

    public function deleteRecord($submenu_id)
    {
        $this->submenu_id = $submenu_id;
    }

    public function destroyRecord()
    {
        $submenus =  NavigationSubmenu::find($this->submenu_id);
        $submenus->is_delete = '0';
        $submenus->update();
        
        return redirect('admin/website/submenu')->with('message','Submenu Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $submenus = NavigationSubmenu::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.submenu.index', ['submenus' => $submenus]);
    }
}
