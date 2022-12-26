<?php

namespace App\Http\Controllers\Admin\Website;

use App\Http\Controllers\Controller;
use App\Http\Requests\Website\ContactInfoFormRequest;
use App\Models\Website\ContactInfo;
use Illuminate\Http\Request;

class ContactInfoController extends Controller
{
    public function index()
    {
        return view('admin.website.contactinfo.index');
    }

    public function create()
    {
        return view('admin.website.contactinfo.create');
    }

    public function store(ContactInfoFormRequest $request)
    {
        $validatedData = $request->validated();

        $contacts = new ContactInfo();

        $contacts->hotel_name = $validatedData['hotel_name'];
        $contacts->phone = $validatedData['phone'];
        $contacts->email = $validatedData['email'];
        $contacts->address = $validatedData['address'];
        $contacts->google_map = $validatedData['google_map'];
        $contacts->display_order = $validatedData['display_order'];
        $contacts->phone_sales = $validatedData['phone_sales'];
        $contacts->phone_reservation = $validatedData['phone_reservation'];
        $contacts->email_sales = $validatedData['email_sales'];
        $contacts->email_reservation = $validatedData['email_reservation'];
        $contacts->meta_title = $validatedData['meta_title'];
        $contacts->meta_keyword = $validatedData['meta_keyword'];
        $contacts->meta_decription = $validatedData['meta_decription'];
        $contacts->is_active = $request->is_active == true ? '1':'0';
        $contacts->created_by = $validatedData['created_by'];
        $contacts->save();

        return redirect('admin/website/contactinfo')->with('message','Congratulations! New Contact Information Has Been Created Successfully.');
    }

    public function edit(ContactInfo $contacts)
    {
        return view('admin.website.contactinfo.edit', compact('contacts'));
    }

    public function update(ContactInfoFormRequest $request, int $contacts_id)
    {
        $validatedData = $request->validated();

        $contacts = ContactInfo::findOrFail($contacts_id);

        $contacts->hotel_name = $validatedData['hotel_name'];
        $contacts->phone = $validatedData['phone'];
        $contacts->email = $validatedData['email'];
        $contacts->address = $validatedData['address'];
        $contacts->google_map = $validatedData['google_map'];
        $contacts->display_order = $validatedData['display_order'];
        $contacts->phone_sales = $validatedData['phone_sales'];
        $contacts->phone_reservation = $validatedData['phone_reservation'];
        $contacts->email_sales = $validatedData['email_sales'];
        $contacts->email_reservation = $validatedData['email_reservation'];
        $contacts->meta_title = $validatedData['meta_title'];
        $contacts->meta_keyword = $validatedData['meta_keyword'];
        $contacts->meta_decription = $validatedData['meta_decription'];
        $contacts->is_active = $request->is_active == true ? '1':'0';
        $contacts->updated_by = $validatedData['updated_by'];
        $contacts->update();

        return redirect('admin/website/contactinfo')->with('message','Congratulations! New Contact Information Has Been Updated Successfully.');
    }
}
