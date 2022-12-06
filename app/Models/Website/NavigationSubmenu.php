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
        'parent_id',
        'display_order',
        'meta_title',
        'meta_keyword',
        'meta_decription',
        'is_active',
        'is_delete',
        'created_by',
        'updated_by',
    ];

    public function menus()
    {
        return $this->belongsTo(NavigationMenu::class, 'parent_id')->where('is_active','1')->where('is_delete','1')->orderBy('display_order','ASC');
    }
}
