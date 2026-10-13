<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ParaphraseRequest;
use App\Models\History;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;

class ParaphraseController extends Controller
{
    public function process(Request $request)
    {
        $request->validate([
            'original_text' => 'required|string|max:1000',
            'style' => 'nullable|string'
        ]);

        $originalText = $request->original_text;
        $style = $request->style ?? 'Akademik';
        $userId = $request->user()->id_user; // Sesuaikan dengan primary key user di token

        // LOGIKA PARAFRASE (Menggunakan API AI / Service / OpenRouter / Gemini API / Dummy)
        // Contoh integrasi ke Gemini API / OpenAI API atau logika sederhana:
        $paraphrasedText = $this->generateParaphraseAI($originalText, $style);

        // Simpan riwayat ke database PostgreSQL
        $savedRecord = ParaphraseRequest::create([
            'id_user' => $userId,
            'original_text' => $originalText,
            'paraphrase_text' => $paraphrasedText,
            'created_at' => now(),
        ]);

        History::create([
            'user_id' => $userId,
            'title' => 'Parafrase Teks (' . $style . ')',
            'description' => '"' . Str::limit($originalText, 120) . '"',
            'category' => 'Parafrase (' . $style . ')',
            'jurusan' => $user->university ?? 'Informatika',
            'reference_type' => 'Paraphrase',
            'reference_id' => $savedRecord->id_paraphrase ?? $savedRecord->id,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Teks berhasil diparafrase',
            'data' => [
                'id_paraphrase' => $savedRecord->id_paraphrase,
                'original_text' => $savedRecord->original_text,
                'paraphrase_text' => $savedRecord->paraphrase_text,
                'created_at' => $savedRecord->created_at,
            ]
        ], 200);
    }

    private function generateParaphraseAI($text, $style)
    {
        // Tempat memanggil API AI luar (misal OpenAI / Gemini)
        // Sementara contoh pemrosesan simulasi:
        return "Hasil parafrase (" . $style . "): " . $text . " [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]";
    }

}

