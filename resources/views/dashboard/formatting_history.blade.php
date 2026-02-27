@extends('layouts.app')

@section('title','Formatting History')
@section('page-title','Formatting Jobs History')

@section('content')
<div class="card">
    <div class="card-body">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>Formatting jobs</h5>
            <form method="GET" class="d-flex">
                <select name="status" class="form-select form-select-sm me-2">
                    <option value="">All</option>
                    <option value="formatting_queued">Queued</option>
                    <option value="formatting_processing">Processing</option>
                    <option value="formatting_failed">Failed</option>
                </select>
                <button class="btn btn-sm btn-outline-secondary">Filter</button>
            </form>
        </div>

        @if($documents->count())
            <div class="table-responsive">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th>Document</th>
                            <th>Uploader</th>
                            <th>Template</th>
                            <th>Status</th>
                            <th>Updated</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($documents as $d)
                            <tr>
                                <td><a href="{{ route('documents.show', $d->id) }}">{{ $d->title }}</a></td>
                                <td>{{ $d->user?->firstName }} {{ $d->user?->lastName }}</td>
                                <td>{{ $d->template?->title ?? '—' }}</td>
                                <td>
                                    @php
                                        $map = [
                                            'formatting_queued' => ['label'=>'Queued','class'=>'bg-info text-dark'],
                                            'formatting_processing' => ['label'=>'Processing','class'=>'bg-primary text-white'],
                                            'formatting_failed' => ['label'=>'Failed','class'=>'bg-danger']
                                        ];
                                        $s = $d->status;
                                        $disp = $map[$s] ?? ['label' => ucfirst(str_replace('_',' ',$s)), 'class'=>'bg-secondary'];
                                    @endphp
                                    <span class="badge {{ $disp['class'] }}">{{ $disp['label'] }}</span>
                                </td>
                                <td>{{ $d->updated_at->format('Y-m-d H:i') }}</td>
                                <td class="text-end">
                                    <a href="{{ route('documents.show', $d->id) }}" class="btn btn-sm btn-outline-primary">Open</a>
                                    @if($d->status === 'formatting_failed')
                                        <a href="{{ route('documents.backups', $d->id) }}" class="btn btn-sm btn-outline-secondary ms-1">Backups</a>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            {{ $documents->links() }}
        @else
            <p class="text-muted">No formatting jobs found.</p>
        @endif
    </div>
</div>
@endsection
