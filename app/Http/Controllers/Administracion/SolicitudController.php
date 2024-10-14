<?php

namespace App\Http\Controllers\Administracion;

use App\Events\Logout;
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
        $nFolio = $request->nFolio;
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
            $rpta =  DB::select('call sp_Solicitud_setRegistrarMemo( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )', [
                $nTipo,
                $nAreaSolicita,
                $nMemo,
                $cAsunto,
                $nFolio,
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
}
