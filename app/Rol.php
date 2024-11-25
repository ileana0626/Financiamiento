<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rol extends Model
{
    use HasFactory;

    protected $table = 'cat_rol'; // La tabla en BD
    protected $primaryKey = 'idRol'; // Clave primaria personalizada

    protected $fillable = [
        'idRol', // campos relevantes
        'slug',
        'nombre'
    ];

    public function users(){
        return $this->belongsToMany(User::class, 'usuario_rol', 'idRol', 'idUsuario');
    }
}
