<?php

namespace App\Models;

use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements FilamentUser
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $primaryKey = 'id_user';

    protected $fillable = [
        'name',
        'email',
        'password',
        'id_role',
        'role',
        'login_provider',
        'token_balance',
        'profile_photo_path',
        'university',
    ];

    protected $hidden = [
        'password',
        'remember_token',
        'tokens',
    ];

    // TAMBAHKAN INI: Otomatis menyertakan profile_photo_url ke JSON response
    protected $appends = [
        'profile_photo_url',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'token_balance' => 'integer',
        ];
    }

    /**
     * Accessor untuk mendapatkan Full URL Foto Profil
     */
    public function getProfilePhotoUrlAttribute(): ?string
    {
        return $this->profile_photo_path 
            ? asset('storage/' . $this->profile_photo_path) 
            : null;
    }

    public function getBalanceTokensAttribute(): int
    {
        return (int) ($this->attributes['token_balance'] ?? 0);
    }

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->role === 'admin';
    }

    public function studyRole()
    {
        return $this->belongsTo(StudyRole::class, 'id_role', 'id_role');
    }
}