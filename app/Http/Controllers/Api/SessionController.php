<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Session;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SessionController extends Controller
{
    /**
     * Display a listing of sessions for the user.
     */
    public function index(Request $request): JsonResponse
    {
        $user = $request->user() ?? User::first();

        if (! $user) {
            return response()->json([
                'message' => 'Pengguna tidak ditemukan.',
                'data' => [],
            ], 200);
        }

        $sessions = Session::where('id_user', $user->id_user)
            ->with(['studyRole', 'writingStyle'])
            ->latest('id_session')
            ->get();

        return response()->json([
            'message' => 'Daftar sesi skripsi berhasil diambil.',
            'data' => $sessions,
        ], 200);
    }

    /**
     * Store a newly created session in storage.
     */
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'id_user' => 'nullable|exists:users,id_user',
            'id_role' => 'required|exists:study_roles,id_role',
            'id_style' => 'required|exists:writing_styles,id_style',
            'research_topic' => 'required_without:title_topic|string',
            'title_topic' => 'nullable|string',
            'thesis_title' => 'nullable|string|max:255',
            'research_detail' => 'nullable|string',
        ]);

        $user = null;
        if (! empty($validated['id_user'])) {
            $user = User::find($validated['id_user']);
        }
        $user ??= $request->user() ?? User::first();

        if (! $user) {
            return response()->json([
                'message' => 'Pengguna tidak ditemukan.',
            ], 404);
        }

        $topic = $validated['research_topic'] ?? $validated['title_topic'];

        $session = Session::create([
            'id_user' => $user->id_user,
            'id_role' => $validated['id_role'],
            'id_style' => $validated['id_style'],
            'thesis_title' => $validated['thesis_title'] ?? null,
            'research_topic' => $topic,
            'research_detail' => $validated['research_detail'] ?? null,
        ]);

        return response()->json([
            'message' => 'Sesi skripsi berhasil dibuat.',
            'data' => $session->load(['studyRole', 'writingStyle']),
        ], 201);
    }

    /**
     * Remove the specified session from storage.
     */
    public function destroy(int|string $id): JsonResponse
    {
        $session = Session::findOrFail($id);
        $session->delete();

        return response()->json([
            'message' => 'Sesi skripsi berhasil dihapus.',
        ], 200);
    }
}
