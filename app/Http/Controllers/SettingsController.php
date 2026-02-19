<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SystemSettings;

class SettingsController extends Controller
{
    public function index()
    {
        $settings = SystemSettings::all();
        return view('settings.index', ['settings' => $settings]);
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'app_name' => 'nullable|string|max:255',
            'app_description' => 'nullable|string',
            'maintenance_mode' => 'nullable|boolean',
        ]);

        foreach ($data as $key => $value) {
            SystemSettings::set($key, $value);
        }

        return back()->with('success', 'Settings updated.');
    }
}
