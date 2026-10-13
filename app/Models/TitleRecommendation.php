<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TitleRecommendation extends Model
{
    use HasFactory;

    protected $table = 'title_recommendations';

    protected $primaryKey = 'id_title';

    public $timestamps = false;

    protected $fillable = [
        'id_generate',
        'title',
        'explanation',
    ];

    public function generation(): BelongsTo
    {
        return $this->belongsTo(Generation::class, 'id_generate', 'id_generate');
    }
}
