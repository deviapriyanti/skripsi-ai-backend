<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Plan extends Model
{
    use HasFactory;

    protected $table = 'plans';

    protected $primaryKey = 'id_plan';

    public $timestamps = false;

    protected $fillable = [
        'name_plan',
        'token_quota',
        'price',
        'duration',
    ];

    protected function casts(): array
    {
        return [
            'token_quota' => 'integer',
            'price' => 'decimal:2',
            'duration' => 'integer',
        ];
    }

    public function subscriptions(): HasMany
    {
        return $this->hasMany(Subscription::class, 'id_plan', 'id_plan');
    }
}
