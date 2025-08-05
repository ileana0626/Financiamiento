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
    /**Nuevo registro de solicitudes */
    Route::post('/administracion/solicitud/setRegistrarRequi','Administracion\SolicitudController@setRegistrarRequi');
    Route::post('/administracion/solicitud/setRegistrarMemo','Administracion\SolicitudController@setRegistrarMemo');

    
    // Calculos de Prerrogativas Partidos Politicos
    Route::post('/administracion/solicitud/setRegistrarCalculo','Administracion\SolicitudController@setRegistrarCalculo');
    Route::get('/administracion/solicitud/getCalculosFinanciamiento','Administracion\SolicitudController@getCalculosFinanciamiento');
    Route::get('/administracion/solicitud/exportarCalculosFinanciamientoExcel/{id}', 'Administracion\SolicitudController@exportarCalculosFinanciamientoExcel');

    
    Route::post('/administracion/solicitud/setRegistrarOficio','Administracion\SolicitudController@setRegistrarOficio');
    Route::post('/administracion/solicitud/setRegistrarCircular','Administracion\SolicitudController@setRegistrarCircular');
    Route::post('/administracion/solicitud/setRegistrarExtra','Administracion\SolicitudController@setRegistrarExtra');
    Route::post('/administracion/solicitud/setRegistrarCopiaCon','Administracion\SolicitudController@setRegistrarCopiaCon');
    Route::get('/administracion/solicitud/getAllByType','Administracion\SolicitudController@getAllByType');
    Route::get('/administracion/solicitud/getDatosById','Administracion\SolicitudController@getDatosById');
    Route::get('/administracion/solicitud/getArchivoById','Administracion\SolicitudController@getArchivoById');
    Route::get('/administracion/solicitud/getCopiasById','Administracion\SolicitudController@getCopiasById');
    Route::get('/administracion/solicitud/getCopiasCon','Administracion\SolicitudController@getCopiasCon');
    Route::get('/administracion/solicitud/getSeguimiento','Administracion\SolicitudController@getSeguimiento');
    Route::post('/administracion/solicitud/setGuardaContestacion','Administracion\SolicitudController@setGuardaContestacion');
    Route::post('/administracion/solicitud/setUpdateEstatus','Administracion\SolicitudController@setUpdateEstatus');
    Route::post('/administracion/solicitud/setEnteradoCopia','Administracion\SolicitudController@setEnteradoCopia');
    /**Actualización de solicitudes */
    Route::post('/administracion/solicitud/setUpdateCaptura','Administracion\SolicitudController@setUpdateCaptura');
    Route::post('/administracion/solicitud/setUpdateCopias','Administracion\SolicitudController@setUpdateCopias');
    /**Historial solicitudes */
    Route::get('/administracion/solicitud/getAnios','Administracion\SolicitudController@getAnios');
    Route::get('/administracion/solicitud/getHistorial','Administracion\SolicitudController@getHistorial');
    Route::get('/administracion/solicitud/reporteMensualPDF', 'Administracion\SolicitudController@reporteMensualPDF');
    Route::get('/administracion/solicitud/reporteMensualExcel', 'Administracion\SolicitudController@reporteMensualExcel');
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
    Route::get('/administracion/birthday/getTodayDates','Administracion\BirthdayController@getTodayDates');

    /*****SUBIR ARCHIVO *****/
    Route::post('/archivos/subirArchivo', 'FileController@subirArchivo');
    Route::post('/archivos/subirArchivoSolicitud', 'FileController@subirArchivoSolicitud');
    Route::post('/archivos/subirArchivoContestacion', 'FileController@subirArchivoContestacion');

    /**Validación de acceso para una ruta con id de usuario */
    Route::get('/administracion/admin/isUserValid','Administracion\AdminController@isUserValid');

    /**Mi Perfil */
    Route::get('/administracion/usuario/getDatosPersonalesById','Administracion\UsersController@getDatosPersonalesById');
    Route::post('/administracion/usuario/setDatosPersonalesFormById', 'Administracion\UsersController@setDatosPersonalesFormById');
    Route::post('/archivos/setSubirFP','FileController@setSubirFP');
    Route::post('/administracion/usuario/setUpdatePass','Administracion\UsersController@setUpdatePass');

    /**Usuarios */
    Route::get('/administracion/admin/validUserToEdit','Administracion\AdminController@validUserToEdit');
    Route::get('/administracion/usuario/getRoles','Administracion\UsersController@getRoles');
    Route::get('/administracion/usuario/getDepartamentos','Administracion\UsersController@getDepartamentos');
    Route::get('/administracion/usuario/getDatosRolById','Administracion\UsersController@getDatosRolById');
    Route::post('/administracion/usuario/setRegistrarUser','Administracion\UsersController@setRegistrarUser');
    Route::post('/administracion/usuario/setCambiarEstadoById','Administracion\UsersController@setCambiarEstadoById');
    Route::post('/administracion/usuario/setUpdateDatosRolById', 'Administracion\UsersController@setUpdateDatosRolById');
    Route::post('/administracion/usuario/setReestablecerPass','Administracion\UsersController@setReestablecerPass');

    /****Editar****/
    Route::get('/administracion/usuario/obtenerSolicitud','Administracion\UsersController@obtenerSolicitud');
    Route::get('/administracion/usuario/obtenerCopiasConocimiento','Administracion\UsersController@obtenerCopiasConocimiento');
    Route::post('/administracion/usuario/editarSolicitud','Administracion\UsersController@editarSolicitud');

    /***Correo***/
    Route::get('send-mail', 'Auth\ResetPasswordController@sendMailPass'); 

    /**Recordatorio */
    Route::post('/administracion/solicitud/setUpdateRecordatorio','Administracion\SolicitudController@setUpdateRecordatorio');
    Route::post('/administracion/solicitud/sendNavNotify','Administracion\SolicitudController@sendNavNotify');
    
    /***Captura v2***/
    Route::get('/administracion/usuario/getTipoDic','Administracion\UsersController@getTipoDic');
    Route::get('/administracion/usuario/getAnioFiscal','Administracion\UsersController@getAnioFiscal');
    Route::get('/administracion/usuario/getCapitulo','Administracion\UsersController@getCapitulo');
});

Route::get('/{optional?}', function () {
    return view('app');
})->name('basepath')
    ->where('optional', '.*');
