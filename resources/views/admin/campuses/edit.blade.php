@extends('layouts.app')

@section('title', 'Edit Campus')
@section('page-title')
    <i class="fas fa-edit"></i> Edit Campus
@endsection

@section('content')
<div class="container" style="max-width:600px">
    <div class="card">
        <div class="modal-header" style="background:linear-gradient(135deg,#800000,#a00000);color:#fff">
            <h5 class="modal-title"><i class="fas fa-map-marker"></i> Edit: {{ $campus->name }}</h5>
        </div>
        <div class="card-body">
            @if ($errors->any())
                <div class="alert alert-danger">
                    @foreach ($errors->all() as $error)
                        <div><i class="fas fa-exclamation-circle"></i> {{ $error }}</div>
                    @endforeach
                </div>
            @endif

            <form action="{{ route('campuses.update', $campus) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label for="name" class="form-label"><i class="fas fa-building"></i> Campus Name *</label>
                    <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" 
                           value="{{ old('name', $campus->name) }}" required>
                    @error('name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="location" class="form-label"><i class="fas fa-map"></i> Location</label>
                    <input type="text" name="location" id="location" class="form-control @error('location') is-invalid @enderror" 
                           value="{{ old('location', $campus->location) }}">
                    @error('location')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label"><i class="fas fa-align-left"></i> Description</label>
                    <textarea name="description" id="description" rows="4" class="form-control @error('description') is-invalid @enderror">{{ old('description', $campus->description) }}</textarea>
                    @error('description')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <div class="d-flex gap-2 justify-content-end">
                    <a href="{{ route('campuses.index') }}" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update Campus
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
