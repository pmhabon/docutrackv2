@extends('layouts.app')

@section('title','Assigned To Me')
@section('page-title','Assigned To Me')

@section('content')
<div class="container-fluid">
    <div class="card-stats p-3 rounded">
        <h5>Documents Assigned To You</h5>
        <form method="get" class="row g-2 align-items-end mt-2">
            <div class="col-auto">
                <label class="form-label small text-muted">Search</label>
                <input type="search" name="search" value="{{ request('search') }}" class="form-control form-control-sm" placeholder="Title or description">
            </div>
            <div class="col-auto">
                <label class="form-label small text-muted">College</label>
                <select name="college" class="form-select form-select-sm">
                    <option value="">All</option>
                    @foreach($colleges as $c)
                        <option value="{{ $c }}" @if(request('college')==$c) selected @endif>{{ $c }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-auto">
                <label class="form-label small text-muted">Program</label>
                <select name="program" class="form-select form-select-sm">
                    <option value="">All</option>
                    @foreach($programs as $p)
                        <option value="{{ $p }}" @if(request('program')==$p) selected @endif>{{ $p }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                <a href="{{ route('documents.assigned') }}" class="btn btn-sm btn-outline-secondary ms-1">Reset</a>
            </div>
        </form>
        <div class="table-responsive mt-3">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Uploaded by</th>
                        <th>Assigned As</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($documents as $doc)
                        @php
                            $assignedAs = [];
                            if($doc->editors->contains(function($u){ return $u->id === auth()->id(); })) $assignedAs[] = 'Editor';
                            if($doc->commenters->contains(function($u){ return $u->id === auth()->id(); })) $assignedAs[] = 'Reviewer';

                            // determine review status: if commenters assigned, check latest action per commenter
                            $isReviewsDone = false;
                            if ($doc->commenters->count() > 0) {
                                $actions = ['approve' => 0, 'reject' => 0, 'revise' => 0, 'pending' => 0];
                                foreach ($doc->commenters as $c) {
                                    $last = $doc->comments->where('user_id', $c->id)->sortBy('created_at')->last();
                                    if ($last) {
                                        if ($last->action === 'approve') $actions['approve']++;
                                        elseif ($last->action === 'reject') $actions['reject']++;
                                        elseif ($last->action === 'revise') $actions['revise']++;
                                        else $actions['pending']++;
                                    } else {
                                        $actions['pending']++;
                                    }
                                }
                                if ($actions['pending'] === 0) {
                                    $isReviewsDone = true;
                                }
                            } else {
                                // fallback to explicit status
                                if ($doc->status === 'reviews_done') $isReviewsDone = true;
                            }

                            $rowClass = $isReviewsDone ? 'table-success' : '';
                        @endphp
                        <tr class="{{ $rowClass }}">
                            <td><strong>{{ $doc->title }}</strong></td>
                            <td><span class="badge bg-secondary">{{ $doc->type?->name ?? 'Untyped' }}</span></td>
                            <td>{{ $doc->user?->firstName }} {{ $doc->user?->lastName }}</td>
                            <td>{{ implode(', ', $assignedAs) }}</td>
                            <td>
                                @if($isReviewsDone)
                                    <span class="badge bg-success">Reviews Done</span>
                                @else
                                    @if($doc->commenters->count() > 0)
                                        <span class="badge bg-warning">Pending</span>
                                    @else
                                        <span class="badge bg-info">No reviewers assigned</span>
                                    @endif
                                @endif
                            </td>
                            <td>{{ $doc->created_at->format('Y-m-d') }}</td>
                            <td>
                                <a href="{{ route('documents.show', $doc) }}" class="btn btn-sm btn-outline-primary">View</a>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="7" class="text-center text-muted py-3">No documents assigned to you</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <div class="mt-3">{{ $documents->links() }}</div>
    </div>
</div>
@endsection
