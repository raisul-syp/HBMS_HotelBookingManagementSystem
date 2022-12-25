<?php

namespace App\Http\Livewire\Admin\Website\Menu;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Website\NavigationMenu;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $menu_id;

    public function deleteRecord($menu_id)
    {
        $this->menu_id = $menu_id;
    }

    public function destroyRecord()
    {
        $menus =  NavigationMenu::find($this->menu_id);
        $menus->is_delete = '0';
        $menus->update();

        return redirect('admin/website/menu')->with('message','Menu Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $menus = NavigationMenu::where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.menu.index', compact('menus'));
    }
}
