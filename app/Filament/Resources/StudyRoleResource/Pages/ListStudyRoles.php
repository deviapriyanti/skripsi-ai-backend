<?php

namespace App\Filament\Resources\StudyRoleResource\Pages;

use App\Filament\Resources\StudyRoleResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListStudyRoles extends ListRecords
{
    protected static string $resource = StudyRoleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
