<?php

namespace App\Http\Controllers\Operacion;

use PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class OrdersController extends Controller
{
    public function getListarPedido(Request $request)
    {
        if(!$request -> ajax()) return redirect('/');

        $cNombre = $request->cNombre;
        $cDocumento = $request->cDocumento;
        $cPedido = $request->cPedido;
        $cEstado = $request->cEstado;

        $cNombre = ($cNombre == NULL ) ? ($cNombre = '') : $cNombre;
        $cDocumento = ($cDocumento == NULL) ? ($cDocumento = '') : $cDocumento;
        $cPedido = ($cPedido == Null ) ? ($cPedido = '' ) : $cPedido;
        $cEstado = ($cEstado == NULL ) ? ($cEstado = '' ) : $cEstado;

        $rpta = DB::select('call sp_Pedido_getListarPedido ( ? , ? , ? , ? ) ', [ $cNombre , $cDocumento , $cPedido , $cEstado]);

        return $rpta;
    }

    public function setRegistrarPedido(Request $request)
    {
        if(!$request->ajax()) return redirect('/');

        $nIdCliente = $request->nIdCliente;
        $cComentario = $request->cComentarios;
        $fTotalPedido = $request->fTotalPedido;
        $nIdAuthUser = Auth::id();
        
        $cComentario = ($cComentario == NULL) ? ($cComentario = '') : $cComentario;

        try{
            DB::beginTransaction();
            $rpta =  DB::select('call sp_Pedido_setRegistrarPedido( ? ,  ? , ? , ? )', [ $nIdCliente , $cComentario , $fTotalPedido , $nIdAuthUser ]);

            $nIdPedido = $rpta[0]->nIdPedido;
            
            $listPedido = $request->listPedidos;
            $listPedidoSize = sizeof($listPedido);
            if($listPedidoSize > 0){
                foreach($listPedido as $key => $value){
                    DB::select('call sp_Pedido_setRegistrarDetallePedido( ? , ? , ? , ?)', [ $nIdPedido , $value['nIdProducto'], $value['nStock'], $value['fPrecio'] ]);
                }
            } 
            DB::commit();
            return $nIdPedido;
        } catch(Exception $e){
            DB:rollBack();
        }
    }

    public function setGenerarDocumento(Request $request)
    {
        if(!$request->ajax()) return redirect('/');

        $nIdPedido = $request->nIdPedido;

        $logo = asset('img/AdminLTELogo.png');

        $rpta1 = DB::select('call sp_Pedido_getPedido(?)', [ $nIdPedido ]);
        $rpta2 = DB::select('call sp_Pedido_getDetallePedido(?)', [ $nIdPedido ]);
        
       $pdf = PDF::loadView('reportes.pedido.pdf.ver', [
          'rpta1' => $rpta1,
          'rpta2' => $rpta2,
          'logo' => $logo
       ]);
       return $pdf->download('invoice.pdf');
    }

    public function setCambiarEstadoPedido(Request $request)
    {
        if(!$request -> ajax()) return redirect('/');
        $nIdPedido = $request->nIdPedido;
        $cEstado = $request->cEstado;
        $nIdAuthUser = Auth::id();

        $nIdPedido = ($nIdPedido == NULL) ? ($nIdPedido = 0) : $nIdPedido;
        $cEstado = ($cEstado == NULL) ? ($cEstado = '') : $cEstado;

        $rpta =  DB::select('call sp_Pedido_setCambiarEstadoPedido(  ? , ? , ? )', [$nIdPedido ,$cEstado ,$nIdAuthUser]);

        return $rpta;
    }

    public function setGenerarReportePorUsuario(Request $request)
    {
        if(!$request -> ajax()) return redirect('/');

        $folio = $request->nIdUsuario;

        $logo = asset('img/LOGO_NUEVO.png');

        $folio = ($folio == NULL) ? ($folio = 0) : $folio;

        try {
            $rpta = DB::select('call sp_reporte_por_ususario( ? )', [ $folio ]);

            $pdf = PDF::loadView('reportes.pedido.excel.evaluacionesUsuarios' , [
                'rpta' => $rpta,
                'logo' => $logo
            ])->setPaper('A4', 'landscape');

            return $pdf->download('invoice.pdf');
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
}
