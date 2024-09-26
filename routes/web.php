<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::post('/authenticate/login', 'Auth\LoginController@login'); 
Route::get('/administracion/usuario/getTotalIntentos', 'Administracion\UsersController@getTotalIntentos'); 
Route::get('/administracion/usuario/consultarUsuario', 'Administracion\UsersController@consultarUsuario'); 
Route::post('/administracion/usuario/setTotalIntentos', 'Administracion\UsersController@SetTotalIntentos'); 
Route::post('/administracion/usuario/logout', 'Administracion\UsersController@logout'); 
Route::post('/administracion/usuario/setInterfaceSettings', 'Administracion\UsersController@setInterfaceSettings'); 

Route::get('/administracion/usuario/getCurrentTime', 'Administracion\UsersController@getCurrentTime'); 
Route::get('/administracion/usuario/getSaludoInicio', 'Administracion\UsersController@getSaludoInicio'); 

Route::group(['middleware' => ['auth']], function () {

    Route::post('/authenticate/logout', 'Auth\LoginController@logout');
    Route::get('/authenticate/getRefrescarUsuarioAutentucado', function () {
        return Auth::user()->load('file');
    });

    Route::get('/administracion/usuario/getListarRolPermisosByUsuario', 'Administracion\UsersController@getListarRolPermisosByUsuario');
    Route::get('/administracion/usuario/getListarAllUsers', 'Administracion\UsersController@getListarAllUsers');
    Route::get('/administracion/usuario/getUsuario', 'Administracion\UsersController@getUsuario');
    Route::get('/administracion/usuario/consultarRolUsuario', 'Administracion\UsersController@consultarRolUsuario');

    /****CODI****/  
    /*****Registro de Solicitudes*****/
    Route::get('/administracion/usuario/obtenerDatos', 'Administracion\UsersController@obtenerDatos');
    Route::post('/administracion/usuario/guardarSolicitud', 'Administracion\UsersController@guardarSolicitud');
    Route::post('/administracion/usuario/guardarCopiasConocimiento', 'Administracion\UsersController@guardarCopiasConocimiento');
    /*****CALENDARIO*****/
    Route::get('/administracion/usuario/getFechasPeriodos', 'Administracion\UsersController@getFechasPeriodos');
    /*****Lista de Solicitudes*****/
    Route::get('/administracion/usuario/getSolicitudes', 'Administracion\UsersController@getSolicitudes');
    Route::post('/administracion/usuario/CopiaEnterado', 'Administracion\UsersController@CopiaEnterado');
    Route::post('/administracion/usuario/todosEnteradoConcluido', 'Administracion\UsersController@todosEnteradoConcluido');
    /*****Catalogos *****/
    Route::post('/administracion/usuario/registrar', 'Administracion\UsersController@registrar');
    Route::post('/administracion/usuario/editar', 'Administracion\UsersController@editar');
    Route::get('/administracion/usuario/consultarRegistros', 'Administracion\UsersController@consultarRegistros');
    Route::post('/administracion/usuario/desactivar', 'Administracion\UsersController@desactivar');
    /*****CAMBIAR ESTATUS SOLICITUD*****/ 
    Route::post('/administracion/usuario/archivoContestacion', 'Administracion\UsersController@archivoContestacion');

    /****CUMPLEAÑOS****/
    Route::get('/administracion/usuario/getbirthday', 'Administracion\UsersController@getbirthday');
    Route::post('/administracion/usuario/guardarBirthday', 'Administracion\UsersController@guardarBirthday');
    Route::post('/administracion/usuario/EditarBirthday', 'Administracion\UsersController@EditarBirthday');

    /*****SUBIR ARCHIVO *****/
    Route::post('/archivos/subirArchivo', 'FileController@subirArchivo');

    /**Validación de acceso para una ruta con id de usuario */
    Route::get('/administracion/admin/isUserValid','Administracion\AdminController@isUserValid');

    /**Mi Perfil */
    Route::get('/administracion/usuario/getDatosPersonalesById','Administracion\UsersController@getDatosPersonalesById');
    Route::post('/administracion/usuario/setDatosPersonalesFormById', 'Administracion\UsersController@setDatosPersonalesFormById');
    Route::post('/archivos/setSubirFP','FileController@setSubirFP');
    Route::post('/administracion/usuario/setUpdatePass','Administracion\UsersController@setUpdatePass');

    /**Usuarios */
    Route::get('/administracion/usuario/getRoles','Administracion\UsersController@getRoles');
    Route::get('/administracion/usuario/getDepartamentos','Administracion\UsersController@getDepartamentos');
    Route::post('/administracion/usuario/setRegistrarUser','Administracion\UsersController@setRegistrarUser');
    Route::post('/administracion/usuario/setCambiarEstadoById','Administracion\UsersController@setCambiarEstadoById');

    /****Editar****/
    Route::get('/administracion/usuario/obtenerSolicitud','Administracion\UsersController@obtenerSolicitud');
    Route::get('/administracion/usuario/obtenerCopiasConocimiento','Administracion\UsersController@obtenerCopiasConocimiento');
    Route::post('/administracion/usuario/editarSolicitud','Administracion\UsersController@editarSolicitud');

    /***Correo***/
    Route::get('send-mail', 'Auth\ResetPasswordController@sendMailPass'); 
});

Route::get('/{optional?}', function () {
    return view('app');
})->name('basepath')
    ->where('optional', '.*');
