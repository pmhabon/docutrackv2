@extends('layouts.app')

@section('title','Edit User')
@section('page-title','Edit User: ' . $user->firstName . ' ' . $user->lastName)

@section('content')
<div class="container" style="max-width:700px">
    @if($errors->any())
        <div class="alert alert-danger">
            <strong>Error!</strong>
            <ul class="list-unstyled mb-0">
                @foreach($errors->all() as $err)
                    <li>{{ $err }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card-stats p-4">
        <form method="POST" action="{{ route('users.update', $user) }}">
            @csrf
            @method('PUT')

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" value="{{ old('firstName', $user->firstName) }}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" value="{{ old('lastName', $user->lastName) }}" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Middle Name</label>
                <input type="text" name="middleName" class="form-control" value="{{ old('middleName', $user->middleName) }}">
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" value="{{ old('email', $user->email) }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Role</label>
                <select name="role" class="form-select" required>
                    <option value="campus_director" {{ $user->role === 'campus_director' ? 'selected' : '' }}>Campus Director</option>
                    <option value="dean" {{ $user->role === 'dean' ? 'selected' : '' }}>Dean</option>
                    <option value="program_head" {{ $user->role === 'program_head' ? 'selected' : '' }}>Program Head</option>
                    <option value="faculty" {{ $user->role === 'faculty' ? 'selected' : '' }}>Faculty</option>
                    <option value="student" {{ $user->role === 'student' ? 'selected' : '' }}>Student</option>
                    <option value="superadmin" {{ $user->role === 'superadmin' ? 'selected' : '' }}>Superadmin</option>
                </select>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="form-label">Campus</label>
                    <input type="hidden" name="campus" value="{{ old('campus', $user->campus ?? 'ISPSC Tagudin') }}">
                    <div class="form-control-plaintext">{{ old('campus', $user->campus ?? 'ISPSC Tagudin') }}</div>
                </div>
                <div class="col-md-4">
                    <label class="form-label">College</label>
                    <select name="college" class="form-select">
                        <option value="">-- Select --</option>
                        @foreach($colleges as $c)
                            <option value="{{ $c->name }}" {{ (old('college', $user->college) === $c->name) ? 'selected' : '' }}>{{ $c->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Program</label>
                    <select name="program" class="form-select">
                        <option value="">-- Select --</option>
                        @foreach($programs as $p)
                            <option value="{{ $p->name }}" {{ (old('program', $user->program) === $p->name) ? 'selected' : '' }}>{{ $p->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Contact</label>
                    <input type="tel" name="contactNumber" class="form-control" value="{{ old('contactNumber', $user->contactNumber) }}">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Rank</label>
                    <select name="rank" class="form-select">
                        <option value="">-- Select Rank --</option>
                        @foreach($ranks as $r)
                            <option value="{{ $r->name }}" {{ (old('rank', $user->rank) === $r->name) ? 'selected' : '' }}>{{ $r->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control" rows="2">{{ old('address', $user->address) }}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Status</label>
                <select name="status" class="form-select">
                    <option value="active" {{ $user->status === 'active' ? 'selected' : '' }}>Active</option>
                    <option value="inactive" {{ $user->status === 'inactive' ? 'selected' : '' }}>Inactive</option>
                </select>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">Update User</button>
                <a href="{{ route('users.index') }}" class="btn btn-outline-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection
