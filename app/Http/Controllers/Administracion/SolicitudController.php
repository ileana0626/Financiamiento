<?php

namespace App\Http\Controllers\Administracion;

use App\Events\Logout;
use App\Events\NavNotify;
use App\Events\Testear;
use App\Exports\SolicitudesExport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use PDO;
use PDF;

class SolicitudController extends Controller
{
    //Desactivar transacciones del lado de la Base de Datos y evitar conflictos
    protected static $useTransaction = false;

    public function setRegistrarCalculoFinanciamiento(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nAnio = $request->nAnio;
        $fPublicacion = $request->fPublicacion;
        $cUMA = $request->cUMA;
        $cPersonas_padron = $request->cPersonas_padron;
        $cbPartidosPoliticosSinRepr = $request->cbPartidosPoliticosSinRepr;
        $pp_sin_repr_siglas = $request->pp_sin_repr_siglas;
        $cbPartidosPoliticosConRepr = $request->cbPartidosPoliticosConRepr;
        $pp_con_repr_siglas = $request->pp_con_repr_siglas;
        //$nIdAuth = $request->nIdAuth;
       
        // $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            DB::statement('SET @p_new_id = 0');
            $rpta =  DB::statement('call sp_insert_calculo(?,?,?,?,?,?,?,?,?, @p_new_id)', [
                $nAnio,
                $fPublicacion,
                $cUMA,
                $cPersonas_padron,
                $cbPartidosPoliticosSinRepr,
                $pp_sin_repr_siglas,
                $cbPartidosPoliticosConRepr,
                $pp_con_repr_siglas,
                //$nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;
                self::$useTransaction, // bandera estática
                
            ]); 

            $rpta = DB::select('SELECT @p_new_id as idInsertado');
            //$idInsertado = $rpta[0]->p_new_id; // o el nombre de la columna que devuelve el procedimiento
            Log::info('Cálculo insertado con id: '.$rpta[0]->idInsertado);
            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error en setRegistrarCalculo', [
                'error' => $e->getMessage(),
                'code' => $e->getCode(),
                'file' => $e->getFile(),
                'line' => $e->getLine()
            ]);
            throw $e;
            // $errorCode = $e->errorInfo[1];
            // throw new \ErrorException("No se ha podido registrar la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getCalculosFinanciamiento(Request $request)
    {
        if (!$request->ajax()) {return redirect('/');}
        DB::enableQueryLog();
        DB::beginTransaction();
        try {
            $id = $request->input('id', null); // Valor por defecto null
            $rpta = DB::select('call sp_get_calculo_completo(?)', [$id]);
            // Obtener y loguear la consulta
            $queryLog = DB::getQueryLog();
            Log::info('Consulta SQL ejecutada:', $queryLog);
        
            DB::commit();
            return response()->json([
                'success' => true,
                'calculos' => $rpta,
                'message' => 'Cálculos obtenidos correctamente'
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error en getCalculosFinanciamiento', [
                'error' => $e->getMessage(),
                'code' => $e->getCode(),
                'file' => $e->getFile(),
                'line' => $e->getLine()
            ]);
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener los cálculos'
            ]);
            throw $e;
        }
    }

    public function get_Partidos_Calculo_porId(Request $request){
        if(!$request->ajax()) return redirect('/');
        $id = $request->input('id', null); // Valor por defecto null
        $rpta = DB::select('call sp_get_Partidos_Calculo_porId(?)', [$id]);
        // Obtener y loguear la consulta
        $queryLog = DB::getQueryLog();
        Log::info('Listado -> Consulta SQL ejecutada:', $queryLog);
    
        DB::commit();
        return response()->json([
            'success' => true,
            'calculos' => $rpta,
            'message' => 'Cálculos obtenidos correctamente'
        ]);
    }

    
    /**
     * Exporta el reporte de financiamiento a Excel
     *
     * @param Request $request
     * @return \Maatwebsite\Excel\BinaryFileResponse
     */
    public function exportarCalculosFinanciamientoExcel(Request $request, $id = null)
    {
        try {
            Log::info('Iniciando exportación de Excel para el ID: ' . $id);
            
            if (!$id) {
                Log::error('No se proporcionó un ID para la exportación');
                return response()->json([
                    'success' => false,
                    'message' => 'ID no proporcionado para la exportación'
                ], 400);
            }

            // Obtener los datos del cálculo
            $calculo = DB::select('call sp_get_calculo_completo(?)', [$id]);
            Log::info('Datos del cálculo obtenidos:', ['calculo' => $calculo]);

            if (empty($calculo)) {
                Log::error('No se encontró el cálculo con ID: ' . $id);
                return response()->json([
                    'success' => false,
                    'message' => 'No se encontró el cálculo solicitado'
                ], 404);
            }
            // Procesar los datos correctamente
            $calculoData = !empty($calculo) ? (array)$calculo[0] : [];

            // Obtener los partidos políticos (con y sin representación)
            $pdo = DB::connection()->getPdo();
            $stmt = $pdo->prepare('CALL sp_get_Partidos_Calculo_porId(?)');
            $stmt->execute([$id]);
            
            // Obtener el primer conjunto de resultados (partidos sin representación)
            $partidosSinRep = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            // Avanzar al siguiente conjunto de resultados
            $stmt->nextRowset();
            
            // Obtener el segundo conjunto de resultados (partidos con representación)
            $partidosConRep = $stmt->fetchAll(PDO::FETCH_ASSOC);

            Log::info('Partidos sin representación:', $partidosSinRep);
            Log::info('Partidos con representación:', $partidosConRep);


            $data = [
                'calculo' => $calculoData,
                'partidos_sin_rep' => $partidosSinRep,
                'partidos_con_rep' => $partidosConRep
            ];

            // Log::info('Datos preparados para la exportación:', $data);
            
            // Usar la clase FinanciamientoExport para generar el Excel
            // return (new \App\Exports\CalculosFinanciamientoExport($data))
            //     ->download(date('Y-m-d') . '_calculos_financiamiento.xlsx');
                
                 // Retornamos la vista sin datos
            return (new \App\Exports\CalculosFinanciamientoExport($data))
            ->download(date('Y-m-d') . 'calculos_financiamiento.xlsx', \Maatwebsite\Excel\Excel::XLSX, [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            ]);
        } catch (\Exception $e) {
            Log::error('Error al exportar el reporte de financiamiento', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'file' => $e->getFile(),
                'line' => $e->getLine()
            ]);
            
            return response()->json([
                'success' => false,
                'message' => 'Error al generar el reporte: ' . $e->getMessage(),
                'error_details' => [
                    'file' => $e->getFile(),
                    'line' => $e->getLine(),
                    'trace' => $e->getTraceAsString()
                ]
            ], 500);
        }
    }

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




    public function setRegistrarCalculo(Request $request){
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
            if(sizeof($rpta) > 0 && $rpta[0]->anio != null){
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

    
    // FUNCIONES PARA EXPORTAR EXCEL/PDF:
    public function reporteMensualPDF(Request $request){
        if(!$request -> ajax()) return redirect('/');

        $nUsuario = $request->nUsuario;
        $nRol = $request->nRol;
        $nDPTO = $request->nDPTO;
        $fInicio = $request->fInicio;
        $fFin = $request->fFin;
        $anio = $request->anio;
        $mesNombre = $request->mesNombre;

        $nUsuario = ($nUsuario == NULL) ? Auth::id() : $nUsuario;
        $nRol = ($nRol == NULL) ? 0 : $nRol;
        $nDPTO = ($nDPTO == NULL) ? 0 : $nDPTO;

        $mesNombre = ($mesNombre == NULL || $mesNombre == '') ? 'N/A' : $mesNombre;
        $anio = ($anio == NULL) ? '2024' : $anio;

        try {
            $rpta = DB::select("call sp_Solicitud_getHistorial(?,?,?,?,?)",[
                $nUsuario,
                $nRol,
                $nDPTO,
                $fInicio,
                $fFin,
            ]);

            $rutaBlade = 'reportes.solicitudes.pdf.reporteMensual';
            $data = [
                'logoIEE' => asset('/img/logo-light.png'),
                'logoNORMA' => asset('/img/LOGO_NORMA.png'),
                'mes' => $mesNombre,
                'data' => $rpta,
                'anio' => $anio,
            ];

            $pdf = PDF::loadView($rutaBlade, $data)->setPaper('legal','landscape');
            return $pdf->download('invoice.pdf');
        } catch (\Exception $e) {
            throw new \Exception($e);
        }
    }
    public function reporteMensualExcel(Request $request){
        if(!$request -> ajax()) return redirect('/');

        $nUsuario = $request->nUsuario;
        $nRol = $request->nRol;
        $nDPTO = $request->nDPTO;
        $fInicio = $request->fInicio;
        $fFin = $request->fFin;
        $anio = $request->anio;
        $mesNombre = $request->mesNombre;

        $nUsuario = ($nUsuario == NULL) ? Auth::id() : $nUsuario;
        $nRol = ($nRol == NULL) ? 0 : $nRol;
        $nDPTO = ($nDPTO == NULL) ? 0 : $nDPTO;

        $mesNombre = ($mesNombre == NULL || $mesNombre == '') ? 'N/A' : $mesNombre;
        $anio = ($anio == NULL) ? '2024' : $anio;

        try {
            $rpta = DB::select("call sp_Solicitud_getHistorial(?,?,?,?,?)",[
                $nUsuario,
                $nRol,
                $nDPTO,
                $fInicio,
                $fFin,
            ]);

            $data = [
                'logoIEE' => '/img/logo-light.png',
                'logoNORMA' => '/img/LOGO_NORMA.png',
                'mes' => $mesNombre,
                'datos' => $rpta,
                'anio' => $anio,
            ];

            return (new SolicitudesExport)->setDatos($data)->download('invoice.xlsx');
        } catch (\Exception $e) {
            throw new \Exception($e);
        }
    }
    
    public function setUpdateCaptura(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nIdSolicitud = $request->nIdSolicitud;
        $nTipo = $request->nTipo;
        $nIdArchivo = $request->nIdArchivo;
        $nAreaSolicita = $request->nAreaSolicita;
        $nAreaEmite = $request->nAreaEmite;
        $nAreaAsignar = $request->nAreaAsignar;
        $cOficio = $request->cOficio;
        $cAsunto = $request->cAsunto;
        $cCargo = $request->cCargo;
        $cRemitente = $request->cRemitente;
        $cFolio = $request->cFolio;
        $cMemo = $request->cMemo;
        $nCapitulo = $request->nCapitulo;
        $nTermino = $request->nTermino;
        $nRespuesta = $request->nRespuesta;
        $fRecibido = $request->fRecibido;
        $hRecibido = $request->hRecibido;
        $fTermino = $request->fTermino;
        $jsonSeguimiento = $request->jsonSeguimiento;
        $fAccion = $request->fAccion;
        $nIdAuth = $request->nIdAuth;
        $cMotivo = $request->cMotivo;

        $fTermino = ($fTermino == NULL) ? NULL : $fTermino;
        $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            $rpta =  DB::select('call sp_Solicitud_setUpdateCaptura( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )', [
                $nIdSolicitud,
                $nTipo,
                $nIdArchivo,
                $nAreaSolicita,
                $nAreaEmite,
                $nAreaAsignar,
                $cOficio,
                $cAsunto,
                $cCargo,
                $cRemitente,
                $cFolio,
                $cMemo,
                $nCapitulo,
                $nTermino,
                $nRespuesta,
                $fRecibido,
                $hRecibido,
                $fTermino,
                $jsonSeguimiento,
                $fAccion,
                $nIdAuth,
                $cMotivo,
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
    public function setUpdateCopias(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nIdSolicitud = $request->nIdSolicitud;
        $copiasPrevias = json_decode($request->copiasPrevias);
        $copiasConocimiento = $request->copiasConocimiento;
        $copiasQuitar = $request->copiasQuitar;
        $fAccion = $request->fAccion;

        DB::beginTransaction();
        try {
            if(sizeof($copiasPrevias) > 0 && sizeof($copiasQuitar) > 0){
                // borrar los registros indicados en copiasQuitar y quitar el elemento relacionado de copiasPrevias
                for($cQ = 0; $cQ < sizeof($copiasQuitar); $cQ++){
                    foreach($copiasPrevias as $index => $pCopia){
                        if($pCopia->id_departamento === $copiasQuitar[$cQ]){
                            DB::select('call sp_Solicitud_deleteCopiaCon(?,?)',[
                                $nIdSolicitud,
                                $pCopia->id_departamento,
                            ]);
                            unset($copiasPrevias[$index]);
                        }
                    }
                }
            }
            if(sizeof($copiasConocimiento) > 0){
                if(sizeof($copiasPrevias) > 0){
                    // añadir solo las copias que no se encuentren ya registradas
                    for($cC = 0; $cC < sizeof($copiasConocimiento); $cC++){
                        foreach($copiasPrevias as $index => $pCopia){
                            if($pCopia->id_departamento !== $copiasConocimiento[$cC]){
                                DB::select('call sp_Solicitud_setRegistrarCopiaCon(?,?,?)',[
                                    $nIdSolicitud,
                                    $copiasConocimiento[$cC],
                                    $fAccion,
                                ]);
                            }
                        }
                    }
                } else {
                    // añadir los registros como de primera vez
                    foreach($copiasConocimiento as $cono){
                        DB::select('call sp_Solicitud_setRegistrarCopiaCon(?,?,?)',[
                            $nIdSolicitud,
                            $cono,
                            $fAccion,
                        ]);                      
                    }
                }
            }
            DB::commit();
            return response()->json(['message' => 'ok']);
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
        }
    }
}
