<?php

namespace App\Exports;

use Illuminate\Support\Facades\Log;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithTitle;
// Formatear el Excel
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithEvents;


class CalculosFinanciamientoExport implements FromView, ShouldAutoSize, WithTitle, WithEvents, WithColumnFormatting
{
    use Exportable;

    private $datos;

    public function __construct($datos)
    {
        $this->datos = $datos;
    }

    public function title(): string
    {
        return 'Calculos';
    }

    public function view(): View 
    {
        try {
            $data = (object) [
                'calculo' => (object) $this->datos['calculo'],
                'partidos_sin_rep' => (array) $this->datos['partidos_sin_rep'],
                'partidos_con_rep' => (array) $this->datos['partidos_con_rep']
            ];

            // Convert the data to array for logging
            Log::info('Datos para la exportación:', ['data' => json_decode(json_encode($data), true)]);
            
            return view('reportes.financiamiento.excel.calculosFinanciamiento', [
                'datos' => $data
            ]);
    
        } catch (\Exception $e) {
            Log::error('Error en la generación de la vista de exportación', [
                'error' => $e->getMessage()
            ]);
            throw $e;
        }
    }
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                // Obtener la hoja
                $sheet = $event->sheet;
                
                // Ajustar ancho de columnas
                $sheet->getColumnDimension('A')->setAutoSize(false);
                $sheet->getColumnDimension('A')->setWidth(20);
                $sheet->getColumnDimension('B')->setAutoSize(false);
                $sheet->getColumnDimension('B')->setWidth(80);
                $sheet->getColumnDimension('C')->setAutoSize(false);
                $sheet->getColumnDimension('C')->setWidth(40);


                // Agregar un log para depuración
                Log::info('Anchos de columna configurados', [
                    'ancho_A' => $sheet->getDelegate()->getColumnDimension('A')->getWidth(),
                    'ancho_B' => $sheet->getDelegate()->getColumnDimension('B')->getWidth(),
                    'ancho_C' => $sheet->getDelegate()->getColumnDimension('C')->getWidth()
                ]);
                // $sheet->getColumnDimension('D')->setWidth(20);
                // $sheet->getColumnDimension('E')->setWidth(20);
                
                // Ejemplo color amarillo
                // $sheet->getStyle('A1:C1')->applyFromArray([
                //     'font' => ['bold' => true, 'color' => ['rgb' => 'FF0000']],
                //     'fill' => ['fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID, 'color' => ['rgb' => 'FFFF00']]
                // ]);

                // Estilo para el título principal
                // $sheet->mergeCells('A1:E1');
                // $sheet->setCellValue('A1', 'CÁLCULO DE FINANCIAMIENTO PÚBLICO');
                // $sheet->getStyle('A1')->applyFromArray([
                //     'font' => [
                //         'bold' => true,
                //         'size' => 14,
                //     ],
                //     'alignment' => [
                //         'horizontal' => Alignment::HORIZONTAL_CENTER,
                //     ],
                // ]);
                
                // Estilo para encabezados de tablas
                // $headerStyle = [
                //     'font' => [
                //         'bold' => true,
                //         'color' => ['rgb' => 'FFFFFF'],
                //     ],
                //     'fill' => [
                //         'fillType' => Fill::FILL_SOLID,
                //         'startColor' => ['rgb' => '4472C4'],
                //     ],
                //     'borders' => [
                //         'allBorders' => [
                //             'borderStyle' => Border::BORDER_THIN,
                //         ],
                //     ],
                // ];
                
                // Aplicar estilos a las celdas de datos
                // $sheet->getStyle('A3:E' . $sheet->getHighestRow())->applyFromArray([
                //     'borders' => [
                //         'allBorders' => [
                //             'borderStyle' => Border::BORDER_THIN,
                //         ],
                //     ],
                //     'alignment' => [
                //         'vertical' => Alignment::VERTICAL_CENTER,
                //     ],
                // ]);
                
                // Formato de moneda para columnas numéricas
                // $sheet->getStyle('B3:E' . $sheet->getHighestRow())->getNumberFormat()
                //     ->setFormatCode('"$"#,##0.00');
            },
        ];
    }

    public function columnFormats(): array
    {
        return [
            // 'B' => NumberFormat::FORMAT_NUMBER_00,
            // 'C' => NumberFormat::FORMAT_NUMBER_00,
            // 'D' => NumberFormat::FORMAT_NUMBER_00,
            // 'E' => NumberFormat::FORMAT_NUMBER_00,
        ];
    }
}
