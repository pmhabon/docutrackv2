@extends('layouts.app')

@section('title','Editor Monitor')
@section('page-title','Editor - Assigned Documents')

@section('content')
<div class="container-fluid">
    <div class="card-stats p-3 rounded">
        <h5>Documents Assigned To You</h5>
        <div class="table-responsive mt-3">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Uploaded by</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($documents as $doc)
                        <tr>
                            <td><strong>{{ $doc->title }}</strong></td>
                            <td><span class="badge bg-secondary">{{ $doc->type?->name ?? 'Untyped' }}</span></td>
                            <td>{{ $doc->user?->firstName }} {{ $doc->user?->lastName }}</td>
                            <td>
                                @php $s = $doc->status; @endphp
                                @if($s === 'no_reviewers_assigned')
                                    <span class="badge bg-info">No reviewers assigned</span>
                                @else
                                    <span class="badge bg-warning">{{ ucfirst(str_replace('_',' ',$s)) }}</span>
                                @endif
                            </td>
                            <td>{{ $doc->created_at->format('Y-m-d') }}</td>
                            <td>
                                <a href="{{ route('documents.show', $doc) }}" class="btn btn-sm btn-outline-primary">View</a>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="6" class="text-center text-muted py-3">No documents assigned to you</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <div class="mt-3">{{ $documents->links() }}</div>
    </div>
</div>
@endsection
