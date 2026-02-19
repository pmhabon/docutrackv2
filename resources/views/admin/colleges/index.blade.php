@extends('layouts.app')

@section('title', 'Manage Colleges')
@section('page-title')
    <i class="fas fa-building"></i> Manage Colleges
@endsection

@section('content')
<div class="container-fluid">
    <!-- Header with Action -->
    <div class="row mb-4">
        <div class="col-md-6">
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
                <input type="text" id="searchInput" class="form-control search-bar" placeholder="Search by name or code...">
            </div>
        </div>
        <div class="col-md-3">
            <select id="campusFilter" class="form-select">
                <option value="">All Campuses</option>
                @foreach(\App\Models\Campus::all() as $campus)
                    <option value="{{ $campus->id }}">{{ $campus->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-3 text-end">
            <a href="{{ route('colleges.create') }}" class="btn btn-primary">
                <i class="fas fa-plus-circle"></i> Add College
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

    <!-- College Table -->
    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th style="color:#333"><i class="fas fa-building"></i> College Name</th>
                        <th><i class="fas fa-tag"></i> Code</th>
                        <th><i class="fas fa-map-marker"></i> Campus</th>
                        <th><i class="fas fa-graduation-cap"></i> Programs</th>
                        <th><i class="fas fa-desc"></i> Description</th>
                        <th style="text-align:center">Actions</th>
                    </tr>
                </thead>
                <tbody id="collegeTable">
                    @if($colleges->count() > 0)
                        @foreach ($colleges as $college)
                            <tr data-campus="{{ $college->campus_id }}">
                                <td><strong>{{ $college->name }}</strong></td>
                                <td><code>{{ $college->code }}</code></td>
                                <td><span class="badge bg-secondary">{{ $college->campus->name ?? 'N/A' }}</span></td>
                                <td><span class="badge bg-info">{{ $college->programs_count }}</span></td>
                                <td>{{ Str::limit($college->description, 40) ?? 'N/A' }}</td>
                                <td style="text-align:center;gap:5px;display:flex;justify-content:center">
                                    <a href="{{ route('colleges.edit', $college) }}" class="btn btn-sm btn-warning">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal-{{ $college->id }}">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteModal-{{ $college->id }}" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header" style="background:linear-gradient(135deg,#800000,#a00000);color:#fff">
                                                    <h5 class="modal-title"><i class="fas fa-exclamation-triangle"></i> Confirm Delete</h5>
                                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete <strong>{{ $college->name }}</strong>?</p>
                                                    <p class="text-muted">This action cannot be undone.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <form method="POST" action="{{ route('colleges.destroy', $college) }}" style="display:inline">
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
                            <td colspan="6" class="text-center py-4 text-muted">
                                <i class="fas fa-inbox" style="font-size:28px"></i>
                                <p>No colleges found</p>
                            </td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pagination -->
    <div class="mt-4">
        {{ $colleges->links() }}
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('searchInput').addEventListener('keyup', function(){
        const search = this.value.toLowerCase();
        const rows = document.querySelectorAll('#collegeTable tr');
        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(search) ? '' : 'none';
        });
    });

    document.getElementById('campusFilter').addEventListener('change', function(){
        const campusId = this.value;
        const rows = document.querySelectorAll('#collegeTable tr');
        rows.forEach(row => {
            if (!campusId || row.dataset.campus === campusId) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
@endpush
@endsection
