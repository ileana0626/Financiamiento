<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
//use Illuminate\Http\Response;

class CorsMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        //return $next($request);
        $response = $next($request);
        
        $response->headers->set('Access-Control-Allow-Origin', '*');
        $response->headers->set('Access-Control-Allow-Methods', 'GET');
        $response->headers->set('Access-Control-Allow-Headers', 'Content-Type, Accept, Authorization, X-Requested-With, x-csrf-token');
        
        // if ($request->isMethod('OPTIONS')) {
        //     //die();
        //     return response('', 200)
        //     ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        //     ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
        // }
        
        return $response;
    }

}