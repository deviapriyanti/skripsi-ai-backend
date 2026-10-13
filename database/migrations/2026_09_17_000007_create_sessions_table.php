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
        Schema::create('sessions', function (Blueprint $table) {
            $table->id('id_session');
            $table->foreignId('id_user')->constrained('users', 'id_user')->onDelete('cascade');
            $table->unsignedInteger('id_role');
            $table->foreign('id_role')->references('id_role')->on('study_roles')->onDelete('cascade');
            $table->unsignedInteger('id_style');
            $table->foreign('id_style')->references('id_style')->on('writing_styles')->onDelete('cascade');
            $table->string('thesis_title', 255)->nullable();
            $table->text('research_topic');
            $table->text('research_detail')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sessions');
    }
};
