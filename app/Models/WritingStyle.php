<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class WritingStyle extends Model
{
    use HasFactory;

    protected $table = 'writing_styles';

    protected $primaryKey = 'id_style';

    protected $fillable = [
        'name_style',
        'description',
        'instruction',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
        ];
    }

    public function sessions(): HasMany
    {
        return $this->hasMany(Session::class, 'id_style', 'id_style');
    }
}
