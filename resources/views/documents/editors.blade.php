@extends('layouts.app')

@section('title','Assign Editors')
@section('page-title','Assign Editors — ' . $document->title)

@section('content')
<div class="container" style="max-width:800px">
    <div class="card-stats p-4">
        <h4>Assign Editors for: {{ $document->title }}</h4>

        <form method="POST" action="{{ route('documents.editors.update', $document->id) }}">
            @csrf
            <div class="form-group mb-3">
                <label>Select editors (Ctrl/Cmd+click for multiple)</label>
                <select name="editors[]" multiple class="form-select" size="12">
                    @php $byCollege = $users->groupBy('college'); @endphp
                    @foreach($byCollege as $collegeName => $collegeGroup)
                        <optgroup label="{{ $collegeName ?: 'Unassigned' }}">
                            @foreach($collegeGroup->groupBy('program') as $programName => $programGroup)
                                @foreach($programGroup as $u)
                                    <option value="{{ $u->id }}" {{ in_array($u->id, $assigned) ? 'selected' : '' }}>{{ $u->firstName }} {{ $u->lastName }} — {{ $u->program ?: 'Unassigned' }} ({{ $u->role }})</option>
                                @endforeach
                            @endforeach
                        </optgroup>
                    @endforeach
                </select>
            </div>

            <button class="btn btn-maroon">Save</button>
        </form>
    </div>
</div>
@endsection
