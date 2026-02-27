<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string $code
 * @property int|null $campus_id
 * @property string|null $description
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 */
class College extends Model
{
    protected $fillable = ['name', 'code', 'description'];

    public function programs()
    {
        return $this->hasMany(Program::class);
    }

    public function campus()
    {
        return $this->belongsTo(Campus::class, 'campus_id');
    }
}
