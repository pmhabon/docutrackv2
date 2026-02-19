@extends('layouts.app')

@section('title','Edit Profile')
@section('page-title','Edit Profile')

@section('content')
<div class="container" style="max-width:600px">
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

    <div class="card p-4 card-stats">
        <form method="POST" action="{{ route('profile.update') }}">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" name="firstName" class="form-control" value="{{ old('firstName', $user->firstName) }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" name="lastName" class="form-control" value="{{ old('lastName', $user->lastName) }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Contact Number</label>
                <input type="tel" name="contactNumber" class="form-control" value="{{ old('contactNumber', $user->contactNumber) }}">
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control" rows="3">{{ old('address', $user->address) }}</textarea>
            </div>

            <hr>

            <div class="mb-3">
                <label class="form-label">New Password (leave blank to keep current)</label>
                <input type="password" name="password" class="form-control" placeholder="Leave empty to skip">
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm Password</label>
                <input type="password" name="password_confirmation" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Update Profile</button>
            <a href="{{ route('dashboard') }}" class="btn btn-outline-secondary">Cancel</a>
        </form>
    </div>
</div>
@endsection
