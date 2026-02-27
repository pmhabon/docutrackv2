@extends('layouts.app')

@section('title','Available Templates')
@section('page-title','Available Templates')

@section('content')
<div class="card">
    <div class="card-body">
        <h5 class="mb-3">Templates available to you</h5>

        @if($templates->count())
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
                        </td>
                    </tr>
                    @if(!empty($t->format_rules) && is_array($t->format_rules))
                        @php
                            $r = $t->format_rules;
                            $font = $r['normal']['font'] ?? $r['format_font'] ?? null;
                            $fontSize = isset($r['normal']['fontSize']) ? ($r['normal']['fontSize'] / 2) : null; // points
                            $heading1Size = isset($r['heading1']['fontSize']) ? ($r['heading1']['fontSize'] / 2) : null;
                            $line = $r['normal']['line'] ?? null; // 240,360,480
                            $lineLabel = $line === 240 ? 'single' : ($line === 360 ? '1.5' : ($line === 480 ? 'double' : null));
                            $margins = $r['margins'] ?? null; // twips
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
    </div>
</div>

@endsection
