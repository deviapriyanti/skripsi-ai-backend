<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Kolom id_role dibuat nullable (boleh kosong saat baru registrasi)
            $table->foreignId('id_role')
                ->nullable()
                ->constrained('study_roles', 'id_role')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['id_role']);
            $table->dropColumn('id_role');
        });
    }
};