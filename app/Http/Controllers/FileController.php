<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
// use Illuminate\Support\Facades\Input;

class FileController extends Controller
{
    public function subirArchivo(Request $request)
    {
        $file = $request->file('archivo');
        $filename = $request->filename;
        $extension = $request->extension;
        $tipo = $request->tipo;
        $elaboro = $request->elaboro;
        if ($file != "") {
            $fileExtension = $request->file('archivo')->extension();
        } else {
            $fileExtension = $extension;
        }
        $fileserver = $filename .'.'.$fileExtension  ;
        
        // if ($filename == "Doc_fotografia8") {
        //     Storage::putFileAs('public\\descargas\\' . $nIdAuthUser . '\\', $file, $fileserver);
        // } else {
               $ruta = Storage::putFileAs('public/users/documentos', $file , $fileserver);

                $rpta =  DB::select('call sp_Archivo_subirArchivo( ?, ? )', [ 'storage/users/documentos/'.$fileserver , $filename ]);

        // }

        return  $rpta;
    }   

    /**Cargar la foto en storage y guardar la ruta en BD */
    public function setSubirFP(Request $request){
        if(!$request->ajax()) return redirect('/');

        $nId = $request->nId;
        $file = $request->file('archivo');
        $fActualizado = $request->fActualizado;
        $idAuth = $request->idAuth;
        $extension = $request->extension;

        DB::beginTransaction();
        try {
            $idAuth = ($idAuth == NULL) ? Auth::id() : $idAuth;
            $fActualizado = ($fActualizado == NULL) ? date('Y-m-d H:m:s') : $fActualizado;
            
            if($file != ""){
                $fileExtension = $request->file('archivo')->extension();
            }
            else{
                $fileExtension = $extension;
            }
            $fileserver = $nId . '_' . 'Foto' . '_' . 'Usuario' . '.' . $fileExtension;
    
            Storage::putFileAs('public\\users\\' . $nId . '\\', $file, $fileserver);
    
            DB::select('call sp_setSubirFP(?,?,?,?)', [
                $nId,
                'storage/users/' . $nId . '/' . $fileserver,
                $idAuth,
                $fActualizado,
            ]);

            $rpta = DB::table('fotos_personal')->select('id as id_FP','ruta as rutaFP')->where([["fotos_personal.user","=",$nId]])->get();
            DB::commit();
            return $rpta;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new \Exception($e); 
        }
    }   
}