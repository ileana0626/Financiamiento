<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Illuminate\Contracts\Queue\ShouldQueue;
//use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
//use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class CalculosFinanciamientoExport implements FromView, ShouldQueue, ShouldAutoSize
{
    use Exportable;

    private $datosCalculoFinanciamiento = [];

    public function __construct($datosCalculoFinanciamiento)
    {
        $this->datosCalculoFinanciamiento = $datosCalculoFinanciamiento;
    }

    public function view(): View 
    {
        return view('reportes.financiamiento.excel.calculosFinanciamiento', [
            'datos' => $this->datosCalculoFinanciamiento
        ]);
    }
}
