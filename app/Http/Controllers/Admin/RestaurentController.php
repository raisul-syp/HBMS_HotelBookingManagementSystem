<?php

namespace App\Http\Controllers\Admin;

use App\Models\Hotel;
use App\Models\Restaurent;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\RestaurentFormRequest;

class RestaurentController extends Controller
{
    public function index()
    {
        return view('admin.restaurent.index');
    }

    public function create()
    {
        return view('admin.restaurent.create');
    }

    public function store(RestaurentFormRequest $request)
    {
        $validatedData = $request->validated();

        $restaurent = new Restaurent();

        $restaurent->name = $validatedData['name'];
        $restaurent->slug = Str::slug($validatedData['slug']);
        $restaurent->short_description = $validatedData['short_description'];
        $restaurent->long_description = $validatedData['long_description'];

        if($request->hasFile('logo_image')){
            $logoUploadPath = 'uploads/restaurents/logo';
            $logoFile = $request->file('logo_image');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = Str::slug($restaurent->name).'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $restaurent->logo_image = $logoFilename;
        }

        $restaurent->meta_title = $validatedData['meta_title'];
        $restaurent->meta_keyword = $validatedData['meta_keyword'];
        $restaurent->meta_decription = $validatedData['meta_decription'];

        $restaurent->is_active = $request->is_active == true ? '1':'0';
        $restaurent->created_by = $validatedData['created_by'];
        $restaurent->save();

        if($request->hasFile('image')){
            $uploadPath = 'uploads/restaurents/';
            $i = 1;

            foreach($request->file('image') as $imageFile){
                $extension = $imageFile->getClientOriginalExtension();
                $filename =  $restaurent->slug.'-'.time().'-'.$i++.'.'.$extension;
                $imageFile->move($uploadPath,$filename);
                $finalImagePathName = $uploadPath.$filename;

                $restaurent->restaurentImages()->create([
                    'restaurent_id' => $restaurent->id,
                    'image' => $finalImagePathName,
                ]);
            }
        }

        return redirect('admin/restaurent')->with('message','Congratulations! New Restaurents Has Been Created Successfully.');
    }

    public function edit(Restaurent $restaurent)
    {
        return view('admin.restaurent.edit', compact('restaurent'));
    }

    public function update(RestaurentFormRequest $request, int $restaurent_id)
    {
        $validatedData = $request->validated();

        $restaurent = Restaurent::findOrFail($restaurent_id);

        $restaurent->name = $validatedData['name'];
        $restaurent->slug = Str::slug($validatedData['slug']);
        $restaurent->short_description = $validatedData['short_description'];
        $restaurent->long_description = $validatedData['long_description'];

        if($request->hasFile('logo_image')){
            $logoUploadPath = 'uploads/restaurents/logo';
            $logoPreviousPath = 'uploads/restaurents/logo/'.$restaurent->logo_image;
            if(File::exists($logoPreviousPath)){
                File::delete($logoPreviousPath);
            }
            $logoFile = $request->file('logo_image');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = Str::slug($restaurent->name).'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $restaurent->logo_image = $logoFilename;
        }

        $restaurent->meta_title = $validatedData['meta_title'];
        $restaurent->meta_keyword = $validatedData['meta_keyword'];
        $restaurent->meta_decription = $validatedData['meta_decription'];

        $restaurent->is_active = $request->is_active == true ? '1':'0';
        $restaurent->updated_by = $validatedData['updated_by'];
        $restaurent->update();

        if($request->hasFile('image')){
            $uploadPath = 'uploads/restaurents/';
            $i = 1;

            foreach($request->file('image') as $imageFile){
                $extension = $imageFile->getClientOriginalExtension();
                $filename =  $restaurent->slug.'-'.time().'-'.$i++.'.'.$extension;
                $imageFile->move($uploadPath,$filename);
                $finalImagePathName = $uploadPath.$filename;

                $restaurent->restaurentImages()->create([
                    'restaurent_id' => $restaurent->id,
                    'image' => $finalImagePathName,
                ]);
            }
        }

        return redirect('admin/restaurent')->with('message','Congratulations! New Restaurent Has Been Updated Successfully.');
    }
}
