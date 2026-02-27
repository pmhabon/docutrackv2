@extends('layouts.app')

@section('content')
<div class="container">
    <h3>Backups for: {{ $document->title }}</h3>

    @if(empty($backups))
        <div class="alert alert-info">No backups found for this document.</div>
    @else
        <table class="table">
            <thead>
                <tr><th>Backup File</th><th>Modified</th><th>Action</th></tr>
            </thead>
            <tbody>
                @foreach($backups as $b)
                    <tr>
                        <td>{{ $b }}</td>
                        <td>{{ \Carbon\Carbon::createFromTimestamp(Storage::disk('local')->lastModified($b))->toDayDateTimeString() }}</td>
                        <td>
                            <form method="post" action="{{ route('documents.backups.restore', $document->id) }}" onsubmit="return confirm('Restore this backup? This will overwrite the current document file.');">
                                @csrf
                                <input type="hidden" name="backup" value="{{ $b }}" />
                                <button class="btn btn-sm btn-primary">Restore</button>
                            </form>
                            <a class="btn btn-sm btn-secondary" href="{{ route('documents.download', $document->id) }}?backup={{ urlencode($b) }}">Download</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif

    <a href="{{ route('documents.show', $document->id) }}" class="btn btn-link">Back to document</a>
</div>
@endsection
