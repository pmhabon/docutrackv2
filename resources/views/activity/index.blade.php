@extends('layouts.app')

@section('title','Activity Logs')
@section('page-title','Activity Logs')

@section('content')
<div class="container-fluid">
    <div class="card p-3 mb-3 card-stats">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="m-0">Recent Activity</h5>
            <div>
                <input id="search" class="form-control form-control-sm" placeholder="Search action/details..." style="width:220px">
            </div>
        </div>
    </div>

    <div class="card p-3">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>User</th>
                        <th>Action</th>
                        <th>Details</th>
                        <th>Scope</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody id="logs">
                    @foreach($logs as $log)
                        <tr>
                            <td>{{ $log->id }}</td>
                            <td>{{ $log->user?->firstName }} {{ $log->user?->lastName }}</td>
                            <td>{{ $log->action }}</td>
                            <td>{{ Str::limit($log->details, 80) }}</td>
                            <td>{{ $log->campus }} / {{ $log->college }} / {{ $log->program }}</td>
                            <td>{{ $log->created_at->format('Y-m-d H:i') }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="mt-3">{{ $logs->links() }}</div>
    </div>
</div>

@endsection

@push('scripts')
<script>
    document.getElementById('search').addEventListener('input', function(e){
        const q = e.target.value.toLowerCase();
        document.querySelectorAll('#logs tr').forEach(function(row){
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(q)?'':'none';
        });
    });
</script>
@endpush
