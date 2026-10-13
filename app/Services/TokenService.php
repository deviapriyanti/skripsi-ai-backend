<?php

namespace App\Services;

use App\Models\TokenTransaction;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\DB;

class TokenService
{
    /**
     * Check if user has enough token balance.
     */
    public function checkBalance(User $user, int $requiredTokens): bool
    {
        return $user->token_balance >= $requiredTokens;
    }

    /**
     * Deduct tokens from user balance using DB transaction and row locking.
     *
     * @throws Exception
     */
    public function deductTokens(User $user, int $amount, string $description, ?int $relatedId = null): bool
    {
        return DB::transaction(function () use ($user, $amount, $description) {
            /** @var User $lockedUser */
            $lockedUser = User::where('id_user', $user->id_user)
                ->lockForUpdate()
                ->firstOrFail();

            if ($lockedUser->token_balance < $amount) {
                throw new Exception('Saldo token tidak mencukupi.');
            }

            $lockedUser->decrement('token_balance', $amount);
            $lockedUser->refresh();

            TokenTransaction::create([
                'id_user' => $lockedUser->id_user,
                'transaction_type' => 'Debit',
                'feature_tag' => $description,
                'amount' => $amount,
                'balance_after' => $lockedUser->token_balance,
            ]);

            return true;
        });
    }

    /**
     * Add tokens to user balance using DB transaction.
     */
    public function addTokens(User $user, int $amount, string $description): void
    {
        DB::transaction(function () use ($user, $amount, $description) {
            /** @var User $lockedUser */
            $lockedUser = User::where('id_user', $user->id_user)
                ->lockForUpdate()
                ->firstOrFail();

            $lockedUser->increment('token_balance', $amount);
            $lockedUser->refresh();

            TokenTransaction::create([
                'id_user' => $lockedUser->id_user,
                'transaction_type' => 'Credit',
                'feature_tag' => $description,
                'amount' => $amount,
                'balance_after' => $lockedUser->token_balance,
            ]);
        });
    }
}
