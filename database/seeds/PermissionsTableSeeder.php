<?php

use App\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::create([
            'name' => 'Navegar Usuarios',
            'slug' => 'usuario.index'
        ]);
        Permission::create([
            'name' => 'Crear Usuarios',
            'slug' => 'usuario.crear'
        ]);
        Permission::create([
            'name' => 'Editar Usuarios',
            'slug' => 'usuario.editar'
        ]);
        Permission::create([
            'name' => 'Ver Usuarios',
            'slug' => 'usuario.ver'
        ]);
        Permission::create([
            'name' => 'Activar Usuarios',
            'slug' => 'usuario.activar'
        ]);
        Permission::create([
            'name' => 'Desactivar Usuarios',
            'slug' => 'usuario.desactivar'
        ]);
        Permission::create([
            'name' => 'Navegar Usuarios',
            'slug' => 'rol.index'
        ]);
    }
}
