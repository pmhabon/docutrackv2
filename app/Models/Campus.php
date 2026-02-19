<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string|null $location
 * @property string|null $description
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 */
class Campus extends Model
{
    protected $fillable = ['name', 'location', 'description'];

    public function colleges()
    {
        return $this->hasMany(College::class);
    }
}
