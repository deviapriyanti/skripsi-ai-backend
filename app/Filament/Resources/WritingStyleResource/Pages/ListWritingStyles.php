<?php

namespace App\Filament\Resources\WritingStyleResource\Pages;

use App\Filament\Resources\WritingStyleResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListWritingStyles extends ListRecords
{
    protected static string $resource = WritingStyleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
