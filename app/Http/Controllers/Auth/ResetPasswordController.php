<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;
use App\Events\Logout;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
// use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    // use ResetsPasswords;

    // /**
    //  * Where to redirect users after resetting their password.
    //  *
    //  * @var string
    //  */
    // protected $redirectTo = '/home';

    // /**
    //  * Create a new controller instance.
    //  *
    //  * @return void
    //  */
    // public function __construct()
    // {
    //     $this->middleware('guest');
    // }


    public function sendMailPass(Request $request){

        if (!$request->ajax()) return redirect('/');
        
        $cUsername = $request->cUsername;
        $cFullname = $request->cFullname;
        $cEmail = $request->cEmail;
        $nIdUsuario = $request->nIdUsuario;
        $cPass = $request->cPass;
        

        // $n=12;
        // $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-*_."+$#';
        // $randomString = '';
    
        // for ($i = 0; $i < $n; $i++) {
        //     $index = rand(0, strlen($characters) - 1);
        //     $randomString .= $characters[$index];
        // }
    
        $cNewPass = Hash::make($cPass);

        $details = [
            'username' => $cUsername,
            'fullname' => $cFullname,
            'newPass' => $cPass
        ];

        try{
            $rpta = DB::transaction(function () use (
                $nIdUsuario,
                $cNewPass
            ) {
                return DB::select('call sp_Admin_ResetPass( ? , ? )',
                    [$nIdUsuario, $cNewPass ]);
            }, 3);
            DB::commit();
            
            \Mail::to($cEmail)->send(new \App\Mail\ResetPassMail($details));
            \Mail::to('sistemasnotificacion@ieepuebla.org.mx')->send(new \App\Mail\ResetPassMail($details));
            
            return $rpta;
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollback();
            $errorCode = $e->errorInfo[1];
            throw new \ErrorException("No se ha podido obtener la información, inténtelo más tarde." . $errorCode);
        }
    }
}
