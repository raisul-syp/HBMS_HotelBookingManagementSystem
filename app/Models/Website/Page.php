<?php

namespace App\Models\Website;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    use HasFactory;

    protected $table = 'hb_webpages';

    protected $fillable = [
        'name',
        'title',
        'sub_title',
        'short_description',
        'long_description',
        'url',
        'display_order',
        'image',
        'meta_title',
        'meta_keyword',
        'meta_decription',
        'footer_item',
        'is_active',
        'is_delete',
        'created_by',
        'updated_by',
    ];
}
