<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithDrawings;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Events\BeforeExport;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class SolicitudesExport implements FromView, WithEvents, WithDrawings, WithStyles
{
    use Exportable;

    private $data = [];
    private $datos = [];
    private $mes = '';
    private $anio = '';
    private $logoIEE = '';
    private $logoNORMA = '';

    public function setDatos($data)
    {
        $this->datos = $data['datos'];
        $this->mes = $data['mes'];
        $this->anio = $data['anio'];
        $this->logoIEE = $data['logoIEE'];
        $this->logoNORMA = $data['logoNORMA'];
        
        return $this;
    }

    public function view(): View 
    {
        return view('reportes.solicitudes.excel.reporteMensual' , [
            'datos' => $this->datos,
            'mes' => $this->mes,
            'anio' => $this->anio,
        ]);
    }

    public function registerEvents(): array{
        return [
            BeforeExport::class => function(BeforeExport $event) {
                $bSheet = $event->writer->getDelegate(); 
                $bSheet->getProperties()->setCreator('IEE Puebla');
                $bSheet->getProperties()->setTitle('Solicitudes '.  $this->mes .' '. $this->anio);
            },
            AfterSheet::class => function(AfterSheet $event){
                $sheet = $event->sheet->getDelegate();

                $sheet->mergeCells('A1:E5');
                $sheet->mergeCells('L1:O5');

                $sheet->mergeCells('F1:K1');
                $sheet->setCellValue('F1','INSTITUTO ELECTORAL DEL ESTADO DE PUEBLA');
                
                $sheet->mergeCells('F2:K2');
                $sheet->setCellValue('F2','DIRECCIÓN ADMINISTRATIVA');
                
                $sheet->mergeCells('F3:K3');
                $sheet->setCellValue('F3','COORDINACIÓN DE INFORMATICA');
                
                $sheet->mergeCells('F4:K4');
                $sheet->setCellValue('F4','Historial de solicitudes del mes de '. $this->mes . ' de '. $this->anio );

                $sheet->mergeCells('F5:K5');

                $sheet->getStyle('F1:K1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('F2:K2')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('F3:K3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle('F4:K4')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

                foreach (range('A', $sheet->getHighestColumn()) as $columnID) {
                    if($columnID == 'F'){
                        $sheet->getColumnDimension('O')->setWidth(50);
                        continue;
                    }
                    $sheet->getColumnDimension($columnID)->setAutoSize(true);
                }
            }
        ];
    }
    
    public function drawings(){
        $draw1 = new Drawing();
        $draw1->setName('logoIEE');
        $draw1->setDescription('logo iee');
        $draw1->setPath(public_path($this->logoIEE));
        $draw1->setHeight(60);
        (sizeof($this->datos) > 0) ? $draw1->setCoordinates('B2') : $draw1->setCoordinates('A2');

        $draw2 = new Drawing();
        $draw2->setName('logoNORMA');
        $draw2->setDescription('logo NORMA');
        $draw2->setPath(public_path($this->logoNORMA));
        $draw2->setHeight(60);
        $draw2->setCoordinates('D2');        

        return [$draw1, $draw2];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            // Style a range of cells as bold text.
            // For the 'fill' value to work, its necesary to put the style=background-color property in the HTML table within the matching cells 
            'A6:O6'    => [
                'font' => ['bold' => true],
                'fill' => [
                    'color' => [
                        'rgb' => 'F9F7F5'
                    ]
                ],
            ],

            // Styling a specific cell by coordinate.
            'F4' => ['font' => ['bold' => true]],

            // Styling an entire column.
            //'C'  => ['font' => ['size' => 16]],
        ];
    }
}
