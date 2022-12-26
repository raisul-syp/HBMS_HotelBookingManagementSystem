<?php

namespace App\Http\Controllers\Admin;

use App\Models\Hotel;
use App\Models\Settings;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\SettingsFormRequest;

class SettingsController extends Controller
{
    public function index()
    {
        return view('admin.settings.index');
    }

    public function create()
    {
        return view('admin.settings.create');
    }

    public function store(SettingsFormRequest $request)
    {
        $validatedData = $request->validated();

        $settings = new Settings();

        $settings->name = $validatedData['name'];
        $settings->phone = $validatedData['phone'];
        $settings->email = $validatedData['email'];
        $settings->address = $validatedData['address'];
        $settings->display_order = $validatedData['display_order'];

        if($request->hasFile('logo')){
            $logoUploadPath = 'uploads/site';
            $logoFile = $request->file('logo');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = 'logo-'.'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $settings->logo = $logoFilename;
        }

        if($request->hasFile('icon')){
            $iconUploadPath = 'uploads/site';
            $iconFile = $request->file('icon');

            $iconExtension = $iconFile->getClientOriginalExtension();
            $iconFilename = 'icon-'.'.'.$iconExtension;
            $iconFile->move($iconUploadPath,$iconFilename);

            $settings->icon = $iconFilename;
        }

        $settings->social_fb = $validatedData['social_fb'];
        $settings->social_tw = $validatedData['social_tw'];
        $settings->social_insta = $validatedData['social_insta'];
        $settings->social_yt = $validatedData['social_yt'];

        $settings->meta_title = $validatedData['meta_title'];
        $settings->meta_keyword = $validatedData['meta_keyword'];
        $settings->meta_decription = $validatedData['meta_decription'];

        $settings->is_active = $request->is_active == true ? '1':'0';
        $settings->created_by = $validatedData['created_by'];
        $settings->save();

        return redirect('admin/settings')->with('message','Congratulations! New Settings Has Been Created Successfully.');
    }

    public function edit(Settings $settings)
    {
        return view('admin.settings.edit', compact('settings'));
    }

    public function update(SettingsFormRequest $request, int $settings_id)
    {
        $validatedData = $request->validated();

        $settings = Settings::findOrFail($settings_id);

        $settings->name = $validatedData['name'];
        $settings->phone = $validatedData['phone'];
        $settings->email = $validatedData['email'];
        $settings->address = $validatedData['address'];
        $settings->display_order = $validatedData['display_order'];

        if($request->hasFile('logo')){
            $logoUploadPath = 'uploads/site';
            $logoPreviousPath = 'uploads/site/'.$settings->logo;
            if(File::exists($logoPreviousPath)){
                File::delete($logoPreviousPath);
            }
            $logoFile = $request->file('logo');

            $logoExtension = $logoFile->getClientOriginalExtension();
            $logoFilename = 'logo-'.'.'.$logoExtension;
            $logoFile->move($logoUploadPath,$logoFilename);

            $settings->logo = $logoFilename;
        }

        if($request->hasFile('icon')){
            $iconUploadPath = 'uploads/site';
            $iconPreviousPath = 'uploads/site/'.$settings->icon;
            if(File::exists($iconPreviousPath)){
                File::delete($iconPreviousPath);
            }
            $iconFile = $request->file('icon');

            $iconExtension = $iconFile->getClientOriginalExtension();
            $iconFilename = 'icon-'.'.'.$iconExtension;
            $iconFile->move($iconUploadPath,$iconFilename);

            $settings->icon = $iconFilename;
        }

        $settings->social_fb = $validatedData['social_fb'];
        $settings->social_tw = $validatedData['social_tw'];
        $settings->social_insta = $validatedData['social_insta'];
        $settings->social_yt = $validatedData['social_yt'];

        $settings->meta_title = $validatedData['meta_title'];
        $settings->meta_keyword = $validatedData['meta_keyword'];
        $settings->meta_decription = $validatedData['meta_decription'];

        $settings->is_active = $request->is_active == true ? '1':'0';
        $settings->updated_by = $validatedData['updated_by'];
        $settings->update();

        return redirect('admin/settings')->with('message','Congratulations! New Settings Has Been Updated Successfully.');
    }
}
