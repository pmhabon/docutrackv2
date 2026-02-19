@extends('layouts.app')

@section('title', ($user->firstName ?? 'User') . ' Profile')
@section('page-title', 'User: ' . ($user->firstName ?? '') . ' ' . ($user->lastName ?? ''))

@section('content')
<div class="container" style="max-width:900px">
    <div class="mb-3">
        <a href="{{ url()->previous() }}" class="btn btn-outline-secondary btn-sm">← Back</a>
    </div>

    <div class="card-stats p-4">
        <h4>{{ $user->firstName ?? '' }} {{ $user->lastName ?? '' }}</h4>
        <div class="text-muted mb-3">
            <div><strong>Email:</strong> {{ $user->email ?? '—' }}</div>
            <div><strong>Role:</strong> {{ $user->role ?? '—' }}</div>
        </div>

        <hr>

        <h5>User Comments</h5>

        @if(isset($user->comments) && $user->comments->count() > 0)
            <ul class="list-group mb-3">
                @foreach($user->comments as $comment)
                    <li class="list-group-item">
                        <div class="d-flex justify-content-between">
                            <div>
                                @if(isset($comment->document) && $comment->document)
                                    <a href="{{ route('documents.show', $comment->document->id) }}">{{ $comment->document->title }}</a>
                                @else
                                    Document #{{ $comment->document_id }}
                                @endif
                            </div>
                            <div class="text-muted" style="font-size:12px">{{ $comment->created_at->format('Y-m-d H:i') }}</div>
                        </div>
                        <div style="margin-top:6px">{{ $comment->content }}</div>
                    </li>
                @endforeach
            </ul>
        @else
            <p class="text-muted">No comments found for this user.</p>
        @endif
    </div>
</div>
@endsection
