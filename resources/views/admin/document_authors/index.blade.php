@extends('layouts.app')

@section('title','Document Authors')
@section('page-title')
    <i class="fas fa-user-edit"></i> Document Authors
@endsection

@section('content')
<div class="container-fluid">
    <div class="d-flex justify-content-between mb-3">
        <h5>Authors</h5>
        <a href="{{ route('document-authors.create') }}" class="btn btn-primary mb-3">Add Author</a>
    </div>

    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr><th>Name</th><th>Email</th><th>Affiliation</th><th>Actions</th></tr>
                </thead>
                <tbody>
                    @foreach($authors as $author)
                    <tr>
                        <td>{{ $author->first_name }} {{ $author->last_name }}</td>
                        <td>{{ $author->email ?? '—' }}</td>
                        <td>{{ $author->affiliation ?? '—' }}</td>
                        <td>
                            <a href="{{ route('document-authors.edit', $author) }}" class="btn btn-sm btn-outline-secondary">Edit</a>
                            <form action="{{ route('document-authors.destroy', $author) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this author?')">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-sm btn-outline-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <div class="mt-3">{{ $authors->links() }}</div>
</div>
@endsection