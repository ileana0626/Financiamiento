<?php

namespace App;

use App\File;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','departamento'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $appends = ['fullname'];

    public function getFullNameAttribute()
    {
        return "{$this->Nombre} {$this->Apaterno} {$this->Amaterno}";
    }

    public function roles(){
        return $this->belongsToMany(Rol::class, 'usuario_rol', 'idUsuario', 'idRol');
    }

    public function getIdDPTO(){
        return $this->departamento;
    }


    public function file()
    {
        return $this->belongsTo(File::class , 'file_id');
    }
}
