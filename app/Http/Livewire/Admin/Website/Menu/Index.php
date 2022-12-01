<?php

namespace App\Http\Livewire\Admin\Website\Menu;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Website\NavigationMenu;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    
    public function render()
    {
        $menus = NavigationMenu::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.menu.index',['menus' => $menus]);
    }
}
