<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Document;
use App\Models\DocumentType;
use App\Models\DocumentAuthor;
use App\Services\ActivityTracker;
use App\Services\TemplateValidator;
use App\Models\Template;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use App\Services\FormattingEngine;
use App\Services\BibliographyFormatter;
use App\Jobs\FormatDocument;

class DocumentController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();
        $query = Document::with(['user','type','comments','commenters','authors'])->latest();

        // Students only see their own uploaded files
        if ($user->role === 'student') {
            $query->where('user_id', $user->id);
        }

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

        if ($request->filled('college')) {
            $query->where('college', $request->query('college'));
        }
        if ($request->filled('program')) {
            $query->where('program', $request->query('program'));
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

        $colleges = Document::whereNotNull('college')->distinct()->orderBy('college')->pluck('college');
        $programs = Document::whereNotNull('program')->distinct()->orderBy('program')->pluck('program');

        return view('documents.index', ['documents' => $documents, 'types' => $types, 'authors' => $authors, 'colleges' => $colleges, 'programs' => $programs]);
    }

    public function show(Document $document)
    {
        $user = Auth::user();
        $document->load(['comments.user','commenters']);

        return view('documents.show', ['document' => $document]);
    }

    // Return JSON status for formatting (used by AJAX polling)
    public function formattingStatus(Document $document)
    {
        $user = Auth::user();
        // Allow uploader, commenters, editors, or superadmin to view status
        $allowed = false;
        if ($user->role === 'superadmin') $allowed = true;
        if ($user->id === $document->user_id) $allowed = true;
        if ($document->commenters->contains('id', $user->id)) $allowed = true;
        if (method_exists($document, 'editors') && $document->editors->contains('id', $user->id)) $allowed = true;
        if (! $allowed) abort(403);

        $status = $document->status;
        $statusMap = [
            'approved' => ['label' => 'Approved', 'class' => 'bg-success'],
            'rejected' => ['label' => 'Rejected', 'class' => 'bg-danger'],
            'pending' => ['label' => 'Pending', 'class' => 'bg-warning text-dark'],
            'no_reviewers_assigned' => ['label' => 'No reviewers assigned', 'class' => 'bg-secondary'],
            'pending_formatting' => ['label' => 'Pending formatting', 'class' => 'bg-info text-dark'],
            'formatting_queued' => ['label' => 'Formatting queued', 'class' => 'bg-info text-dark'],
            'formatting_processing' => ['label' => 'Formatting processing', 'class' => 'bg-primary text-white'],
            'formatting_failed' => ['label' => 'Formatting failed', 'class' => 'bg-danger'],
            'reviews_done' => ['label' => 'Reviews done', 'class' => 'bg-secondary']
        ];

        $display = $statusMap[$status] ?? ['label' => ucfirst(str_replace('_', ' ', $status)), 'class' => 'bg-secondary'];

        return response()->json([
            'status' => $status,
            'label' => $display['label'],
            'class' => $display['class'],
            'updated_at' => $document->updated_at->toDateTimeString(),
        ]);
    }

    // Editor assignment removed — commenters control who can comment on documents.

    // Commenter assignment view (uploader or superadmin)
    public function commenters(Document $document)
    {
        $user = Auth::user();
        // only uploader or superadmin can assign commenters
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);
        // only show non-student roles for assignment
        $roles = ['faculty','dean','program_head','campus_director','superadmin'];
        $users = \App\Models\User::whereIn('role', $roles)->orderBy('college')->orderBy('program')->orderBy('lastName')->get();
        $assigned = $document->commenters()->pluck('users.id')->toArray();

        return view('documents.commenters', ['document' => $document, 'users' => $users, 'assigned' => $assigned]);
    }

    // Editor assignment view (uploader or superadmin)
    public function editors(Document $document)
    {
        $user = Auth::user();
        // only uploader or superadmin can assign editors
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);
        // only show non-student roles for assignment
        $roles = ['faculty','dean','program_head','campus_director','superadmin'];
        $users = \App\Models\User::whereIn('role', $roles)->orderBy('college')->orderBy('program')->orderBy('lastName')->get();
        $assigned = $document->editors()->pluck('users.id')->toArray();

        return view('documents.editors', ['document' => $document, 'users' => $users, 'assigned' => $assigned]);
    }

    public function updateEditors(Request $request, Document $document)
    {
        $user = Auth::user();
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);

        $data = $request->validate([
            'editors' => 'nullable|array',
            'editors.*' => 'exists:users,id'
        ]);

        $existing = $document->editors()->pluck('users.id')->toArray();
        $newList = $data['editors'] ?? [];

        $document->editors()->sync($newList);

        $added = array_values(array_diff($newList, $existing));

        $notify = [];
        foreach ($added as $uid) {
            $target = \App\Models\User::find($uid);
            if (! $target) continue;
            $byName = $user->firstName . ' ' . $user->lastName;
            $notify[] = [
                'user_id' => $uid,
                'type' => 'document.editor.assigned',
                'data' => [
                    'message' => "{$byName} has added you as an editor on {$document->title}",
                    'document_id' => $document->id,
                    'title' => $document->title,
                    'url' => route('documents.show', $document->id),
                    'assigned_by' => $user->id,
                ]
            ];
        }

        ActivityTracker::logDocumentUpdate($document->id, $document->title, ['updated_by' => $user->id, 'notify' => $notify]);

        return redirect()->route('documents.show', $document->id)->with('success','Editors updated. Notifications sent.');
    }

    // AJAX: return eligible commenters (for modal search/filter)
    public function eligibleCommenters(Document $document, Request $request)
    {
        $user = Auth::user();
        // only uploader or superadmin may fetch eligible commenters for this document
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);

        $q = $request->query('q');
        $roles = ['faculty','dean','program_head','campus_director','superadmin'];

        $query = \App\Models\User::whereIn('role', $roles)->orderBy('lastName');
        if ($q) {
            $query->where(function($s) use ($q) {
                $s->where('firstName','like','%'.$q.'%')->orWhere('lastName','like','%'.$q.'%')->orWhere('email','like','%'.$q.'%');
            });
        }

        $users = $query->limit(50)->get(['id','firstName','lastName','email','role']);

        return response()->json($users);
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
            $target = \App\Models\User::find($uid);
            if (! $target) continue;
            $byName = $user->firstName . ' ' . $user->lastName;
            $notify[] = [
                'user_id' => $uid,
                'type' => 'document.commenter.assigned',
                'data' => [
                    'message' => "{$byName} has added you as a commentor/reviewer on {$document->title}",
                    'document_id' => $document->id,
                    'title' => $document->title,
                    'url' => route('documents.show', $document->id),
                    'assigned_by' => $user->id,
                ]
            ];
        }

        ActivityTracker::logDocumentUpdate($document->id, $document->title, ['updated_by' => $user->id, 'notify' => $notify]);

        return redirect()->route('documents.show', $document->id)->with('success','Commenters updated. Notifications sent.');
    }

    // Documents where current user is assigned as editor
    public function editorMonitor()
    {
        $user = Auth::user();
        $documents = Document::whereHas('editors', function($q) use ($user) {
            $q->where('users.id', $user->id);
        })->with(['user','type','commenters'])->paginate(15);

        return view('documents.editor_monitor', ['documents' => $documents]);
    }

    // Documents assigned to current user either as editor or commenter
    public function assignedToMe(Request $request)
    {
        $user = Auth::user();
        $allowed = ['faculty','dean','campus_director','program_head'];
        if (! in_array($user->role, $allowed) && $user->role !== 'superadmin') {
            abort(403);
        }
        $query = Document::where(function($q) use ($user) {
            $q->whereHas('editors', function($q2) use ($user) { $q2->where('users.id', $user->id); })
              ->orWhereHas('commenters', function($q2) use ($user) { $q2->where('users.id', $user->id); });
        })->with(['user','type','commenters','editors']);

        if ($request->filled('search')) {
            $s = $request->query('search');
            $query->where(function($q) use ($s){
                $q->where('title','like','%'.$s.'%')->orWhere('description','like','%'.$s.'%');
            });
        }
        if ($request->filled('college')) {
            $query->where('college', $request->query('college'));
        }
        if ($request->filled('program')) {
            $query->where('program', $request->query('program'));
        }

        $documents = $query->latest()->paginate(15)->withQueryString();

        $colleges = Document::whereNotNull('college')->distinct()->orderBy('college')->pluck('college');
        $programs = Document::whereNotNull('program')->distinct()->orderBy('program')->pluck('program');

        return view('documents.assigned', ['documents' => $documents, 'colleges' => $colleges, 'programs' => $programs]);
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
            // No reviewers assigned: keep a clear status for uploader/UI
            $document->update(['status' => 'no_reviewers_assigned']);
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

        // notify uploader, other commenters and editors (excluding the commenter)
        $notify = [];
        $pushed = [];
        $byName = trim(($user->firstName ?? '') . ' ' . ($user->lastName ?? '')) ?: 'Someone';
        $message = $action === 'comment' ? "{$byName} commented on {$document->title}" : "{$byName} performed {$action} on {$document->title}";
        if ($document->user_id && $document->user_id !== $user->id) {
            $notify[] = ['user_id' => $document->user_id, 'type' => 'document.comment', 'data' => ['message' => $message, 'document_id' => $document->id, 'comment_by' => $user->id, 'url' => route('documents.show', $document->id)]];
            $pushed[] = $document->user_id;
        }
        $otherCommenters = $document->commenters()->where('user_id', '!=', $user->id)->pluck('users.id')->toArray();
        foreach ($otherCommenters as $uid) {
            if (in_array($uid, $pushed)) continue;
            $notify[] = ['user_id' => $uid, 'type' => 'document.comment', 'data' => ['message' => $message, 'document_id' => $document->id, 'comment_by' => $user->id, 'url' => route('documents.show', $document->id)]];
            $pushed[] = $uid;
        }
        $otherEditors = $document->editors()->where('user_id', '!=', $user->id)->pluck('users.id')->toArray();
        foreach ($otherEditors as $uid) {
            if (in_array($uid, $pushed)) continue;
            $notify[] = ['user_id' => $uid, 'type' => 'document.comment', 'data' => ['message' => $message, 'document_id' => $document->id, 'comment_by' => $user->id, 'url' => route('documents.show', $document->id)]];
            $pushed[] = $uid;
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

    // Show available backups for a document
    public function backups(Document $document)
    {
        $user = Auth::user();
        // only uploader or superadmin may view backups
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);

        $disk = Storage::disk('local');
        $files = $disk->files('documents/backups');
        // filter backups that end with the document filename
        $basename = basename($document->file_path);
        $matches = array_filter($files, function($f) use ($basename) {
            return str_ends_with($f, '-' . $basename) || str_ends_with($f, '/' . $basename) || $f === 'documents/backups/' . $basename;
        });

        // sort newest first
        usort($matches, function($a, $b) use ($disk) { return $disk->lastModified($b) <=> $disk->lastModified($a); });

        return view('documents.backups', ['document' => $document, 'backups' => $matches]);
    }

    // Restore a selected backup over the active document file
    public function restoreBackup(Request $request, Document $document)
    {
        $user = Auth::user();
        if ($user->id !== $document->user_id && $user->role !== 'superadmin') abort(403);

        $data = $request->validate([
            'backup' => 'required|string'
        ]);

        $disk = Storage::disk('local');
        $backup = $data['backup'];
        if (! $disk->exists($backup)) {
            return back()->withErrors(['backup' => 'Selected backup not found.']);
        }

        $targetRel = 'documents/' . basename($document->file_path);
        // overwrite active file
        try {
            $disk->copy($backup, $targetRel);
            ActivityTracker::logDocumentUpdate($document->id, 'backup_restored', ['user_id' => $user->id, 'backup' => storage_path('app/' . $backup)]);
            return redirect()->route('documents.show', $document->id)->with('success', 'Backup restored.');
        } catch (\Exception $e) {
            ActivityTracker::logSystem('document', 'backup_restore_error', 'DocumentController', null, null, ['user_id' => $user->id, 'exception' => $e->getMessage()], 'low', 'Error restoring backup');
            return back()->withErrors(['backup' => 'Unable to restore backup.']);
        }
    }

    public function create()
    {
        $authors = DocumentAuthor::orderBy('last_name')->get();
        $types = DocumentType::orderBy('name')->get();
        $users = \App\Models\User::orderBy('lastName')->get(['id','firstName','middleName','lastName']);
        $user = Auth::user();
        // Only show templates that are global, owned by the user, or exactly match the user's college+program
        $templates = Template::where(function($q) use ($user) {
            $q->whereNull('college')->whereNull('program');
        })->orWhere('user_id', $user->id)
          ->orWhere(function($q) use ($user) {
              $q->where('college', $user->college)->where('program', $user->program);
          })->orderBy('created_at','desc')->get();

        return view('documents.create', compact('authors','types','users','templates'));
    }

    public function store(Request $request)
    {
        $user = Auth::user();

        $data = $request->validate([
            'title' => 'required|string|max:255',
            'document_type_id' => 'nullable|exists:document_types,id',
            'file' => 'required|file|mimes:pdf,doc,docx|max:20480',
            'template_id' => 'nullable|exists:templates,id',
            // formatting fields
            'format_font' => 'nullable|string|in:Times New Roman,Arial,Calibri',
            'line_spacing' => 'nullable|in:single,1.5,double',
            'margin_preset' => 'nullable|in:thesis,default,custom',
            'margin_top' => 'nullable|numeric',
            'margin_bottom' => 'nullable|numeric',
            'margin_left' => 'nullable|numeric',
            'margin_right' => 'nullable|numeric',
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
        $data['template_id'] = $request->input('template_id') ?: null;
        // Formatting options removed from document uploader — templates provide authoritative format rules.
        // If uploaded file is DOCX, require a chosen template
        $uploadedFile = $request->file('file');
        if ($uploadedFile && strtolower($uploadedFile->getClientOriginalExtension()) === 'docx' && empty($data['template_id'])) {
            return back()->withErrors(['template_id' => 'Please select a template when uploading a DOCX file.'])->withInput();
        }
        $data['college'] = $user->college;
        $data['program'] = $user->program;
        // default status pending
        $data['status'] = 'pending';

        // For DOCX uploads, ensure a template is selected and that the template provides format metadata.
        $uploadedFile = $request->file('file');
        if ($uploadedFile && strtolower($uploadedFile->getClientOriginalExtension()) === 'docx') {
            $chosen = Template::find($data['template_id']);
            if (! $chosen) {
                return back()->withErrors(['template_id' => 'Selected template not found.'])->withInput();
            }
            // enforce that chosen template matches uploader's college/program (unless template is global/null)
            if (($chosen->college !== null && $chosen->college !== $user->college) || ($chosen->program !== null && $chosen->program !== $user->program)) {
                return back()->withErrors(['template_id' => 'Selected template does not match your college/program.'])->withInput();
            }
            // require template to include authoritative format_rules since reformatting depends on them
            if (empty($chosen->format_rules) || !is_array($chosen->format_rules)) {
                return back()->withErrors(['template_id' => 'Selected template does not include required formatting metadata. Please choose a template with formatting metadata.'])->withInput();
            }
            // mark status to reflect automated reformat will run
            $data['status'] = 'pending_formatting';
        }

        // store uploaded file now that validation passed (or for non-DOCX files)
        if ($request->hasFile('file')) {
            $uploaded = $request->file('file')->store('documents');
            $data['file_path'] = basename($uploaded);
            $data['file_type'] = $request->file('file')->getClientMimeType();
        } else {
            $data['file_path'] = 'sample-document.pdf';
        }

        // Queue formatting job: conversion + formatting will run in background

        $document = Document::create($data);

        // Dispatch background formatting job for DOCX/converted uploads
        try {
            $queueDriver = config('queue.default', env('QUEUE_CONNECTION', 'sync'));
            FormatDocument::dispatch($document->id);
            // If this upload selected a template (DOCX) mark as queued so UI shows job state,
            // but only when using a real queue driver (not 'sync')
            $uploadedExt = $request->file('file') ? strtolower($request->file('file')->getClientOriginalExtension()) : strtolower(pathinfo($document->file_path, PATHINFO_EXTENSION));
            if ($queueDriver !== 'sync' && $uploadedExt === 'docx' && $document->template_id) {
                $document->update(['status' => 'formatting_queued']);
            }
            // notify uploader that formatting was queued
            $notify = [['user_id' => $user->id, 'type' => 'document.formatting_queued', 'data' => ['message' => 'Formatting has been queued for your document', 'document_id' => $document->id, 'url' => route('documents.show', $document->id)]]];
            ActivityTracker::logDocumentUpdate($document->id, 'formatting_queued', ['user_id' => $user->id, 'notify' => $notify]);
        } catch (\Throwable $e) {
            ActivityTracker::logSystem('document', 'format_queue_error', 'DocumentController', null, null, ['user_id' => $user->id, 'exception' => $e->getMessage()], 'low', 'Failed to queue formatting job');
        }

        // If no commenters were assigned at upload, set a clear UI status
        // but preserve any formatting-related status set above (queued/processing/failed/pending_formatting)
        $currentStatus = $document->status ?? null;
        $formattingStates = ['pending_formatting','formatting_queued','formatting_processing','formatting_failed'];
        $isFormattingState = in_array($currentStatus, $formattingStates, true);

        if ($document->commenters()->count() === 0) {
            if (! $isFormattingState) {
                $document->update(['status' => 'no_reviewers_assigned']);
            }
        } else {
            // if commenters exist and the status isn't already a special formatting state, mark as pending
            if (! $isFormattingState) {
                $document->update(['status' => 'pending']);
            }
        }

        // If there was validation feedback, persist it as a comment
        if (!empty($data['_validation_feedback'])) {
            \App\Models\Comment::create([
                'document_id' => $document->id,
                'user_id' => $user->id,
                'content' => $data['_validation_feedback'],
                'action' => (strpos(strtolower($data['_validation_feedback']), 'passed') !== false) ? null : 'reject'
            ]);
        }

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
        ActivityTracker::logDocumentCreate($document->id, $data['title'], null, $data['college'], $data['program']);

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

        // Check access by college/program roles (single-campus deployment)
        if ($user->role === 'dean' && ($document->college !== $user->college)) {
            abort(403);
        } elseif ($user->role === 'program_head' && ($document->college !== $user->college || $document->program !== $user->program)) {
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
