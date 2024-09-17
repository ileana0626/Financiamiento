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
        $consulta = $request->consulta;

        $tipo = ($tipo == NULL) ? 0 : $tipo;
        $consulta = ($consulta == NULL) ? 0 : $consulta;

        try {
            $rpta = DB::select('call sp_ConsultarDatos( ?, ? )', [$tipo, $consulta]);

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

    public function getSolicitudes(Request $request)
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

    public function consultarRegistros(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $tipo = $request->tipo;
        $nombre = $request->nombre;

        $tipo = ($tipo == NULL) ? 0 : $tipo;
        $nombre = ($nombre == NULL) ? '' : $nombre;

        try {
            $rpta = DB::select('call sp_Consultar_RegistrosDuplicados( ?, ? )', [  $tipo, $nombre ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $tipo = $request->tipo;
        $id = $request->id;
        $estatus = $request->estatus;

        $tipo = ($tipo == NULL) ? 0 : $tipo;
        $id = ($id == NULL) ? 0 : $id;
        $estatus = ($estatus == NULL) ? '' : $estatus;

        try {
            $rpta = DB::select('call sp_DesactivarRegistros( ?, ? , ?)', [  $tipo, $id, $estatus ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
    
    public function guardarSolicitud(Request $request) 
    {
        if (!$request->ajax())  return redirect('/');

        $numeroConsecutivo = $request->numeroConsecutivo;
        $numeroSolicitud = $request->numeroSolicitud;
        $fechaRecibido = $request->fechaRecibido;
        $remitente = $request->remitente;
        $otroRemitente = $request->otroRemitente;
        $cargo = $request->cargo;
        $otroCargo = $request->otroCargo;
        $asunto = $request->asunto;
        $termino = $request->termino;
        $fechaTermino = $request->fechaTermino;
        $diasTermino = $request->diasTermino;
        $respuesta = $request->respuesta;
        $seguimiento = $request->seguimiento;
        $areaAsignada = $request->areaAsignada;
        $tipo = $request->tipo;
        $fechaAsignacion = $request->fechaAsignacion;
        $estatus = $request->estatus;
        $observaciones = $request->observaciones;
        $idArchivo = $request->idArchivo;

        $numeroConsecutivo = ( $numeroConsecutivo == NULL ) ? 0 : $numeroConsecutivo;
        $numeroSolicitud = ( $numeroSolicitud == NULL ) ? 0 : $numeroSolicitud;
        $fechaRecibido = ( $fechaRecibido == NULL ) ? NULL : $fechaRecibido;
        $remitente = ( $remitente == NULL ) ? 0 : $remitente;
        $otroRemitente = ( $otroRemitente == NULL ) ? NULL : $otroRemitente;
        $cargo = ( $cargo == NULL ) ? 0 : $cargo;
        $otroCargo = ( $otroCargo == NULL ) ? NULL : $otroCargo;
        $asunto = ( $asunto == NULL ) ? 0 : $asunto;
        $termino = ( $termino == NULL ) ? 0 : $termino;
        $fechaTermino = ( $fechaTermino == NULL ) ? NULL : $fechaTermino;
        $diasTermino = ( $diasTermino == NULL ) ? 0 : $diasTermino;
        $respuesta = ( $respuesta == NULL ) ? 0 : $respuesta;
        $seguimiento = ( $seguimiento == NULL ) ? 0 : $seguimiento;
        $areaAsignada = ( $areaAsignada == NULL ) ? 0 : $areaAsignada;
        $tipo = ( $tipo == NULL ) ? 0 : $tipo;
        $fechaAsignacion = ( $fechaAsignacion == NULL ) ? NULL : $fechaAsignacion;
        $estatus = ( $estatus == NULL ) ? 0 : $estatus;
        $observaciones = ( $observaciones == NULL ) ? '' : $observaciones;
        $idArchivo = ( $idArchivo == NULL ) ? NULL : $idArchivo;

        try {
            $rpta = DB::select('call sp_RegistrarSolicitud( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [  $numeroConsecutivo, $numeroSolicitud, $fechaRecibido, $remitente, $otroRemitente, $cargo, $otroCargo, $asunto, $termino, $fechaTermino, $diasTermino, $respuesta, $seguimiento, $areaAsignada, $tipo, $fechaAsignacion, $estatus, $observaciones,$idArchivo]);
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }

    }

    public function archivoContestacion(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $archivoid = $request->archivoid;
        $idsolicitud = $request->idsolicitud;

        $archivoid = ($archivoid == NULL) ? 0 : $archivoid;
        $idsolicitud = ($idsolicitud == NULL) ? 0 : $idsolicitud;

        try {
            $rpta = DB::select('call sp_Solicitudes_Contestacion( ?, ? )', [  $archivoid, $idsolicitud]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getSaludoInicio(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        try {
            $rpta = DB::select('call sp_getSaludoInicio');

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getDatosPersonalesById(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $nId = $request->nId;
        $nId = ($nId == NULL) ? 0 : $nId;

        try {
            $rpta = DB::select('call sp_getDatosPersonalesById(?)',[
                $nId
            ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
}
