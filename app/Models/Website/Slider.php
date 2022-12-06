<?php

namespace App\Models\Website;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;

    protected $table = 'hb_websliders';

    protected $fillable = [
        'name',
        'url',
        'desktop_image',
        'mobile_image',
        'content_1',
        'content_2',
        'content_3',
        'content_4',
        'content_5',
        'button_1',
        'button_2',
        'button_1_url',
        'button_2_url',
        'display_order',
        'meta_title',
        'meta_keyword',
        'meta_decription',
        'is_active',
        'is_delete',
        'created_by',
        'updated_by',
    ];
}
