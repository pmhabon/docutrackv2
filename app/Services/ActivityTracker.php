<?php

namespace App\Services;

use App\Models\ActivityLog;
use App\Models\SystemLog;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;

/**
 * Service for tracking user activities and system logs
 */
class ActivityTracker
{
    /**
     * Log user activity
     */
    public static function log(string $action, string $details = '', ?string $campus = null, ?string $college = null, ?string $program = null): ActivityLog
    {
        $user = Auth::user();

        return ActivityLog::create([
            'user_id' => $user?->id,
            'action' => $action,
            'details' => $details,
            'college' => $college ?? $user?->college,
            'program' => $program ?? $user?->program,
            'ip' => Request::ip(),
            'user_agent' => Request::userAgent(),
        ]);
    }

    /**
     * Log system event with model changes
     */
    public static function logSystem(
        string $eventType,
        string $action,
        ?string $modelType = null,
        ?int $modelId = null,
        ?array $oldValues = null,
        ?array $newValues = null,
        string $severity = 'low',
        ?string $description = null
    ): SystemLog {
        $user = Auth::user();

        return SystemLog::create([
            'user_id' => $user?->id,
            'event_type' => $eventType,
            'action' => $action,
            'model_type' => $modelType,
            'model_id' => $modelId,
            'old_values' => $oldValues,
            'new_values' => $newValues,
            'ip_address' => Request::ip(),
            'user_agent' => Request::userAgent(),
            'description' => $description,
            'severity' => $severity,
        ]);
    }

    /**
     * Log login activity
     */
    public static function logLogin(): void
    {
        $user = Auth::user();
        self::log('login', "User {$user->firstName} {$user->lastName} logged in");
        self::logSystem('auth', 'login', 'User', $user->id, null, ['email' => $user->email], 'low', "User login from {$user->email}");
    }

    /**
     * Log logout activity
     */
    public static function logLogout(): void
    {
        $user = Auth::user();
        if ($user) {
            self::log('logout', "User {$user->firstName} {$user->lastName} logged out");
            self::logSystem('auth', 'logout', 'User', $user->id, null, null, 'low', "User logout");
        }
    }

    /**
     * Log user registration
     */
    public static function logRegistration(array $userData): void
    {
        self::log('register', "New user registration: {$userData['email']}", $userData['campus'] ?? null, $userData['college'] ?? null, $userData['program'] ?? null);
        self::logSystem('user', 'create', 'User', null, null, $userData, 'medium', "New user registered: {$userData['email']}");
    }

    /**
     * Log document upload/creation
     */
    public static function logDocumentCreate(int $documentId, string $title, ?string $campus = null, ?string $college = null, ?string $program = null): void
    {
        self::log('document_created', "Document created: {$title}", $campus, $college, $program);
        self::logSystem('document', 'create', 'Document', $documentId, null, ['title' => $title], 'low', "Document created: {$title}");
    }

    /**
     * Log document update
     */
    public static function logDocumentUpdate(int $documentId, string $title, array $changes = []): void
    {
        $details = "Document updated: {$title}" . (!empty($changes) ? ' - changes: ' . json_encode($changes) : '');
        self::log('document_updated', $details);
        self::logSystem('document', 'update', 'Document', $documentId, null, $changes, 'low', $details);

        // If notifications requested, persist them to database notifications table
        if (! empty($changes['notify']) && is_array($changes['notify'])) {
            foreach ($changes['notify'] as $notify) {
                try {
                    $payload = $notify['data'] ?? [];

                    // Ensure message and url exist for UI
                    if (! isset($payload['message'])) {
                        $type = $notify['type'] ?? '';
                        if (str_starts_with($type, 'document.commenter') || str_contains($type, 'comment')) {
                            $payload['message'] = "New activity on {$title}";
                        } else {
                            $payload['message'] = $payload['message'] ?? "Notification: {$title}";
                        }
                    }
                    if (! isset($payload['url'])) {
                        $payload['url'] = $payload['url'] ?? route('documents.show', $documentId);
                    }

                    \DB::table('notifications')->insert([
                        'id' => (string) \Illuminate\Support\Str::uuid(),
                        'type' => $notify['type'] ?? 'document.notification',
                        'notifiable_type' => 'App\\Models\\User',
                        'notifiable_id' => $notify['user_id'],
                        'data' => json_encode($payload),
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                } catch (\Exception $e) {
                    // ignore failures
                }
            }
        }
    }

    /**
     * Log document deletion
     */
    public static function logDocumentDelete(int $documentId, string $title): void
    {
        self::log('document_deleted', "Document deleted: {$title}");
        self::logSystem('document', 'delete', 'Document', $documentId, ['title' => $title], null, 'high', "Document deleted: {$title}");
    }

    /**
     * Log user role change
     */
    public static function logRoleChange(int $userId, string $oldRole, string $newRole): void
    {
        self::log('role_changed', "User role changed from {$oldRole} to {$newRole}");
        self::logSystem('user', 'role_change', 'User', $userId, ['role' => $oldRole], ['role' => $newRole], 'high', "User role changed from {$oldRole} to {$newRole}");
    }

    /**
     * Log user status change
     */
    public static function logStatusChange(int $userId, string $oldStatus, string $newStatus): void
    {
        self::log('status_changed', "User status changed from {$oldStatus} to {$newStatus}");
        self::logSystem('user', 'status_change', 'User', $userId, ['status' => $oldStatus], ['status' => $newStatus], 'medium', "User status changed from {$oldStatus} to {$newStatus}");
    }
}
