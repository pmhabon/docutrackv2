@extends('layouts.app')

@section('title',$document->title)
@section('page-title','Document: ' . $document->title)

@section('content')
<div class="container" style="max-width:800px">
    <div class="card-stats p-4">
        <div class="mb-3">
            <a href="{{ route('documents.index') }}" class="btn btn-outline-secondary btn-sm">← Back</a>
        </div>

        <h4>{{ $document->title }}</h4>
        <div class="text-muted mb-3">
            <small>Uploaded by: {{ $document->user?->firstName }} {{ $document->user?->lastName }}</small><br>
            <small>Date: {{ $document->created_at->format('Y-m-d H:i') }}</small><br>
            @php
                $totalCommenters = $document->commenters->count();

                // Determine latest action per assigned commenter (approve / reject / revise / pending)
                $actions = ['approve' => 0, 'reject' => 0, 'revise' => 0, 'pending' => 0];
                foreach($document->commenters as $c) {
                    $last = $document->comments->where('user_id', $c->id)->sortBy('created_at')->last();
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

            <small>Status: 
                    @php
                        $status = $document->status;
                        $statusMap = [
                            'approved' => ['label' => 'Approved', 'class' => 'bg-success'],
                            'rejected' => ['label' => 'Rejected', 'class' => 'bg-danger'],
                            'pending' => ['label' => 'Pending', 'class' => 'bg-warning text-dark'],
                            'no_reviewers_assigned' => ['label' => 'No reviewers assigned', 'class' => 'bg-secondary'],
                            'pending_formatting' => ['label' => 'Pending formatting', 'class' => 'bg-info text-dark'],
                            'formatting_queued' => ['label' => 'Formatting queued', 'class' => 'bg-info text-dark'],
                            'formatting_processing' => ['label' => 'Formatting processing', 'class' => 'bg-primary text-white'],
                            'formatting_failed' => ['label' => 'Formatting failed', 'class' => 'bg-danger'],
                            'reviews_done' => ['label' => 'Reviews done', 'class' => 'bg-secondary']
                        ];
                        $display = $statusMap[$status] ?? ['label' => ucfirst(str_replace('_', ' ', $status)), 'class' => 'bg-secondary'];
                    @endphp
                    <span id="doc-status-badge" class="badge {{ $display['class'] }} me-2">{{ $display['label'] }}</span>
                    <small class="text-muted">Uploaded {{ $document->created_at->diffForHumans() }}</small>
                </small>
                @if(in_array($document->status, ['formatting_queued','formatting_processing','formatting_failed']))
                    <div class="mt-2">
                        <strong>Formatting status:</strong>
                        <span id="formatting-status-label" class="ms-2">{{ $display['label'] }}</span>
                        @if($document->status === 'formatting_failed')
                            <a href="{{ route('documents.backups', $document->id) }}" class="btn btn-sm btn-outline-secondary ms-3">View backups / restore</a>
                        @endif
                    </div>
                @endif
            </small>
        </div>

        @if($totalCommenters > 0)
            <div class="mb-2">
                @php
                    $parts = [];
                    if($actions['approve'] > 0) $parts[] = $actions['approve'] . ' author' . ($actions['approve'] > 1 ? 's' : '') . ' approves';
                    if($actions['reject'] > 0) $parts[] = $actions['reject'] . ' author' . ($actions['reject'] > 1 ? 's' : '') . ' rejects';
                    if($actions['revise'] > 0) $parts[] = $actions['revise'] . ' author' . ($actions['revise'] > 1 ? 's' : '') . ' revise';
                    if($actions['pending'] > 0) $parts[] = $actions['pending'] . ' pending';
                @endphp
                <small class="text-muted">{{ implode(' · ', $parts) }}</small>
                @if($actions['pending'] > 0)
                    <div><span class="badge bg-info">Waiting for {{ $actions['pending'] }} reviewer(s)</span></div>
                @endif
            </div>
        @endif

        @php
            $currentUser = auth()->user();
            $isUploader = $currentUser && $document->user_id === $currentUser->id;
            $isCommenter = $currentUser && $document->commenters->contains(function($u) use ($currentUser){ return $u->id === $currentUser->id; });
        @endphp

        @if($isUploader || $isCommenter || ($currentUser && $currentUser->role === 'superadmin'))
            @if($totalCommenters > 0)
            <div class="mb-3">
                <h6>Reviewers</h6>
                <ul class="list-group">
                    @foreach($document->commenters as $c)
                        @php
                            $last = $document->comments->where('user_id', $c->id)->sortBy('created_at')->last();
                            $statusLabel = 'Pending';
                            $badgeClass = 'bg-warning';
                            if($last) {
                                if($last->action === 'approve') { $statusLabel = 'Approved'; $badgeClass = 'bg-success'; }
                                elseif($last->action === 'reject') { $statusLabel = 'Rejected'; $badgeClass = 'bg-danger'; }
                                elseif($last->action === 'revise') { $statusLabel = 'Revise'; $badgeClass = 'bg-warning'; }
                            }
                        @endphp
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <strong>{{ $c->firstName }} {{ $c->lastName }}</strong>
                                <span class="badge {{ $badgeClass }} ms-2">{{ $statusLabel }}</span>
                            </div>
                            <div>
                                @if($currentUser && $currentUser->id === $c->id)
                                    <form method="POST" action="{{ route('documents.comments.store', $document->id) }}" style="display:inline" onsubmit="return confirm('Approve this document?');">
                                        @csrf
                                        <input type="hidden" name="action" value="approve">
                                        <button class="btn btn-sm btn-outline-success">Approve</button>
                                    </form>

                                    <form method="POST" action="{{ route('documents.comments.store', $document->id) }}" style="display:inline;margin-left:6px;" onsubmit="return confirm('Reject this document?');">
                                        @csrf
                                        <input type="hidden" name="action" value="reject">
                                        <button class="btn btn-sm btn-outline-danger">Reject</button>
                                    </form>

                                    <form method="POST" action="{{ route('documents.comments.store', $document->id) }}" style="display:inline;margin-left:6px;" onsubmit="return confirm('Request revisions for this document?');">
                                        @csrf
                                        <input type="hidden" name="action" value="revise">
                                        <button class="btn btn-sm btn-outline-warning">Revise</button>
                                    </form>
                                @endif
                            </div>
                        </li>
                    @endforeach
                </ul>
            </div>
        @endif

        <hr>

        <div class="mb-4">
            <h6>Description</h6>
            <p>{{ $document->description ?? 'No description provided' }}</p>
        </div>

        <div class="mb-4">
            <h6>File Information</h6>
            <p>
                <strong>Type:</strong> {{ $document->type?->name ?? $document->file_type ?? 'PDF' }}<br>
                <strong>Path:</strong> {{ $document->file_path }}
            </p>
        </div>

        {{-- current user already determined above; do not redeclare --}}

        <div class="d-flex gap-2">
            <a href="{{ route('documents.preview', $document->id) }}" target="_blank" class="btn btn-primary">Open Preview</a>
            <a href="{{ route('documents.download', $document->id) }}" class="btn btn-outline-primary">Download</a>
            @if($currentUser && ($currentUser->id === $document->user_id || $currentUser->role === 'superadmin'))
                <a href="{{ route('documents.commenters', $document->id) }}" class="btn btn-secondary">Assign Commenters</a>
            @endif
        </div>

        <hr>

        <div class="mt-4">
            <h5>Comments</h5>

            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            @if($document->comments->count() > 0)
                <div style="max-height:320px;overflow-y:auto;margin-bottom:10px;">
                    <ul class="list-group mb-3">
                        @foreach($document->comments as $comment)
                            <li class="list-group-item">
                                <strong>{{ $comment->user->firstName }} {{ $comment->user->lastName }}</strong>
                                <span class="text-muted" style="font-size:12px"> — {{ $comment->created_at->format('Y-m-d H:i') }}</span>
                                <div style="margin-top:6px">{{ $comment->content }}</div>
                            </li>
                        @endforeach
                    </ul>
                </div>
            @else
                <p class="text-muted">No comments yet.</p>
            @endif

            @if($currentUser && ($isUploader || $isCommenter || $currentUser->role === 'superadmin'))
                <form method="POST" action="{{ route('documents.comments.store', $document->id) }}">
                    @csrf
                    <div class="mb-2">
                        <textarea name="content" class="form-control" rows="3" placeholder="Write a comment..." required style="background:#fff7e6"></textarea>
                    </div>
                    <div class="mb-2 d-flex gap-2 align-items-center">
                        <div class="grow">
                            <small class="text-muted">Actions:</small>
                        </div>
                        {{-- Post a plain comment (requires content) --}}
                        <button type="submit" name="action" value="comment" class="btn btn-success">Post Comment</button>
                    </div>
                </form>
            @endif
        </div>

        @endif

        <!-- Preview iframe removed — users can use the Open Preview button which opens file in a new tab -->
    </div>
</div>
@endsection

    @section('scripts')
    <script>
    (() => {
        const pollingStates = ['formatting_queued','formatting_processing','formatting_failed'];
        const statusUrl = "{{ route('documents.formatting_status', $document->id) }}";
        const badge = document.getElementById('doc-status-badge');
        const fmtLabel = document.getElementById('formatting-status-label');

        if (!badge) return;

        function applyDisplay(data) {
            if (!data) return;
            // update badge text and classes
            badge.textContent = data.label;
            // remove existing bg- classes
            badge.className = 'badge me-2 ' + data.class;
            if (fmtLabel) fmtLabel.textContent = data.label;
        }

        function pollOnce() {
            fetch(statusUrl, { credentials: 'same-origin' })
                .then(r => r.ok ? r.json() : Promise.reject(r))
                .then(json => {
                    applyDisplay(json);
                    if (!pollingStates.includes(json.status)) {
                        // final state reached — stop polling and reload to reflect full state
                        clearInterval(window._docFmtPoll);
                        setTimeout(() => location.reload(), 800);
                    }
                })
                .catch(() => {/* silent */});
        }

        // start polling only if current status is one of the formatting states
        const currentStatus = "{{ $document->status }}";
        if (pollingStates.includes(currentStatus)) {
            pollOnce();
            window._docFmtPoll = setInterval(pollOnce, 5000);
        }
    })();
    </script>
    @endsection
