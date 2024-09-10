<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Illuminate\Contracts\Queue\ShouldQueue;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class CandidaturasGubernaturaExport implements FromView, ShouldQueue, ShouldAutoSize
{
    use Exportable;

    private $Candidaturas = [];
    private $tipoEleccion = [];
    private $nIdEleccion = [];

    public function getCandidaturasByEleccion($Candidaturas, $tipoEleccion, $nIdEleccion)
    {
        $this->Candidaturas = $Candidaturas;
        $this->tipoEleccion = $tipoEleccion;
        $this->nIdEleccion = $nIdEleccion;
        return $this;
    }

    public function view(): View 
    {
        return view('reportes.candidaturas.excel.candidaturasGubernatura' , [
            'Candidaturas' => $this->Candidaturas,
            'tipoEleccion' => $this->tipoEleccion,
            'nIdEleccion' => $this->nIdEleccion
        ]);
    }
}
