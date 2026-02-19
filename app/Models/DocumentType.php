<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int $id
 * @property string $name
 * @property string|null $code
 * @property string|null $description
 */
class DocumentType extends Model
{
    protected $fillable = ['name','code','description'];

    public function documents(): HasMany
    {
        return $this->hasMany(Document::class, 'document_type_id');
    }
}
