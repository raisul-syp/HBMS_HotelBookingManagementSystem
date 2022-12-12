<?php

namespace App\Http\Controllers\Admin;

use App\Models\Hotel;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\HotelFormRequest;

class HotelController extends Controller
{
    public function index()
    {
        return view('admin.hotel.index');
    }

    public function create()
    {
        return view('admin.hotel.create');
    }

    public function store(HotelFormRequest $request)
    {
        $validatedData = $request->validated();

        $hotel = new Hotel();

        $hotel->name = $validatedData['name'];
        $hotel->slug = Str::slug($validatedData['slug']);
        $hotel->hotel_location = $validatedData['hotel_location'];
        $hotel->display_order = $validatedData['display_order'];
        $hotel->description = $validatedData['description'];

        $hotel->meta_title = $validatedData['meta_title'];
        $hotel->meta_keyword = $validatedData['meta_keyword'];
        $hotel->meta_decription = $validatedData['meta_decription'];

        $hotel->is_active = $request->is_active == true ? '1':'0';
        $hotel->created_by = $validatedData['created_by'];
        $hotel->save();

        return redirect('admin/hotels')->with('message','Congratulations! New Hotel Has Been Created Successfully.');
    }

    public function edit(Hotel $hotel)
    {
        return view('admin.hotel.edit', compact('hotel'));
    }

    public function update(HotelFormRequest $request, $hotel)
    {
        $validatedData = $request->validated();

        $hotel = Hotel::findOrFail($hotel);

        $hotel->name = $validatedData['name'];
        $hotel->slug = Str::slug($validatedData['slug']);
        $hotel->hotel_location = $validatedData['hotel_location'];
        $hotel->display_order = $validatedData['display_order'];
        $hotel->description = $validatedData['description'];

        $hotel->meta_title = $validatedData['meta_title'];
        $hotel->meta_keyword = $validatedData['meta_keyword'];
        $hotel->meta_decription = $validatedData['meta_decription'];

        $hotel->is_active = $request->is_active == true ? '1':'0';
        $hotel->updated_by = $validatedData['updated_by'];
        $hotel->update();

        return redirect('admin/hotels')->with('message','Congratulations! New Hotel Has Been Updated Successfully.');
    }
}
