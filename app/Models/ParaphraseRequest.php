<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParaphraseRequest extends Model
{
    use HasFactory;

    protected $table = 'paraphrase_requests';
    protected $primaryKey = 'id_paraphrase';

    public $timestamps = false;

    protected $fillable = [
        'id_user',
        'original_text',
        'paraphrase_text',
        'created_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id_user');
    }
}