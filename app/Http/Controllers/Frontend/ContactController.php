<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Website\Address;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function index()
    {
        $addresses = Address::all()->where('is_active','1')->where('is_delete','1');
        return view('frontend.contact-us', compact('addresses'));
    }
}
