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
    public function getListarAllUsers(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $nidusuario =  Auth::id();

        try {
            $rpta =  DB::select('call sp_Usuario_getListarAllUsers');

            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
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

        $tipo = $request->tipo;
        $tipo = ($tipo == NULL) ? 0 : $tipo;

        try {
            $rpta = DB::select('call sp_listarSolicitudes( ? )', [ $tipo ]);

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
        $supervisa = $request->supervisa;

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
        $supervisa = ( $supervisa == NULL ) ? NULL : $supervisa;

        try {
            $rpta = DB::select('call sp_RegistrarSolicitud( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [  $numeroConsecutivo, $numeroSolicitud, $fechaRecibido, $remitente, $otroRemitente, $cargo, $otroCargo, $asunto, $termino, $fechaTermino, $diasTermino, $respuesta, $seguimiento, $areaAsignada, $tipo, $fechaAsignacion, $estatus, $observaciones, $idArchivo ,$supervisa]);
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

    public function setDatosPersonalesFormById(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $nIdRegistro = $request->nIdRegistro;
        $nIdUser = $request->nIdUser;
        $cNombre = $request->cNombre;
        $cApaterno = $request->cApaterno;
        $cAmaterno = $request->cAmaterno;
        $cEmail = $request->cEmail;
        $fNacimiento = $request->fNacimiento;
        $cCelular = $request->cCelular;

        $nIdAuth = $request->nIdAuth;
        $fAccion = $request->fAccion;

        $cNombre = ($cNombre == NULL) ? '' : $cNombre;
        $cApaterno = ($cApaterno == NULL) ? '' : $cApaterno;
        $cAmaterno = ($cAmaterno == NULL) ? '' : $cAmaterno;
        $fNacimiento = ($fNacimiento == NULL) ? NULL : $fNacimiento;
        $nIdAuth = ($nIdAuth == NULL) ? Auth::id() : $nIdAuth;

        DB::beginTransaction();
        try {
            DB::select('call sp_setUpdateInfoUserById(?,?,?,?,?,?)',[
                $nIdUser,
                $cNombre,
                $cApaterno,
                $cAmaterno,
                $cEmail,
                $fAccion,
            ]);

            $DatosP = DB::select('call sp_setUpdateDatosPById(?,?,?,?,?,?)',[
                $nIdRegistro,
                $nIdUser,
                $fNacimiento,
                $cCelular,
                $nIdAuth,
                $fAccion,
            ]);

            DB::commit();
            return $DatosP;
        } catch (\Exception $e) {
            DB::rollBack();
            // $errorCode = $e->errorInfo[1];
            throw new \Exception($e);
        }
    }

    public function guardarCopiasConocimiento(Request $request)
    {
        if (!$request->ajax())  return redirect('/');
        $idSolicitud = $request->idSolicitud;
        $departamentos = $request->departamentos;
        $estatus = $request->estatus;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;
        $departamentos = ($departamentos == NULL) ? 0 : $departamentos;
        $estatus = ( $estatus == NULL ) ? 0 : $estatus;

        try{
            DB::beginTransaction();
            DB::Select('call sp_EliminarCopiasConocimiento(?)', [$idSolicitud]);
            $departamentosSize = sizeof($departamentos);
            if( $departamentosSize > 0 ){
                foreach( $departamentos as $key => $value ){
                    $rpta =  DB::select('call sp_insertarCopiasConocimiento(?, ?, ?)', [$idSolicitud, $value, $estatus ]);
                }
            }
            DB::commit();
            return $rpta;
        }catch (\Illuminate\Database\QueryException $e) {
            DB::rollback();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }

    }

    public function CopiaEnterado(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $solicitud = $request->solicitud;
        $departamento = $request->departamento;

        $solicitud = ($solicitud == NULL) ? 0 : $solicitud;
        $departamento = ($departamento == NULL) ? 0 : $departamento;

        try {
            $rpta = DB::select('call sp_Copia_Enterado( ?, ? )', [  $solicitud, $departamento]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function todosEnteradoConcluido(Request $request)
    {
        if (!$request->ajax())  return redirect('/');

        $estatus = $request->estatus;
        $solicitud = $request->solicitud;

        $estatus = ($estatus == NULL) ? 0 : $estatus;
        $solicitud = ($solicitud == NULL) ? 0 : $solicitud;

        try {
            $rpta = DB::select('call sp_Actualizar_Estatus_Solicitud( ?, ? )', [  $estatus, $solicitud]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function getbirthday(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        
        try {
            $rpta = DB::select('call sp_listado_birthday');
        
            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function guardarBirthday(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
            $tipo = $request->tipo;
            $id = $request->id;
            $nombre = $request->nombre;
            $adscripcion = $request->adscripcion;
            $mes = $request->mes;
            $dia = $request->dia;

            $tipo = ( $tipo == NULL ) ? 0 : $tipo;
            $id = ( $id == NULL ) ? 0 : $id;
            $nombre = ( $nombre == NULL ) ? '': $nombre;
            $adscripcion = ( $adscripcion == NULL ) ? 0 : $adscripcion;
            $mes = ( $mes == NULL ) ? 0 : $mes;
            $dia = ( $dia == NULL ) ? 0 : $dia;
        
        try {
            $rpta = DB::select('call sp_birthday_acciones( ?, ?, ?, ?, ?, ?)', [$tipo,$adscripcion,$nombre,$dia,$mes,$id]);
        
            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function EditarBirthday(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
            $tipo = $request->tipo;
            $id = $request->id;
            $nombre = $request->nombre;
            $adscripcion = $request->adscripcion;
            $mes = $request->mes;
            $dia = $request->dia;

            $tipo = ( $tipo == NULL ) ? 0 : $tipo;
            $id = ( $id == NULL ) ? 0 : $id;
            $nombre = ( $nombre == NULL ) ? '': $nombre;
            $adscripcion = ( $adscripcion == NULL ) ? 0 : $adscripcion;
            $mes = ( $mes == NULL ) ? 0 : $mes;
            $dia = ( $dia == NULL ) ? 0 : $dia;
        
        try {
            $rpta = DB::select('call sp_birthday_acciones( ?, ?, ?, ?, ?, ?)', [$tipo,$adscripcion,$nombre,$dia,$mes,$id]);
        
            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function setUpdatePass(Request $request){
        if (!$request->ajax()) return redirect('/');

        $nId = $request->nId;
        $pass = $request->pass;
        $newPass = $request->newPass;
        $confirmPass = $request->confirmPass;
        $fAccion = $request->fAccion;
        
        $newPass = ($newPass == NULL) ? '-1' : $newPass;
        $confirmPass = ($confirmPass == NULL) ? '+2' : $confirmPass;
        $fAccion = ($fAccion == NULL) ? date('Y-m-d H:m:s') : $fAccion;

        DB::beginTransaction();
        try {
            $raw = DB::table('users')
                ->select('password')
                ->where([['users.id','=',$nId]])
                ->get();
            $hash = $raw[0]->password;
            
            $newHash = '';
            $rpta = '';

            if(password_verify($pass,$hash)){
                if($newPass === $confirmPass){
                    //crear hash
                    $newHash = password_hash($newPass, PASSWORD_DEFAULT, ['cost' => 10]);
                    //actualizar la pass
                    $rpta = DB::select('call sp_setUpdatePassById(?,?,?)',[
                        $nId,
                        $newHash,
                        $fAccion,
                    ]);

                } else {
                    //lanza error si la nueva pass y su confirmacion no coinciden
                    throw new \ErrorException("Error en nueva contraseña, verifique la nueva contraseña y vuelva a intentarlo.". 400);
                }
            } else {
                throw new \ErrorException("Error en contraseña actual, verifique la contraseña y vuelva a intentarlo.". 400);
            }
            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
        }
    }
    public function setReestablecerPass(Request $request){
        if (!$request->ajax()) return redirect('/');

        $nId = $request->nId;
        $newPass = $request->newPass;
        $confirmPass = $request->confirmPass;
        $fAccion = $request->fAccion;
        
        $newPass = ($newPass == NULL) ? '-1' : $newPass;
        $confirmPass = ($confirmPass == NULL) ? '+2' : $confirmPass;
        $nIdAuth = Auth::id();
        $fAccion = ($fAccion == NULL) ? date('Y-m-d H:m:s') : $fAccion;

        DB::beginTransaction();
        try {
            $newHash = '';
            $rpta = '';

            if($newPass === $confirmPass){
                //crear hash
                $newHash = Hash::make($newPass);
                //actualizar la pass
                $rpta = DB::select('call sp_setUpdatePassById(?,?,?)',[
                    $nId,
                    $newHash,
                    $fAccion,
                ]);
                broadcast(new Logout($nId));
            } else {
                //lanza error si la nueva pass y su confirmacion no coinciden
                throw new \ErrorException("Error en nueva contraseña, verifique la nueva contraseña y vuelva a intentarlo.". 400);
            }
            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
        }
    }
    public function getRoles(Request $request){
        if (!$request->ajax()) return redirect('/');
        
        $nIdRol = $request->nIdRol;
        $nIdRol = ($nIdRol == NULL) ? 0 : $nIdRol;

        try {
            $rpta = DB::select('call sp_getRoles(?)',[
                $nIdRol
            ]);
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function getDepartamentos(Request $request){
        if (!$request->ajax()) return redirect('/');

        try {
            $rpta = DB::select('call sp_getDepartamentos');
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
    public function setRegistrarUser(Request $request){
        if (!$request->ajax()) return redirect('/');

        $cNombre = $request->cNombre;
        $cApaterno = $request->cApaterno;
        $cAmaterno = $request->cAmaterno;
        $cEmail = $request->cEmail;
        $cUser = $request->cUser;
        $pswd = $request->pswd;
        $pswdConfirmar = $request->pswdConfirmar;
        $nIdDPTO = $request->nIdDPTO;
        $nIdRol = $request->nIdRol;
        $fRegistro = $request->fRegistro;

        $cAmaterno = ($cAmaterno == NULL) ? '' : $cAmaterno;
        $fRegistro = ($fRegistro == NULL) ? date('Y-m-d h:m:s') : $fRegistro;

        DB::beginTransaction();
        try {
            $userCheck = DB::select('call sp_Usuario_checkUsername(?)',[
                $cUser
            ]);
            if(sizeof($userCheck) > 0){
                throw new \ErrorException("Usuario ya registrado; Escriba un nuevo usuario y vuelva a intentarlo.". 400);
            }

            $newHash = password_hash($pswd, PASSWORD_DEFAULT, ['cost' => 10]);

            $rpta = DB::select('call sp_Usuario_setRegistrarUser(?,?,?,?,?,?,?,?,?)',[
                $cNombre,
                $cApaterno,
                $cAmaterno,
                $cUser,
                $newHash,
                $cEmail,
                $nIdDPTO,
                $nIdRol,
                $fRegistro,
            ]);
            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e);
        }
    }
    public function setCambiarEstadoById(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $user_id = $request->user_id;
        $estado = $request->estado;

        DB::beginTransaction();
        try{
            $result = DB::select('call sp_Usuario_setCambiarEstadoById(?, ?)', [
                $user_id, $estado,
            ]);

            if ($estado == 'INACTIVO') {
                broadcast(new Logout($user_id));
            }
            DB::commit();
            return $result;
        } catch(\Exception $e){
            DB::rollBack();
            throw new \Exception($e);
        }        
    }
    public function getDatosRolById(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nId = $request->nId;
        $nId = ($nId == NULL) ? 0 : $nId;

        try {
            $rpta = DB::select('call sp_Usuario_getDatosRolById(?)',[
                $nId
            ]);

            return $rpta;
        } catch (\Exception $e) {
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . 400);
        }
    }
    public function setUpdateDatosRolById(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nId = $request->nId;
        $rolNuevo = $request->rolNuevo;
        $rolActual = $request->rolActual;
        $dptoNuevo = $request->dptoNuevo;
        $dptoActual = $request->dptoActual;
        $fAccion = $request->fAccion;
        $nIdAuth = Auth::id();

        $fAccion = ($fAccion == NULL) ? date('Y-m-d H:m:s') : $fAccion;
        $updated = false;

        DB::beginTransaction();
        try {
            if($rolNuevo !== $rolActual){
                //actualizar rol de usuario
                DB::select('call sp_Usuario_setUpdateRolById(?,?)',[
                    $nId,
                    $rolNuevo
                ]);
                $updated = true;
            }
            if($dptoNuevo !== $dptoActual){
                //actualizar el departamento
                DB::select('call sp_Usuario_setUpdateDPTOById(?,?,?)',[
                    $nId,
                    $dptoNuevo,
                    $fAccion,
                ]);
                $updated = true;
            }
            if($updated){
                //desloguear si se actualizo
                broadcast(new Logout($nId));
            }

            DB::commit();
            return $updated;
        } catch (\Error $e) {
            DB::rollBack();
            throw new \Exception($e);
        }

    }
    
    public function obtenerSolicitud(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $idSolicitud = $request->idSolicitud;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;

        try {
            $rpta = DB::select('call sp_Solicitudes_ConsultarID( ? )', [ $idSolicitud ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

    public function obtenerCopiasConocimiento(Request $request) 
    {
        if (!$request->ajax()) return redirect('/');

        $idSolicitud = $request->idSolicitud;

        $idSolicitud = ($idSolicitud == NULL) ? 0 : $idSolicitud;

        try {
            $rpta = DB::select('call sp_Consultar_CopiasCononcimientoID( ? )', [ $idSolicitud ]);

            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }

    }

    public function editarSolicitud(Request $request) 
    {
        if (!$request->ajax()) return redirect('/');

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
        $observaciones = $request->observaciones;
        $idArchivo = $request->idArchivo;
        $supervisa = $request->supervisa;
        $id = $request->id;

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
        $observaciones = ( $observaciones == NULL ) ? '' : $observaciones;
        $idArchivo = ( $idArchivo == NULL ) ? NULL : $idArchivo;
        $supervisa = ( $supervisa == NULL ) ? NULL : $supervisa;
        $id = ( $id == NULL ) ? 0 : $id;

        try {
            $rpta = DB::select('call sp_Actualizar_Solicitudes(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [   $numeroConsecutivo,  $numeroSolicitud,  $fechaRecibido,  $remitente,  $otroRemitente,  $cargo,  $otroCargo,  $asunto,  $termino,  $fechaTermino,  $diasTermino,  $respuesta,  $seguimiento,  $areaAsignada,  $tipo,  $fechaAsignacion,  $observaciones,  $supervisa, $idArchivo, $id]);
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }

}
