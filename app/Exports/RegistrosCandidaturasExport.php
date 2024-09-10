<?php

namespace App\Exports;

use App\Invoice;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Illuminate\Contracts\Queue\ShouldQueue;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class RegistrosCandidaturasExport implements FromView, ShouldQueue, ShouldAutoSize
{
    use Exportable;

    private $Candidatos = [];

    public function getRegistros($Candidatos)
    {
        $this->Candidatos = $Candidatos;
        return $this;
    }

    public function view(): View 
    {
        return view('reportes.candidatos.excel.registrosCandidaturas' , [
            'Candidatos' => $this->Candidatos
        ]);
    }
}
