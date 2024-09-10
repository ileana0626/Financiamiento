<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $cUserName = $request -> cUserName;
        $cContrasena = $request -> cContrasena;

        $rpta = Auth::attempt([ 'username' => $cUserName, 'password' => $cContrasena , 'state' => 'A']);

        if($rpta){
            return response()-> json([
                'authUser' => Auth::user(),
                'code' => 200
            ]);
        }else{
            return response()->json([
                'code' => 401
            ]);
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();
        return response()-> json([
            'code' => 204
        ]);
    }
}
