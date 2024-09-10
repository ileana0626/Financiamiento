<?php

use Illuminate\Http\Request;
use App\Http\Controllers\Administracion\UsersController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('cors')->group(function (){
    // Route::get('/usuario/getUserById' , [UsersController::class, 'getUsuarioById2']);
    Route::get('/administracion/usuario/ConocelesConsultarCandidatoClaveElector' , [UsersController::class, 'ConocelesConsultarCandidatoClaveElector']);
    Route::get('/administracion/usuario/ConocelesConsultarListarCandidatos' , [UsersController::class, 'ConocelesConsultarListarCandidatos']);
    Route::get('/administracion/usuario/ConocelesConsultarEstatus' , [UsersController::class, 'ConocelesConsultarEstatusCandidatos']);
    Route::get('/saludar' , function(){
        return 'a';
    });
});
