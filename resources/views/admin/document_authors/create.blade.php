@extends('layouts.app')

@section('title','Add Author')
@section('page-title')
    <i class="fas fa-user-plus"></i> Add Author
@endsection

@section('content')
<div class="container" style="max-width:700px">
    <div class="card">
        <div class="card-body">
            <form action="{{ route('document-authors.store') }}" method="POST">
                @csrf
                <div class="mb-3">
                    <label class="form-label">First Name</label>
                    <input name="first_name" class="form-control" required value="{{ old('first_name') }}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Last Name</label>
                    <input name="last_name" class="form-control" required value="{{ old('last_name') }}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input name="email" class="form-control" value="{{ old('email') }}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Affiliation</label>
                    <input name="affiliation" class="form-control" value="{{ old('affiliation') }}">
                </div>
                <div class="text-end">
                    <a href="{{ route('document-authors.index') }}" class="btn btn-secondary">Cancel</a>
                    <button class="btn btn-primary">Create</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection