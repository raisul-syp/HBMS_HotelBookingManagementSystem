<?php

namespace App\Http\Controllers\Admin;

use App\Models\Room;
use App\Models\Facility;
use App\Models\Roomtype;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\RoomFormRequest;
use App\Models\Hotel;

class RoomController extends Controller
{
    public function index()
    {
        return view('admin.room.index');
    }

    public function create()
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');
        $views = Roomtype::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.room.create', compact('hotels','facilities','views'));
    }

    public function store(RoomFormRequest $request)
    {
        $validatedData = $request->validated();

        $room = new Room();

        $room->name = $validatedData['name'];
        $room->hotel_id = $validatedData['hotel_id'];
        $room->slug = Str::slug($validatedData['slug']);
        $room->short_description = $validatedData['short_description'];
        $room->long_description = $validatedData['long_description'];
        $room->max_adults = $validatedData['max_adults'];
        $room->max_childs = $validatedData['max_childs'];
        $room->quantity = $validatedData['quantity'];
        $room->price = $validatedData['price'];

        $room->meta_title = $validatedData['meta_title'];
        $room->meta_keyword = $validatedData['meta_keyword'];
        $room->meta_decription = $validatedData['meta_decription'];

        $room->is_active = $request->is_active == true ? '1':'0';
        $room->created_by = $validatedData['created_by'];
        $room->save();

        $facilities = Facility::find($request->facilities);
        $room->facilities()->sync($facilities);

        $views = Roomtype::find($request->roomViews);
        $room->roomViews()->sync($views);

        if($request->hasFile('image')){
            $uploadPath = 'uploads/rooms/';
            $i = 1;

            foreach($request->file('image') as $imageFile){
                $extension = $imageFile->getClientOriginalExtension();
                $filename =  $room->slug.'-'.time().'-'.$i++.'.'.$extension;
                $imageFile->move($uploadPath,$filename);
                $finalImagePathName = $uploadPath.$filename;

                $room->roomImages()->create([
                    'room_id' => $room->id,
                    'image' => $finalImagePathName,
                ]);
            }
        }

        return redirect('admin/room')->with('message','Congratulations! New Room Has Been Created Successfully.');
    }

    public function edit(int $room_id)
    {
        // $roomtypes = Roomtype::all()->where('is_active','1')->where('is_delete','1');
        $room = Room::findOrFail($room_id);
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        $facilities = Facility::all()->where('is_active','1')->where('is_delete','1');
        $roomFacilities = $room->facilities();
        $views = Roomtype::all()->where('is_active','1')->where('is_delete','1');
        $roomViews = $room->roomViews();
        return view('admin.room.edit', compact('room','hotels','facilities','roomFacilities','views','roomViews'));
    }

    public function update(RoomFormRequest $request, int $room_id)
    {
        $validatedData = $request->validated();

        $room = Room::findOrFail($room_id);

        $room->name = $validatedData['name'];
        $room->hotel_id = $validatedData['hotel_id'];
        $room->slug = Str::slug($validatedData['slug']);
        $room->short_description = $validatedData['short_description'];
        $room->long_description = $validatedData['long_description'];
        $room->max_adults = $validatedData['max_adults'];
        $room->max_childs = $validatedData['max_childs'];
        $room->quantity = $validatedData['quantity'];
        $room->price = $validatedData['price'];

        $room->meta_title = $validatedData['meta_title'];
        $room->meta_keyword = $validatedData['meta_keyword'];
        $room->meta_decription = $validatedData['meta_decription'];

        $room->is_active = $request->is_active == true ? '1':'0';
        $room->updated_by = $validatedData['updated_by'];
        $room->update();

        $facilities = Facility::find($request->facilities);
        $room->facilities()->sync($facilities);

        $views = Roomtype::find($request->roomViews);
        $room->roomViews()->sync($views);

        if($request->hasFile('image')){
            $uploadPath = 'uploads/rooms/';

            $i = 1;
            foreach($request->file('image') as $imageFile){
                $extension = $imageFile->getClientOriginalExtension();
                $filename =  $room->slug.'-'.time().'-'.$i++.'.'.$extension;
                $imageFile->move($uploadPath,$filename);
                $finalImagePathName = $uploadPath.$filename;

                $room->roomImages()->create([
                    'room_id' => $room->id,
                    'image' => $finalImagePathName,
                ]);
            }
        }

        return redirect('admin/room')->with('message','Congratulations! New Room Has Been Updated Successfully.');
    }
}
