<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\CountryList;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\GuestFormRequest;
use App\Http\Requests\GuestEditFormRequest;

class GuestController extends Controller
{
    public function index()
    {
        return view('admin.guest.index');
    }

    public function create()
    {
        $countries = CountryList::all()->where('is_active','1');
        return view('admin.guest.create', compact('countries'));
    }

    public function store(GuestFormRequest $request)
    {
        $validatedData = $request->validated();

        $guests = new User;

        $guests->first_name = $validatedData['first_name'];
        $guests->last_name = $validatedData['last_name'];
        $guests->email = $validatedData['email'];
        $guests->password = Hash::make($request->password);
        $guests->gender = $validatedData['gender'];
        $guests->date_of_birth = $validatedData['date_of_birth'];
        $guests->phone = $validatedData['phone'];
        $guests->address = $validatedData['address'];
        $guests->city = $validatedData['city'];
        $guests->state = $validatedData['state'];
        $guests->postal_code = $validatedData['postal_code'];
        $guests->country = $validatedData['country'];
        $guests->admin_comment = $validatedData['admin_comment'];
        $guests->is_active = $request->is_active == true ? '1':'0';
        $guests->created_by = $validatedData['created_by'];

        if($request->hasFile('profile_photo')){
            $uploadProfilePath = 'uploads/guests/profile_photo/';

            $profilePhotoFile = $request->file('profile_photo');
            $profileExtension = $profilePhotoFile->getClientOriginalExtension();
            $profileName =  $guests->first_name.'-'.time().'.'.$profileExtension;
            $profilePhotoFile->move($uploadProfilePath,$profileName);

            $guests->profile_photo = $profileName;
        }

        if($request->hasFile('cover_photo')){
            $uploadCoverPath = 'uploads/guests/cover_photo/';

            $coverPhotoFile = $request->file('cover_photo');
            $coverExtension = $coverPhotoFile->getClientOriginalExtension();
            $coverName =  $guests->first_name.'-'.time().'.'.$coverExtension;
            $coverPhotoFile->move($uploadCoverPath,$coverName);

            $guests->cover_photo = $coverName;
        }

        $guests->save();

        return redirect('admin/guest')->with('message','Congratulations! New Guest Has Been Created Successfully.');
    }

    public function edit(User $guest)
    {
        $countries = CountryList::all()->where('is_active','1');
        return view('admin.guest.edit', compact('guest','countries'));
    }

    public function update(GuestEditFormRequest $request, $guest)
    {
        $validatedData = $request->validated();

        $guests = User::findOrFail($guest);

        $guests->first_name = $validatedData['first_name'];
        $guests->last_name = $validatedData['last_name'];
        $guests->email = $validatedData['email'];
        $guests->gender = $validatedData['gender'];
        $guests->date_of_birth = $validatedData['date_of_birth'];
        $guests->phone = $validatedData['phone'];
        $guests->address = $validatedData['address'];
        $guests->city = $validatedData['city'];
        $guests->state = $validatedData['state'];
        $guests->postal_code = $validatedData['postal_code'];
        $guests->country = $validatedData['country'];
        $guests->admin_comment = $validatedData['admin_comment'];
        $guests->is_active = $request->is_active == true ? '1':'0';
        $guests->updated_by = $validatedData['updated_by'];

        if($request->hasFile('profile_photo')){
            $uploadProfilePath = 'uploads/guests/profile_photo/';
            $profilePath = 'uploads/guests/profile_photo/'.$guests->profile_photo;
            if(File::exists($profilePath)){
                File::delete($profilePath);
            }

            $profilePhotoFile = $request->file('profile_photo');
            $profileExtension = $profilePhotoFile->getClientOriginalExtension();
            $profileName =  $guests->first_name.'-'.time().'.'.$profileExtension;
            $profilePhotoFile->move($uploadProfilePath,$profileName);

            $guests->profile_photo = $profileName;
        }

        if($request->hasFile('cover_photo')){
            $uploadCoverPath = 'uploads/guests/cover_photo/';
            $coverPath = 'uploads/guests/cover_photo/'.$guests->cover_photo;
            if(File::exists($coverPath)){
                File::delete($coverPath);
            }

            $coverPhotoFile = $request->file('cover_photo');
            $coverExtension = $coverPhotoFile->getClientOriginalExtension();
            $coverName =  $guests->first_name.'-'.time().'.'.$coverExtension;
            $coverPhotoFile->move($uploadCoverPath,$coverName);

            $guests->cover_photo = $coverName;
        }

        $guests->update();

        return redirect('admin/guest')->with('message','Congratulations! Targeted Guest Has Been Updated Successfully.');
    }
}
