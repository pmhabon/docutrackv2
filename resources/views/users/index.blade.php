@extends('layouts.app')

@section('title','Manage Users')
@section('page-title','User Management')

@section('content')
<div class="container-fluid">
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card-stats p-3 rounded mb-3">
        <div class="row">
            <div class="col-md-8">
                    <form method="GET" class="row g-2">
                        <div class="col-md-4">
                            <input type="text" name="q" id="search" value="{{ request('q') }}" class="form-control" placeholder="Search users by name or email...">
                        </div>
                        
                        <div class="col-md-2">
                            <select name="college" class="form-select">
                                <option value="">All Colleges</option>
                                @foreach($colleges as $c)
                                    <option value="{{ $c->name }}" {{ request('college') == $c->name ? 'selected' : '' }}>{{ $c->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select name="program" class="form-select">
                                <option value="">All Programs</option>
                                @foreach($programs as $p)
                                    <option value="{{ $p->name }}" {{ request('program') == $p->name ? 'selected' : '' }}>{{ $p->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2 d-grid">
                            <button class="btn btn-primary">Filter</button>
                        </div>
                    </form>
            </div>
                <div class="col-md-3 text-end">
                    <a href="{{ route('users.create') }}" class="btn btn-success">+ Create User</a>
                </div>
        </div>
    </div>

    <div class="card-stats p-3 rounded">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="usersTable">
                    @php $me = auth()->user(); @endphp
                    @foreach($users as $user)
                        <tr>
                            <td><strong>{{ $user->firstName }} {{ $user->lastName }}</strong></td>
                            <td>{{ $user->email }}</td>
                            <td><span class="badge bg-info">{{ ucfirst(str_replace('_', ' ', $user->role)) }}</span></td>
                            <td>
                                @if($user->status === 'active')
                                    <span class="badge bg-success">Active</span>
                                @else
                                    <span class="badge bg-secondary">Inactive</span>
                                @endif
                            </td>
                            <td>
                                @if($me && $me->role === 'superadmin')
                                    <a href="{{ route('users.edit', $user) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                                    @if($user->status === 'active')
                                        <form method="POST" action="{{ route('users.deactivate', $user) }}" style="display:inline">
                                            @csrf
                                            <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Deactivate user?')">Deactivate</button>
                                        </form>
                                    @else
                                        <form method="POST" action="{{ route('users.activate', $user) }}" style="display:inline">
                                            @csrf
                                            <button type="submit" class="btn btn-sm btn-outline-success">Activate</button>
                                        </form>
                                    @endif
                                @else
                                    <a href="{{ route('users.show', $user) }}" class="btn btn-sm btn-outline-secondary">View</a>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="mt-3">{{ $users->links() }}</div>
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('search').addEventListener('input', function(e){
        const q = e.target.value.toLowerCase();
        document.querySelectorAll('#usersTable tr').forEach(function(row){
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(q)?'':'none';
        });
    });
</script>
@endpush
@endsection
