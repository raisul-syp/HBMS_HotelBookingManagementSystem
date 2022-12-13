<?php

namespace App\Models;

use App\Models\Website\Address;
use App\Models\Website\Facility;
use App\Models\Website\Page;
use App\Models\Website\Slider;
use App\Models\Website\Testimonial;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    use HasFactory;

    protected $table = 'hb_hotels';

    protected $fillable = [
        'name',
        'slug',
        'hotel_location',
        'display_order',
        'description',
        'meta_title',
        'meta_keyword',
        'meta_decription',
        'is_active',
        'is_delete',
        'created_by',
        'updated_by',
    ];

    public function rooms()
    {
        return $this->hasMany(Room::class, 'hotel_id', 'id');
    }

    public function sliders()
    {
        return $this->hasMany(Slider::class, 'hotel_id', 'id');
    }

    public function testimonials()
    {
        return $this->hasMany(Testimonial::class, 'hotel_id', 'id');
    }

    public function facilities()
    {
        return $this->hasMany(Facility::class, 'hotel_id', 'id');
    }

    public function pages()
    {
        return $this->hasMany(Page::class, 'hotel_id', 'id');
    }

    public function addresses()
    {
        return $this->hasMany(Address::class, 'hotel_id', 'id');
    }
}
