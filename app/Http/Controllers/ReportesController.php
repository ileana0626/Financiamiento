<?php

namespace App\Http\Controllers;

use PDF;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use App\Exports\UsersExport;
use App\Exports\OrdersExport;
use App\Exports\ExamenExport;
use App\Exports\ExamenUserExport;
use App\Exports\RegistrosCandidaturasExport;
use App\Exports\EstatusExport;
use App\Exports\RenunciasExport;
use App\Exports\SustitucionesExport;
use App\Exports\SolventacionesExport;
use App\Exports\CandidaturasGubernaturaExport;
use App\Exports\CandidaturasRelativasExport;
use App\Exports\CandidaturasProporcionalExport;
use App\Exports\CandidaturasAyuntaExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ReportesController extends Controller
{
   
}