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
                $sheet->getColumnDimension('B')->setWidth(90);
                $sheet->getColumnDimension('C')->setAutoSize(false);
                $sheet->getColumnDimension('C')->setWidth(20);

                // Tamaño de fuente de todo el documento -- No aplica correctamente si se da estilo a -> td
                //$sheet->getParent()->getDefaultStyle()->getFont()->setName('Arial');
                //$sheet->getParent()->getDefaultStyle()->getFont()->setSize(14);

                 // Aplicar estilos específicos a celdas
                 $sheet->getStyle('A1:Z1000')->applyFromArray([
                    'font' => [
                        'name' => 'Calibri',
                        'size' => 10
                    ]
                ]);

                // Log para depuración
                Log::info('Anchos de columna configurados', [
                    'ancho_A' => $sheet->getDelegate()->getColumnDimension('A')->getWidth(),
                    'ancho_B' => $sheet->getDelegate()->getColumnDimension('B')->getWidth(),
                    'ancho_C' => $sheet->getDelegate()->getColumnDimension('C')->getWidth()
                ]);

                //Merge cells
                //$sheet->mergeCells('B3:C3');

                // Para la columna C (montos)
                $sheet->getStyle('C1:C1000')->getAlignment()->setHorizontal('right');
                
                /*
                $sheet->getStyle('B3')->applyFromArray([
                    'alignment' => [
                        'wrapText' => true,
                        'vertical' => 'top',
                        'horizontal' => 'left'
                    ]
                ]);
                $sheet->getRowDimension(3)->setRowHeight(-1); // -1 para autoajustar

                // Si es necesario, forzar el recálculo
                $sheet->calculateColumnWidths();
                */
                // Configuración general para la columna B
                $sheet->getStyle('B4:B100')->applyFromArray([
                    'alignment' => [
                        'wrapText' => true,
                        'vertical' => 'top',
                        'horizontal' => 'right'  // Importante para el texto largo
                    ]
                ]);

                // $sheet->getStyle('B3')->getAlignment()->applyFromArray([
                //     'wrapText' => true,
                //     'vertical' => 'top',  // Alinea el texto en la parte superior
                // ]);


                // Aplicar color rojo a montos específicos
                //$sheet->getStyle('C8:C100')->getFont()->getColor()->setARGB('FF0000');
            },
        ];
    }

    public function columnFormats(): array
    {
        return [
            //Ejemplo de formato de moneda
            // 'B' => NumberFormat::FORMAT_NUMBER_00,
        ];
    }
}
