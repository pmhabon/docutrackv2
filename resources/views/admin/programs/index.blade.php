@extends('layouts.app')

@section('title', 'Manage Programs')
@section('page-title')
    <i class="fas fa-graduation-cap"></i> Manage Programs
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
            <select id="collegeFilter" class="form-select">
                <option value="">All Colleges</option>
                @foreach(\App\Models\College::orderBy('name')->get() as $college)
                    <option value="{{ $college->id }}">{{ $college->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-3 text-end">
            <a href="{{ route('programs.create') }}" class="btn btn-primary">
                <i class="fas fa-plus-circle"></i> Add Program
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

    <!-- Program Table -->
    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th style="color:#333"><i class="fas fa-graduation-cap"></i> Program Name</th>
                        <th><i class="fas fa-tag"></i> Code</th>
                        <th><i class="fas fa-building"></i> College</th>
                        <!-- Campus removed for single-campus deployment -->
                        <th><i class="fas fa-desc"></i> Description</th>
                        <th style="text-align:center">Actions</th>
                    </tr>
                </thead>
                <tbody id="programTable">
                    @if($programs->count() > 0)
                        @foreach ($programs as $program)
                            <tr data-college="{{ $program->college_id }}">
                                <td><strong>{{ $program->name }}</strong></td>
                                <td><code>{{ $program->code }}</code></td>
                                <td>{{ $program->college->name ?? 'N/A' }}</td>
                                <!-- Campus display removed; single-campus deployment -->
                                <td>{{ Str::limit($program->description, 40) ?? 'N/A' }}</td>
                                <td style="text-align:center;gap:5px;display:flex;justify-content:center">
                                    <a href="{{ route('programs.edit', $program) }}" class="btn btn-sm btn-warning">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal-{{ $program->id }}">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteModal-{{ $program->id }}" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header" style="background:linear-gradient(135deg,#800000,#a00000);color:#fff">
                                                    <h5 class="modal-title"><i class="fas fa-exclamation-triangle"></i> Confirm Delete</h5>
                                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete <strong>{{ $program->name }}</strong>?</p>
                                                    <p class="text-muted">This action cannot be undone.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <form method="POST" action="{{ route('programs.destroy', $program) }}" style="display:inline">
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
                                <p>No programs found</p>
                            </td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>

    <!-- Pagination -->
    <div class="mt-4">
        {{ $programs->links() }}
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('searchInput').addEventListener('keyup', function(){
        const search = this.value.toLowerCase();
        const rows = document.querySelectorAll('#programTable tr');
        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(search) ? '' : 'none';
        });
    });

    document.getElementById('collegeFilter').addEventListener('change', function(){
        const collegeId = this.value;
        const rows = document.querySelectorAll('#programTable tr');
        rows.forEach(row => {
            if (!collegeId || row.dataset.college === collegeId) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
@endpush
@endsection
