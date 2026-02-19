<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function edit()
    {
        $user = Auth::user();
        return view('profile.edit', ['user' => $user]);
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        $data = $request->validate([
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'contactNumber' => 'nullable|string|max:20',
            'address' => 'nullable|string',
            'password' => 'nullable|min:8|confirmed',
        ]);

        $user->firstName = $data['firstName'];
        $user->lastName = $data['lastName'];
        $user->contactNumber = $data['contactNumber'] ?? $user->contactNumber;
        $user->address = $data['address'] ?? $user->address;

        if (!empty($data['password'])) {
            $user->password = Hash::make($data['password']);
        }

        $user->save();

        return redirect()->route('profile.edit')->with('success', 'Profile updated.');
    }
}
