<?php

namespace App\Services;

class AiService
{
    /**
     * Generate structured prompt for thesis title recommendations.
     */
    public function generateTitlesPrompt(string $topic, string $systemPrompt, string $styleInstruction): string
    {
        return <<<PROMPT
Peran & Panduan Pembimbing:
{$systemPrompt}

Instruksi Gaya Penulisan:
{$styleInstruction}

Topik Penelitian:
{$topic}

Tugas:
Berdasarkan topik penelitian dan panduan pembimbing di atas, buatlah 3-5 opsi judul skripsi yang inovatif, spesifik, dan memenuhi kaidah karya ilmiah akademik. Sertakan pula penjelasan singkat untuk masing-masing opsi judul tersebut.
PROMPT;
    }

    /**
     * Generate structured prompt for academic text paraphrasing.
     */
    public function paraphrasePrompt(string $originalText, string $styleInstruction): string
    {
        return <<<PROMPT
Instruksi Gaya Penulisan:
{$styleInstruction}

Teks Asli:
{$originalText}

Tugas:
Parafrase teks di atas agar lebih akademis, lugas, dan bebas dari unsur plagiarisme dengan tetap mempertahankan makna dan esensi utama kalimat.
PROMPT;
    }
}
