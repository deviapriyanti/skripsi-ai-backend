<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('plans', function (Blueprint $table) {
            $table->increments('id_plan');
            $table->string('name_plan', 100);
            $table->text('description')->nullable(); // Kolom baru
            $table->integer('token_quota');
            $table->decimal('price', 10, 2);
            $table->integer('duration')->nullable();
            $table->json('features')->nullable();    // Kolom baru
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plans');
    }
};
