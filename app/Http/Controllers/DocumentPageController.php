<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DocumentPage;
use App\Models\Document;

class DocumentPageController extends Controller
{
    public function index()
    {
        $pages = DocumentPage::with('document')->paginate(30);
        return view('admin.document_pages.index', compact('pages'));
    }

    public function create()
    {
        $documents = Document::pluck('title','id');
        return view('admin.document_pages.create', compact('documents'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'document_id' => 'required|exists:documents,id',
            'page_number' => 'required|integer',
            'file_path' => 'nullable|string',
            'width' => 'nullable|integer',
            'height' => 'nullable|integer'
        ]);

        DocumentPage::create($data);
        return redirect()->route('document-pages.index')->with('success','Page added');
    }

    public function edit(DocumentPage $documentPage)
    {
        $documents = Document::pluck('title','id');
        return view('admin.document_pages.edit', ['page' => $documentPage, 'documents' => $documents]);
    }

    public function update(Request $request, DocumentPage $documentPage)
    {
        $data = $request->validate([
            'document_id' => 'required|exists:documents,id',
            'page_number' => 'required|integer',
            'file_path' => 'nullable|string',
            'width' => 'nullable|integer',
            'height' => 'nullable|integer'
        ]);

        $documentPage->update($data);
        return redirect()->route('document-pages.index')->with('success','Page updated');
    }

    public function destroy(DocumentPage $documentPage)
    {
        $documentPage->delete();
        return back()->with('success','Page deleted');
    }
}
