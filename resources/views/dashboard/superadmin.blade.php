@extends('layouts.app')

@section('title','Superadmin Dashboard')
@section('page-title','Superadmin Dashboard')

@section('content')
<div class="container-fluid">
    <!-- Stat Cards Row -->
    <div class="row mb-4 g-3">
        <div class="col-md-3">
            <div class="card-stat">
                <i class="fas fa-file-alt"></i>
                <h3 style="margin:10px 0 5px;color:#333">{{ $stats['totalLogs'] ?? 0 }}</h3>
                <p style="margin:0;color:#666;font-size:14px">Total Activity Logs</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card-stat">
                <i class="fas fa-users"></i>
                <h3 style="margin:10px 0 5px;color:#333">{{ \App\Models\User::count() }}</h3>
                <p style="margin:0;color:#666;font-size:14px">Total Users</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card-stat">
                <i class="fas fa-map-marker"></i>
                <h3 style="margin:10px 0 5px;color:#333">1</h3>
                <p style="margin:0;color:#666;font-size:14px">Total Campuses (ISPSC Tagudin)</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card-stat">
                <i class="fas fa-check-circle" style="color:#28a745"></i>
                <h3 style="margin:10px 0 5px;color:#333">Operational</h3>
                <p style="margin:0;color:#666;font-size:14px">System Status</p>
            </div>
        </div>
    </div>
    @include('dashboard._formatting_widget')

    <!-- Centered Documents Summary -->
    <!-- Quick Actions (moved to top) -->
    <div class="row mt-3 g-3">
        <div class="col-md-3">
            <a href="{{ route('users.index') }}" class="btn btn-light" style="width:100%;padding:15px;text-align:left;border:2px solid #eee">
                <div><i class="fas fa-users" style="font-size:24px;color:var(--maroon)"></i></div>
                <div style="margin-top:8px">
                    <strong>Manage Users</strong>
                    <p style="margin:0;font-size:12px;color:#999">View & manage accounts</p>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="{{ route('dashboard.users.visibility') }}" class="btn btn-light" style="width:100%;padding:15px;text-align:left;border:2px solid #eee">
                <div><i class="fas fa-eye" style="font-size:24px;color:var(--maroon)"></i></div>
                <div style="margin-top:8px">
                    <strong>User Visibility</strong>
                    <p style="margin:0;font-size:12px;color:#999">Who you can view</p>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="{{ route('programs.index') }}" class="btn btn-light" style="width:100%;padding:15px;text-align:left;border:2px solid #eee">
                <div><i class="fas fa-graduation-cap" style="font-size:24px;color:var(--maroon)"></i></div>
                <div style="margin-top:8px">
                    <strong>Manage Programs</strong>
                    <p style="margin:0;font-size:12px;color:#999">View & manage</p>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="{{ route('colleges.index') }}" class="btn btn-light" style="width:100%;padding:15px;text-align:left;border:2px solid #eee">
                <div><i class="fas fa-building" style="font-size:24px;color:var(--maroon)"></i></div>
                <div style="margin-top:8px">
                    <strong>Manage Colleges</strong>
                    <p style="margin:0;font-size:12px;color:#999">View & manage</p>
                </div>
            </a>
        </div>
    </div>

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

    <!-- Charts & Filters Row -->
    <div class="row mb-4 g-3">
        <div class="col-md-4">
            <div class="card-stat text-center">
                <h6 style="margin-bottom:10px">Document Status Overview</h6>
                <canvas id="docStatusChart" width="200" height="200"></canvas>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card-stat">
                <h5 style="margin:0 0 12px;color:#333"><i class="fas fa-filter"></i> Filters</h5>
                <div class="row g-2 align-items-center">
                    <div class="col-md-4">
                        <select id="filterStatus" class="form-select">
                            <option value="all">All Statuses</option>
                            <option value="pending">Pending</option>
                            <option value="reviews_done">Reviews Done</option>
                            <!-- Approved/Rejected removed per UI update -->
                        </select>
                    </div>
                    <div class="col-md-4">
                        <select id="filterType" class="form-select">
                            <option value="all">All Types</option>
                            @foreach(\App\Models\DocumentType::orderBy('name')->get() as $t)
                                <option value="type-{{ $t->id }}">{{ $t->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-4 d-grid">
                        <button id="clearFilters" class="btn btn-outline-secondary">Clear</button>
                    </div>
                </div>

                <hr>
                <h5 style="margin:0 0 12px;color:#333"><i class="fas fa-file-alt"></i> Recent Documents</h5>
                <div class="table-responsive">
                    <table id="recentDocsTable" class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Uploaded By</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach(\App\Models\Document::with('commenters','type','user')->latest()->take(20)->get() as $d)
                                @php
                                    $rowStatus = $d->commenters->count() > 0
                                        ? ($d->status === 'reviews_done' ? 'reviews_done' : 'pending')
                                        : 'no_reviewers_assigned';
                                    $typeClass = $d->document_type_id ? 'type-' . $d->document_type_id : 'type-none';
                                @endphp
                                <tr data-status="{{ $rowStatus }}" data-type="{{ $typeClass }}">
                                    <td><a href="{{ route('documents.show', $d) }}">{{ Str::limit($d->title, 80) }}</a></td>
                                    <td>{{ $d->type?->name ?? '—' }}</td>
                                    <td>
                                        @if($rowStatus === 'reviews_done')
                                            <span class="badge bg-info" style="background:#0dcaf0;color:#fff">Reviews Done</span>
                                        @elseif($rowStatus === 'approved')
                                            <span class="badge bg-success">Approved</span>
                                        @elseif($rowStatus === 'rejected')
                                            <span class="badge bg-danger">Rejected</span>
                                        @elseif($rowStatus === 'no_reviewers_assigned')
                                            <span class="badge bg-info">No reviewers assigned</span>
                                        
                                        @else
                                            <span class="badge bg-warning">Pending</span>
                                        @endif
                                    </td>
                                    <td>{{ $d->user?->firstName }} {{ $d->user?->lastName }}</td>
                                    <td style="font-size:12px;color:#777">{{ $d->created_at->format('Y-m-d') }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="card">
        <div class="card-header" style="background:#f5f7fa;border-bottom:2px solid #eee;padding:15px">
            <h5 style="margin:0;color:#333"><i class="fas fa-history"></i> Recent Activity (Last 10)</h5>
        </div>
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th style="color:#555"><i class="fas fa-user"></i> User</th>
                        <th><i class="fas fa-bolt"></i> Action</th>
                        <th><i class="fas fa-align-left"></i> Details</th>
                        <th><i class="fas fa-map-marker"></i> Location</th>
                        <th><i class="fas fa-clock"></i> Time</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($stats['recentLogs'] ?? [] as $log)
                        <tr>
                            <td>
                                <strong>{{ $log->user?->firstName ?? 'System' }}</strong>
                                <br><small style="color:#999">{{ $log->user?->role ?? 'N/A' }}</small>
                            </td>
                            <td>
                                <span class="badge" style="background:linear-gradient(135deg,var(--maroon),var(--maroon-light))">
                                    {{ ucwords(str_replace('_', ' ', $log->action)) }}
                                </span>
                            </td>
                            <td>{{ $log->details ?? 'N/A' }}</td>
                            <td>
                                <span class="badge bg-info" style="cursor:help" title="ISPSC Tagudin{{ $log->college ? ' > ' . $log->college : '' }}">
                                    ISPSC Tagudin{{ $log->college ? ' › ' . Str::limit($log->college, 12) : '' }}
                                </span>
                            </td>
                            <td style="font-size:12px;color:#999">
                                {{ $log->created_at?->format('Y-m-d H:i') ?? 'N/A' }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="text-center py-4 text-muted">
                                <i class="fas fa-inbox" style="font-size:28px"></i>
                                <p>No activity logs yet</p>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Quick Actions removed from bottom since moved to top -->
</div>
@endsection

@push('scripts')
<script>
    // Render document status chart
    const ctx = document.getElementById('docStatusChart');
    if (ctx) {
        const data = {
            labels: ['Pending','Reviews Done'],
            datasets: [{
                data: [{{ $stats['documents']['pending'] ?? 0 }}, {{ $stats['documents']['reviews_done'] ?? 0 }}],
                backgroundColor: ['#ffc107','#0dcaf0']
            }]
        };
        new Chart(ctx, { type: 'doughnut', data: data, options: { responsive: true } });
    }

    // Client-side filters for recent docs
    document.getElementById('filterStatus')?.addEventListener('change', function(){
        applyFilters();
    });
    document.getElementById('filterType')?.addEventListener('change', function(){
        applyFilters();
    });
    document.getElementById('clearFilters')?.addEventListener('click', function(){
        document.getElementById('filterStatus').value = 'all';
        document.getElementById('filterType').value = 'all';
        applyFilters();
    });

    function applyFilters(){
        const s = document.getElementById('filterStatus').value;
        const t = document.getElementById('filterType').value;
        document.querySelectorAll('#recentDocsTable tbody tr').forEach(function(row){
            const rs = row.getAttribute('data-status');
            const rt = row.getAttribute('data-type');
            let show = true;
            if (s !== 'all' && rs !== s) show = false;
            if (t !== 'all' && rt !== t) show = false;
            row.style.display = show ? '' : 'none';
        });
    }
</script>
@endpush

