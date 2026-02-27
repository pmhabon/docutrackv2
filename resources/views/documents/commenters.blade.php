@extends('layouts.app')

@section('title','Assign Commenters')
@section('page-title','Assign Commenters — ' . $document->title)

@section('content')
<div class="container" style="max-width:800px">
    <div class="card-stats p-4">
        <h4>Assign Commenters for: {{ $document->title }}</h4>

        <form method="POST" action="{{ route('documents.commenters.update', $document->id) }}">
            @csrf
            <div class="mb-3 d-flex gap-2 align-items-center">
                <div style="flex:1">
                    <input id="commenterFilterInput" type="text" class="form-control" placeholder="Filter by name, email, program or role">
                </div>
                <div>
                    <button type="button" id="commenterFilterBtn" class="btn btn-outline-secondary">Filter</button>
                </div>
                <div>
                    <button type="button" id="commenterResetBtn" class="btn btn-outline-secondary">Reset</button>
                </div>
            </div>

            <div class="form-group mb-3">
                <label>Select commenters (Ctrl/Cmd+click for multiple)</label>
                <select id="commenterSelect" name="commenters[]" multiple class="form-select" size="12">
                    @php $byCollege = $users->groupBy('college'); @endphp
                    @foreach($byCollege as $collegeName => $collegeGroup)
                        <optgroup label="{{ $collegeName ?: 'Unassigned' }}">
                            @foreach($collegeGroup->groupBy('program') as $programName => $programGroup)
                                @foreach($programGroup as $u)
                                    <option value="{{ $u->id }}" data-name="{{ strtolower($u->firstName . ' ' . $u->lastName) }}" data-email="{{ strtolower($u->email) }}" data-program="{{ strtolower($u->program ?? '') }}" data-role="{{ strtolower($u->role) }}" {{ in_array($u->id, $assigned) ? 'selected' : '' }}>{{ $u->firstName }} {{ $u->lastName }} — {{ $u->program ?: 'Unassigned' }} ({{ $u->role }})</option>
                                @endforeach
                            @endforeach
                        </optgroup>
                    @endforeach
                </select>
            </div>

            <button class="btn btn-maroon">Save</button>
        </form>

        @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function(){
                const input = document.getElementById('commenterFilterInput');
                const btn = document.getElementById('commenterFilterBtn');
                const reset = document.getElementById('commenterResetBtn');
                const select = document.getElementById('commenterSelect');

                function filter() {
                    const q = (input.value || '').trim().toLowerCase();
                    for (let i = 0; i < select.options.length; i++) {
                        const opt = select.options[i];
                        const name = opt.dataset.name || '';
                        const email = opt.dataset.email || '';
                        const program = opt.dataset.program || '';
                        const role = opt.dataset.role || '';
                        if (!q) {
                            opt.style.display = '';
                        } else if (name.includes(q) || email.includes(q) || program.includes(q) || role.includes(q)) {
                            opt.style.display = '';
                        } else {
                            opt.style.display = 'none';
                        }
                    }
                }

                btn.addEventListener('click', filter);
                reset.addEventListener('click', function(){ input.value = ''; filter(); });

                // allow enter to trigger filter
                input.addEventListener('keydown', function(e){ if (e.key === 'Enter') { e.preventDefault(); filter(); } });
            });
        </script>
        @endpush
    </div>
</div>
@endsection
