<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    // Registrasi Mahasiswa
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 'user',
            'token_balance' => 250,
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => 'success',
            'message' => 'Registrasi berhasil',
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => [
                'id' => $user->id_user ?? $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'university' => $user->university,
                'profile_photo_path' => $user->profile_photo_path,
                'profile_photo_url' => $user->profile_photo_url,
                'id_role' => $user->id_role,
                'tokens' => $user->token_balance,
            ]
        ], 200);
    }

    // Login Mahasiswa
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['message' => 'Email atau password salah'], 401);
        }

        $user = User::where('email', $request->email)->firstOrFail();

        // Load relasi jurusan/role jika ada
        $user->load('studyRole');

        $user->tokens()->delete(); // Hapus token lama
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => 'success',
            'message' => 'Login berhasil',
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => [
                'id' => $user->id_user ?? $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'university' => $user->university,
                'profile_photo_path' => $user->profile_photo_path,
                'profile_photo_url' => $user->profile_photo_url,
                'id_role' => $user->id_role,
                'study_role' => $user->studyRole,
                'tokens' => $user->token_balance,
            ]
        ], 200);
    }

    // Logout
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Berhasil logout']);
    }

    // Ambil Data Profile User Aktif
    public function me(Request $request)
    {
        $user = $request->user();
        $user->load('studyRole');
        return response()->json($user);
    }
}