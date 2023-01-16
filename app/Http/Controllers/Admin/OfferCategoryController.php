<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\OfferCategory;
use App\Http\Controllers\Controller;
use App\Http\Requests\OfferCategoryFormRequest;

class OfferCategoryController extends Controller
{
    public function index()
    {
        return view('admin.offer-category.index');
    }

    public function create()
    {
        return view('admin.offer-category.create');
    }

    public function store(OfferCategoryFormRequest $request)
    {
        $validatedData = $request->validated();

        $offer_cat = new OfferCategory();

        $offer_cat->name = $validatedData['name'];
        $offer_cat->slug = Str::slug($validatedData['slug']);

        $offer_cat->meta_title = $validatedData['meta_title'];
        $offer_cat->meta_keyword = $validatedData['meta_keyword'];
        $offer_cat->meta_decription = $validatedData['meta_decription'];

        $offer_cat->is_active = $request->is_active == true ? '1':'0';
        $offer_cat->created_by = $validatedData['created_by'];
        $offer_cat->save();

        return redirect('admin/offer-category')->with('message','Congratulations! New Offer Category Has Been Created Successfully.');
    }

    public function edit(OfferCategory $offer_cat)
    {
        return view('admin.offer-category.edit', compact('offer_cat'));
    }

    public function update(OfferCategoryFormRequest $request, int $offer_category_id)
    {
        $validatedData = $request->validated();

        $offer_cat = OfferCategory::findOrFail($offer_category_id);

        $offer_cat->name = $validatedData['name'];
        $offer_cat->slug = Str::slug($validatedData['slug']);

        $offer_cat->meta_title = $validatedData['meta_title'];
        $offer_cat->meta_keyword = $validatedData['meta_keyword'];
        $offer_cat->meta_decription = $validatedData['meta_decription'];

        $offer_cat->is_active = $request->is_active == true ? '1':'0';
        $offer_cat->updated_by = $validatedData['updated_by'];
        $offer_cat->update();

        return redirect('admin/offer-category')->with('message','Congratulations! New Offer Category Has Been Updated Successfully.');
    }
}
