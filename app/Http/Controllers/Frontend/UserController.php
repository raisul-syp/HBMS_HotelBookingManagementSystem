<?php

namespace App\Http\Controllers\Frontend;

use App\Models\User;
use App\Models\Settings;
use App\Models\CountryList;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use App\Http\Requests\GuestEditFormRequest;
use App\Models\Booking;

class UserController extends Controller
{
    public function myProfile()
    {
        $guests = Auth::user();
        return view('frontend.user.my-profile', compact('guests'));
    }

    public function editMyProfile(User $guest)
    {
        $guests = Auth::user();
        $countries = CountryList::all()->where('is_active','1');
        return view('frontend.user.edit-profile', compact('guest','guests','countries'));
    }

    public function updateMyProfile(GuestEditFormRequest $request, $guest)
    {
        // $guests = Auth::user();
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

        return redirect('guest/profile')->with('message','Congratulations! Your Personal Information Has Been Updated Successfully.');
    }

    public function bookingHistory()
    {
        $serialNo = 1;
        $guests = Auth::user();
        $bookings = Booking::all()->where('guest_id', $guests->id);
        return view('frontend.user.booking-history', compact('serialNo', 'guests', 'bookings'));
    }
}
