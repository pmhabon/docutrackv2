<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Campus;
use App\Models\College;
use App\Models\Program;
use App\Services\ActivityTracker;
use Laravel\Socialite\Facades\Socialite;

class AuthController extends Controller
{
    public function showLogin()
    {
        return view('auth.login');
    }

    public function showRegister()
    {
        $ranks = \App\Models\Rank::orderBy('name')->get();
        $campuses = Campus::orderBy('name')->get();
        $colleges = College::orderBy('name')->get();
        $programs = Program::orderBy('name')->get();

        return view('auth.register', compact('ranks','campuses','colleges','programs'));
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (Auth::attempt($credentials, $request->remember)) {
            $request->session()->regenerate();
            return redirect()->route('dashboard');
        }

        return back()->withErrors([
            'email' => 'Invalid email or password.',
        ])->onlyInput('email');
    }

    public function register(Request $request)
    {
        $rules = [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'middleName' => 'nullable|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|regex:/[A-Z]/|regex:/[a-z]/|regex:/[0-9]/|regex:/[!@#$%^&*]/|confirmed',
            'role' => 'required|in:campus_director,dean,program_head,faculty',
            'contactNumber' => 'nullable|string|max:20',
            'address' => 'nullable|string',
            'rank' => 'nullable|exists:ranks,name',
        ];

        $request->validate($rules);

        $user = User::create([
            'firstName' => $request->firstName,
            'lastName' => $request->lastName,
            'middleName' => $request->middleName,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'contactNumber' => $request->contactNumber,
            'address' => $request->address,
            'rank' => $request->rank,
        ]);

        Auth::login($user);

        // Log registration
        ActivityTracker::logRegistration([
            'email' => $request->email,
            'name' => $request->firstName . ' ' . $request->lastName,
            'role' => $request->role,
        ]);

        return redirect()->route('dashboard');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }

    // Google OAuth Methods
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')->user();

            // Check if user exists
            $existingUser = User::where('email', $user->getEmail())->first();

            if ($existingUser) {
                Auth::login($existingUser);
                return redirect()->route('dashboard');
            }

            // Create new user
            $newUser = User::create([
                'firstName' => explode(' ', $user->getName())[0] ?? $user->getName(),
                'lastName' => explode(' ', $user->getName())[1] ?? '',
                'email' => $user->getEmail(),
                'password' => Hash::make(uniqid()),
            ]);

            Auth::login($newUser);

            return redirect()->route('dashboard');
        } catch (\Exception $e) {
            return redirect('/login')->with('error', 'Authentication failed.');
        }
    }
}

