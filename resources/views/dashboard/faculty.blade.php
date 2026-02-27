@extends('layouts.app')

@section('title','Faculty Dashboard')
@section('page-title','Faculty — ' . ($user->program ?? '') . ' (' . ($user->college ?? '') . ')')

@section('content')
<div class="container-fluid">
    <div class="row g-3 mb-3">
        <div class="col-md-4">
            <div class="card-stats p-4 rounded">
                <h6 class="text-muted">Program</h6>
                <p class="m-0" style="color:var(--maroon);font-size:18px;font-weight:600">{{ $user->program ?? '—' }}</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card-stats p-4 rounded">
                <h6 class="text-muted">College</h6>
                <p class="m-0" style="color:var(--maroon);font-size:14px;font-weight:600">{{ $user->college ?? '—' }}</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card-stats p-4 rounded">
                <h6 class="text-muted">Program Activity Logs</h6>
                <h3 style="color:var(--maroon)">{{ $stats['totalLogs'] }}</h3>
            </div>
        </div>
    </div>
    @include('dashboard._formatting_widget')
    <!-- Quick Actions (top) -->
    <div class="row mt-3 g-3 mb-3">
        <div class="col-md-3">
            <a href="{{ route('dashboard.users.visibility') }}" class="btn btn-light" style="width:100%;padding:12px;text-align:left;border:2px solid #eee">
                <div><i class="fas fa-eye" style="font-size:20px;color:var(--maroon)"></i></div>
                <div style="margin-top:6px">
                    <strong>User Visibility</strong>
                    <p style="margin:0;font-size:12px;color:#999">Who you can view</p>
                </div>
            </a>
        </div>
    </div>

    <!-- Centered Documents Summary -->
    <div class="row justify-content-center mb-4">
        <div class="col-md-6">
            <div class="card-stat text-center">
                <i class="fas fa-folder-open"></i>
                <h4 style="margin:10px 0 5px;color:#333">Documents Summary</h4>
                <div style="margin-top:6px;color:#666">
                    <div style="font-size:16px"><strong>Total Documents:</strong> {{ $stats['documents']['total'] ?? 0 }}</div>
                    <div class="mt-2">
                        <span class="badge bg-warning">Pending {{ $stats['documents']['pending'] ?? 0 }}</span>
                        <span class="badge bg-info ms-2" style="background:#0dcaf0;color:#fff">Reviews Done {{ $stats['documents']['reviews_done'] ?? 0 }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-stats p-3 rounded">
        <h5 class="mb-3">Recent Program Activity</h5>
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Action</th>
                        <th>Details</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($stats['recentLogs'] as $log)
                        <tr>
                            <td>{{ $log->user?->firstName }} {{ $log->user?->lastName }}</td>
                            <td>{{ $log->action }}</td>
                            <td class="text-truncate" style="max-width:300px">{{ $log->details }}</td>
                            <td>{{ $log->created_at->format('Y-m-d H:i') }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="4" class="text-center text-muted py-3">No activity yet</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-3">
            <a href="{{ route('dashboard.users.visibility') }}" class="btn btn-light" style="width:100%;padding:12px;text-align:left;border:2px solid #eee">
                <div><i class="fas fa-eye" style="font-size:20px;color:var(--maroon)"></i></div>
                <div style="margin-top:6px">
                    <strong>User Visibility</strong>
                    <p style="margin:0;font-size:12px;color:#999">Who you can view</p>
                </div>
            </a>
        </div>
    </div>
</div>
@endsection
