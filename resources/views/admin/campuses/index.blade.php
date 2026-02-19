@extends('layouts.app')

@section('title', 'Manage Campuses')
@section('page-title')
    <i class="fas fa-map-marker"></i> Manage Campuses
@endsection

@section('content')
<div class="container-fluid">
    <!-- Header with Action -->
    <div class="row mb-4">
        <div class="col-md-8">
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
                <input type="text" id="searchInput" class="form-control search-bar" placeholder="Search by name or location...">
            </div>
        </div>
        <div class="col-md-4 text-end">
            <a href="{{ route('campuses.create') }}" class="btn btn-primary">
                <i class="fas fa-plus-circle"></i> Add Campus
            </a>
        </div>
    </div>

    <!-- Messages -->
    @if ($message = Session::get('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i> {{ $message }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif
    @if ($errors->any())
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> Error: {{ $errors->first() }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    <!-- Campus Table -->
    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th style="color:#333"><i class="fas fa-map-marker"></i> Campus Name</th>
                        <th><i class="fas fa-map"></i> Location</th>
                        <th><i class="fas fa-building"></i> Colleges</th>
                        <th><i class="fas fa-desc"></i> Description</th>
                        <th style="text-align:center">Actions</th>
                    </tr>
                </thead>
                <tbody id="campusTable">
                    @if($campuses->count() > 0)
                        @foreach ($campuses as $campus)
                            <tr>
                                <td><strong>{{ $campus->name }}</strong></td>
                                <td>{{ $campus->location ?? 'N/A' }}</td>
                                <td><span class="badge bg-info">{{ $campus->colleges_count }}</span></td>
                                <td>{{ Str::limit($campus->description, 40) ?? 'N/A' }}</td>
                                <td style="text-align:center;gap:5px;display:flex;justify-content:center">
                                    <a href="{{ route('campuses.edit', $campus) }}" class="btn btn-sm btn-warning">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal-{{ $campus->id }}">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteModal-{{ $campus->id }}" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header" style="background:linear-gradient(135deg,#800000,#a00000);color:#fff">
                                                    <h5 class="modal-title"><i class="fas fa-exclamation-triangle"></i> Confirm Delete</h5>
                                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete <strong>{{ $campus->name }}</strong>?</p>
                                                    <p class="text-muted">This action cannot be undone.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <form method="POST" action="{{ route('campuses.destroy', $campus) }}" style="display:inline">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Delete</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="5" class="text-center py-4 text-muted">
                                <i class="fas fa-inbox" style="font-size:28px"></i>
                                <p>No campuses found</p>
                            </td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pagination -->
    <div class="mt-4">
        {{ $campuses->links() }}
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('searchInput').addEventListener('keyup', function(){
        const search = this.value.toLowerCase();
        const rows = document.querySelectorAll('#campusTable tr');
        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(search) ? '' : 'none';
        });
    });
</script>
@endpush
@endsection
