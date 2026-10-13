<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function updateStudyRole(Request $request)
    {
        $request->validate([
            'id_role' => 'nullable|exists:study_roles,id_role',
        ]);

        $user = $request->user();
        $user->id_role = $request->id_role;
        $user->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Jurusan berhasil diperbarui',
            'user' => [
                'id' => $user->id_user ?? $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'id_role' => $user->id_role,
            ]
        ], 200);
    }

    public function updateProfile(Request $request)
    {
        $user = $request->user();

        $request->validate([
            'name' => 'required|string|max:255',
            'university' => 'nullable|string|max:255',
            'profile_photo' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
        ]);

        $user->name = $request->name;
        $user->university = $request->university;

        if ($request->hasFile('profile_photo')) {
            // Hapus foto lama dari storage jika ada
            if ($user->profile_photo_path && Storage::disk('public')->exists($user->profile_photo_path)) {
                Storage::disk('public')->delete($user->profile_photo_path);
            }

            // Simpan foto baru
            $path = $request->file('profile_photo')->store('profile-photos', 'public');
            $user->profile_photo_path = $path;
        }

        $user->save();
        $user->load('studyRole');

        return response()->json([
            'status' => 'success',
            'message' => 'Profil berhasil diperbarui',
            'user' => [
                'id' => $user->id_user ?? $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'university' => $user->university,
                'profile_photo_path' => $user->profile_photo_path,
                'profile_photo_url' => $user->profile_photo_url, // Memakai Accessor baru
                'id_role' => $user->id_role,
                'study_role' => $user->studyRole,
            ]
        ], 200);
    }
}