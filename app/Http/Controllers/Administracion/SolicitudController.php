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

        try {
            $rpta =  DB::select('call sp_Solicitud_setRegistrarRequi( ?,?,?,?,?,?,?,?,?,? )', [
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

            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }
}
