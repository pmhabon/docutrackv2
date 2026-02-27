@extends('layouts.app')

@section('title','Documents')
@section('page-title','Documents')

@section('content')
<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h5>Document Library</h5>
        <a href="{{ route('documents.create') }}" class="btn btn-primary btn-sm">+ Upload Document</a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card-stats p-3 rounded">
        <form method="GET" class="mb-3">
            <div class="row g-2 mb-2">
                <div class="col-md-8">
                    <input type="text" name="search" value="{{ request('search') }}" class="form-control" placeholder="Search title or description...">
                </div>
                <div class="col-md-4 d-grid">
                    <button class="btn btn-secondary">Filter</button>
                </div>
            </div>

            <div class="row g-2">
                <div class="col-md-2">
                    <select name="status" class="form-select">
                        <option value="">All Statuses</option>
                        <option value="pending" {{ request('status')=='pending' ? 'selected' : '' }}>Pending</option>
                        <option value="approved" {{ request('status')=='approved' ? 'selected' : '' }}>Approved</option>
                        <option value="rejected" {{ request('status')=='rejected' ? 'selected' : '' }}>Rejected</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="type" class="form-select">
                        <option value="">All Types</option>
                        @foreach($types as $t)
                            <option value="{{ $t->id }}" {{ request('type') == $t->id ? 'selected' : '' }}>{{ $t->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="author" class="form-select">
                        <option value="">All Authors</option>
                        @foreach($authors as $a)
                            <option value="{{ $a->id }}" {{ request('author') == $a->id ? 'selected' : '' }}>{{ $a->first_name }} {{ $a->last_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="college" class="form-select">
                        <option value="">All Colleges</option>
                        @foreach($colleges as $c)
                            <option value="{{ $c }}" {{ request('college') == $c ? 'selected' : '' }}>{{ $c }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="program" class="form-select">
                        <option value="">All Programs</option>
                        @foreach($programs as $p)
                            <option value="{{ $p }}" {{ request('program') == $p ? 'selected' : '' }}>{{ $p }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </form>

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Authors</th>
                        <th>Status</th>
                        <th>Uploaded by</th>
                        <th>College / Role</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($documents as $doc)
                        <tr>
                            <td><strong>{{ $doc->title }}</strong></td>
                            <td><span class="badge bg-secondary">{{ $doc->type?->name ?? 'Untyped' }}</span></td>
                            <td>
                                @if($doc->authors->count() > 0)
                                    @foreach($doc->authors as $author)
                                        <div style="font-size:12px;margin-bottom:4px">
                                            <small class="badge bg-light text-dark">{{ $author->first_name }} {{ $author->last_name }}</small>
                                            @if($author->pivot->role)
                                                <small class="badge bg-info">{{ $author->pivot->role }}</small>
                                            @endif
                                        </div>
                                    @endforeach
                                @else
                                    <small class="text-muted">—</small>
                                @endif
                            </td>
                            <td>
                                @php
                                    $commenters = $doc->commenters;
                                    $actions = ['approve' => 0, 'reject' => 0, 'revise' => 0, 'pending' => 0];
                                    foreach($commenters as $c) {
                                        $last = $doc->comments->where('user_id', $c->id)->sortBy('created_at')->last();
                                        if($last) {
                                            if($last->action === 'approve') $actions['approve']++;
                                            elseif($last->action === 'reject') $actions['reject']++;
                                            elseif($last->action === 'revise') $actions['revise']++;
                                            else $actions['pending']++;
                                        } else {
                                            $actions['pending']++;
                                        }
                                    }
                                @endphp

                                @if($doc->commenters->count() > 0)
                                    @if($actions['pending'] > 0)
                                        <span class="badge bg-warning">Pending</span>
                                    @else
                                        <span class="badge bg-success">Reviews Done</span>
                                    @endif
                                    <div style="font-size:12px;margin-top:4px">
                                        <small class="text-muted">{{ $actions['approve'] }} approves · {{ $actions['reject'] }} rejects · {{ $actions['revise'] }} revise</small>
                                    </div>
                                @else
                                    <span class="badge bg-info">No reviewers assigned</span>
                                @endif
                            </td>
                            <td>{{ $doc->user?->firstName }} {{ $doc->user?->lastName }}</td>
                            <td style="font-size:12px">
                                <div>ISPSC Tagudin</div>
                                <div>{{ $doc->user?->college ?? '—' }}</div>
                                <div><span class="badge bg-info" style="font-size:10px">{{ ucfirst(str_replace('_', ' ', $doc->user?->role ?? '')) }}</span></div>
                            </td>
                            <td>{{ $doc->created_at->format('Y-m-d') }}</td>
                            <td>
                                <a href="{{ route('documents.show', $doc) }}" class="btn btn-sm btn-outline-primary">View</a>
                                <a href="{{ route('documents.download', $doc) }}" class="btn btn-sm btn-outline-secondary ms-1">Download</a>
                                @if(Auth::id() === $doc->user_id)
                                    <form action="{{ route('documents.destroy', $doc) }}" method="POST" class="d-inline ms-1" onsubmit="return confirm('Are you sure you want to delete this document?');">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-sm btn-outline-danger">Delete</button>
                                    </form>
                                @endif
                                @if(Auth::id() === $doc->user_id || Auth::user()?->role === 'superadmin')
                                    {{-- <a href="{{ route('documents.commenters', $doc->id) }}" class="btn btn-sm btn-secondary ms-1">Assign</a> --}}
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="8" class="text-center text-muted py-3">No documents found</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <div class="mt-3">{{ $documents->links() }}</div>
                </div>
                <div class="mt-3">{{ $documents->links() }}</div>
        </div>

    </div>

    @endsection
