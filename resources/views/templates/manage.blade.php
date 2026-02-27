@extends('layouts.app')

@section('title','Research Template')
@section('page-title','Research Template Management')

@section('content')
<div class="card">
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if($errors->any())
            <div class="alert alert-danger">{{ $errors->first() }}</div>
        @endif

        <h5 class="mb-3">Available research templates</h5>
        @if(isset($templates) && $templates->count())
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Uploaded By</th>
                        <th>College</th>
                        <th>Program</th>
                        <th>Uploaded</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                @foreach($templates as $t)
                    <tr>
                        <td>{{ $t->title }}</td>
                        <td>{{ $t->user?->firstName }} {{ $t->user?->lastName }}</td>
                        <td>{{ $t->college }}</td>
                        <td>{{ $t->program }}</td>
                        <td>{{ $t->created_at->format('Y-m-d') }}</td>
                        <td class="text-end">
                            <a href="{{ route('templates.download', $t->id) }}" class="btn btn-sm btn-outline-primary">Download</a>
                            @php $me = auth()->user(); @endphp
                            @if($t->user_id === $me->id || $me->role === 'superadmin')
                                <form method="post" action="{{ route('templates.destroy', $t->id) }}" style="display:inline" onsubmit="return confirm('Delete this template?')">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-sm btn-danger">Delete</button>
                                </form>
                            @endif
                        </td>
                    </tr>
                    @if(!empty($t->format_rules) && is_array($t->format_rules))
                        @php
                            $r = $t->format_rules;
                            $font = $r['normal']['font'] ?? $r['format_font'] ?? null;
                            $fontSize = isset($r['normal']['fontSize']) ? ($r['normal']['fontSize'] / 2) : null;
                            $heading1Size = isset($r['heading1']['fontSize']) ? ($r['heading1']['fontSize'] / 2) : null;
                            $line = $r['normal']['line'] ?? null;
                            $lineLabel = $line === 240 ? 'single' : ($line === 360 ? '1.5' : ($line === 480 ? 'double' : null));
                            $margins = $r['margins'] ?? null;
                            $mTop = isset($margins['top']) ? number_format($margins['top'] / 1440, 2) . ' in' : null;
                            $mBottom = isset($margins['bottom']) ? number_format($margins['bottom'] / 1440, 2) . ' in' : null;
                            $mLeft = isset($margins['left']) ? number_format($margins['left'] / 1440, 2) . ' in' : null;
                            $mRight = isset($margins['right']) ? number_format($margins['right'] / 1440, 2) . ' in' : null;
                            $indent = isset($r['normal']['indent']) ? number_format($r['normal']['indent'] / 1440, 2) . ' in' : null;
                            $citation = $r['citation_style'] ?? null;
                        @endphp
                        <tr class="table-secondary">
                            <td colspan="6">
                                <div class="small text-muted"><strong>Format:</strong>
                                    @if($font) Font: <strong>{{ $font }}</strong>@endif
                                    @if($fontSize) &middot; Normal: <strong>{{ $fontSize }}pt</strong>@endif
                                    @if($heading1Size) &middot; Heading1: <strong>{{ $heading1Size }}pt</strong>@endif
                                    @if($lineLabel) &middot; Line: <strong>{{ $lineLabel }}</strong>@endif
                                    @if($indent) &middot; Indent: <strong>{{ $indent }}</strong>@endif
                                    @if($margins) &middot; Margins: <strong>{{ $mTop ?? '—' }}</strong> / <strong>{{ $mBottom ?? '—' }}</strong> (top/bottom), <strong>{{ $mLeft ?? '—' }}</strong> / <strong>{{ $mRight ?? '—' }}</strong> (left/right)@endif
                                    @if($citation) &middot; Citation: <strong>{{ strtoupper($citation) }}</strong>@endif
                                </div>
                            </td>
                        </tr>
                    @endif
                @endforeach
                </tbody>
            </table>
            {{ $templates->links() }}
        @else
            <p class="text-muted">No templates available.</p>
        @endif

        @php $role = auth()->user()->role ?? null; @endphp
        @if(in_array($role, ['program_head','dean','campus_director','superadmin']))
            <hr>
            <h5 class="mb-2">Upload / Replace Template</h5>
            <form method="post" action="{{ route('templates.store') }}" enctype="multipart/form-data">
                @csrf
                <div class="mb-2">
                    <input type="text" name="title" class="form-control" placeholder="Template title" required>
                </div>
                @php $me = auth()->user(); @endphp
                @if($me->role === 'superadmin')
                    <div class="row g-2 mb-2">
                        <div class="col-md-6">
                            <label class="form-label">College (optional)</label>
                            <select name="college" class="form-select">
                                <option value="">— Any —</option>
                                @foreach($colleges as $c)
                                    <option value="{{ $c->name }}">{{ $c->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Program (optional)</label>
                            <select name="program" class="form-select">
                                <option value="">— Any —</option>
                                @foreach($programs as $p)
                                    <option value="{{ $p->name }}">{{ $p->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                @endif
                <div class="mb-3">
                    <input type="file" name="file" accept=".docx" class="form-control" required>
                </div>
                    <div class="mb-3">
                        <label class="form-label">Formatting Metadata</label>
                        <div class="card p-3" style="background:#f8f9fa">
                            <div class="row g-2">
                                <div class="col-md-4">
                                    <label class="form-label">Normal font</label>
                                    <input type="text" name="format_font" class="form-control" placeholder="Times New Roman">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Normal font size (pt)</label>
                                    <input type="number" step="0.5" name="normal_font_size" class="form-control" placeholder="12">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Line spacing</label>
                                    <select name="line_spacing" class="form-select">
                                        <option value="">--</option>
                                        <option value="single">Single</option>
                                        <option value="1.5">1.5</option>
                                        <option value="double">Double</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row g-2 mt-2">
                                <div class="col-md-3">
                                    <label class="form-label">Margin top (inches)</label>
                                    <input type="number" step="0.01" name="margin_top" class="form-control" placeholder="1.00">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Margin bottom (inches)</label>
                                    <input type="number" step="0.01" name="margin_bottom" class="form-control" placeholder="1.00">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Margin left (inches)</label>
                                    <input type="number" step="0.01" name="margin_left" class="form-control" placeholder="1.00">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Margin right (inches)</label>
                                    <input type="number" step="0.01" name="margin_right" class="form-control" placeholder="1.00">
                                </div>
                            </div>
                            <div class="row g-2 mt-2">
                                <div class="col-md-4">
                                    <label class="form-label">Heading1 size (pt)</label>
                                    <input type="number" step="0.5" name="heading1_size" class="form-control" placeholder="14">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Paragraph indent (inches)</label>
                                    <input type="number" step="0.01" name="paragraph_indent" class="form-control" placeholder="0.50">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Citation style</label>
                                    <select name="citation_style" class="form-select">
                                        <option value="apa">APA</option>
                                        <option value="mla">MLA</option>
                                        <option value="chicago">Chicago</option>
                                        <option value="ieee">IEEE</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                <button class="btn btn-primary">Upload Template</button>
            </form>
            <p class="text-muted mt-2">Only Program Head, Dean, Campus Director, and Superadmin can upload templates.</p>
        @endif
    </div>
</div>

@endsection
