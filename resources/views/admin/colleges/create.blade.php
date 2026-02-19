@extends('layouts.app')

@section('title', 'Create College')
@section('page-title')
    <i class="fas fa-plus-circle"></i> Create New College
@endsection

@section('content')
<div class="container" style="max-width:600px">
    <div class="card">
        <div class="modal-header" style="background:linear-gradient(135deg,#800000,#a00000);color:#fff">
            <h5 class="modal-title"><i class="fas fa-building"></i> New College</h5>
        </div>
        <div class="card-body">
            @if ($errors->any())
                <div class="alert alert-danger">
                    @foreach ($errors->all() as $error)
                        <div><i class="fas fa-exclamation-circle"></i> {{ $error }}</div>
                    @endforeach
                </div>
            @endif

            <form action="{{ route('colleges.store') }}" method="POST">
                @csrf

                <div class="mb-3">
                    <label for="campus_id" class="form-label"><i class="fas fa-map-marker"></i> Campus *</label>
                    <select name="campus_id" id="campus_id" class="form-select @error('campus_id') is-invalid @enderror" required>
                        <option value="">Select Campus</option>
                        @foreach(\App\Models\Campus::all() as $campus)
                            <option value="{{ $campus->id }}" {{ old('campus_id') == $campus->id ? 'selected' : '' }}>{{ $campus->name }}</option>
                        @endforeach
                    </select>
                    @error('campus_id')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="name" class="form-label"><i class="fas fa-building"></i> College Name *</label>
                    <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" 
                           placeholder="e.g., College of Arts and Sciences" value="{{ old('name') }}" required>
                    @error('name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="code" class="form-label"><i class="fas fa-tag"></i> Code *</label>
                    <input type="text" name="code" id="code" class="form-control @error('code') is-invalid @enderror" 
                           placeholder="e.g., CAS" value="{{ old('code') }}" required>
                    <small class="text-muted">Unique identifier for the college</small>
                    @error('code')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label"><i class="fas fa-align-left"></i> Description</label>
                    <textarea name="description" id="description" rows="4" class="form-control @error('description') is-invalid @enderror" 
                              placeholder="College details...">{{ old('description') }}</textarea>
                    @error('description')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="d-flex gap-2 justify-content-end">
                    <a href="{{ route('colleges.index') }}" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Create College
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
