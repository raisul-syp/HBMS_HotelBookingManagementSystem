<?php

namespace App\Http\Controllers\Admin\Website;

use App\Models\Hotel;
use Illuminate\Support\Str;
use App\Models\Website\Page;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\Website\PageFormRequest;

class PageController extends Controller
{
    public function index()
    {
        return view('admin.website.page.index');
    }

    public function create()
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.page.create', compact('hotels'));
    }

    public function store(PageFormRequest $request)
    {
        $validatedData = $request->validated();

        $page = new Page();

        $page->name = $validatedData['name'];
        $page->title = $validatedData['title'];
        $page->sub_title = $validatedData['sub_title'];
        $page->short_description = $validatedData['short_description'];
        $page->long_description = $validatedData['long_description'];
        $page->slug = Str::slug($validatedData['slug']);
        $page->hotel_id = $validatedData['hotel_id'];
        $page->display_order = $validatedData['display_order'];

        if($request->hasFile('image')){
            if($page->hotel_id == '1'){
                $location = 'dhaka';
            }
            if($page->hotel_id == '2') {
                $location = 'jashore';
            }
            $uploadPath = 'frontend/images/pages';
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($page->name).'-'.$location.'.'.$extension;
            $file->move($uploadPath,$filename);

            $page->image = $filename;
        }

        $page->meta_title = $validatedData['meta_title'];
        $page->meta_keyword = $validatedData['meta_keyword'];
        $page->meta_decription = $validatedData['meta_decription'];

        $page->footer_item = $request->footer_item == true ? '1':'0';
        $page->is_active = $request->is_active == true ? '1':'0';
        $page->created_by = $validatedData['created_by'];
        $page->save();

        return redirect('admin/website/pages')->with('message','Congratulations! New Page Has Been Created Successfully.');
    }

    public function edit(Page $page)
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.page.edit', compact('page', 'hotels'));
    }

    public function update(PageFormRequest $request, $page)
    {
        $validatedData = $request->validated();

        $page = Page::findOrFail($page);

        $page->name = $validatedData['name'];
        $page->title = $validatedData['title'];
        $page->sub_title = $validatedData['sub_title'];
        $page->short_description = $validatedData['short_description'];
        $page->long_description = $validatedData['long_description'];
        $page->slug = Str::slug($validatedData['slug']);
        $page->hotel_id = $validatedData['hotel_id'];
        $page->display_order = $validatedData['display_order'];

        if($request->hasFile('image')){
            if($page->hotel_id == '1'){
                $location = 'dhaka';
            }
            if($page->hotel_id == '2') {
                $location = 'jashore';
            }
            $uploadPath = 'frontend/images/pages';
            $previousPath = 'frontend/images/pages/'.$page->image;
            if(File::exists($previousPath)){
                File::delete($previousPath);
            }
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($page->name).'-'.$location.'.'.$extension;
            $file->move($uploadPath,$filename);

            $page->image = $filename;
        }

        $page->meta_title = $validatedData['meta_title'];
        $page->meta_keyword = $validatedData['meta_keyword'];
        $page->meta_decription = $validatedData['meta_decription'];

        $page->footer_item = $request->footer_item == true ? '1':'0';
        $page->is_active = $request->is_active == true ? '1':'0';
        $page->updated_by = $validatedData['updated_by'];
        $page->update();

        return redirect('admin/website/pages')->with('message','Congratulations! New Page Has Been Updated Successfully.');
    }
}
