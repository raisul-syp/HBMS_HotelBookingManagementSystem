<?php

namespace App\Http\Controllers\Admin\Website;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Website\NavigationSubmenu;
use App\Http\Requests\Website\NavsubmenuFormRequest;
use App\Models\Website\NavigationMenu;

class SubmenuController extends Controller
{
    public function index()
    {
        return view('admin.website.submenu.index');
    }

    public function create()
    {
        $submenuList = NavigationSubmenu::all()->where('is_active','1')->where('is_delete','1');
        $menuList = NavigationMenu::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.submenu.create', compact('submenuList','menuList'));
    }

    public function store(NavsubmenuFormRequest $request)
    {
        $validatedData = $request->validated();

        $submenu = new NavigationSubmenu();

        $submenu->name = $validatedData['name'];
        $submenu->slug = Str::slug($validatedData['slug']);
        $submenu->parent_id = $validatedData['parent_id'];
        $submenu->display_order = $validatedData['display_order'];

        $submenu->meta_title = $validatedData['meta_title'];
        $submenu->meta_keyword = $validatedData['meta_keyword'];
        $submenu->meta_decription = $validatedData['meta_decription'];

        $submenu->is_active = $request->is_active == true ? '1':'0';
        $submenu->created_by = $validatedData['created_by'];
        $submenu->save();

        return redirect('admin/website/submenu')->with('message','Congratulations! New Navigation Menu Has Been Created Successfully.');
    }
}
