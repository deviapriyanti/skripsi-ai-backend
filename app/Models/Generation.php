<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Generation extends Model
{
    use HasFactory;

    protected $table = 'generations';

    protected $primaryKey = 'id_generate';

    public $timestamps = false;

    protected $fillable = [
        'id_session',
    ];

    protected function casts(): array
    {
        return [
            'created_at' => 'datetime',
        ];
    }

    public function session(): BelongsTo
    {
        return $this->belongsTo(Session::class, 'id_session', 'id_session');
    }

    public function titleRecommendations(): HasMany
    {
        return $this->hasMany(TitleRecommendation::class, 'id_generate', 'id_generate');
    }
}
