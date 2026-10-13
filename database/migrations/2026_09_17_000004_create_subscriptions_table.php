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
        Schema::create('subscriptions', function (Blueprint $table) {
            $table->id('id_subscription');
            $table->foreignId('id_user')->constrained('users', 'id_user')->onDelete('cascade');
            $table->unsignedInteger('id_plan');
            $table->foreign('id_plan')->references('id_plan')->on('plans')->onDelete('cascade');
            $table->enum('status', ['Active', 'Expired', 'Cancelled'])->default('Active');
            $table->dateTime('expired_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subscriptions');
    }
};
