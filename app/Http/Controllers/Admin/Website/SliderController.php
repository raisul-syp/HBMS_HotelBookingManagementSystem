<?php

namespace App\Http\Controllers\Admin\Website;

use App\Models\Hotel;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Website\Slider;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\Website\SliderFormRequest;

class SliderController extends Controller
{
    public function index()
    {
        return view('admin.website.slider.index');
    }

    public function create()
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.slider.create', compact('hotels'));
    }

    public function store(SliderFormRequest $request)
    {
        $validatedData = $request->validated();

        $slider = new Slider();

        $slider->name = $validatedData['name'];
        $slider->slug = Str::slug($validatedData['slug']);
        $slider->hotel_id = $validatedData['hotel_id'];
        
        if($request->hasFile('desktop_image')){
            if($slider->hotel_id == '1'){
                $location = 'dhaka';
            }
            if($slider->hotel_id == '2') {
                $location = 'jashore';
            }
            $desktopUploadPath = 'frontend/images/sliders';
            $desktopFile = $request->file('desktop_image');

            $desktopExtension = $desktopFile->getClientOriginalExtension();
            $desktopFilename = 'desk-'.Str::slug($slider->name).'-'.$location.'.'.$desktopExtension;
            $desktopFile->move($desktopUploadPath,$desktopFilename);

            $slider->desktop_image = $desktopFilename;
        }

        if($request->hasFile('mobile_image')){
            if($slider->hotel_id == '1'){
                $location = 'dhaka';
            }
            if($slider->hotel_id == '2') {
                $location = 'jashore';
            }
            $mobileUploadPath = 'frontend/images/sliders';
            $mobileFile = $request->file('mobile_image');

            $mobileExtension = $mobileFile->getClientOriginalExtension();
            $mobileFilename = 'mobl-'.Str::slug($slider->name).'-'.$location.'.'.$mobileExtension;
            $mobileFile->move($mobileUploadPath,$mobileFilename);

            $slider->mobile_image = $mobileFilename;
        }

        $slider->content_1 = $validatedData['content_1'];
        $slider->content_2 = $validatedData['content_2'];
        $slider->content_3 = $validatedData['content_3'];
        $slider->content_4 = $validatedData['content_4'];
        $slider->content_5 = $validatedData['content_5'];
        $slider->display_order = $validatedData['display_order'];

        $slider->meta_title = $validatedData['meta_title'];
        $slider->meta_keyword = $validatedData['meta_keyword'];
        $slider->meta_decription = $validatedData['meta_decription'];

        $slider->is_active = $request->is_active == true ? '1':'0';
        $slider->created_by = $validatedData['created_by'];
        $slider->save();

        return redirect('admin/website/sliders')->with('message','Congratulations! New Slider Has Been Created Successfully.');
    }

    public function edit(Slider $slider)
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.slider.edit', compact('slider', 'hotels'));
    }

    public function update(SliderFormRequest $request, $slider)
    {
        $validatedData = $request->validated();

        $slider = Slider::findOrFail($slider);

        $slider->name = $validatedData['name'];
        $slider->slug = Str::slug($validatedData['slug']);
        $slider->hotel_id = $validatedData['hotel_id'];

        if($request->hasFile('desktop_image')){
            if($slider->hotel_id == '1'){
                $location = 'dhaka';
            }
            else {
                $location = 'jashore';
            }
            $desktopUploadPath = 'frontend/images/sliders';
            $desktopPreviousPath = 'frontend/images/sliders/'.$slider->desktop_image;
            if(File::exists($desktopPreviousPath)){
                File::delete($desktopPreviousPath);
            }
            $desktopFile = $request->file('desktop_image');

            $desktopExtension = $desktopFile->getClientOriginalExtension();
            $desktopFilename = 'desk-'.Str::slug($slider->name).'-'.$location.'.'.$desktopExtension;
            $desktopFile->move($desktopUploadPath,$desktopFilename);

            $slider->desktop_image = $desktopFilename;
        }

        if($request->hasFile('mobile_image')){
            if($slider->hotel_id == '1'){
                $location = 'dhaka';
            }
            else {
                $location = 'jashore';
            }
            $mobileUploadPath = 'frontend/images/sliders';
            $mobilePreviousPath = 'frontend/images/sliders/'.$slider->mobile_image;
            if(File::exists($mobilePreviousPath)){
                File::delete($mobilePreviousPath);
            }
            $mobileFile = $request->file('mobile_image');

            $mobileExtension = $mobileFile->getClientOriginalExtension();
            $mobileFilename = 'mobl-'.Str::slug($slider->name).'-'.$location.'.'.$mobileExtension;
            $mobileFile->move($mobileUploadPath,$mobileFilename);

            $slider->mobile_image = $mobileFilename;
        }

        $slider->content_1 = $validatedData['content_1'];
        $slider->content_2 = $validatedData['content_2'];
        $slider->content_3 = $validatedData['content_3'];
        $slider->content_4 = $validatedData['content_4'];
        $slider->content_5 = $validatedData['content_5'];
        $slider->display_order = $validatedData['display_order'];

        $slider->meta_title = $validatedData['meta_title'];
        $slider->meta_keyword = $validatedData['meta_keyword'];
        $slider->meta_decription = $validatedData['meta_decription'];

        $slider->is_active = $request->is_active == true ? '1':'0';
        $slider->updated_by = $validatedData['updated_by'];
        $slider->update();

        return redirect('admin/website/sliders')->with('message','Congratulations! New Slider Has Been Updated Successfully.');
    }
}
