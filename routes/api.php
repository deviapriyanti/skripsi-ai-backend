<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MasterDataController;
use App\Http\Controllers\Api\SessionController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\ParaphraseController;
use App\Http\Controllers\SubscriptionController;
use App\Http\Controllers\HistoryController;
use Illuminate\Support\Facades\Route;

// Public Routes (Bisa diakses tanpa login)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/writing-styles', [MasterDataController::class, 'getWritingStyles']);
Route::get('/plans', [MasterDataController::class, 'getPlans']);

// Protected Routes (Wajib Bawa Bearer Token Sanctum)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me', [AuthController::class, 'me']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/study-roles', [MasterDataController::class, 'getStudyRoles']);
    Route::post('/user/study-role', [UserController::class, 'updateStudyRole']);
    Route::post('/user/profile', [UserController::class, 'updateProfile']);
    Route::post('/paraphrase', [ParaphraseController::class, 'process']);
    Route::get('/subscription/status', [SubscriptionController::class, 'getStatus']);
    Route::post('/subscription/plan', [SubscriptionController::class, 'choosePlan']);
    Route::post('/subscription/topup', [SubscriptionController::class, 'topup']);
    Route::get('/histories', [HistoryController::class, 'index']); 

    // CRUD Sesi Skripsi
    Route::get('/sessions', [SessionController::class, 'index']);
    Route::post('/sessions', [SessionController::class, 'store']);
    Route::delete('/sessions/{id}', [SessionController::class, 'destroy']);
});