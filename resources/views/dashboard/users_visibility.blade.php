@extends('layouts.app')

@section('title','User Visibility')
@section('page-title','User Role Visibility')

@section('content')
<div class="container-fluid">
    <div class="card p-3">
        <p class="text-muted">This page shows which users you can view according to your role-based visibility rules.</p>

        @php $byCampus = $users->groupBy('campus'); @endphp
        @foreach($byCampus as $campusName => $campusGroup)
            <h5 class="mt-3">Campus: {{ $campusName ?: 'Unassigned' }}</h5>
            @php $byCollege = $campusGroup->groupBy('college'); @endphp
            @foreach($byCollege as $collegeName => $collegeGroup)
                <h6 class="ms-3">College: {{ $collegeName ?: 'Unassigned' }}</h6>
                @php $byProgram = $collegeGroup->groupBy('program'); @endphp
                @foreach($byProgram as $programName => $programGroup)
                    <div class="ms-5 mb-2">Program: {{ $programName ?: 'Unassigned' }}</div>
                    <ul class="list-group ms-5 mb-3">
                        @foreach($programGroup as $u)
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <strong>{{ $u->firstName }} {{ $u->lastName }}</strong>
                                    <div class="text-muted" style="font-size:12px">{{ ucfirst(str_replace('_',' ',$u->role)) }} — {{ $u->email }}</div>
                                </div>
                                <div>
                                    {{-- View removed per request --}}
                                </div>
                            </li>
                        @endforeach
                    </ul>
                @endforeach
            @endforeach
        @endforeach
    </div>
</div>
@endsection
