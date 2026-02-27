<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property int $id
 * @property int|null $user_id
 * @property string|null $title
 * @property string $file_path
 * @property string|null $original_name
 * @property string|null $mime_type
 * @property int|null $file_size
 * @property string|null $college
 * @property string|null $program
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
class Template extends Model
{
    protected $fillable = [
        'user_id', 'title', 'file_path', 'original_name', 'mime_type', 'file_size', 'college', 'program', 'format_rules'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    protected $casts = [
        'format_rules' => 'array',
    ];
}
