<?php

namespace App\Http\Controllers\Admin\Website;

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
        $menuList = NavigationMenu::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.menu.create', compact('menuList'));
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
}
