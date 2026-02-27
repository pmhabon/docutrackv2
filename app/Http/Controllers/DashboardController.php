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
        if ($user->role === 'dean' && isset($user->college) && $user->college) {
            $totalLogs->where('college', $user->college);
            $recentLogs->where('college', $user->college);
        } elseif (($user->role === 'program_head' || $user->role === 'faculty') && isset($user->college) && isset($user->program) && $user->college && $user->program) {
            $totalLogs->where('college', $user->college)->where('program', $user->program);
            $recentLogs->where('college', $user->college)->where('program', $user->program);
        }

        // document stats scoped by role
        $documentsQuery = Document::query();
        if ($user->role === 'dean' && isset($user->college) && $user->college) {
            $documentsQuery->where('college', $user->college);
        } elseif (($user->role === 'program_head' || $user->role === 'faculty') && isset($user->college) && isset($user->program) && $user->college && $user->program) {
            $documentsQuery->where('college', $user->college)->where('program', $user->program);
        }

        $stats = [
            'totalLogs' => $totalLogs->count(),
            'recentLogs' => $recentLogs->take(10)->get(),
            'documents' => [
                'total' => $documentsQuery->count(),
                'pending' => (clone $documentsQuery)->where('status', 'pending')->count(),
                'approved' => (clone $documentsQuery)->where('status', 'approved')->count(),
                'no_reviewers_assigned' => (clone $documentsQuery)->where('status', 'no_reviewers_assigned')->count(),
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

        // Formatting job counts and recent items (queued/processing/failed)
        $formattingStatuses = ['formatting_queued','formatting_processing','formatting_failed'];
        $formattingCounts = [
            'queued' => (clone $documentsQuery)->where('status', 'formatting_queued')->count(),
            'processing' => (clone $documentsQuery)->where('status', 'formatting_processing')->count(),
            'failed' => (clone $documentsQuery)->where('status', 'formatting_failed')->count(),
        ];
        $formattingRecent = (clone $documentsQuery)->whereIn('status', $formattingStatuses)->with('user')->latest()->take(8)->get();

        // role-based landing pages with layout
        switch ($user->role) {
            case 'superadmin':
                return view('dashboard.superadmin', ['user' => $user, 'stats' => $stats, 'formattingJobs' => $formattingRecent, 'formattingCounts' => $formattingCounts]);

            case 'campus_director':
                return view('dashboard.campus_director', ['user' => $user, 'stats' => $stats, 'formattingJobs' => $formattingRecent, 'formattingCounts' => $formattingCounts]);

            case 'dean':
                return view('dashboard.dean', ['user' => $user, 'stats' => $stats, 'formattingJobs' => $formattingRecent, 'formattingCounts' => $formattingCounts]);

            case 'program_head':
                return view('dashboard.program_head', ['user' => $user, 'stats' => $stats, 'formattingJobs' => $formattingRecent, 'formattingCounts' => $formattingCounts]);

            case 'faculty':
                return view('dashboard.faculty', ['user' => $user, 'stats' => $stats, 'formattingJobs' => $formattingRecent, 'formattingCounts' => $formattingCounts]);

            case 'student':
                return view('dashboard.student', ['user' => $user, 'stats' => $stats, 'formattingJobs' => $formattingRecent, 'formattingCounts' => $formattingCounts]);
        }

        abort(403, 'Unauthorized role');
    }

    // Superadmin view: full formatting job history
    public function formattingHistory(Request $request)
    {
        $user = Auth::user();
        if ($user->role !== 'superadmin') abort(403);

        $statuses = ['formatting_queued','formatting_processing','formatting_failed'];
        $query = Document::whereIn('status', $statuses)->with(['user','template']);

        if ($request->filled('status')) {
            $query->where('status', $request->query('status'));
        }

        $docs = $query->latest()->paginate(25)->withQueryString();

        return view('dashboard.formatting_history', ['documents' => $docs]);
    }
}

