<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Document;
use App\Models\DocumentType;
use App\Models\DocumentAuthor;
use App\Services\ActivityTracker;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();
        $query = Document::with(['user','type','comments','commenters','authors'])->latest();

        // All authenticated users can list documents; no editor-based restriction.

        // filters
        if ($request->filled('status')) {
            $query->where('status', $request->query('status'));
        }
        if ($request->filled('type')) {
            $query->where('document_type_id', $request->query('type'));
        }
        if ($request->filled('author')) {
            $authorId = (int)$request->query('author');
            $query->whereHas('authors', function($q) use ($authorId){ $q->where('document_authors.id',$authorId); });
        }
        // filters
        if ($request->filled('status')) {
            $query->where('status', $request->query('status'));
        }
        if ($request->filled('type')) {
            $query->where('document_type_id', $request->query('type'));
        }
        if ($request->filled('author')) {
            $authorId = (int)$request->query('author');
            $query->whereHas('authors', function($q) use ($authorId){ $q->where('document_authors.id',$authorId); });
        }
        if ($request->filled('authorName')) {
            $authorName = $request->query('authorName');
            $query->whereHas('authors', function($q) use ($authorName){ $q->where('first_name','like','%'.$authorName.'%')->orWhere('last_name','like','%'.$authorName.'%'); });
        }
        if ($request->filled('search')) {
            $s = $request->query('search');
            $query->where(function($q) use ($s){
                $q->where('title','like','%'.$s.'%')->orWhere('description','like','%'.$s.'%');
            });
        }
        if ($request->filled('authorName')) {
            $authorName = $request->query('authorName');
            $query->whereHas('authors', function($q) use ($authorName){ $q->where('first_name','like','%'.$authorName.'%')->orWhere('last_name','like','%'.$authorName.'%'); });
        }
        if ($request->filled('search')) {
            $s = $request->query('search');
            $query->where(function($q) use ($s){
                $q->where('title','like','%'.$s.'%')->orWhere('description','like','%'.$s.'%');
            });
        }

        $documents = $query->paginate(15)->withQueryString();

        $types = DocumentType::orderBy('name')->get();
        $authors = DocumentAuthor::orderBy('last_name')->get();

        return view('documents.index', ['documents' => $documents, 'types' => $types, 'authors' => $authors]);
    }

    public function show(Document $document)
    {
        $user = Auth::user();
        $document->load(['comments.user','commenters']);

        return view('documents.show', ['document' => $document]);
    }

    // Editor assignment removed — commenters control who can comment on documents.

    // Commenter assignment view (uploader or superadmin)
    public function commenters(Document $document)
    {
        $user = Auth::user();
        // only uploader or superadmin can assign commenters
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);

        $users = \App\Models\User::orderBy('lastName')->get();
        $assigned = $document->commenters()->pluck('users.id')->toArray();

        return view('documents.commenters', ['document' => $document, 'users' => $users, 'assigned' => $assigned]);
    }

    public function updateCommenters(Request $request, Document $document)
    {
        $user = Auth::user();
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);

        $data = $request->validate([
            'commenters' => 'nullable|array',
            'commenters.*' => 'exists:users,id'
        ]);

        $existing = $document->commenters()->pluck('users.id')->toArray();
        $newList = $data['commenters'] ?? [];

        $document->commenters()->sync($newList);

        $added = array_values(array_diff($newList, $existing));
        $notify = [];
        foreach ($added as $uid) {
            $notify[] = ['user_id' => $uid, 'type' => 'document.commenter.assigned', 'data' => ['document_id' => $document->id, 'title' => $document->title, 'assigned_by' => $user->id]];
        }

        ActivityTracker::logDocumentUpdate($document->id, 'commenters_updated', ['updated_by' => $user->id, 'notify' => $notify]);

        return redirect()->route('documents.show', $document->id)->with('success','Commenters updated.');
    }

    // Comment posting
    public function storeComment(Request $request, Document $document)
    {
        $user = Auth::user();

        // validate action as optional: comment (default), approve, reject, revise
        $data = $request->validate([
            'content' => 'nullable|string',
            'action' => 'nullable|in:comment,approve,reject,revise'
        ]);

        $isCommenter = $document->commenters()->where('user_id', $user->id)->exists();

        // Ensure general permission to post a comment: uploader, commenter, or superadmin
        $isUploader = $document->user_id === $user->id;
        if (! $isUploader && ! $isCommenter && $user->role !== 'superadmin') abort(403);

        // Only assigned commenters may perform approve/reject/revise actions
        if (!empty($data['action']) && in_array($data['action'], ['approve','reject','revise']) && ! $isCommenter) {
            abort(403);
        }

        // determine action and content defaults
        $action = $data['action'] ?? 'comment';
        $content = trim($data['content'] ?? '');

                    $disk = Storage::disk('local');
                    $candidates = [];
                    if (Str::startsWith($document->file_path, 'documents/')) {
                        $candidates[] = $document->file_path;
                        $candidates[] = 'documents/' . basename($document->file_path);
                    } else {
                        $candidates[] = 'documents/' . $document->file_path;
                        $candidates[] = $document->file_path;
                    }
        \App\Models\Comment::create([
            'document_id' => $document->id,
            'user_id' => $user->id,
            'content' => $content,
            'action' => $action === 'comment' ? null : $action
        ]);

        // After posting, recompute document status based on latest action per assigned commenter
        $document->load('comments','commenters');
        $totalCommenters = $document->commenters()->count();
        if ($totalCommenters === 0) {
            // fallback to simple rule when no commenters assigned
            $approvedCount = $document->comments()->where('action', 'approve')->distinct('user_id')->count('user_id');
            $rejected = $document->comments()->where('action', 'reject')->exists();
            if ($rejected) {
                $document->update(['status' => 'rejected']);
            } elseif ($approvedCount > 0) {
                $document->update(['status' => 'approved']);
            } else {
                $document->update(['status' => 'pending']);
            }
        } else {
            $actions = ['approve' => 0, 'reject' => 0, 'revise' => 0, 'pending' => 0];
            foreach ($document->commenters as $c) {
                $last = $document->comments->where('user_id', $c->id)->sortBy('created_at')->last();
                if ($last) {
                    if ($last->action === 'approve') $actions['approve']++;
                    elseif ($last->action === 'reject') $actions['reject']++;
                    elseif ($last->action === 'revise') $actions['revise']++;
                    else $actions['pending']++;
                } else {
                    $actions['pending']++;
                }
            }

            // If all commenters have acted (no pending) mark as reviews_done, otherwise pending
            if ($actions['pending'] === 0) {
                $document->update(['status' => 'reviews_done']);
            } else {
                $document->update(['status' => 'pending']);
            }
        }

        // notify uploader and other commenters (excluding the commenter)
        $notify = [];
        if ($document->user_id && $document->user_id !== $user->id) {
            $notify[] = ['user_id' => $document->user_id, 'type' => 'document.comment', 'data' => ['document_id' => $document->id, 'comment_by' => $user->id]];
        }
        $otherCommenters = $document->commenters()->where('user_id', '!=', $user->id)->pluck('users.id')->toArray();
        foreach ($otherCommenters as $uid) {
            $notify[] = ['user_id' => $uid, 'type' => 'document.comment', 'data' => ['document_id' => $document->id, 'comment_by' => $user->id]];
        }

        ActivityTracker::logDocumentUpdate($document->id, 'comment_posted', ['user_id' => $user->id, 'notify' => $notify]);

        return back()->with('success','Comment posted.');
    }

    // Secure preview route — streams file inline after permission check
    public function preview(Document $document)
    {
        $user = Auth::user();

        // Any authenticated user may preview documents; comments remain restricted separately.
        $disk = Storage::disk('local');
        $candidates = [];
        if (Str::startsWith($document->file_path, 'documents/')) {
            $candidates[] = $document->file_path;
            $candidates[] = 'documents/' . basename($document->file_path);
        } else {
            $candidates[] = 'documents/' . $document->file_path;
            $candidates[] = $document->file_path;
        }

        $found = null;
        foreach ($candidates as $p) {
            if ($disk->exists($p)) { $found = $disk->path($p); break; }
        }

        if (! $found) abort(404);

        return response()->file($found, [
            'Content-Type' => mime_content_type($found) ?: 'application/octet-stream',
            'Content-Disposition' => 'inline; filename="' . basename($found) . '"'
        ]);
    }

    // Secure download (checks same permissions as preview)
    public function download(Document $document)
    {
        $user = Auth::user();

        // Any authenticated user may download documents; comments remain restricted separately.
        $disk = Storage::disk('local');
        $candidates = [];
        if (Str::startsWith($document->file_path, 'documents/')) {
            $candidates[] = $document->file_path;
            $candidates[] = 'documents/' . basename($document->file_path);
        } else {
            $candidates[] = 'documents/' . $document->file_path;
            $candidates[] = $document->file_path;
        }

        $found = null;
        foreach ($candidates as $p) {
            if ($disk->exists($p)) { $found = $disk->path($p); break; }
        }

        if (! $found) abort(404);

        return response()->download($found, basename($found));
    }

    public function create()
    {
        $authors = DocumentAuthor::orderBy('last_name')->get();
        $types = DocumentType::orderBy('name')->get();
        $users = \App\Models\User::orderBy('lastName')->get(['id','firstName','middleName','lastName']);
        return view('documents.create', compact('authors','types','users'));
    }

    public function store(Request $request)
    {
        $user = Auth::user();

        $data = $request->validate([
            'title' => 'required|string|max:255',
            'document_type_id' => 'nullable|exists:document_types,id',
            'file' => 'required|file|mimes:pdf,doc,docx|max:20480',
            'author_mode' => 'required|in:single,multiple',
            'single_author_name' => 'nullable|string|max:255',
            'single_author_user_id' => 'nullable|exists:users,id',
            'single_author_type' => 'nullable|string|in:Primary,Secondary,Contributor',
            'multiple_authors' => 'nullable|array',
            'multiple_authors.*.name' => 'nullable|string|max:255',
            'multiple_authors.*.type' => 'nullable|string|in:Primary,Secondary,Contributor',
            'author_user_ids' => 'nullable|array',
            'author_user_ids.*' => 'exists:users,id',
        ]);

        $data['user_id'] = $user->id;
        $data['campus'] = $user->campus;
        $data['college'] = $user->college;
        $data['program'] = $user->program;
        // store uploaded file
        if ($request->hasFile('file')) {
            $uploaded = $request->file('file')->store('documents');
            $data['file_path'] = basename($uploaded);
            $data['file_type'] = $request->file('file')->getClientMimeType();
        } else {
            $data['file_path'] = 'sample-document.pdf';
        }
        $data['status'] = 'pending';

        $document = Document::create($data);

        // attach authors based on mode; users can be selected (author_user_ids) or typed manually
        $authorsToAttach = [];

        if ($data['author_mode'] === 'single') {
            // prefer selected user id if provided
            if (!empty($data['single_author_user_id'])) {
                $u = \App\Models\User::find($data['single_author_user_id']);
                if ($u) {
                    $author = DocumentAuthor::firstOrCreate([
                        'first_name' => $u->firstName ?? '',
                        'last_name' => $u->lastName ?? '',
                    ], ['user_id' => $u->id]);
                    $authorsToAttach[$author->id] = ['role' => $data['single_author_type'] ?? 'Primary'];
                }
            }
        } elseif ($data['author_mode'] === 'multiple') {
            // attach any explicitly selected user ids first
            if (!empty($data['author_user_ids'])) {
                foreach ($data['author_user_ids'] as $uid) {
                    $u = \App\Models\User::find($uid);
                    if ($u) {
                        $author = DocumentAuthor::firstOrCreate([
                            'first_name' => $u->firstName ?? '',
                            'last_name' => $u->lastName ?? '',
                        ], ['user_id' => $u->id]);
                        $authorsToAttach[$author->id] = ['role' => 'Primary'];
                    }
                }
            }

            if (!empty($data['multiple_authors'])) {
                foreach ($data['multiple_authors'] as $authorData) {
                    if (!empty($authorData['name'])) {
                        $author = $this->findOrCreateAuthor($authorData['name']);
                        $authorsToAttach[$author->id] = ['role' => $authorData['type'] ?? 'Primary'];
                    }
                }
            }

            // fallback: if nothing attached, attach the uploader
            if (empty($authorsToAttach)) {
                $name = trim(($user->firstName ?? '') . ' ' . ($user->lastName ?? '')) ?: null;
                if ($name) {
                    $author = $this->findOrCreateAuthor($name);
                    $authorsToAttach[$author->id] = ['role' => 'Primary'];
                }
            }
        }

        if (!empty($authorsToAttach)) {
            $document->authors()->attach($authorsToAttach);
        }

        // Log document creation
        ActivityTracker::logDocumentCreate($document->id, $data['title'], $data['campus'], $data['college'], $data['program']);

        return redirect()->route('documents.index')->with('success', 'Document uploaded.');
    }

    private function findOrCreateAuthor(string $fullName)
    {
        // Parse name (simple: split by space, first part is first name, rest is last name)
        $nameParts = explode(' ', trim($fullName), 2);
        $firstName = $nameParts[0] ?? '';
        $lastName = $nameParts[1] ?? '';

        return DocumentAuthor::firstOrCreate(
            ['first_name' => $firstName, 'last_name' => $lastName],
            ['email' => null, 'affiliation' => null]
        );
    }

    public function destroy(Document $document)
    {
        $user = Auth::user();

        // Check access
        if ($user->role === 'campus_director' && $document->campus !== $user->campus) {
            abort(403);
        } elseif ($user->role === 'dean' && ($document->campus !== $user->campus || $document->college !== $user->college)) {
            abort(403);
        } elseif ($user->role === 'program_head' && ($document->campus !== $user->campus || $document->college !== $user->college || $document->program !== $user->program)) {
            abort(403);
        }

        $title = $document->title;
        $documentId = $document->id;

        $document->delete();

        // Log document deletion
        ActivityTracker::logDocumentDelete($documentId, $title);

        return back()->with('success', 'Document deleted.');
    }
}
