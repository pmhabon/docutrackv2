<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DocumentPart;
use App\Models\Document;

class DocumentPartController extends Controller
{
    public function index()
    {
        $parts = DocumentPart::with('document')->paginate(20);
        return view('admin.document_parts.index', compact('parts'));
    }

    public function create()
    {
        $documents = Document::pluck('title','id');
        return view('admin.document_parts.create', compact('documents'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'document_id' => 'required|exists:documents,id',
            'title' => 'required|string',
            'description' => 'nullable|string',
            'order' => 'nullable|integer'
        ]);

        DocumentPart::create($data);
        return redirect()->route('document-parts.index')->with('success','Part created');
    }

    public function edit(DocumentPart $documentPart)
    {
        $documents = Document::pluck('title','id');
        return view('admin.document_parts.edit', ['part' => $documentPart, 'documents' => $documents]);
    }

    public function update(Request $request, DocumentPart $documentPart)
    {
        $data = $request->validate([
            'document_id' => 'required|exists:documents,id',
            'title' => 'required|string',
            'description' => 'nullable|string',
            'order' => 'nullable|integer'
        ]);

        $documentPart->update($data);
        return redirect()->route('document-parts.index')->with('success','Part updated');
    }

    public function destroy(DocumentPart $documentPart)
    {
        $documentPart->delete();
        return back()->with('success','Part deleted');
    }
}
