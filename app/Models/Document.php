<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Document
 *
 * @property int $id
 * @property string $title
 * @property string|null $description
 * @property string $file_path
 * @property string|null $file_type
 * @property int|null $user_id
 * @property string|null $campus
 * @property string|null $college
 * @property string|null $program
 * @property string $status
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 */
class Document extends Model
{
    protected $fillable = [
        'title', 'description', 'file_path', 'file_type', 'user_id', 'campus', 'college', 'program', 'status', 'document_type_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function type()
    {
        return $this->belongsTo(DocumentType::class, 'document_type_id');
    }

    public function authors()
    {
        return $this->belongsToMany(DocumentAuthor::class, 'document_author_document', 'document_id', 'document_author_id')->withTimestamps();
    }

    public function parts()
    {
        return $this->hasMany(DocumentPart::class);
    }

    public function pages()
    {
        return $this->hasMany(DocumentPage::class);
    }

    public function editors()
    {
        return $this->belongsToMany(User::class, 'document_editors', 'document_id', 'user_id')->withTimestamps();
    }

    public function commenters()
    {
        return $this->belongsToMany(User::class, 'document_commenters', 'document_id', 'user_id')->withTimestamps();
    }

    public function comments()
    {
        return $this->hasMany(\App\Models\Comment::class)->latest();
    }
}
