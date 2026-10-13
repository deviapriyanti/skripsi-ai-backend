<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Subscription extends Model
{
    use HasFactory;

    protected $table = 'subscriptions';

    protected $primaryKey = 'id_subscription';

    public $timestamps = false;

    protected $fillable = [
    'id_user',
    'id_plan',
    'status',
    'expired_at',
];

    protected function casts(): array
    {
        return [
            'starts_at' => 'datetime',
            'expired_at' => 'datetime',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_user', 'id_user');
    }

    public function plan(): BelongsTo
    {
        return $this->belongsTo(Plan::class, 'id_plan', 'id_plan');
    }
}