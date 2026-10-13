<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;

    // Tambahkan baris ini agar Eloquent tahu primary key-nya bukan 'id'
    protected $primaryKey = 'id_history';

    protected $fillable = [
        'user_id',
        'title',
        'description',
        'category',
        'jurusan',
        'reference_type',
        'reference_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id_user');
    }
}