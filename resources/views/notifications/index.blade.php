@extends('layouts.app')

@section('title','Notifications')
@section('page-title','Notifications')

@section('content')
<div class="container" style="max-width:900px">
    <div class="card-stats p-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5>Notifications</h5>
            <form method="POST" action="{{ route('notifications.mark_all_read') }}">
                @csrf
                <button class="btn btn-sm btn-outline-secondary">Mark all read</button>
            </form>
        </div>

        <h6 class="mt-3">Unread</h6>
        @if($unread->count() > 0)
            <ul class="list-group mb-3">
                @foreach($unread as $n)
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div>
                            <a href="{{ route('notifications.click', $n->id) }}">{{ $n->data['message'] ?? 'Notification' }}</a>
                            <div class="text-muted" style="font-size:12px">{{ $n->created_at->diffForHumans() }}</div>
                        </div>
                        <div>
                            <small class="badge bg-primary">New</small>
                        </div>
                    </li>
                @endforeach
            </ul>
        @else
            <p class="text-muted">No unread notifications.</p>
        @endif

        <h6 class="mt-3">Earlier</h6>
        @if($read->count() > 0)
            <ul class="list-group">
                @foreach($read as $n)
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div>
                            <a href="{{ $n->data['url'] ?? '#' }}">{{ $n->data['message'] ?? 'Notification' }}</a>
                            <div class="text-muted" style="font-size:12px">{{ $n->created_at->diffForHumans() }}</div>
                        </div>
                        <div>
                            <small class="text-muted">Read</small>
                        </div>
                    </li>
                @endforeach
            </ul>
        @else
            <p class="text-muted">No earlier notifications.</p>
        @endif
    </div>
</div>
@endsection
