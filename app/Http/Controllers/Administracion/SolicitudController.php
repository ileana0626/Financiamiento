<?php

namespace App\Http\Controllers\Administracion;

use App\Events\Logout;
use App\Events\NavNotify;
use App\Events\Testear;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class SolicitudController extends Controller
{
    public function setRegistrarRequi(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $nTipo = $request->nTipo;
        $nCapitulo = $request->nCapitulo;
        $nFolio = $request->nFolio;
        $fRecibido = $request->fRecibido;
        $hRecibido = $request->hRecibido;
        $nAreaSolicita = $request->nAreaSolicita;
        $nAsignacion = $request->nAsignacion;
        $nIdArchivo = $request->nIdArchivo;
        $jsonSeguimiento = $request->jsonSeguimiento;
        $fAccion = $request->fAccion;

        $nIdUsuario = $request->nIdUsuario;

        if (!$nIdUsuario) {
            $nIdUsuario = Auth::id();
        }

        DB::beginTransaction();
        try {
            $rpta =  DB::select('call sp_Solicitud_setRegistrarRequi( ?,?,?,?,?,?,?,?,?,?,? )', [
                $nTipo,
                $nCapitulo,
                $nFolio,
                $fRecibido,
                $hRecibido,
                $nAreaSolicita,
                $nAsignacion,
                $nIdArchivo,
                $jsonSeguimiento,
                $fAccion,
                $nIdUsuario
            ]);

            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function setRegistrarMemo(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nTipo = $request->nTipo;
        $nAreaSolicita = $request->nAreaSolicita;
        $nMemo = $request->nMemo;
        $cAsunto = $request->cAsunto;
        $fRecibido = $request->fRecibido;
        $hRecibido = $request->hRecibido;
        $nTermino = $request->nTermino;
        $fTermino = $request->fTermino;
        $nAsignacion = $request->nAsignacion;
        $nRespuesta = $request->nRespuesta;
        $nIdArchivo = $request->nIdArchivo;
        $jsonSeguimiento = $request->jsonSeguimiento;
        $nIdAuth = $request->nIdAuth;
        $fAccion = $request->fAccion;

        $fTermino = ($fTermino == NULL) ? NULL : $fTermino;
        $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            $rpta =  DB::select('call sp_Solicitud_setRegistrarMemo( ?,?,?,?,?,?,?,?,?,?,?,?,?,? )', [
                $nTipo,
                $nAreaSolicita,
                $nMemo,
                $cAsunto,
                $fRecibido,
                $hRecibido,
                $nTermino,
                $fTermino,
                $nAsignacion,
                $nRespuesta,
                $nIdArchivo,
                $jsonSeguimiento,
                $nIdAuth,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function setRegistrarOficio(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nTipo = $request->nTipo;
        $nOficio = $request->nOficio;
        $cRemitente = $request->cRemitente;
        $cCargo = $request->cCargo;
        $cAsunto = $request->cAsunto;
        $nTermino = $request->nTermino;
        $fTermino = $request->fTermino;
        $nAsignacion = $request->nAsignacion;
        $fRecibido = $request->fRecibido;
        $hRecibido = $request->hRecibido;
        $nIdArchivo = $request->nIdArchivo;
        $jsonSeguimiento = $request->jsonSeguimiento;
        $nIdAuth = $request->nIdAuth;
        $fAccion = $request->fAccion;

        $fTermino = ($fTermino == NULL) ? NULL : $fTermino;
        $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            $rpta =  DB::select('call sp_Solicitud_setRegistrarOficio( ?,?,?,?,?,?,?,?,?,?,?,?,?,? )', [
                $nTipo,
                $nOficio,
                $cRemitente,
                $cCargo,
                $cAsunto,
                $nTermino,
                $fTermino,
                $nAsignacion,
                $fRecibido,
                $hRecibido,
                $nIdArchivo,
                $jsonSeguimiento,
                $nIdAuth,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }        
    }

    public function setRegistrarCircular(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nTipo = $request->nTipo;
        $fRecibido = $request->fRecibido;
        $hRecibido = $request->hRecibido;
        $nAreaEmite = $request->nAreaEmite;
        $cAsunto = $request->cAsunto;
        $nIdArchivo = $request->nIdArchivo;
        $jsonSeguimiento = $request->jsonSeguimiento;
        $nIdAuth = $request->nIdAuth;
        $fAccion = $request->fAccion;

        $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            $rpta =  DB::select('call sp_Solicitud_setRegistrarCircular( ?,?,?,?,?,?,?,?,? )', [
                $nTipo,
                $fRecibido,
                $hRecibido,
                $nAreaEmite,
                $cAsunto,
                $nIdArchivo,
                $jsonSeguimiento,
                $nIdAuth,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }        
    }

    public function setRegistrarExtra(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nTipo = $request->nTipo;
        $nAreaSolicita = $request->nAreaSolicita;
        $cAsunto = $request->cAsunto;
        $fRecibido = $request->fRecibido;
        $hRecibido = $request->hRecibido;
        $nTermino = $request->nTermino;
        $fTermino = $request->fTermino;
        $nAsignacion = $request->nAsignacion;
        $nRespuesta = $request->nRespuesta;
        $nIdArchivo = $request->nIdArchivo;
        $jsonSeguimiento = $request->jsonSeguimiento;
        $nIdAuth = $request->nIdAuth;
        $fAccion = $request->fAccion;

        $fTermino = ($fTermino == NULL) ? NULL : $fTermino;
        $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            $rpta =  DB::select('call sp_Solicitud_setRegistrarExtra( ?,?,?,?,?,?,?,?,?,?,?,?,? )', [
                $nTipo,
                $nAreaSolicita,
                $cAsunto,
                $fRecibido,
                $hRecibido,
                $nTermino,
                $fTermino,
                $nAsignacion,
                $nRespuesta,
                $nIdArchivo,
                $jsonSeguimiento,
                $nIdAuth,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function setRegistrarCopiaCon(Request $request){
        if(!$request->ajax()) return redirect('/');
        
        $DPTOS = $request->DPTOS;
        $idSOLICITUD = $request->idSOLICITUD;
        $fAccion = $request->fAccion;

        $numDPTOS = sizeof($DPTOS);
        DB::beginTransaction();
        try {
            if($numDPTOS > 0){
                for($i = 0; $i < $numDPTOS; $i++){
                    DB::select('call sp_Solicitud_setRegistrarCopiaCon(?,?,?)',[
                        $idSOLICITUD,
                        $DPTOS[$i],
                        $fAccion,
                    ]);
                }
            }
            DB::commit();
            return response()->json(['numCopias' => $numDPTOS]);
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getAllByType(Request $request){
        if(!$request->ajax()) return redirect('/');
        $nTipo = $request->nTipo;
        $nDPTO = $request->nDPTO;
        $nRol = $request->nRol;
        $nUser = $request->nUser;

        $nTipo = ($nTipo == NULL) ? 0 : $nTipo;
        $nRol = ($nRol == NULL) ? 0 : $nRol;
        $nUser = ($nUser == NULL) ? Auth::id() : $nUser;
        
        DB::beginTransaction();
        try {
            if($nRol != 4){
                $rpta = DB::select('call sp_Solicitud_getAllByType(?,?)',[$nTipo,$nDPTO]);
            } else {
                $rpta = DB::select('call sp_Solicitud_getAllByUser(?,?)',[$nTipo,$nUser]);
            }

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getDatosById(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idSolicitud = $request->idSolicitud;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_getDatosById(?)',[$idSolicitud]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getArchivoById(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idArchivo = $request->idArchivo;

        $idArchivo = ($idArchivo == NULL) ? 0 : $idArchivo;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_getArchivoById(?)',[$idArchivo]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getCopiasById(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idSolicitud = $request->idSolicitud;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_getCopiasById(?)',[$idSolicitud]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function setGuardaContestacion(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idSolicitud = $request->idSolicitud;
        $idArchivo = $request->idArchivo;
        $idAuth = $request->idAuth;
        $fAccion = $request->fAccion;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;
        $idAuth = ($idAuth == NULL) ? Auth::id() : $idAuth;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_setGuardaContestacion(?,?,?,?)',[
                $idSolicitud,
                $idArchivo,
                $idAuth,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function setUpdateEstatus(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idSolicitud = $request->idSolicitud;
        $idEstatus = $request->idEstatus;
        $idAuth = $request->idAuth;
        $fAccion = $request->fAccion;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;
        $idEstatus = ($idEstatus == NULL) ? 0 : $idEstatus;
        $idAuth = ($idAuth == NULL) ? Auth::id() : $idAuth;
        $fAccion = ($fAccion == NULL) ? Date('Y-m-d H:m:s') : $fAccion;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_setUpdateEstatus(?,?,?,?)',[
                $idSolicitud,
                $idEstatus,
                $idAuth,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getCopiasCon(Request $request){
        if(!$request->ajax()) return redirect('/');
        $nDPTO = $request->nDPTO;

        $nDPTO = ($nDPTO == NULL) ? 0 : $nDPTO;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_getCopiasCon(?)',[$nDPTO]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function setEnteradoCopia(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idCopia = $request->idCopia;
        $idSolicitud = $request->idSolicitud;

        $idCopia = ($idCopia == NULL) ? 0 : $idCopia;
        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_setEnteradoCopia(?,?)',[
                $idCopia,
                $idSolicitud,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido modificar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getSeguimiento(Request $request){
        if(!$request->ajax()) return redirect('/');
        $nDPTO = $request->nDPTO;
        $ahora = $request->ahora;

        $nDPTO = ($nDPTO == NULL) ? 0 : $nDPTO;
        $ahora = ($ahora == NULL) ? date('Y-m-d H:m:s') : $ahora;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_getSeguimiento(?,?)',[
                $nDPTO,
                $ahora,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }
    
    public function setUpdateRecordatorio(Request $request){
        if(!$request->ajax()) return redirect('/');
        $idSolicitud = $request->idSolicitud;
        $ahora = $request->ahora;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;
        $ahora = ($ahora == NULL) ? date('Y-m-d H:m:s') : $ahora;

        DB::beginTransaction();
        try {
            $rpta = DB::select('call sp_Solicitud_setUpdateRecordatorio(?,?)',[
                $idSolicitud,
                $ahora,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido actualizar la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function sendNavNotify(Request $request){
        if(!$request->ajax()) return redirect('/');

        $textNotify = $request->textNotify;
        $nRol = $request->nRol;
        $nDPTO = $request->nDPTO;
        $nSolicitud = $request->nSolicitud;
        $fAccion = $request->fAccion;

        $textNotify = ($textNotify == NULL) ? 'prueba' : $textNotify;
        $nRol = ($nRol == NULL) ? 0 : $nRol;
        $nDPTO = ($nDPTO == NULL) ? 0 : $nDPTO;
        $nSolicitud = ($nSolicitud == NULL) ? 0 : $nSolicitud;
        $fAccion = ($fAccion == NULL) ? date('Y-m-d H:m:s') : $fAccion;

        DB::beginTransaction();
        try {
            event(new NavNotify($textNotify, $nRol, $nDPTO));
            $rpta = DB::select('call sp_Solicitud_setUpdateSysNotify(?,?)',[
                $nSolicitud,
                $fAccion,
            ]);

            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido notificar la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getAnios(Request $request){
        if(!$request->ajax()) return redirect('/');

        try {
            $rpta = DB::select('call sp_Solicitud_getAnios');
            $anios = [];
            if(sizeof($rpta) > 0){
                foreach($rpta as $index => $value){
                    $value->id = $index + 1;
                }
                $anios = $rpta;
            } else{
                array_push($anios, ['id' => 1, 'anio' => date('Y')]);
            }

            return $anios;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getHistorial(Request $request){
        if(!$request->ajax()) return redirect('/');
        $nUsuario = $request->nUsuario;
        $nRol = $request->nRol;
        $nDPTO = $request->nDPTO;
        $fInicio = $request->fInicio;
        $fFin = $request->fFin;

        $nUsuario = ($nUsuario == NULL) ? Auth::id() : $nUsuario;
        $nRol = ($nRol == NULL) ? 0 : $nRol;
        $nDPTO = ($nDPTO == NULL) ? 0 : $nDPTO;

        try {
            $rpta = DB::select('call sp_Solicitud_getHistorial(?,?,?,?,?)',[
                $nUsuario,
                $nRol,
                $nDPTO,
                $fInicio,
                $fFin,
            ]);
            
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido recuperar la información, inténtelo más tarde." . $errorCode);
        }
    }

}
