<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class ExamenUserExport implements FromView, ShouldAutoSize
{
    use Exportable;

    private $EvaluacionUsuario = [];

    public function getEvaluacionUsuario($EvaluacionUsuario)
    {
        $this->EvaluacionUsuario = $EvaluacionUsuario;

        return $this;
    }

    public function view(): View 
    {
        return view('reportes.pedido.excel.evaluacionesUsuarios' , [
            'evaluacionesUsuario' => $this->EvaluacionUsuario
        ]);
    }
}
