<?php

namespace App\Http\Controllers;

use App\Models\History;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();

        // Mengambil riwayat berdasarkan id_user milik user yang sedang login
        $query = History::where('user_id', $user->id_user);

        // Filter Jurusan
        if ($request->has('jurusan') && $request->jurusan !== 'Semua Jurusan') {
            $query->where('jurusan', $request->jurusan);
        }

        // Pencarian Teks
        if ($request->has('search') && !empty($request->search)) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('title', 'ilike', "%{$search}%")
                  ->orWhere('description', 'ilike', "%{$search}%")
                  ->orWhere('category', 'ilike', "%{$search}%");
            });
        }

        // Sorting (Terbaru / Terlama)
        $sort = $request->get('sort', 'Terbaru');
        if ($sort === 'Terlama') {
            $query->orderBy('created_at', 'asc');
        } else {
            $query->orderBy('created_at', 'desc');
        }

        $histories = $query->paginate($request->get('per_page', 10));

        return response()->json([
            'success' => true,
            'data' => $histories
        ]);
    }
}