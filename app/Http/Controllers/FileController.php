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

}