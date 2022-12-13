<?php

namespace App\Http\Controllers\Admin\Website;

use App\Models\Hotel;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Website\Address;
use App\Http\Controllers\Controller;
use App\Http\Requests\Website\AddressFormRequest;

class AddressController extends Controller
{
    public function index()
    {
        return view('admin.website.address.index');
    }

    public function create()
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.address.create', compact('hotels'));
    }

    public function store(AddressFormRequest $request)
    {
        $validatedData = $request->validated();

        $address = new Address();

        $address->hotel_id = $validatedData['hotel_id'];
        $address->slug = Str::slug($validatedData['slug']);
        $address->display_order = $validatedData['display_order'];
        $address->phone = $validatedData['phone'];
        $address->phone_sales = $validatedData['phone_sales'];
        $address->phone_reservation = $validatedData['phone_reservation'];
        $address->email = $validatedData['email'];
        $address->email_sales = $validatedData['email_sales'];
        $address->email_reservation = $validatedData['email_reservation'];
        $address->address = $validatedData['address'];
        $address->google_map = $validatedData['google_map'];

        $address->meta_title = $validatedData['meta_title'];
        $address->meta_keyword = $validatedData['meta_keyword'];
        $address->meta_decription = $validatedData['meta_decription'];

        $address->is_active = $request->is_active == true ? '1':'0';
        $address->created_by = $validatedData['created_by'];
        $address->save();

        return redirect('admin/website/addresses')->with('message','Congratulations! New Address Has Been Created Successfully.');
    }

    public function edit(Address $address)
    {
        $hotels = Hotel::all()->where('is_active','1')->where('is_delete','1');
        return view('admin.website.address.edit', compact('address', 'hotels'));
    }

    public function update(AddressFormRequest $request, $address)
    {
        $validatedData = $request->validated();

        $address = Address::findOrFail($address);

        $address->hotel_id = $validatedData['hotel_id'];
        $address->slug = Str::slug($validatedData['slug']);
        $address->display_order = $validatedData['display_order'];
        $address->phone = $validatedData['phone'];
        $address->phone_sales = $validatedData['phone_sales'];
        $address->phone_reservation = $validatedData['phone_reservation'];
        $address->email = $validatedData['email'];
        $address->email_sales = $validatedData['email_sales'];
        $address->email_reservation = $validatedData['email_reservation'];
        $address->address = $validatedData['address'];
        $address->google_map = $validatedData['google_map'];

        $address->meta_title = $validatedData['meta_title'];
        $address->meta_keyword = $validatedData['meta_keyword'];
        $address->meta_decription = $validatedData['meta_decription'];

        $address->is_active = $request->is_active == true ? '1':'0';
        $address->updated_by = $validatedData['updated_by'];
        $address->update();

        return redirect('admin/website/addresses')->with('message','Congratulations! New Address Has Been Updated Successfully.');
    }
}
