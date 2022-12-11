<?php

namespace App\Models\Website;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

    protected $table = 'hb_webaddresses';

    protected $fillable = [
        'title',
        'slug',
        'display_order',
        'phone',
        'phone_sales',
        'phone_reservation',
        'email',
        'email_sales',
        'email_reservation',
        'address',
        'google_map',
        'meta_title',
        'meta_keyword',
        'meta_decription',
        'is_active',
        'is_delete',
        'created_by',
        'updated_by',
    ];
}
