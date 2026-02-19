@extends('layouts.app')

@section('title','System Settings')
@section('page-title','System Settings')

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
        <form method="POST" action="{{ route('settings.update') }}">
            @csrf

            <div class="mb-3">
                <label class="form-label">Application Name</label>
                <input type="text" name="app_name" class="form-control" value="{{ old('app_name', \App\Models\SystemSettings::get('app_name', 'DocuTrack')) }}">
            </div>

            <div class="mb-3">
                <label class="form-label">Application Description</label>
                <textarea name="app_description" class="form-control" rows="4">{{ old('app_description', \App\Models\SystemSettings::get('app_description', 'ISPSC Document Management System')) }}</textarea>
            </div>

            <div class="mb-3">
                <div class="form-check">
                    <input type="checkbox" name="maintenance_mode" class="form-check-input" id="maintenance" value="1" {{ \App\Models\SystemSettings::get('maintenance_mode') ? 'checked' : '' }}>
                    <label class="form-check-label" for="maintenance">
                        Enable Maintenance Mode
                    </label>
                </div>
            </div>

            <hr>

            <div>
                <h6>System Information</h6>
                <ul class="list-unstyled small text-muted">
                    <li><strong>Laravel Version:</strong> 11.x</li>
                    <li><strong>Database:</strong> MySQL</li>
                    <li><strong>Timezone:</strong> UTC</li>
                </ul>
            </div>

            <button type="submit" class="btn btn-primary">Save Settings</button>
        </form>
    </div>
</div>
@endsection
