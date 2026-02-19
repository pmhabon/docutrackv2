@extends('layouts.app')

@section('title', 'Create Program')
@section('page-title')
    <i class="fas fa-plus-circle"></i> Create New Program
@endsection

@section('content')
<div class="container" style="max-width:600px">
    <div class="card">
        <div class="modal-header" style="background:linear-gradient(135deg,#800000,#a00000);color:#fff">
            <h5 class="modal-title"><i class="fas fa-graduation-cap"></i> New Program</h5>
        </div>
        <div class="card-body">
            @if ($errors->any())
                <div class="alert alert-danger">
                    @foreach ($errors->all() as $error)
                        <div><i class="fas fa-exclamation-circle"></i> {{ $error }}</div>
                    @endforeach
                </div>
            @endif

            <form action="{{ route('programs.store') }}" method="POST">
                @csrf

                <div class="mb-3">
                    <label for="college_id" class="form-label"><i class="fas fa-building"></i> College *</label>
                    <select name="college_id" id="college_id" class="form-select @error('college_id') is-invalid @enderror" required>
                        <option value="">Select College</option>
                        @foreach(\App\Models\College::with('campus')->get() as $college)
                            <option value="{{ $college->id }}" {{ old('college_id') == $college->id ? 'selected' : '' }}>
                                {{ $college->campus->name ?? 'N/A' }} - {{ $college->name }}
                            </option>
                        @endforeach
                    </select>
                    @error('college_id')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="name" class="form-label"><i class="fas fa-graduation-cap"></i> Program Name *</label>
                    <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" 
                           placeholder="e.g., Bachelor of Science in Information Technology" value="{{ old('name') }}" required>
                    @error('name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="code" class="form-label"><i class="fas fa-tag"></i> Code *</label>
                    <input type="text" name="code" id="code" class="form-control @error('code') is-invalid @enderror" 
                           placeholder="e.g., BSIT" value="{{ old('code') }}" required>
                    <small class="text-muted">Unique identifier for the program</small>
                    @error('code')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label"><i class="fas fa-align-left"></i> Description</label>
                    <textarea name="description" id="description" rows="4" class="form-control @error('description') is-invalid @enderror" 
                              placeholder="Program details...">{{ old('description') }}</textarea>
                    @error('description')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="d-flex gap-2 justify-content-end">
                    <a href="{{ route('programs.index') }}" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Create Program
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
