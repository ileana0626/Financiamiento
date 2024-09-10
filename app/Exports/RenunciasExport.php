<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Illuminate\Contracts\Queue\ShouldQueue;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class RenunciasExport implements FromView, ShouldQueue, ShouldAutoSize
{
    use Exportable;

    private $Candidatos = [];

    public function getRenuncias($Candidatos)
    {
        $this->Candidatos = $Candidatos;
        return $this;
    }

    public function view(): View 
    {
        return view('reportes.candidatos.excel.reporteRenuncias' , [
            'Candidatos' => $this->Candidatos
        ]);
    }
}
