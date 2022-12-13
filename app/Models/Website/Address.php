<?php

namespace App\Models\Website;

use App\Models\Hotel;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Address extends Model
{
    use HasFactory;

    protected $table = 'hb_webaddresses';

    protected $fillable = [
        'hotel_id',
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

    public function hotels()
    {
        return $this->belongsTo(Hotel::class, 'hotel_id');
    }
}
