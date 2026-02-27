<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ActivityLogController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\UserManagementController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\CollegeController;
use App\Http\Controllers\ProgramController;
use App\Http\Controllers\DocumentTypeController;
use App\Http\Controllers\DocumentAuthorController;
use App\Http\Controllers\DocumentPartController;
use App\Http\Controllers\PartContentController;
use App\Http\Controllers\DocumentPageController;

/* Landing */
Route::get('/', function () {
    return view('welcome');
})->name('home');

/* Auth */
Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('auth.store');

Route::get('/register', [AuthController::class, 'showRegister'])->name('register');
Route::post('/register', [AuthController::class, 'register'])->name('auth.register');

Route::post('/logout', [AuthController::class, 'logout'])->name('auth.logout');

/* Google OAuth */
Route::get('/auth/google', [AuthController::class, 'redirectToGoogle'])->name('google.redirect');
Route::get('/auth/google/callback', [AuthController::class, 'handleGoogleCallback'])->name('google.callback');

/* Protected */
Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Dashboard users visibility (available to all authenticated users)
    Route::get('/dashboard/users-visibility', [UserManagementController::class, 'visibility'])->name('dashboard.users.visibility');

    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::put('/profile', [ProfileController::class, 'update'])->name('profile.update');

    Route::get('/activity', [ActivityLogController::class, 'index'])->name('activity.index');

    // Documents
    Route::get('/documents', [DocumentController::class, 'index'])->name('documents.index');
    Route::get('/documents/create', [DocumentController::class, 'create'])->name('documents.create');
    Route::post('/documents', [DocumentController::class, 'store'])->name('documents.store');
    Route::get('/documents/{document}', [DocumentController::class, 'show'])->where('document','[0-9]+')->name('documents.show');
    Route::get('/documents/{document}/formatting-status', [DocumentController::class, 'formattingStatus'])->name('documents.formatting_status');
    Route::delete('/documents/{document}', [DocumentController::class, 'destroy'])->name('documents.destroy');

    // (editor assignment removed; commenter assignment remains)

    // Commenter assignment (uploader or superadmin)
    Route::get('/documents/{document}/commenters', [DocumentController::class, 'commenters'])->name('documents.commenters');
    Route::post('/documents/{document}/commenters', [DocumentController::class, 'updateCommenters'])->name('documents.commenters.update');

    // Editor assignment (uploader or superadmin)
    Route::get('/documents/{document}/editors', [DocumentController::class, 'editors'])->name('documents.editors');
    Route::post('/documents/{document}/editors', [DocumentController::class, 'updateEditors'])->name('documents.editors.update');

    // Editor monitor
    Route::get('/documents/editor-monitor', [DocumentController::class, 'editorMonitor'])->name('documents.editor_monitor');
    // Assigned to me (editors or commenters)
    Route::get('/documents/assigned', [DocumentController::class, 'assignedToMe'])->name('documents.assigned');

    // Notifications
    Route::get('/notifications/{id}/click', [\App\Http\Controllers\NotificationController::class, 'click'])->name('notifications.click');
    Route::get('/notifications', [\App\Http\Controllers\NotificationController::class, 'index'])->name('notifications.index');
    Route::post('/notifications/mark-all-read', [\App\Http\Controllers\NotificationController::class, 'markAllRead'])->name('notifications.mark_all_read');

    // Comments
    Route::post('/documents/{document}/comments', [DocumentController::class, 'storeComment'])->name('documents.comments.store');
    Route::get('/documents/{document}/preview', [DocumentController::class, 'preview'])->name('documents.preview');
    Route::get('/documents/{document}/download', [DocumentController::class, 'download'])->name('documents.download');
    // Backups: list and restore backups created during formatting
    Route::get('/documents/{document}/backups', [DocumentController::class, 'backups'])->name('documents.backups');
    Route::post('/documents/{document}/backups/restore', [DocumentController::class, 'restoreBackup'])->name('documents.backups.restore');

    // Research template management and availability
    Route::get('/templates', [\App\Http\Controllers\TemplateController::class, 'index'])->name('templates.index');
    Route::get('/templates/manage', [\App\Http\Controllers\TemplateController::class, 'manage'])->name('templates.manage');
    Route::post('/templates', [\App\Http\Controllers\TemplateController::class, 'store'])->name('templates.store');
    Route::get('/templates/{template}/download', [\App\Http\Controllers\TemplateController::class, 'download'])->name('templates.download');
    Route::delete('/templates/{template}', [\App\Http\Controllers\TemplateController::class, 'destroy'])->name('templates.destroy');

    // User Management (superadmin only)
    Route::middleware('role:superadmin')->group(function () {
        Route::get('/users', [UserManagementController::class, 'index'])->name('users.index');
        Route::get('/users/create', [UserManagementController::class, 'create'])->name('users.create');
        Route::post('/users', [UserManagementController::class, 'store'])->name('users.store');
        Route::get('/users/{user}', [UserManagementController::class, 'show'])->name('users.show');
        Route::get('/users/{user}/edit', [UserManagementController::class, 'edit'])->name('users.edit');
        Route::put('/users/{user}', [UserManagementController::class, 'update'])->name('users.update');
        Route::post('/users/{user}/deactivate', [UserManagementController::class, 'deactivate'])->name('users.deactivate');
        Route::post('/users/{user}/activate', [UserManagementController::class, 'activate'])->name('users.activate');

        // Settings
        Route::get('/settings', [SettingsController::class, 'index'])->name('settings.index');
        Route::post('/settings', [SettingsController::class, 'update'])->name('settings.update');

        // Campus management removed for single-campus deployment

        // College Management
        Route::get('/colleges', [CollegeController::class, 'index'])->name('colleges.index');
        Route::get('/colleges/create', [CollegeController::class, 'create'])->name('colleges.create');
        Route::post('/colleges', [CollegeController::class, 'store'])->name('colleges.store');
        Route::get('/colleges/{college}/edit', [CollegeController::class, 'edit'])->name('colleges.edit');
        Route::put('/colleges/{college}', [CollegeController::class, 'update'])->name('colleges.update');
        Route::delete('/colleges/{college}', [CollegeController::class, 'destroy'])->name('colleges.destroy');

        // Program Management
        Route::get('/programs', [ProgramController::class, 'index'])->name('programs.index');
        Route::get('/programs/create', [ProgramController::class, 'create'])->name('programs.create');
        Route::post('/programs', [ProgramController::class, 'store'])->name('programs.store');
        Route::get('/programs/{program}/edit', [ProgramController::class, 'edit'])->name('programs.edit');
        Route::put('/programs/{program}', [ProgramController::class, 'update'])->name('programs.update');
        Route::delete('/programs/{program}', [ProgramController::class, 'destroy'])->name('programs.destroy');

        // Formatting history (superadmin only)
        Route::get('/admin/formatting-history', [DashboardController::class, 'formattingHistory'])->name('admin.formatting_history');

    // AJAX endpoints for dependent selects
    Route::get('/ajax/colleges', function (Illuminate\Http\Request $request) {
        $campusId = $request->query('campus_id');
        $cols = \App\Models\College::where('campus_id', $campusId)->orderBy('name')->get(['id','name']);
        return response()->json($cols);
    });

    Route::get('/ajax/programs', function (Illuminate\Http\Request $request) {
        $collegeId = $request->query('college_id');
        $progs = \App\Models\Program::where('college_id', $collegeId)->orderBy('name')->get(['id','name']);
        return response()->json($progs);
    });

    // AJAX: eligible commenters for a document (uploader or superadmin)
    Route::get('/ajax/documents/{document}/eligible-commenters', [DocumentController::class, 'eligibleCommenters'])->name('documents.eligible_commenters');

        // Document management supporting types, authors, parts, pages
        Route::resource('document-types', DocumentTypeController::class);
        Route::resource('document-authors', DocumentAuthorController::class);
        Route::resource('document-parts', DocumentPartController::class);
        Route::resource('part-contents', PartContentController::class);
        Route::resource('document-pages', DocumentPageController::class);
    });

    Route::middleware('role:faculty')->group(function () {
        Route::get('/dashboard/faculty', [DashboardController::class, 'index'])->name('dashboard.faculty');
    });
});

