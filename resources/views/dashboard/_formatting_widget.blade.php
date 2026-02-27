<div class="card-stats p-3 rounded mb-3">
    <h5 class="mb-2">Formatting Jobs</h5>
    <div class="mb-2">
        <span class="me-2"><strong>Queued:</strong> {{ $formattingCounts['queued'] ?? 0 }}</span>
        <span class="me-2"><strong>Processing:</strong> {{ $formattingCounts['processing'] ?? 0 }}</span>
        <span class="me-2"><strong>Failed:</strong> {{ $formattingCounts['failed'] ?? 0 }}</span>
        <a href="{{ route('documents.index') }}?status=formatting_queued" class="btn btn-sm btn-outline-secondary ms-3">View all</a>
    </div>

    @if(isset($formattingJobs) && $formattingJobs->count() > 0)
        <div class="table-responsive">
            <table class="table table-sm table-hover">
                <thead>
                    <tr>
                        <th>Document</th>
                        <th>Uploader</th>
                        <th>Status</th>
                        <th>Updated</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($formattingJobs as $d)
                        @php
                            $s = $d->status;
                            $map = [
                                'formatting_queued' => ['label'=>'Queued','class'=>'bg-info text-dark'],
                                'formatting_processing' => ['label'=>'Processing','class'=>'bg-primary text-white'],
                                'formatting_failed' => ['label'=>'Failed','class'=>'bg-danger']
                            ];
                            $disp = $map[$s] ?? ['label' => ucfirst(str_replace('_',' ',$s)), 'class'=>'bg-secondary'];
                        @endphp
                        <tr>
                            <td><a href="{{ route('documents.show', $d->id) }}">{{ $d->title }}</a></td>
                            <td>{{ $d->user?->firstName }} {{ $d->user?->lastName }}</td>
                            <td><span class="badge {{ $disp['class'] }}">{{ $disp['label'] }}</span></td>
                            <td>{{ $d->updated_at->diffForHumans() }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    @else
        <p class="text-muted">No recent formatting jobs.</p>
    @endif
</div>
