<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PartContent;
use App\Models\DocumentPart;

class PartContentController extends Controller
{
    public function index()
    {
        $contents = PartContent::with('part')->paginate(20);
        return view('admin.part_contents.index', compact('contents'));
    }

    public function create()
    {
        $parts = DocumentPart::pluck('title','id');
        return view('admin.part_contents.create', compact('parts'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'document_part_id' => 'required|exists:document_parts,id',
            'content' => 'required|string',
            'page_number' => 'nullable|integer'
        ]);

        PartContent::create($data);
        return redirect()->route('part-contents.index')->with('success','Content added');
    }

    public function edit(PartContent $partContent)
    {
        $parts = DocumentPart::pluck('title','id');
        return view('admin.part_contents.edit', ['content' => $partContent, 'parts' => $parts]);
    }

    public function update(Request $request, PartContent $partContent)
    {
        $data = $request->validate([
            'document_part_id' => 'required|exists:document_parts,id',
            'content' => 'required|string',
            'page_number' => 'nullable|integer'
        ]);

        $partContent->update($data);
        return redirect()->route('part-contents.index')->with('success','Content updated');
    }

    public function destroy(PartContent $partContent)
    {
        $partContent->delete();
        return back()->with('success','Content deleted');
    }
}
