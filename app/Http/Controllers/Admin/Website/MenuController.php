<?php

namespace App\Http\Controllers\Admin\Website;

use App\Models\Hotel;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Website\NavigationMenu;
use App\Http\Requests\Website\NavmenuFormRequest;

class MenuController extends Controller
{
    public function index()
    {
        return view('admin.website.menu.index');
    }

    public function create()
    {
        return view('admin.website.menu.create');
    }

    public function store(NavmenuFormRequest $request)
    {
        $validatedData = $request->validated();

        $menu = new NavigationMenu();

        $menu->name = $validatedData['name'];
        $menu->slug = Str::slug($validatedData['slug']);
        $menu->display_order = $validatedData['display_order'];

        $menu->meta_title = $validatedData['meta_title'];
        $menu->meta_keyword = $validatedData['meta_keyword'];
        $menu->meta_decription = $validatedData['meta_decription'];

        $menu->is_active = $request->is_active == true ? '1':'0';
        $menu->created_by = $validatedData['created_by'];
        $menu->save();

        return redirect('admin/website/menu')->with('message','Congratulations! New Navigation Menu Has Been Created Successfully.');
    }

    public function edit(NavigationMenu $menu)
    {
        return view('admin.website.menu.edit', compact('menu'));
    }

    public function update(NavmenuFormRequest $request, $menu)
    {
        $validatedData = $request->validated();

        $menu = NavigationMenu::findOrFail($menu);

        $menu->name = $validatedData['name'];
        $menu->slug = Str::slug($validatedData['slug']);
        $menu->display_order = $validatedData['display_order'];

        $menu->meta_title = $validatedData['meta_title'];
        $menu->meta_keyword = $validatedData['meta_keyword'];
        $menu->meta_decription = $validatedData['meta_decription'];

        $menu->is_active = $request->is_active == true ? '1':'0';
        $menu->updated_by = $validatedData['updated_by'];
        $menu->update();

        return redirect('admin/website/menu')->with('message','Congratulations! New Navigation Menu Has Been Updated Successfully.');
    }
}
