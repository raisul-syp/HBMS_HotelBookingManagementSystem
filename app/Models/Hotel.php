<?php

namespace App\Models;

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
}
