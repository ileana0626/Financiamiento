<?php

namespace App\Http\Controllers\Administracion;

use App\Events\Logout;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class UsersController extends Controller
{
    public function getListarRolPermisosByUsuario(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $nIdUsuario = $request->nIdUsuario;

        if (!$nIdUsuario) {
            $nIdUsuario = Auth::id();
        }

        $nIdUsuario   = ($nIdUsuario == NULL) ? ($nIdUsuario = 0) : $nIdUsuario;

        try {
            $rpta =  DB::select('call sp_Usuario_getListarRolPermisosByUsuario( ? )', [$nIdUsuario]);

            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getCurrentTime(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        
        try {
            $rpta = DB::select('call sp_getCurrentTime');
        
            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function consultarUsuario(Request $request) {
        if ( !$request->ajax())  return redirect('/');

        $user = $request->user;
        $mail = $request->mail;

        $user = ( $user == NULL ) ? '' : $user;
        $mail = ( $mail == NULL ) ? '' : $mail;
        
        $rpta = DB::select('call sp_Consultar_Usuairo( ?, ? )', [ $user, $mail]);
            return $rpta;
    }

    public function getTotalIntentos(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $usrTel = $request->usrTel;

        $usrTel = ($usrTel == NULL) ? '' : $usrTel;

        try {
            $rpta = DB::select('call sp_Usuario_GetTotalIntentos( ? )', [$usrTel]);
        
            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function SetTotalIntentos(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $valor = $request->valor;
        $usrTel = $request->usrTel;

        try {
            $rpta = DB::select('call sp_Usuario_SetTotalIntentos( ? , ? )', [$valor, $usrTel]);
            
            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }


    public function logout(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $userName = $request->userName;

        $userName = ($userName == NULL) ? ($userName = '') : $userName;

        try {
            $rpta = DB::select('call sp_Usuario_getIdUsuario( ? )', [$userName]);

            if ($rpta) {
                $id = $rpta[0]->id;
                if ($id != '') {
                    broadcast(new Logout($id));
                }
            }
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function setInterfaceSettings(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $watermarkValue = $request->watermarkValue;

        try {
            $rpta = DB::transaction(function () use (
                $watermarkValue
            ) {
                return DB::select(
                    'call sp_setInterfaceSettings(?)',
                    [
                        $watermarkValue
                    ]
                );
            }, 3);
            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
        }
    }

    public function getUsuario(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $nidusuario =  Auth::id();
        $cnombre = $request->cNombre;
        $cusuario = $request->cUsuario;
        $cestado = $request->cestado;

        $cnombre = ($cnombre == NULL) ? ($cnombre = '') : $cnombre;
        $cusuario = ($cusuario == NULL) ? ($cusuario = '') : $cusuario;
        $cestado = ($cestado == NULL) ? ($cestado = '') : $cestado;

        try {
            $rpta =  DB::select('call sp_Usuario_getListarUsuarios( ? ,  ? , ? , ? )', [$nidusuario, $cnombre, $cusuario, $cestado]);

            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function consultarRolUsuario(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $idUsuario = $request->idUsuario;

        $idUsuario = ($idUsuario == NULL) ? 0 : $idUsuario;

        try {
            $rpta = DB::select('call sp_ConsultarRolUsuario( ? )', [$idUsuario]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function obtenerDatos(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $tipo = $request->tipo;

        $tipo = ($tipo == NULL) ? 0 : $tipo;

        try {
            $rpta = DB::select('call sp_ConsultarDatos( ? )', [$tipo]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getFechasPeriodos(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        try {
            $rpta = DB::select('call sp_Periodos_getFechas( )');

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getSolocitudes(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        try {
            $rpta = DB::select('call sp_listarSolicitudes( )');

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function registrar(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $tipo = $request->tipo;
        $nombre = $request->nombre;

        $tipo = ($tipo == NULL) ? 0 : $tipo;
        $nombre = ($nombre == NULL) ? '' : $nombre;

        try {
            $rpta = DB::select('call sp_Registrar_Datos( ?, ? )', [ $nombre, $tipo ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function editar(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $tipo = $request->tipo;
        $id = $request->id;
        $nombre = $request->nombre;

        $tipo = ($tipo == NULL) ? 0 : $tipo;
        $id = ($id == NULL) ? 0 : $id;
        $nombre = ($nombre == NULL) ? '' : $nombre;

        try {
            $rpta = DB::select('call sp_ActualizarCatalogos( ?, ? , ?)', [  $tipo, $id, $nombre ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
}
