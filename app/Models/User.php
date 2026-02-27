<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Models\College;
use App\Models\Program;

/**
 * App\Models\User
 *
 * @property int $id
 * @property string $firstName
 * @property string $lastName
 * @property string|null $middleName
 * @property string $email
 * @property \Illuminate\Support\Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $role
 * @property string|null $contactNumber
 * @property string|null $address
 * @property string|null $rank
 * @property string|null $college
 * @property string|null $program
 * @property string|null $status
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 */

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'firstName',
        'lastName',
        'middleName',
        'email',
        'password',
        'role',
        'contactNumber',
        'address',
        'rank',
        'college',
        'program',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function campusModel()
    {
        return null;
    }

    public function collegeModel()
    {
        return $this->belongsTo(College::class, 'college', 'name');
    }

    public function programModel()
    {
        return $this->belongsTo(Program::class, 'program', 'name');
    }

    public function comments()
    {
        return $this->hasMany(\App\Models\Comment::class);
    }
}
