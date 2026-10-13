<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class StudyRole extends Model
{
    use HasFactory;

    protected $table = 'study_roles';

    protected $primaryKey = 'id_role';

    protected $fillable = [
        'name_role',
        'description',
        'system_prompt',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
        ];
    }

    public function sessions(): HasMany
    {
        return $this->hasMany(Session::class, 'id_role', 'id_role');
    }
}
