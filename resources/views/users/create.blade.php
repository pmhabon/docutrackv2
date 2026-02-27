@extends('layouts.app')

@section('title','Create User')
@section('page-title','Create User')

@section('content')
<div class="container" style="max-width:700px">
    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $err)
                    <li>{{ $err }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="card p-4">
        <form method="POST" action="{{ route('users.store') }}">
            @csrf

            <div style="max-height: 70vh; overflow-y: auto; padding-right: 8px;">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName" class="form-control" value="{{ old('firstName') }}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastName" class="form-control" value="{{ old('lastName') }}" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Middle Name</label>
                    <input type="text" name="middleName" class="form-control" value="{{ old('middleName') }}">
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="{{ old('email') }}" required>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Contact</label>
                        <input type="tel" name="contactNumber" class="form-control" value="{{ old('contactNumber') }}" placeholder="+63 9XX XXX XXXX">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Rank</label>
                            <select name="rank" class="form-select">
                                <option value="">-- Select Rank --</option>
                                @foreach($ranks as $r)
                                    <option value="{{ $r->name }}" {{ old('rank') === $r->name ? 'selected' : '' }}>{{ $r->name }}</option>
                                @endforeach
                            </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" name="password_confirmation" class="form-control" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select" required>
                        <option value="campus_director">Campus Director</option>
                        <option value="dean">Dean</option>
                        <option value="program_head">Program Head</option>
                        <option value="faculty">Faculty</option>
                        <option value="student">Student</option>
                        <option value="superadmin">Superadmin</option>
                    </select>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Campus</label>
                        <input type="hidden" name="campus" value="ISPSC Tagudin">
                        <div class="form-control-plaintext">ISPSC Tagudin</div>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">College</label>
                        <select name="college" class="form-select">
                            <option value="">-- Select --</option>
                            @foreach($colleges as $c)
                                <option value="{{ $c->name }}">{{ $c->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Program</label>
                        <select name="program" class="form-select">
                            <option value="">-- Select --</option>
                            @foreach($programs as $p)
                                <option value="{{ $p->name }}">{{ $p->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea name="address" class="form-control" rows="2">{{ old('address') }}</textarea>
                </div>
            </div>

            <div class="d-flex gap-2 mt-3">
                <button type="submit" class="btn btn-primary">Create User</button>
                <a href="{{ route('users.index') }}" class="btn btn-outline-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection