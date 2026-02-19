<?php

namespace App\Http\Controllers;

use App\Models\Campus;
use Illuminate\Http\Request;

class CampusController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $query = Campus::query();

        if ($search) {
            $query->where('name', 'like', "%{$search}%")
                  ->orWhere('location', 'like', "%{$search}%");
        }

        $campuses = $query->withCount('colleges')->paginate(15);
        return view('admin.campuses.index', ['campuses' => $campuses, 'search' => $search]);
    }

    public function create()
    {
        return view('admin.campuses.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|unique:campuses',
            'location' => 'nullable|string',
            'description' => 'nullable|string',
        ]);

        Campus::create($data);
        return redirect()->route('campuses.index')->with('success', 'Campus created.');
    }

    public function edit(Campus $campus)
    {
        return view('admin.campuses.edit', ['campus' => $campus]);
    }

    public function update(Request $request, Campus $campus)
    {
        $data = $request->validate([
            'name' => 'required|string|unique:campuses,name,' . $campus->id,
            'location' => 'nullable|string',
            'description' => 'nullable|string',
        ]);

        $campus->update($data);
        return redirect()->route('campuses.index')->with('success', 'Campus updated.');
    }

    public function destroy(Campus $campus)
    {
        $campus->delete();
        return back()->with('success', 'Campus deleted.');
    }
}
