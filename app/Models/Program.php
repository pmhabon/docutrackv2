<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string $code
 * @property int|null $college_id
 * @property string|null $description
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 */
class Program extends Model
{
    protected $fillable = ['name', 'code', 'college_id', 'description'];

    public function college()
    {
        return $this->belongsTo(College::class);
    }
}
