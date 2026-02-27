@extends('layouts.app')

@section('title','Student Dashboard')
@section('page-title','Student Dashboard')

@section('content')
<div class="container">
    <div class="card-stats p-4">
        <h4>Welcome, {{ auth()->user()->firstName }}</h4>
        <p class="text-muted">Your uploaded documents and review status.</p>

        <div style="margin-top:20px">
            <a href="{{ route('documents.index') }}" class="btn btn-primary">My Documents</a>
        </div>

        <hr>

        <h5>Recent Activity</h5>
        <div class="mt-3">
            @foreach($stats['recentLogs'] as $log)
                <div style="padding:8px 0;border-bottom:1px solid #f1f1f1">
                    <div style="font-size:13px;color:#555">{{ $log->description ?? $log->action }}</div>
                    <div style="font-size:12px;color:#999">{{ $log->created_at->diffForHumans() }}</div>
                </div>
            @endforeach
        </div>
    </div>
    @include('dashboard._formatting_widget')
</div>
@endsection
