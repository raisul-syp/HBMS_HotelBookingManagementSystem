<?php

namespace App\Models\Website;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NavigationSubmenu extends Model
{
    use HasFactory;

    protected $table = 'hb_websubnav';

    protected $fillable = [
        'name',
        'slug',
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
