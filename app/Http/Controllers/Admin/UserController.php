<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin;
use App\Models\CountryList;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\UserFormRequest;
use App\Http\Requests\UserEditFormRequest;
use Illuminate\Validation\Rules;

class UserController extends Controller
{
    public function index()
    {
        return view('admin.user.index');
    }

    public function create()
    {
        $countries = CountryList::all()->where('is_active','1');
        return view('admin.user.create', compact('countries'));
    }

    public function store(UserFormRequest $request)
    {
        $validatedData = $request->validated();

        $users = new Admin;

        $users->first_name = $validatedData['first_name'];
        $users->last_name = $validatedData['last_name'];
        $users->email = $validatedData['email'];
        $users->password = Hash::make($request->password);
        $users->gender = $validatedData['gender'];
        $users->date_of_birth = $validatedData['date_of_birth'];
        $users->phone = $validatedData['phone'];
        $users->address = $validatedData['address'];
        $users->city = $validatedData['city'];
        $users->state = $validatedData['state'];
        $users->postal_code = $validatedData['postal_code'];
        $users->country = $validatedData['country'];
        $users->admin_comment = $validatedData['admin_comment'];
        $users->is_active = $request->is_active == true ? '1':'0';
        $users->created_by = $validatedData['created_by'];
        $users->role_as = $validatedData['role_as'];

        if($request->hasFile('profile_photo')){
            $uploadProfilePath = 'uploads/users/profile_photo/';

            $profilePhotoFile = $request->file('profile_photo');
            $profileExtension = $profilePhotoFile->getClientOriginalExtension();
            $profileName =  $users->first_name.'-'.time().'.'.$profileExtension;
            $profilePhotoFile->move($uploadProfilePath,$profileName);

            $users->profile_photo = $profileName;
        }

        if($request->hasFile('cover_photo')){
            $uploadCoverPath = 'uploads/users/cover_photo/';

            $coverPhotoFile = $request->file('cover_photo');
            $coverExtension = $coverPhotoFile->getClientOriginalExtension();
            $coverName =  $users->first_name.'-'.time().'.'.$coverExtension;
            $coverPhotoFile->move($uploadCoverPath,$coverName);

            $users->cover_photo = $coverName;
        }

        $users->save();

        return redirect('admin/user')->with('message','Congratulations! New User Has Been Created Successfully.');
    }

    public function edit(Admin $user)
    {
        $countries = CountryList::all()->where('is_active','1');
        return view('admin.user.edit', compact('user','countries'));
    }

    public function update(UserEditFormRequest $request, $user)
    {
        $validatedData = $request->validated();

        $users = Admin::findOrFail($user);

        $users->first_name = $validatedData['first_name'];
        $users->last_name = $validatedData['last_name'];
        $users->email = $validatedData['email'];
        $users->gender = $validatedData['gender'];
        $users->date_of_birth = $validatedData['date_of_birth'];
        $users->phone = $validatedData['phone'];
        $users->address = $validatedData['address'];
        $users->city = $validatedData['city'];
        $users->state = $validatedData['state'];
        $users->postal_code = $validatedData['postal_code'];
        $users->country = $validatedData['country'];
        $users->admin_comment = $validatedData['admin_comment'];
        $users->is_active = $request->is_active == true ? '1':'0';
        $users->updated_by = $validatedData['updated_by'];
        $users->role_as = $validatedData['role_as'];

        if($request->hasFile('profile_photo')){
            $uploadProfilePath = 'uploads/users/profile_photo/';
            $profilePath = 'uploads/users/profile_photo/'.$users->profile_photo;
            if(File::exists($profilePath)){
                File::delete($profilePath);
            }

            $profilePhotoFile = $request->file('profile_photo');
            $profileExtension = $profilePhotoFile->getClientOriginalExtension();
            $profileName =  $users->first_name.'-'.time().'.'.$profileExtension;
            $profilePhotoFile->move($uploadProfilePath,$profileName);

            $users->profile_photo = $profileName;
        }

        if($request->hasFile('cover_photo')){
            $uploadCoverPath = 'uploads/users/cover_photo/';
            $coverPath = 'uploads/users/cover_photo/'.$users->cover_photo;
            if(File::exists($coverPath)){
                File::delete($coverPath);
            }

            $coverPhotoFile = $request->file('cover_photo');
            $coverExtension = $coverPhotoFile->getClientOriginalExtension();
            $coverName =  $users->first_name.'-'.time().'.'.$coverExtension;
            $coverPhotoFile->move($uploadCoverPath,$coverName);

            $users->cover_photo = $coverName;
        }

        $users->update();

        return redirect('admin/user')->with('message','Congratulations! Targeted User Has Been Updated Successfully.');
    }
}
