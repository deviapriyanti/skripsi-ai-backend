<?php

namespace App\Filament\Resources\StudyRoleResource\Pages;

use App\Filament\Resources\StudyRoleResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditStudyRole extends EditRecord
{
    protected static string $resource = StudyRoleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
