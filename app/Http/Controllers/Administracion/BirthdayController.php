<?php

namespace App\Http\Controllers\Administracion;

use App\Events\Logout;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class BirthdayController extends Controller
{

    public function getTodayDates(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        try {
            $rpta =  DB::select('call sp_Birthday_getTodayDates');

            return $rpta;

        } catch (\Illuminate\Database\QueryException $e) {
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }    
}
