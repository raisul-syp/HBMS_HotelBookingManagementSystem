<?php

namespace App\Http\Controllers\Admin\Website;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Website\Testimonial;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\Website\TestimonialFormRequest;

class TestimonialController extends Controller
{
    public function index()
    {
        return view('admin.website.testimonial.index');
    }

    public function create()
    {
        return view('admin.website.testimonial.create');
    }

    public function store(TestimonialFormRequest $request)
    {
        $validatedData = $request->validated();

        $testimonial = new Testimonial();

        $testimonial->name = $validatedData['name'];
        $testimonial->designation = $validatedData['designation'];
        $testimonial->company = $validatedData['company'];
        $testimonial->message = $validatedData['message'];
        
        if($request->hasFile('image')){
            $uploadPath = 'frontend/images/testimonials';
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($testimonial->name).'.'.$extension;
            $file->move($uploadPath,$filename);

            $testimonial->image = $filename;
        }

        $testimonial->url = $validatedData['url'];
        $testimonial->display_order = $validatedData['display_order'];

        $testimonial->meta_title = $validatedData['meta_title'];
        $testimonial->meta_keyword = $validatedData['meta_keyword'];
        $testimonial->meta_decription = $validatedData['meta_decription'];

        $testimonial->is_active = $request->is_active == true ? '1':'0';
        $testimonial->created_by = $validatedData['created_by'];
        $testimonial->save();

        return redirect('admin/website/testimonials')->with('message','Congratulations! New Testimonial Has Been Created Successfully.');
    }

    public function edit(Testimonial $testimonial)
    {
        return view('admin.website.testimonial.edit', compact('testimonial'));
    }

    public function update(TestimonialFormRequest $request, $testimonial)
    {
        $validatedData = $request->validated();

        $testimonial = Testimonial::findOrFail($testimonial);

        $testimonial->name = $validatedData['name'];
        $testimonial->designation = $validatedData['designation'];
        $testimonial->company = $validatedData['company'];
        $testimonial->message = $validatedData['message'];

        if($request->hasFile('image')){
            $uploadPath = 'frontend/images/testimonials';
            $previousPath = 'frontend/images/testimonials/'.$testimonial->image;
            if(File::exists($previousPath)){
                File::delete($previousPath);
            }
            $file = $request->file('image');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($testimonial->name).'.'.$extension;
            $file->move($uploadPath,$filename);

            $testimonial->image = $filename;
        }

        $testimonial->url = $validatedData['url'];
        $testimonial->display_order = $validatedData['display_order'];

        $testimonial->meta_title = $validatedData['meta_title'];
        $testimonial->meta_keyword = $validatedData['meta_keyword'];
        $testimonial->meta_decription = $validatedData['meta_decription'];

        $testimonial->is_active = $request->is_active == true ? '1':'0';
        $testimonial->updated_by = $validatedData['updated_by'];
        $testimonial->update();

        return redirect('admin/website/testimonials')->with('message','Congratulations! New Testimonial Has Been Updated Successfully.');
    }
}
