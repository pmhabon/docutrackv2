<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DocumentAuthor;

class DocumentAuthorController extends Controller
{
    public function index()
    {
        $authors = DocumentAuthor::paginate(20);
        return view('admin.document_authors.index', compact('authors'));
    }

    public function create()
    {
        return view('admin.document_authors.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'nullable|email',
            'affiliation' => 'nullable|string'
        ]);

        DocumentAuthor::create($data);
        return redirect()->route('document-authors.index')->with('success','Author added');
    }

    public function edit(DocumentAuthor $documentAuthor)
    {
        return view('admin.document_authors.edit', ['author' => $documentAuthor]);
    }

    public function update(Request $request, DocumentAuthor $documentAuthor)
    {
        $data = $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'nullable|email',
            'affiliation' => 'nullable|string'
        ]);

        $documentAuthor->update($data);
        return redirect()->route('document-authors.index')->with('success','Author updated');
    }

    public function destroy(DocumentAuthor $documentAuthor)
    {
        $documentAuthor->delete();
        return back()->with('success','Author deleted');
    }
}
