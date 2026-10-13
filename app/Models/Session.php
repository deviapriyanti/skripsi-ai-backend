<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Session extends Model
{
    use HasFactory;

    protected $table = 'sessions';

    protected $primaryKey = 'id_session';

    protected $fillable = [
        'id_user',
        'id_role',
        'id_style',
        'thesis_title',
        'research_topic',
        'research_detail',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_user', 'id_user');
    }

    public function studyRole(): BelongsTo
    {
        return $this->belongsTo(StudyRole::class, 'id_role', 'id_role');
    }

    public function writingStyle(): BelongsTo
    {
        return $this->belongsTo(WritingStyle::class, 'id_style', 'id_style');
    }

    public function generations(): HasMany
    {
        return $this->hasMany(Generation::class, 'id_session', 'id_session');
    }
}
