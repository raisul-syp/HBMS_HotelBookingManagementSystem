<?php

namespace App\Http\Controllers\Admin\Website;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Website\Facility;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\Website\FacilityFormRequest;

class FacilityController extends Controller
{
    public function index()
    {
        return view('admin.website.facility.index');
    }

    public function create()
    {
        return view('admin.website.facility.create');
    }

    public function store(FacilityFormRequest $request)
    {
        $validatedData = $request->validated();

        $facility = new Facility();

        $facility->name = $validatedData['name'];
        $facility->url = $validatedData['url'];
        $facility->description = $validatedData['description'];
        
        if($request->hasFile('image')){
            $uploadPath = 'frontend/images/facilities';
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($facility->name).'.'.$extension;
            $file->move($uploadPath,$filename);

            $facility->image = $filename;
        }

        $facility->display_order = $validatedData['display_order'];

        $facility->meta_title = $validatedData['meta_title'];
        $facility->meta_keyword = $validatedData['meta_keyword'];
        $facility->meta_decription = $validatedData['meta_decription'];

        $facility->is_active = $request->is_active == true ? '1':'0';
        $facility->created_by = $validatedData['created_by'];
        $facility->save();

        return redirect('admin/website/facilities')->with('message','Congratulations! New Facility Has Been Created Successfully.');
    }

    public function edit(Facility $facility)
    {
        return view('admin.website.facility.edit', compact('facility'));
    }

    public function update(FacilityFormRequest $request, $facility)
    {
        $validatedData = $request->validated();

        $facility = Facility::findOrFail($facility);

        $facility->name = $validatedData['name'];
        $facility->url = $validatedData['url'];
        $facility->description = $validatedData['description'];

        if($request->hasFile('image')){
            $uploadPath = 'frontend/images/facilities';
            $previousPath = 'frontend/images/facilities/'.$facility->image;
            if(File::exists($previousPath)){
                File::delete($previousPath);
            }
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($facility->name).'.'.$extension;
            $file->move($uploadPath,$filename);

            $facility->image = $filename;
        }

        $facility->display_order = $validatedData['display_order'];

        $facility->meta_title = $validatedData['meta_title'];
        $facility->meta_keyword = $validatedData['meta_keyword'];
        $facility->meta_decription = $validatedData['meta_decription'];

        $facility->is_active = $request->is_active == true ? '1':'0';
        $facility->updated_by = $validatedData['updated_by'];
        $facility->update();

        return redirect('admin/website/facilities')->with('message','Congratulations! New Facility Has Been Updated Successfully.');
    }
}