<?php

namespace App\Http\Controllers\Admin;

use App\Models\Hotel;
use App\Models\Restaurent;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\RestaurentFormRequest;

class RestaurentController extends Controller
{
    public function index()
    {
        return view('admin.restaurent.index');
    }

    public function create()
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.restaurent.create', compact('hotels'));
    }

    public function store(RestaurentFormRequest $request)
    {
        $validatedData = $request->validated();

        $restaurent = new Restaurent();

        $restaurent->name = $validatedData['name'];
        $restaurent->hotel_id = $validatedData['hotel_id'];
        $restaurent->slug = Str::slug($validatedData['slug']);
        $restaurent->short_description = $validatedData['short_description'];
        $restaurent->long_description = $validatedData['long_description'];

        $restaurent->meta_title = $validatedData['meta_title'];
        $restaurent->meta_keyword = $validatedData['meta_keyword'];
        $restaurent->meta_decription = $validatedData['meta_decription'];

        $restaurent->is_active = $request->is_active == true ? '1':'0';
        $restaurent->created_by = $validatedData['created_by'];
        $restaurent->save();        
        
        if($request->hasFile('logo')){
            $logoUploadPath = 'uploads/restaurents/';
            $logoFile = $request->file('logo');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = 'logo-'.Str::slug($restaurent->name).'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $restaurent->logo = $logoFilename;
        }

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

    // public function edit(Restaurent $restaurent)
    // {
    //     $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
    //     return view('admin.restaurent.edit', compact('restaurent','hotels'));
    // }

    // public function update(RoomFormRequest $request, int $room_id)
    // {
    //     $validatedData = $request->validated();

    //     $room = Room::findOrFail($room_id);

    //     $room->name = $validatedData['name'];
    //     $room->hotel_id = $validatedData['hotel_id'];
    //     $room->slug = Str::slug($validatedData['slug']);
    //     $room->short_description = $validatedData['short_description'];
    //     $room->long_description = $validatedData['long_description'];
    //     $room->max_adults = $validatedData['max_adults'];
    //     $room->max_childs = $validatedData['max_childs'];
    //     $room->quantity = $validatedData['quantity'];
    //     $room->price = $validatedData['price'];

    //     $room->meta_title = $validatedData['meta_title'];
    //     $room->meta_keyword = $validatedData['meta_keyword'];
    //     $room->meta_decription = $validatedData['meta_decription'];

    //     $room->is_active = $request->is_active == true ? '1':'0';
    //     $room->updated_by = $validatedData['updated_by'];
    //     $room->update();

    //     $facilities = Facility::find($request->facilities);
    //     $room->facilities()->sync($facilities);

    //     $views = Roomtype::find($request->roomViews);
    //     $room->roomViews()->sync($views);

    //     if($request->hasFile('image')){
    //         $uploadPath = 'uploads/rooms/';

    //         $i = 1;
    //         foreach($request->file('image') as $imageFile){
    //             $extension = $imageFile->getClientOriginalExtension();
    //             $filename =  $room->slug.'-'.time().'-'.$i++.'.'.$extension;
    //             $imageFile->move($uploadPath,$filename);
    //             $finalImagePathName = $uploadPath.$filename;

    //             $room->roomImages()->create([
    //                 'room_id' => $room->id,
    //                 'image' => $finalImagePathName,
    //             ]);
    //         }
    //     }

    //     return redirect('admin/room')->with('message','Congratulations! New Room Has Been Updated Successfully.');
    // }
}
