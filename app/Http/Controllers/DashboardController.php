<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\ActivityLog;
use App\Models\Document;
use App\Models\Comment;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        // Get stats
        $totalLogs = ActivityLog::query();
        $recentLogs = ActivityLog::query()->latest();

        // scope by role where possible — only apply filters if the user has the fields
        if ($user->role === 'campus_director' && isset($user->campus) && $user->campus) {
            $totalLogs->where('campus', $user->campus);
            $recentLogs->where('campus', $user->campus);
        } elseif ($user->role === 'dean' && isset($user->campus) && isset($user->college) && $user->campus && $user->college) {
            $totalLogs->where('campus', $user->campus)->where('college', $user->college);
            $recentLogs->where('campus', $user->campus)->where('college', $user->college);
        } elseif (($user->role === 'program_head' || $user->role === 'faculty') && isset($user->campus) && isset($user->college) && isset($user->program) && $user->campus && $user->college && $user->program) {
            $totalLogs->where('campus', $user->campus)->where('college', $user->college)->where('program', $user->program);
            $recentLogs->where('campus', $user->campus)->where('college', $user->college)->where('program', $user->program);
        }

        // document stats scoped by role
        $documentsQuery = Document::query();
        if ($user->role === 'campus_director' && isset($user->campus) && $user->campus) {
            $documentsQuery->where('campus', $user->campus);
        } elseif ($user->role === 'dean' && isset($user->campus) && isset($user->college) && $user->campus && $user->college) {
            $documentsQuery->where('campus', $user->campus)->where('college', $user->college);
        } elseif (($user->role === 'program_head' || $user->role === 'faculty') && isset($user->campus) && isset($user->college) && isset($user->program) && $user->campus && $user->college && $user->program) {
            $documentsQuery->where('campus', $user->campus)->where('college', $user->college)->where('program', $user->program);
        }

        $stats = [
            'totalLogs' => $totalLogs->count(),
            'recentLogs' => $recentLogs->take(10)->get(),
            'documents' => [
                'total' => $documentsQuery->count(),
                'pending' => (clone $documentsQuery)->where('status', 'pending')->count(),
                'approved' => (clone $documentsQuery)->where('status', 'approved')->count(),
                'rejected' => (clone $documentsQuery)->where('status', 'rejected')->count(),
                'reviews_done' => (clone $documentsQuery)->where('status', 'reviews_done')->count(),
            ],
            'comments' => [
                'total' => Comment::count(),
                'approve' => Comment::where('action','approve')->count(),
                'reject' => Comment::where('action','reject')->count(),
                'revise' => Comment::where('action','revise')->count(),
            ]
        ];

        // role-based landing pages with layout
        switch ($user->role) {
            case 'superadmin':
                return view('dashboard.superadmin', ['user' => $user, 'stats' => $stats]);

            case 'campus_director':
                return view('dashboard.campus_director', ['user' => $user, 'stats' => $stats]);

            case 'dean':
                return view('dashboard.dean', ['user' => $user, 'stats' => $stats]);

            case 'program_head':
                return view('dashboard.program_head', ['user' => $user, 'stats' => $stats]);

            case 'faculty':
                return view('dashboard.faculty', ['user' => $user, 'stats' => $stats]);
        }

        abort(403, 'Unauthorized role');
    }
}

