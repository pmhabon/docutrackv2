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
        if ($user->role === 'campus_director') {
            $query->where('campus', $user->campus);
        } elseif ($user->role === 'dean') {
            $query->where('campus', $user->campus)->where('college', $user->college);
        } elseif ($user->role === 'program_head') {
            $query->where('campus', $user->campus)->where('college', $user->college)->where('program', $user->program);
        }

        $logs = $query->paginate(25);

        return view('activity.index', ['logs' => $logs]);
    }
}
