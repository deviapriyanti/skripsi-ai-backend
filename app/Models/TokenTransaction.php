<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TokenTransaction extends Model
{
    use HasFactory;

    protected $table = 'token_transactions';

    protected $primaryKey = 'id_transaction';

    public $timestamps = false;

    protected $fillable = [
        'id_user',
        'transaction_type',
        'feature_tag',
        'amount',
        'balance_after',
    ];

    protected function casts(): array
    {
        return [
            'amount' => 'integer',
            'balance_after' => 'integer',
            'created_at' => 'datetime',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_user', 'id_user');
    }
}
