<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Settings;
use App\Models\Website\ContactInfo;
use App\Models\Website\Page;
use Illuminate\Http\Request;

class PagesController extends Controller
{
    public function aboutUs()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.about-us', compact('pages'));
    }

    public function contactUs()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        $contacts = ContactInfo::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.contact-us', compact('pages', 'contacts'));
    }

    public function news()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.news', compact('pages'));
    }

    public function offers()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.offers', compact('pages'));
    }

    public function certificatesAwards()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.certificates-awards', compact('pages'));
    }

    public function bookingCancelPolicy()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.booking-cancelation-policy', compact('pages'));
    }

    public function privacyPolicy()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.privacy-policy', compact('pages'));
    }

    public function termsConditions()
    {
        $pages = Page::all()->where('is_active', '1')->where('is_delete', '1');
        return view('frontend.terms-conditions', compact('pages'));
    }
}
