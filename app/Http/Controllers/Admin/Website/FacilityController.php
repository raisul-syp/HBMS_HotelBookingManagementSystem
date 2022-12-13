<?php

namespace App\Http\Controllers\Admin\Website;

use App\Models\Hotel;
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
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.facility.create', compact('hotels'));
    }

    public function store(FacilityFormRequest $request)
    {
        $validatedData = $request->validated();

        $facility = new Facility();

        $facility->name = $validatedData['name'];
        $facility->slug = Str::slug($validatedData['slug']);
        $facility->hotel_id = $validatedData['hotel_id'];
        $facility->description = $validatedData['description'];
        $facility->display_order = $validatedData['display_order'];
        
        if($request->hasFile('image')){
            if($facility->hotel_id == '1'){
                $location = 'dhaka';
            }
            if($facility->hotel_id == '2') {
                $location = 'jashore';
            }
            $uploadPath = 'frontend/images/facilities';
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($facility->name).'-'.$location.'.'.$extension;
            $file->move($uploadPath,$filename);

            $facility->image = $filename;
        }

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
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.facility.edit', compact('facility', 'hotels'));
    }

    public function update(FacilityFormRequest $request, $facility)
    {
        $validatedData = $request->validated();

        $facility = Facility::findOrFail($facility);

        $facility->name = $validatedData['name'];
        $facility->slug = Str::slug($validatedData['slug']);
        $facility->hotel_id = $validatedData['hotel_id'];
        $facility->description = $validatedData['description'];
        $facility->display_order = $validatedData['display_order'];

        if($request->hasFile('image')){
            if($facility->hotel_id == '1'){
                $location = 'dhaka';
            }
            if($facility->hotel_id == '2') {
                $location = 'jashore';
            }
            $uploadPath = 'frontend/images/facilities';
            $previousPath = 'frontend/images/facilities/'.$facility->image;
            if(File::exists($previousPath)){
                File::delete($previousPath);
            }
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($facility->name).'-'.$location.'.'.$extension;
            $file->move($uploadPath,$filename);

            $facility->image = $filename;
        }

        $facility->meta_title = $validatedData['meta_title'];
        $facility->meta_keyword = $validatedData['meta_keyword'];
        $facility->meta_decription = $validatedData['meta_decription'];

        $facility->is_active = $request->is_active == true ? '1':'0';
        $facility->updated_by = $validatedData['updated_by'];
        $facility->update();

        return redirect('admin/website/facilities')->with('message','Congratulations! New Facility Has Been Updated Successfully.');
    }
}
