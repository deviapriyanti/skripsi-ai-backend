<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('token_transactions', function (Blueprint $table) {
            $table->id('id_transaction');
            $table->foreignId('id_user')->constrained('users', 'id_user')->onDelete('cascade');
            $table->enum('transaction_type', ['Debit', 'Credit']);
            $table->string('feature_tag', 100)->nullable();
            $table->integer('amount');
            $table->integer('balance_after');
            $table->timestamp('created_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('token_transactions');
    }
};
