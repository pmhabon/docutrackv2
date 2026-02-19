<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DocumentType;

class DocumentTypeController extends Controller
{
    public function index()
    {
        $types = DocumentType::paginate(20);
        return view('admin.document_types.index', compact('types'));
    }

    public function create()
    {
        return view('admin.document_types.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([ 'name' => 'required|string|unique:document_types,name', 'code' => 'nullable|string|unique:document_types,code' ]);
        DocumentType::create($data);
        return redirect()->route('document-types.index')->with('success','Document type created');
    }

    public function edit(DocumentType $documentType)
    {
        return view('admin.document_types.edit', ['type' => $documentType]);
    }

    public function update(Request $request, DocumentType $documentType)
    {
        $data = $request->validate([ 'name' => 'required|string|unique:document_types,name,'.$documentType->id, 'code' => 'nullable|string|unique:document_types,code,'.$documentType->id ]);
        $documentType->update($data);
        return redirect()->route('document-types.index')->with('success','Document type updated');
    }

    public function destroy(DocumentType $documentType)
    {
        $documentType->delete();
        return back()->with('success','Document type deleted');
    }
}
