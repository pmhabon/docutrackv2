<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property int $id
 * @property int $user_id
 * @property int|null $document_id
 * @property string $original_name
 * @property string $stored_name
 * @property string $file_path
 * @property string $mime_type
 * @property int $file_size
 * @property string|null $campus
 * @property string|null $college
 * @property string|null $program
 * @property string $status
 * @property string|null $metadata
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
class FileUpload extends Model
{
    protected $fillable = [
        'user_id',
        'document_id',
        'original_name',
        'stored_name',
        'file_path',
        'mime_type',
        'file_size',
        'campus',
        'college',
        'program',
        'status',
        'metadata',
    ];

    protected $casts = [
        'metadata' => 'json',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function document(): BelongsTo
    {
        return $this->belongsTo(Document::class);
    }
}
