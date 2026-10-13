<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MasterDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // =========================================================================
        // 1. Seed Master Study Roles
        // =========================================================================
        $studyRoles = [
            [
                'id_role' => 1,
                'name_role' => 'Ilmu Komputer',
                'description' => 'Khusus untuk mahasiswa Teknik Informatika, Sistem Informasi, Rekayasa Perangkat Lunak, dan Ilmu Komputer.',
                'system_prompt' => 'Anda adalah pakar akademis dan pembimbing skripsi bidang Teknik Informatika, Sistem Informasi, Rekayasa Perangkat Lunak, dan Ilmu Komputer. Fokus pada topik seperti Machine Learning, Computer Vision, Software Engineering, Web/Mobile Development, Cyber Security, dan Data Science. Gunakan terminologi teknis yang tepat dan metodologi riset standar IT.',
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($studyRoles as $role) {
            DB::table('study_roles')->updateOrInsert(
                ['id_role' => $role['id_role']],
                $role
            );
        }

        // =========================================================================
        // 2. Seed Master Writing Styles
        // =========================================================================
        $writingStyles = [
            [
                'id_style' => 1,
                'name_style' => 'Formal & Akademik Standard',
                'description' => 'Bahasa baku sesuai PUEBI/EYD, gaya penulisan karya ilmiah resmi perguruan tinggi.',
                'instruction' => 'Gunakan tata bahasa formal baku, kalimat efektif, objektif, dan istilah ilmiah yang presisi.',
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id_style' => 2,
                'name_style' => 'Ringkas & Point-to-Point',
                'description' => 'Penjelasan lugas berfokus pada inti masalah, batasan sistem, dan poin penting.',
                'instruction' => 'Gunakan poin-poin terstruktur, ringkas, tanpa bertele-tele, dan langsung menargetkan rumusan masalah.',
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($writingStyles as $style) {
            DB::table('writing_styles')->updateOrInsert(
                ['id_style' => $style['id_style']],
                $style
            );
        }

        // =========================================================================
        // 3. Seed Master Plans
        // =========================================================================
        $plans = [
            [
                'id_plan' => 1,
                'name_plan' => 'Free',
                'description' => 'Untuk mencoba fitur dasar Skripsi AI.',
                'token_quota' => 250,
                'price' => 0.00,
                'duration' => 30,
                'features' => json_encode([
                    ['text' => '250 Token / bulan', 'enabled' => true],
                    ['text' => 'Akses Paraphrasing Dasar', 'enabled' => true],
                    ['text' => 'Review Bab Spesifik', 'enabled' => false],
                ]),
            ],
            [
                'id_plan' => 2,
                'name_plan' => 'Pro',
                'description' => 'Rekomendasi terbaik untuk pejuang skripsi aktif.',
                'token_quota' => 500,
                'price' => 49000.00,
                'duration' => 30,
                'features' => json_encode([
                    ['text' => '500 Token / bulan', 'enabled' => true],
                    ['text' => 'Paraphrasing Tingkat Lanjut', 'enabled' => true],
                    ['text' => 'Review Bab Spesifik (Bab 1-5)', 'enabled' => true],
                    ['text' => 'Prioritas Respon AI', 'enabled' => true],
                ]),
            ],
            [
                'id_plan' => 3,
                'name_plan' => 'Pro++',
                'description' => 'Akses tanpa batas untuk percepatan kelulusan.',
                'token_quota' => -1,
                'price' => 99000.00,
                'duration' => 30,
                'features' => json_encode([
                    ['text' => 'Unlimited Token', 'enabled' => true],
                    ['text' => 'Semua Fitur Pro', 'enabled' => true],
                    ['text' => 'Simulasi Sidang Skripsi (Audio)', 'enabled' => true],
                ]),
            ],
        ];

        foreach ($plans as $plan) {
            DB::table('plans')->updateOrInsert(
                ['id_plan' => $plan['id_plan']],
                $plan
            );
        }
    }
}