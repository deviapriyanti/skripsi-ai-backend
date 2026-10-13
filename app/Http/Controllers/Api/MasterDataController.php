<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\StudyRole;

class MasterDataController extends Controller
{
    public function getStudyRoles()
    {
        $roles = StudyRole::all();

        return response()->json([
            'status' => 'success',
            'data' => $roles
        ], 200);
    }
}