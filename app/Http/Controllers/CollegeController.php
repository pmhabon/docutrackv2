<?php

namespace App\Http\Controllers;

use App\Models\College;
use Illuminate\Http\Request;

class CollegeController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $campus_filter = null;
        $query = College::query();

        if ($search) {
            $query->where('name', 'like', "%{$search}%")
                  ->orWhere('code', 'like', "%{$search}%");
        }

        $colleges = $query->withCount('programs')->paginate(15);

        return view('admin.colleges.index', [
            'colleges' => $colleges,
            'search' => $search,
        ]);
    }

    public function create()
    {
        return view('admin.colleges.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'code' => 'required|string|unique:colleges',
            'description' => 'nullable|string',
        ]);

        College::create($data);
        return redirect()->route('colleges.index')->with('success', 'College created.');
    }

    public function edit(College $college)
    {
        return view('admin.colleges.edit', ['college' => $college]);
    }

    public function update(Request $request, College $college)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'code' => 'required|string|unique:colleges,code,' . $college->id,
            'description' => 'nullable|string',
        ]);

        $college->update($data);
        return redirect()->route('colleges.index')->with('success', 'College updated.');
    }

    public function destroy(College $college)
    {
        $college->delete();
        return back()->with('success', 'College deleted.');
    }
}
