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
        Schema::create('paraphrase_requests', function (Blueprint $table) {
            $table->id('id_paraphrase');
            $table->foreignId('id_user')->constrained('users', 'id_user')->onDelete('cascade');
            $table->text('original_text');
            $table->text('paraphrase_text');
            $table->timestamp('created_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paraphrase_requests');
    }
};
