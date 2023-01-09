<?php

namespace App\Http\Controllers\Admin;

use App\Models\Faq;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\FaqFormRequest;

class FaqController extends Controller
{
    public function index()
    {
        return view('admin.faq.index');
    }

    public function create()
    {
        return view('admin.faq.create');
    }

    public function store(FaqFormRequest $request)
    {
        $validatedData = $request->validated();

        $faq = new Faq();

        $faq->question = $validatedData['question'];
        $faq->answer = $validatedData['answer'];
        $faq->faq_type = $validatedData['faq_type'];
        $faq->slug = Str::slug($validatedData['question']);

        $faq->meta_title = $validatedData['meta_title'];
        $faq->meta_keyword = $validatedData['meta_keyword'];
        $faq->meta_decription = $validatedData['meta_decription'];

        $faq->is_active = $request->is_active == true ? '1':'0';
        $faq->created_by = $validatedData['created_by'];
        $faq->save();

        return redirect('admin/faq')->with('message','Congratulations! New FAQ Has Been Created Successfully.');
    }

    public function edit(Faq $faq)
    {
        return view('admin.faq.edit', compact('faq'));
    }

    public function update(FaqFormRequest $request, int $faq_id)
    {
        $validatedData = $request->validated();

        $faq = Faq::findOrFail($faq_id);

        $faq->question = $validatedData['question'];
        $faq->answer = $validatedData['answer'];
        $faq->faq_type = $validatedData['faq_type'];
        $faq->slug = Str::slug($validatedData['question']);

        $faq->meta_title = $validatedData['meta_title'];
        $faq->meta_keyword = $validatedData['meta_keyword'];
        $faq->meta_decription = $validatedData['meta_decription'];

        $faq->is_active = $request->is_active == true ? '1':'0';
        $faq->updated_by = $validatedData['updated_by'];
        $faq->update();

        return redirect('admin/faq')->with('message','Congratulations! New FAQ Has Been Updated Successfully.');
    }
}
