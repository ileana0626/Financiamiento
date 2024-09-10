<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;

class ExamenExport implements FromView, ShouldAutoSize
{
    use Exportable;

    private $listEvaluacion = [];

    public function getEvaluacion($listEvaluacion)
    {
        $this->listEvaluacion = $listEvaluacion;

        return $this;
    }

    public function view(): View
    {
        return view('reportes.pedido.excel.evaluaciones', [
            'evaluaciones' => $this->listEvaluacion
        ]);
    }
}
