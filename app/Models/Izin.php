<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Izin extends Model
{
    protected $fillable =
    [
        'user_id',
        'judul',
        'isi',
        'detail',
        'status',
        'verifikator_comment',
        'verifikator_id'
    ];

    public function users()
    {
        return $this->belongsTo(User::class);
    }

    public function verifikator()
    {
        return $this->belongsTo(User::class, 'verifikator_id');
    }
}
