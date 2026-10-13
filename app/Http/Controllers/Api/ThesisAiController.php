<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Generation;
use App\Models\ParaphraseRequest;
use App\Models\Session;
use App\Models\TitleRecommendation;
use App\Models\User;
use App\Models\WritingStyle;
use App\Services\AiService;
use App\Services\TokenService;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ThesisAiController extends Controller
{
    public function __construct(
        public TokenService $tokenService,
        public AiService $aiService,
    ) {}

    /**
     * Create a new thesis discussion session.
     */
    public function createSession(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'id_role' => 'required|exists:study_roles,id_role',
            'id_style' => 'required|exists:writing_styles,id_style',
            'research_topic' => 'required|string',
            'thesis_title' => 'nullable|string|max:255',
            'research_detail' => 'nullable|string',
        ]);

        $user = $request->user() ?? User::first();

        if (! $user) {
            return response()->json([
                'message' => 'Pengguna tidak ditemukan.',
            ], 404);
        }

        $session = Session::create([
            'id_user' => $user->id_user,
            'id_role' => $validated['id_role'],
            'id_style' => $validated['id_style'],
            'thesis_title' => $validated['thesis_title'] ?? null,
            'research_topic' => $validated['research_topic'],
            'research_detail' => $validated['research_detail'] ?? null,
        ]);

        return response()->json([
            'message' => 'Sesi percakapan berhasil dibuat.',
            'data' => $session->load(['studyRole', 'writingStyle']),
        ], 201);
    }

    /**
     * Generate thesis title recommendations for a session.
     */
    public function generateTitles(Request $request, int|string $id): JsonResponse
    {
        $session = Session::with(['studyRole', 'writingStyle'])->findOrFail($id);
        $user = $request->user() ?? User::find($session->id_user) ?? User::first();

        if (! $user) {
            return response()->json([
                'message' => 'Pengguna tidak ditemukan.',
            ], 404);
        }

        $systemPrompt = $session->studyRole->system_prompt ?? 'Anda adalah dosen pembimbing skripsi profesional.';
        $styleInstruction = $session->writingStyle->instruction ?? 'Gunakan bahasa Indonesia baku dan akademis.';

        $prompt = $this->aiService->generateTitlesPrompt(
            $session->research_topic,
            $systemPrompt,
            $styleInstruction
        );

        try {
            $this->tokenService->deductTokens($user, 10, 'Generate rekomendasi judul skripsi');
        } catch (Exception $e) {
            return response()->json([
                'message' => $e->getMessage(),
            ], 400);
        }

        $generation = Generation::create([
            'id_session' => $session->id_session,
        ]);

        $recommendationsData = [
            [
                'title' => 'Rancang Bangun Sistem Berbasis AI untuk Topik: '.$session->research_topic,
                'explanation' => 'Mengimplementasikan teknologi kecerdasan buatan untuk merancang solusi komprehensif pada topik riset.',
            ],
            [
                'title' => 'Analisis Performa dan Optimasi Algoritma pada Studi Kasus: '.$session->research_topic,
                'explanation' => 'Berfokus pada pembanding algoritma serta evaluasi metrik kinerja secara ilmiah.',
            ],
            [
                'title' => 'Penerapan Metode Pembelajaran Mesin dalam Mengatasi Permasalahan: '.$session->research_topic,
                'explanation' => 'Menggunakan pendekatan machine learning modern untuk ekstraksi pola dan prediksi otomatis.',
            ],
        ];

        $createdRecommendations = [];
        foreach ($recommendationsData as $item) {
            $createdRecommendations[] = TitleRecommendation::create([
                'id_generate' => $generation->id_generate,
                'title' => $item['title'],
                'explanation' => $item['explanation'],
            ]);
        }

        return response()->json([
            'message' => 'Rekomendasi judul skripsi berhasil dibuat.',
            'data' => [
                'generation_id' => $generation->id_generate,
                'prompt_used' => $prompt,
                'recommendations' => $createdRecommendations,
            ],
            'token_balance' => $user->fresh()->token_balance,
        ], 200);
    }

    /**
     * Paraphrase academic text.
     */
    public function paraphrase(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'original_text' => 'required|string',
            'id_style' => 'nullable|exists:writing_styles,id_style',
        ]);

        $user = $request->user() ?? User::first();

        if (! $user) {
            return response()->json([
                'message' => 'Pengguna tidak ditemukan.',
            ], 404);
        }

        $writingStyle = null;
        if (! empty($validated['id_style'])) {
            $writingStyle = WritingStyle::find($validated['id_style']);
        }
        $writingStyle ??= WritingStyle::first();

        $styleInstruction = $writingStyle->instruction ?? 'Gunakan ragam bahasa akademik baku dan kalimat efektif.';

        $prompt = $this->aiService->paraphrasePrompt(
            $validated['original_text'],
            $styleInstruction
        );

        try {
            $this->tokenService->deductTokens($user, 5, 'Parafrase teks akademik');
        } catch (Exception $e) {
            return response()->json([
                'message' => $e->getMessage(),
            ], 400);
        }

        $paraphrasedText = 'Hasil parafrase akademik (Gaya: '.($writingStyle->name_style ?? 'Baku').'): '.$validated['original_text'];

        $paraphraseRecord = ParaphraseRequest::create([
            'id_user' => $user->id_user,
            'original_text' => $validated['original_text'],
            'paraphrase_text' => $paraphrasedText,
        ]);

        return response()->json([
            'message' => 'Teks berhasil diparafrase.',
            'data' => [
                'paraphrase' => $paraphraseRecord,
                'prompt_used' => $prompt,
            ],
            'token_balance' => $user->fresh()->token_balance,
        ], 200);
    }
}
