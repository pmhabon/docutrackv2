<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\College;
use App\Models\Program;
use Illuminate\Support\Str;
use App\Services\ActivityTracker;
use Illuminate\Support\Facades\Hash;

class UserManagementController extends Controller
{
    public function index(Request $request)
    {
        $user = auth()->user();

        $query = User::query();

        // Apply role-based visibility: simplify for single-campus deployment
        if ($user->role === 'superadmin') {
            // superadmin sees all users
        } elseif ($user->role === 'dean') {
            $query->where('college', $user->college);
        } elseif ($user->role === 'program_head') {
            $query->where(function($q) use ($user) {
                $q->where('role', 'dean')->where('college', $user->college)
                  ->orWhere(function($q2) use ($user) {
                      $q2->where('role', 'faculty')->where('program', $user->program)->where('college', $user->college);
                  })
                  ->orWhere(function($q2) use ($user) {
                      $q2->where('role', 'program_head')->where('college', $user->college);
                  });
            });
        } elseif ($user->role === 'faculty') {
            $query->where(function($q) use ($user) {
                $q->where('role', 'dean')->where('college', $user->college)
                  ->orWhere(function($q2) use ($user) {
                      $q2->where('role', 'program_head')->where('program', $user->program)->where('college', $user->college);
                  })
                  ->orWhere('id', $user->id);
            });
        }

        // Optional request filters (further narrow the visibility)
        if ($request->filled('college')) {
            $query->where('college', $request->college);
        }
        if ($request->filled('program')) {
            $query->where('program', $request->program);
        }

        if ($request->filled('q')) {
            $q = $request->q;
            $query->where(function($qry) use ($q) {
                $qry->where('firstName', 'like', "%$q%")
                    ->orWhere('lastName', 'like', "%$q%")
                    ->orWhere('email', 'like', "%$q%");
            });
        }

        $users = $query->paginate(20)->withQueryString();

        $colleges = College::orderBy('name')->get();
        $programs = Program::orderBy('name')->get();

        return view('users.index', compact('users','colleges','programs'));
    }

    public function show(User $user)
    {
        $user->load('comments.document');
        return view('users.show', ['user' => $user]);
    }

    public function edit(User $user)
    {
        $colleges = College::orderBy('name')->get();
        $programs = Program::orderBy('name')->get();

        $ranks = \App\Models\Rank::orderBy('name')->get();
        return view('users.edit', compact('user','colleges','programs','ranks'));
    }

    public function create()
    {
        $colleges = College::orderBy('name')->get();
        $programs = Program::orderBy('name')->get();

        $ranks = \App\Models\Rank::orderBy('name')->get();
        return view('users.create', compact('colleges', 'programs', 'ranks'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'middleName' => 'nullable|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:8|confirmed',
            'role' => 'required|in:campus_director,dean,program_head,faculty,student,superadmin',
            'rank' => 'nullable|exists:ranks,name',
            'contactNumber' => 'nullable|string|max:50',
            'address' => 'nullable|string|max:500',
            'college' => 'nullable|string|max:255',
            'program' => 'nullable|string|max:255',
            'status' => 'nullable|in:active,inactive',
        ]);

        $user = User::create([
            'firstName' => $data['firstName'],
            'lastName' => $data['lastName'],
            'middleName' => $data['middleName'] ?? null,
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'role' => $data['role'],
            'rank' => $data['rank'] ?? null,
            'contactNumber' => $data['contactNumber'] ?? null,
            'address' => $data['address'] ?? null,
            'college' => $data['college'] ?? null,
            'program' => $data['program'] ?? null,
            'status' => $data['status'] ?? 'active',
        ]);


        ActivityTracker::log('user_created', "User {$user->firstName} {$user->lastName} created by admin");

        return redirect()->route('users.index')->with('success', 'User created.');
    }

    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'role' => 'required|in:campus_director,dean,program_head,faculty,student,superadmin',
            'middleName' => 'nullable|string|max:255',
            'rank' => 'nullable|exists:ranks,name',
            'contactNumber' => 'nullable|string|max:50',
            'address' => 'nullable|string|max:500',
            'college' => 'nullable|string',
            'program' => 'nullable|string',
            'status' => 'nullable|in:active,inactive',
        ]);

        $oldRole = $user->role;
        $oldStatus = $user->status;

        // Ensure campus default exists when updating
        $data['campus'] = $data['campus'] ?? 'ISPSC Tagudin';
        $user->update($data);

        // Log role change
        if ($oldRole !== $data['role']) {
            ActivityTracker::logRoleChange($user->id, $oldRole, $data['role']);
        }

        // Log status change
        if ($oldStatus !== ($data['status'] ?? $oldStatus)) {
            ActivityTracker::logStatusChange($user->id, $oldStatus, $data['status'] ?? $oldStatus);
        }

        // Log general user update
        ActivityTracker::log(
            'user_updated',
            "User {$user->firstName} {$user->lastName} was updated"
        );

        return redirect()->route('users.index')->with('success', 'User updated.');
    }

    public function deactivate(User $user)
    {
        $oldStatus = $user->status;
        $user->update(['status' => 'active']);

        ActivityTracker::logStatusChange($user->id, $oldStatus, 'active');

        return back()->with('success', 'User activated.');
    }


    // Dashboard-facing visibility page for all authenticated users
    public function visibility(Request $request)
    {
        $user = auth()->user();
        // For the dashboard visibility page, show all non-student users to every authenticated user
        $query = User::where('role', '!=', 'student');
        if ($request->filled('q')) {
            $q = $request->q;
            $query->where(function($qry) use ($q) {
                $qry->where('firstName', 'like', "%$q%")
                    ->orWhere('lastName', 'like', "%$q%")
                    ->orWhere('email', 'like', "%$q%");
            });
        }

        $users = $query->orderBy('college')->orderBy('program')->get();

        return view('dashboard.users_visibility', compact('users'));
    }
}
