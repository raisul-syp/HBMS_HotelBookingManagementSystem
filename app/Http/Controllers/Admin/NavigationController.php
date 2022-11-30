<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\NavigationMenu;
use App\Http\Controllers\Controller;
use App\Http\Requests\NavmenuFormRequest;

class NavigationController extends Controller
{
    public function index()
    {
        return view('admin.website.menu.index');
    }

    public function create()
    {
        $parentMenu = NavigationMenu::all()->where('parent_id','0')->where('is_active','1')->where('is_delete','1');
        return view('admin.website.menu.create', compact('parentMenu'));
    }

    public function store(NavmenuFormRequest $request)
    {
        $validatedData = $request->validated();

        $menu = new NavigationMenu();

        $menu->name = $validatedData['name'];
        $menu->slug = Str::slug($validatedData['slug']);
        $menu->display_order = $validatedData['display_order'];
        $menu->parent_id = $validatedData['parent_id'];

        $menu->meta_title = $validatedData['meta_title'];
        $menu->meta_keyword = $validatedData['meta_keyword'];
        $menu->meta_decription = $validatedData['meta_decription'];

        $menu->is_active = $request->is_active == true ? '1':'0';
        $menu->created_by = $validatedData['created_by'];
        $menu->save();

        return redirect('admin/website/menu')->with('message','Congratulations! New Navigation Menu Has Been Created Successfully.');
    }
}
