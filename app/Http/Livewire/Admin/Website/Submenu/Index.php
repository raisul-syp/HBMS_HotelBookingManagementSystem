<?php

namespace App\Http\Livewire\Admin\Website\Submenu;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Website\NavigationSubmenu;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $submenus = NavigationSubmenu::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.submenu.index',['submenus' => $submenus]);
    }
}
