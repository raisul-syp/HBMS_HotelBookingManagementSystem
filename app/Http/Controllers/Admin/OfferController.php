<?php

namespace App\Http\Controllers\Admin;

use App\Models\Offer;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\Http\Requests\OfferFormRequest;

class OfferController extends Controller
{
    public function index()
    {
        return view('admin.offer.index');
    }

    public function create()
    {
        $offerDateTime = Carbon::now();
        return view('admin.offer.create', compact('offerDateTime'));
    }

    public function store(OfferFormRequest $request)
    {
        $validatedData = $request->validated();

        $offer = new Offer();

        $offer->name = $validatedData['name'];
        $offer->slug = Str::slug($validatedData['slug']);
        $offer->short_description = $validatedData['short_description'];
        $offer->long_description = $validatedData['long_description'];
        $offer->start_date = $validatedData['start_date'];
        $offer->end_date = $validatedData['end_date'];

        if($request->hasFile('thumb')){
            $uploadPath = 'uploads/offer';
            $file = $request->file('thumb');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($offer->name).'.'.$extension;
            $file->move($uploadPath,$filename);

            $offer->thumb = $filename;
        }

        $offer->meta_title = $validatedData['meta_title'];
        $offer->meta_keyword = $validatedData['meta_keyword'];
        $offer->meta_decription = $validatedData['meta_decription'];

        $offer->is_active = $request->is_active == true ? '1':'0';
        $offer->created_by = $validatedData['created_by'];
        $offer->save();

        return redirect('admin/offers')->with('message','Congratulations! New Offer Has Been Created Successfully.');
    }

    public function edit(Offer $offer)
    {
        return view('admin.offer.edit', compact('offer'));
    }

    public function update(OfferFormRequest $request, int $offer_id)
    {
        $validatedData = $request->validated();

        $offer = Offer::findOrFail($offer_id);

        $offer->name = $validatedData['name'];
        $offer->slug = Str::slug($validatedData['slug']);
        $offer->short_description = $validatedData['short_description'];
        $offer->long_description = $validatedData['long_description'];
        $offer->start_date = $validatedData['start_date'];
        $offer->end_date = $validatedData['end_date'];

        if($request->hasFile('thumb')){
            $uploadPath = 'uploads/offer';
            $previousPath = 'uploads/offer/'.$offer->thumb;
            if(File::exists($previousPath)){
                File::delete($previousPath);
            }
            $file = $request->file('thumb');

            $extension = $file->getClientOriginalExtension();
            $filename = Str::slug($offer->name).'.'.$extension;
            $file->move($uploadPath,$filename);

            $offer->thumb = $filename;
        }

        $offer->meta_title = $validatedData['meta_title'];
        $offer->meta_keyword = $validatedData['meta_keyword'];
        $offer->meta_decription = $validatedData['meta_decription'];

        $offer->is_active = $request->is_active == true ? '1':'0';
        $offer->updated_by = $validatedData['updated_by'];
        $offer->update();

        return redirect('admin/offers')->with('message','Congratulations! New Offer Has Been Updated Successfully.');
    }
}
