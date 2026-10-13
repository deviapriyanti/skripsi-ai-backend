<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Plan;
use App\Models\Subscription;
use App\Models\TokenTransaction;
use App\Models\History; // <--- IMPOR MODEL HISTORY
use Illuminate\Support\Facades\DB;

class SubscriptionController extends Controller
{
    public function getStatus(Request $request)
    {
        $user = $request->user();

        // 1. Ambil daftar paket dan pastikan 'features' diparse ke Array secara aman
        $plans = Plan::all()->map(function ($plan) {
            if (is_string($plan->features)) {
                $decoded = json_decode($plan->features, true);
                $plan->features = is_array($decoded) ? $decoded : [];
            }
            return $plan;
        });

        // 2. Ambil paket aktif user
        $activeSub = Subscription::where('id_user', $user->id_user)
            ->whereIn('status', ['active', 'Active', 'ACTIVE'])
            ->orderBy('id_subscription', 'desc')
            ->first();

        return response()->json([
            'success' => true,
            'tokens' => $user->token_balance ?? 0,
            'active_plan_id' => $activeSub ? $activeSub->id_plan : 1,
            'plans' => $plans,
        ], 200);
    }

    public function choosePlan(Request $request)
    {
        $request->validate([
            'id_plan' => 'required|exists:plans,id_plan',
        ]);

        $user = $request->user();
        $plan = Plan::findOrFail($request->id_plan);

        DB::transaction(function () use ($user, $plan) {
            // Nonaktifkan langganan lama
            Subscription::where('id_user', $user->id_user)
                ->whereIn('status', ['active', 'Active', 'ACTIVE'])
                ->update(['status' => 'Expired']);

            // Buat langganan baru
            $sub = Subscription::create([
                'id_user' => $user->id_user,
                'id_plan' => $plan->id_plan,
                'status' => 'Active',
                'expired_at' => now()->addDays($plan->duration ?? 30),
            ]);

            // Update Token User
            if ($plan->token_quota === -1) {
                $user->token_balance = -1;
            } else {
                $current = ($user->token_balance === -1) ? 0 : ($user->token_balance ?? 0);
                $user->token_balance = $current + $plan->token_quota;
            }
            $user->save();

            // Catat Riwayat Transaksi Token
            $transaction = TokenTransaction::create([
                'id_user' => $user->id_user,
                'transaction_type' => 'Credit',
                'feature_tag' => "Subscription Plan: {$plan->name_plan}",
                'amount' => $plan->token_quota,
                'balance_after' => $user->token_balance,
                'created_at' => now(),
            ]);

            // =========================================================================
            // CATAT RIWAYAT KE TABEL HISTORIES
            // =========================================================================
            History::create([
                'user_id' => $user->id_user,
                'title' => "Langganan Paket {$plan->name_plan}",
                'description' => "Berhasil berlangganan paket {$plan->name_plan} via QRIS.",
                'category' => 'Paket Langganan',
                'jurusan' => null,
                'reference_type' => 'Transaction',
                'reference_id' => $transaction->id_token_transaction ?? $transaction->id ?? $sub->id_subscription,
            ]);
        });

        return response()->json([
            'success' => true,
            'message' => "Berhasil berlangganan paket {$plan->name_plan}!",
            'tokens' => $user->token_balance,
            'active_plan_id' => $plan->id_plan,
        ], 200);
    }

    public function topup(Request $request)
    {
        $request->validate([
            'amount' => 'required|integer|min:1',
        ]);

        $user = $request->user();
        $amount = $request->amount;

        DB::transaction(function () use ($user, $amount) {
            if ($user->token_balance !== -1) {
                $current = $user->token_balance ?? 0;
                $user->token_balance = $current + $amount;
                $user->save();
            }

            $transaction = TokenTransaction::create([
                'id_user' => $user->id_user,
                'transaction_type' => 'Credit',
                'feature_tag' => 'Topup Token Satuan',
                'amount' => $amount,
                'balance_after' => $user->token_balance,
                'created_at' => now(),
            ]);

            History::create([
                'user_id' => $user->id_user,
                'title' => "Top-Up {$amount} Token Berhasil",
                'description' => "Pembelian {$amount} token via pembayaran QRIS.",
                'category' => 'Top Up Token',
                'jurusan' => null,
                'reference_type' => 'Transaction',
                'reference_id' => $transaction->id_token_transaction ?? $transaction->id,
            ]);
        });

        return response()->json([
            'success' => true,
            'message' => "Berhasil membeli {$amount} token!",
            'tokens' => $user->token_balance,
        ], 200);
    }
}