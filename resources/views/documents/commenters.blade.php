@extends('layouts.app')

@section('title','Assign Commenters')
@section('page-title','Assign Commenters — ' . $document->title)

@section('content')
<div class="container" style="max-width:800px">
    <div class="card-stats p-4">
        <h4>Assign Commenters for: {{ $document->title }}</h4>

        <form method="POST" action="{{ route('documents.commenters.update', $document->id) }}">
            @csrf
            <div class="form-group mb-3">
                <label>Select commenters (Ctrl/Cmd+click for multiple)</label>
                <select name="commenters[]" multiple class="form-select" size="8">
                    @foreach($users as $u)
                        <option value="{{ $u->id }}" {{ in_array($u->id, $assigned) ? 'selected' : '' }}>{{ $u->firstName }} {{ $u->lastName }} ({{ $u->email }})</option>
                    @endforeach
                </select>
            </div>

            <button class="btn btn-maroon">Save</button>
        </form>
    </div>
</div>
@endsection
