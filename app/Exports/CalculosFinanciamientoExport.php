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
// Texto de color
use PhpOffice\PhpSpreadsheet\RichText\RichText;
use PhpOffice\PhpSpreadsheet\Style\Color;



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

                 // Aplicar estilos específicos a celdas
                 $sheet->getStyle('A1:Z1000')->applyFromArray([
                    'font' => [
                        'name' => 'Calibri',
                        'size' => 10
                    ]
                ]);

                // Log para depuración
                /*Log::info('Anchos de columna configurados', [
                    'ancho_A' => $sheet->getDelegate()->getColumnDimension('A')->getWidth(),
                    'ancho_B' => $sheet->getDelegate()->getColumnDimension('B')->getWidth(),
                    'ancho_C' => $sheet->getDelegate()->getColumnDimension('C')->getWidth()
                ]);*/

                $this->highlightQuotedTextInCell($sheet, 'A2', "'"); // Título
                $this->highlightQuotedTextInCell($sheet, 'B', "'", 1, 22); //los demas textos entre comillas

                //Merge cells
                //$sheet->mergeCells('B3:C3');

                // Para la columna C (montos)
                $sheet->getStyle('C1:C1000')->getAlignment()->setHorizontal('right');
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
            
            // Ajustar el ancho de la columna para que se vea bien
            $sheet->getColumnDimension('A')->setAutoSize(true);
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

    /**
     * Resalta en rojo el texto entre comillas en una celda o columna
     * @param \PhpOffice\PhpSpreadsheet\Worksheet\Worksheet $sheet
     * @param string $reference Referencia de celda (ej: 'A1') o columna (ej: 'A')
     * @param string $delimiter Delimitador a buscar (por defecto: comilla simple)
     * @param int|null $startRow Fila de inicio (solo para referencia de columna)
     * @param int|null $endRow Fila final (opcional, para referencia de columna)
     * @example
     * // Para una celda específica
        $this->highlightQuotedTextInCell($sheet, 'A1');

        // Para una columna completa
        $this->highlightQuotedTextInCell($sheet, 'A');

        // Para un rango específico de filas en una columna
        $this->highlightQuotedTextInCell($sheet, 'A', "'", 1, 100); // Filas 1 a 100

        // Con delimitador personalizado
        $this->highlightQuotedTextInCell($sheet, 'B', '"'); // Usa comillas dobles
     */
    function highlightQuotedTextInCell($sheet, $reference, $delimiter = "'", $startRow = null, $endRow = null) {
        // Si es solo una letra de columna
        if (preg_match('/^[A-Za-z]+$/', $reference)) {
            $col = strtoupper($reference);
            $startRow = $startRow ?: 1;
            $highestRow = $endRow ?: $sheet->getHighestRow();
            
            for ($row = $startRow; $row <= $highestRow; $row++) {
                $cell = $col . $row;
                $this->highlightCellQuotedText($sheet, $cell, $delimiter);
            }
        } 
        // Si es una referencia de celda completa
        else {
            $this->highlightCellQuotedText($sheet, $reference, $delimiter);
        }
    }

    /**
     * Función auxiliar para resaltar texto en una celda específica
     */
    private function highlightCellQuotedText($sheet, $coordinate, $delimiter) {
        $cellValue = $sheet->getCell($coordinate)->getValue();
        
        if ($cellValue instanceof RichText) {
            $cellValue = $cellValue->getPlainText();
        }
        
        if (empty($cellValue) || strpos($cellValue, $delimiter) === false) {
            return;
        }

        $richText = new RichText();
        $parts = explode($delimiter, $cellValue);
        
        foreach ($parts as $index => $part) {
            if ($index % 2 === 0) {
                $richText->createText($part);
            } else {
                // Solo el texto entre delimitadores, sin los delimitadores
                $richText->createTextRun($part)
                        ->getFont()
                        ->setColor(new Color(Color::COLOR_RED));
            }
        }
        
        $sheet->setCellValue($coordinate, $richText);
    }
}
