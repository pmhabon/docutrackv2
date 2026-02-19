<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PartContent extends Model
{
    protected $fillable = ['document_part_id','content','page_number'];

    public function part(): BelongsTo
    {
        return $this->belongsTo(DocumentPart::class, 'document_part_id');
    }
}
