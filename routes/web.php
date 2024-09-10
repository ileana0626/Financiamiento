<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::post('/authenticate/login', 'Auth\LoginController@login'); 
Route::get('/administracion/usuario/getTotalIntentos', 'Administracion\UsersController@getTotalIntentos'); 
Route::get('/administracion/usuario/consultarUsuario', 'Administracion\UsersController@consultarUsuario'); 
Route::get('send-mail', 'Auth\ResetPasswordController@sendMailPass'); 
Route::post('/administracion/usuario/setTotalIntentos', 'Administracion\UsersController@SetTotalIntentos'); 
Route::post('/administracion/usuario/logout', 'Administracion\UsersController@logout'); 
Route::post('/administracion/usuario/setInterfaceSettings', 'Administracion\UsersController@setInterfaceSettings'); 

Route::get('/administracion/usuario/getCurrentTime', 'Administracion\UsersController@getCurrentTime'); 

Route::group(['middleware' => ['auth']], function () {

    Route::post('/authenticate/logout', 'Auth\LoginController@logout');
    Route::get('/authenticate/getRefrescarUsuarioAutentucado', function () {
        return Auth::user()->load('file');
    });

    Route::get('/administracion/usuario/getListarRolPermisosByUsuario', 'Administracion\UsersController@getListarRolPermisosByUsuario');
    Route::get('/administracion/usuario/getUsuario', 'Administracion\UsersController@getUsuario');
    Route::get('/administracion/usuario/consultarRolUsuario', 'Administracion\UsersController@consultarRolUsuario');

    /****CODI****/  
    /*****Registro de Solicitudes*****/
    Route::get('/administracion/usuario/obtenerDatos', 'Administracion\UsersController@obtenerDatos');
    /*****CALENDARIO*****/
    Route::get('/administracion/usuario/getFechasPeriodos', 'Administracion\UsersController@getFechasPeriodos');
    /*****Lista de Solicitudes*****/
    Route::get('/administracion/usuario/getSolocitudes', 'Administracion\UsersController@getSolocitudes');
    /*****Catalogos *****/
    Route::post('/administracion/usuario/registrar', 'Administracion\UsersController@registrar');
    Route::post('/administracion/usuario/editar', 'Administracion\UsersController@editar');

});

Route::get('/{optional?}', function () {
    return view('app');
})->name('basepath')
    ->where('optional', '.*');
