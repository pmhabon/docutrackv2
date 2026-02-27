<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ActivityLog;
use Illuminate\Support\Facades\Auth;

class ActivityLogController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();

        $query = ActivityLog::query()->latest();

        // scope logs by role
            // Role-based scoping for single-campus deployment: scope by college/program only
            if ($user->role === 'dean') {
                $query->where('college', $user->college);
            } elseif ($user->role === 'program_head' || $user->role === 'faculty') {
                $query->where('college', $user->college)->where('program', $user->program);
        }

        $logs = $query->paginate(25);

        return view('activity.index', ['logs' => $logs]);
    }
}
