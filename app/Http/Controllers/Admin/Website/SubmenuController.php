<?php

namespace App\Http\Controllers\Admin\Website;

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
        $menuList = NavigationMenu::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.submenu.create', compact('menuList'));
    }

    public function store(NavsubmenuFormRequest $request)
    {
        $validatedData = $request->validated();

        $submenu = new NavigationSubmenu();

        $submenu->name = $validatedData['name'];
        $submenu->slug = $validatedData['slug'];
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

    public function edit(NavigationSubmenu $submenu)
    {
        $menuList = NavigationMenu::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.submenu.edit', compact('menuList','submenu'));
    }

    public function update(NavsubmenuFormRequest $request, $submenu)
    {
        $validatedData = $request->validated();
        
        $submenu = NavigationSubmenu::findOrFail($submenu);

        $submenu->name = $validatedData['name'];
        $submenu->slug = $validatedData['slug'];
        $submenu->parent_id = $validatedData['parent_id'];
        $submenu->display_order = $validatedData['display_order'];

        $submenu->meta_title = $validatedData['meta_title'];
        $submenu->meta_keyword = $validatedData['meta_keyword'];
        $submenu->meta_decription = $validatedData['meta_decription'];

        $submenu->is_active = $request->is_active == true ? '1':'0';
        $submenu->updated_by = $validatedData['updated_by'];
        $submenu->update();

        return redirect('admin/website/submenu')->with('message','Congratulations! New Navigation Submenu Has Been Updated Successfully.');
    }
}
