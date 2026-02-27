<?php

namespace App\Http\Controllers;

use App\Models\Program;
use App\Models\College;
use Illuminate\Http\Request;

class ProgramController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $college_filter = $request->input('college');
        
        $query = Program::with('college');

        if ($search) {
            $query->where('name', 'like', "%{$search}%")
                  ->orWhere('code', 'like', "%{$search}%");
        }

        if ($college_filter) {
            $query->where('college_id', $college_filter);
        }

        $programs = $query->paginate(15);
        $colleges = College::all();
        
        return view('admin.programs.index', [
            'programs' => $programs,
            'colleges' => $colleges,
            'search' => $search,
            'college_filter' => $college_filter,
        ]);
    }

    public function create()
    {
        $colleges = College::all();
        return view('admin.programs.create', ['colleges' => $colleges]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'code' => 'required|string|unique:programs',
            'college_id' => 'required|exists:colleges,id',
            'description' => 'nullable|string',
        ]);

        Program::create($data);
        return redirect()->route('programs.index')->with('success', 'Program created.');
    }

    public function edit(Program $program)
    {
        $colleges = College::all();
        return view('admin.programs.edit', ['program' => $program, 'colleges' => $colleges]);
    }

    public function update(Request $request, Program $program)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'code' => 'required|string|unique:programs,code,' . $program->id,
            'college_id' => 'required|exists:colleges,id',
            'description' => 'nullable|string',
        ]);

        $program->update($data);
        return redirect()->route('programs.index')->with('success', 'Program updated.');
    }

    public function destroy(Program $program)
    {
        $program->delete();
        return back()->with('success', 'Program deleted.');
    }
}
