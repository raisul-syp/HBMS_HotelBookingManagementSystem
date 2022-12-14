<?php

namespace App\Http\Controllers\Admin;

use App\Models\Hall;
use App\Models\Hotel;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\HallFormRequest;

class HallController extends Controller
{
    public function index()
    {
        return view('admin.hall.index');
    }

    public function create()
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.hall.create', compact('hotels'));
    }

    public function store(HallFormRequest $request)
    {
        $validatedData = $request->validated();

        $hall = new Hall();

        $hall->name = $validatedData['name'];
        $hall->hotel_id = $validatedData['hotel_id'];
        
        if($hall->hotel_id == '1'){
            $location = 'dhaka';
        }
        if($hall->hotel_id == '2') {
            $location = 'jashore';
        }

        $hall->slug = Str::slug($validatedData['slug']).'-'.$location;
        $hall->short_description = $validatedData['short_description'];
        $hall->long_description = $validatedData['long_description'];
        
        if($request->hasFile('logo_image')){
            $logoUploadPath = 'uploads/halls/logo';
            $logoFile = $request->file('logo_image');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = Str::slug($hall->name).'-'.$location.'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $hall->logo_image = $logoFilename;
        }

        $hall->meta_title = $validatedData['meta_title'];
        $hall->meta_keyword = $validatedData['meta_keyword'];
        $hall->meta_decription = $validatedData['meta_decription'];

        $hall->is_active = $request->is_active == true ? '1':'0';
        $hall->created_by = $validatedData['created_by'];
        $hall->save();        

        if($request->hasFile('image')){
            $uploadPath = 'uploads/halls/';
            $i = 1;

            foreach($request->file('image') as $imageFile){
                $extension = $imageFile->getClientOriginalExtension();
                $filename =  $hall->slug.'-'.time().'-'.$i++.'.'.$extension;
                $imageFile->move($uploadPath,$filename);
                $finalImagePathName = $uploadPath.$filename;

                $hall->hallImages()->create([
                    'hall_id' => $hall->id,
                    'image' => $finalImagePathName,
                ]);
            }
        }

        return redirect('admin/hall')->with('message','Congratulations! New Hall Has Been Created Successfully.');
    }

    public function edit(Hall $hall)
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.hall.edit', compact('hall','hotels'));
    }

    public function update(HallFormRequest $request, int $hall_id)
    {
        $validatedData = $request->validated();

        $hall = Hall::findOrFail($hall_id);

        $hall->name = $validatedData['name'];
        $hall->hotel_id = $validatedData['hotel_id'];
        
        if($hall->hotel_id == '1'){
            $location = 'dhaka';
        }
        if($hall->hotel_id == '2') {
            $location = 'jashore';
        }

        $hall->slug = Str::slug($validatedData['slug']).'-'.$location;
        $hall->short_description = $validatedData['short_description'];
        $hall->long_description = $validatedData['long_description'];
        
        if($request->hasFile('logo_image')){
            $logoUploadPath = 'uploads/halls/logo';
            $logoPreviousPath = 'uploads/halls/logo/'.$hall->logo_image;
            if(File::exists($logoPreviousPath)){
                File::delete($logoPreviousPath);
            }
            $logoFile = $request->file('logo_image');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = Str::slug($hall->name).'-'.$location.'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $hall->logo_image = $logoFilename;
        }

        $hall->meta_title = $validatedData['meta_title'];
        $hall->meta_keyword = $validatedData['meta_keyword'];
        $hall->meta_decription = $validatedData['meta_decription'];

        $hall->is_active = $request->is_active == true ? '1':'0';
        $hall->updated_by = $validatedData['updated_by'];
        $hall->update();

        if($request->hasFile('image')){
            $uploadPath = 'uploads/halls/';
            $i = 1;

            foreach($request->file('image') as $imageFile){
                $extension = $imageFile->getClientOriginalExtension();
                $filename =  $hall->slug.'-'.time().'-'.$i++.'.'.$extension;
                $imageFile->move($uploadPath,$filename);
                $finalImagePathName = $uploadPath.$filename;

                $hall->hallImages()->create([
                    'hall_id' => $hall->id,
                    'image' => $finalImagePathName,
                ]);
            }
        }

        return redirect('admin/hall')->with('message','Congratulations! New Hall Has Been Updated Successfully.');
    }
}
