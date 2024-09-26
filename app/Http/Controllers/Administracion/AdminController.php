<?php

namespace App\Http\Controllers\Administracion;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    /** Verifica que el usuario autenticado es el mismo para la ruta con id */
    public function isUserValid(Request $request){
        if(!$request->ajax()) return redirect('/');

        $reqId = $request->reqId;

        $reqId = ($reqId == NULL) ? 0 : (int) $reqId;

        return ($reqId === Auth::id());
    }

    /** Verifica que el id de usuario proporcionado existe y no es fantasma */
    public function validUserToEdit(Request $request){
        if(!$request->ajax()) return redirect('/');

        $reqId = $request->reqId;
        $reqId = ($reqId == NULL) ? 0 : (int) $reqId;

        try {
            $rpta = DB::select('call sp_Admin_validUserToEdit(?)',[
                $reqId
            ]);
            return sizeof($rpta);
        } catch (\Exception $e) {
            throw new \Exception($e);
        }
    }
}