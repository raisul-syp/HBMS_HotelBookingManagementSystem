<?php

namespace App\Models;

use App\Models\Hotel;
use App\Models\RestaurentImage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Restaurent extends Model
{
    use HasFactory;

    protected $table = 'hb_restaurents';

    protected $fillable = [
        'name',
        'hotel_id',
        'slug',
        'short_description',
        'long_description',
        'logo',
        'meta_title',
        'meta_keyword',
        'meta_decription',
        'is_active',
        'is_delete',
        'created_by',
        'updated_by',
    ];

    public function hotels()
    {
        return $this->belongsTo(Hotel::class, 'hotel_id');
    }

    public function restaurentImages()
    {
        return $this->hasMany(RestaurentImage::class, 'restaurent_id', 'id');
    }
}
