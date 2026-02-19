<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class DocumentPart extends Model
{
    protected $fillable = ['document_id','title','description','order'];

    public function document(): BelongsTo
    {
        return $this->belongsTo(Document::class);
    }

    public function contents(): HasMany
    {
        return $this->hasMany(PartContent::class, 'document_part_id');
    }
}
