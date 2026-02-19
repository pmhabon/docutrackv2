<?php

namespace App\Http\Controllers;

use App\Models\College;
use App\Models\Campus;
use Illuminate\Http\Request;

class CollegeController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $campus_filter = $request->input('campus');
        
        $query = College::with('campus');

        if ($search) {
            $query->where('name', 'like', "%{$search}%")
                  ->orWhere('code', 'like', "%{$search}%");
        }

        if ($campus_filter) {
            $query->where('campus_id', $campus_filter);
        }

        $colleges = $query->withCount('programs')->paginate(15);
        $campuses = Campus::all();
        
        return view('admin.colleges.index', [
            'colleges' => $colleges,
            'campuses' => $campuses,
            'search' => $search,
            'campus_filter' => $campus_filter,
        ]);
    }

    public function create()
    {
        $campuses = Campus::all();
        return view('admin.colleges.create', ['campuses' => $campuses]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'code' => 'required|string|unique:colleges',
            'campus_id' => 'required|exists:campuses,id',
            'description' => 'nullable|string',
        ]);

        College::create($data);
        return redirect()->route('colleges.index')->with('success', 'College created.');
    }

    public function edit(College $college)
    {
        $campuses = Campus::all();
        return view('admin.colleges.edit', ['college' => $college, 'campuses' => $campuses]);
    }

    public function update(Request $request, College $college)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'code' => 'required|string|unique:colleges,code,' . $college->id,
            'campus_id' => 'required|exists:campuses,id',
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
