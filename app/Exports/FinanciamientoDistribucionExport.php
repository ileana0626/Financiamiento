<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
//use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Fill;
//use PhpOffice\PhpSpreadsheet\Style\Color;
//use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
//use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\Exportable;
use PhpOffice\PhpSpreadsheet\RichText\RichText;

class FinanciamientoDistribucionExport implements FromView, ShouldAutoSize, WithStyles, WithEvents
{
    use Exportable;

    private $datos;
    
    public function __construct($datos)
    {
        $this->datos = $datos;
        // Aumentar el tiempo de ejecución para la generación del Excel
        set_time_limit(300); // 5 minutos
    }

    public function title(): string
    {
        return 'Distribución';
    }
    
    public function view(): View 
    {
        try {
            //Convertimos los datos a objetos
            $data = (object) [
                'calculo' => (object) $this->datos['calculo'],
                'distribucion' => (object) $this->datos['distribucion'],
                'partidos_sin_rep' => (array) $this->datos['partidos_sin_rep'],
                'partidos_con_rep' => (array) $this->datos['partidos_con_rep']
            ];  

            Log::info('Datos para la exportación:', ['data' => json_decode(json_encode($data), true)]);
            
            return view('reportes.financiamiento.excel.FinanciamientoDistribucion', [
                'datos' => $data
            ]);
    
        } catch (\Exception $e) {
            Log::error('Error en la generación de la vista de exportación', [
                'error' => $e->getMessage()
            ]);
            throw $e;
        }
    }

    public function styles(Worksheet $sheet)
    {
        // Aplicar estilos a todas las celdas
        $sheet->getStyle('A1:Z1000')->applyFromArray([
            'font' => [
                'name' => 'Calibri',
                'size' => 10,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                'wrapText' => true,
            ],
        ]);    
    
        // Ajustar el ancho de las columnas
        $sheet->getColumnDimension('A')->setAutoSize(false);
        $sheet->getColumnDimension('A')->setWidth(8);  // No.
        $sheet->getColumnDimension('B')->setAutoSize(false);
        $sheet->getColumnDimension('B')->setWidth(8); // Sigla
        $sheet->getColumnDimension('C')->setAutoSize(false);
        $sheet->getColumnDimension('C')->setWidth(15); // Partido Político
        $sheet->getColumnDimension('D')->setAutoSize(false);
        $sheet->getColumnDimension('D')->setWidth(30); // % Votación
        $sheet->getColumnDimension('E')->setAutoSize(false);
        $sheet->getColumnDimension('E')->setWidth(30); // 30% igualitario
        $sheet->getColumnDimension('F')->setAutoSize(false);
        $sheet->getColumnDimension('F')->setWidth(30); // 70% votación
        $sheet->getColumnDimension('G')->setAutoSize(false);
        $sheet->getColumnDimension('G')->setWidth(30); // 70% con ajuste
        $sheet->getColumnDimension('H')->setAutoSize(false);
        $sheet->getColumnDimension('H')->setWidth(30); // Financiamiento ordinario
        $sheet->getColumnDimension('I')->setAutoSize(false);
        $sheet->getColumnDimension('I')->setWidth(30); // Financiamiento voto

        // Ajustar altura de filas
        $sheet->getDefaultRowDimension()->setRowHeight(-1);
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $sheet = $event->sheet;
                $worksheet = $sheet->getDelegate();
                $highestRow = $worksheet->getHighestRow();
                $highestColumn = $worksheet->getHighestColumn();
                
                
                
                // Establecer zoom al 85%
                $sheet->getDelegate()->getParent()->getActiveSheet()->getSheetView()->setZoomScale(85);
                
                Log::info('Anchos de columna configurados', [
                    'ancho_A' => $sheet->getDelegate()->getColumnDimension('A')->getWidth(),
                    'ancho_B' => $sheet->getDelegate()->getColumnDimension('B')->getWidth(),
                    'ancho_C' => $sheet->getDelegate()->getColumnDimension('C')->getWidth(),
                    'ancho_D' => $sheet->getDelegate()->getColumnDimension('D')->getWidth(),
                    'ancho_E' => $sheet->getDelegate()->getColumnDimension('E')->getWidth(),
                    'ancho_F' => $sheet->getDelegate()->getColumnDimension('F')->getWidth(),
                    'ancho_G' => $sheet->getDelegate()->getColumnDimension('G')->getWidth(),
                    'ancho_H' => $sheet->getDelegate()->getColumnDimension('H')->getWidth(),
                    'ancho_I' => $sheet->getDelegate()->getColumnDimension('I')->getWidth()
                ]);

                // Aplicar bordes solo a celdas con contenido
                $highestRow = $sheet->getHighestRow();
                $highestColumn = $sheet->getHighestColumn();
                
                // Aplicar bordes a celdas con contenido
                foreach ($sheet->getRowIterator(3, $highestRow) as $row) {
                    $rowIndex = $row->getRowIndex();
                    $hasContent = false;
                    
                    // Verificar si la fila tiene contenido
                    foreach ($sheet->getColumnIterator('A', $highestColumn) as $cell) {
                        if ($sheet->getCell($cell->getColumn() . $rowIndex)->getValue() !== null) {
                            $hasContent = true;
                            break;
                        }
                    }
                    
                    // Si la fila tiene contenido, aplicar bordes
                    if ($hasContent) {
                        $sheet->getStyle('A' . $rowIndex . ':' . $highestColumn . $rowIndex)->applyFromArray([
                            'borders' => [
                                'outline' => [
                                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                                    'color' => ['argb' => 'FF000000'],
                                ],
                                'inside' => [
                                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                                    'color' => ['argb' => 'FF000000'],
                                ],
                            ],
                        ]);
                    }
                }

                // Formato de números para columnas monetarias en rojo
                $sheet->getStyle('E2:I' . $highestRow)->applyFromArray([
                    'numberFormat' => [
                        'formatCode' => '[Red]\$#,##0.00_);[Red](\$#,##0.00)'
                    ],
                    // 'font' => [
                    //     'color' => ['argb' => 'FFFF0000']  // Rojo puro
                    // ]
                ]);
                // Formato de porcentaje
                $sheet->getStyle('D2:D' . $highestRow)->getNumberFormat()->setFormatCode('0.00%');
                
                // Estilo para fila 3 (negritas y color negro)
                $sheet->getStyle('A3:I3')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'color' => ['argb' => 'FFFFFFFF']  // Letras blancas
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => [
                            'argb' => 'FFAE8700', // Fondo amarillo claro #AE8700
                        ],
                    ],
                ]);
                //Formateando Título
                $tituloBase = 'FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO ';
                $richText = $this->crearTituloConAnio($tituloBase, $this->datos['distribucion']['anio_ejercicio']);
                $sheet->setCellValue('A1', $richText);

                // Alinear texto al centro para encabezados
                $sheet->getStyle('A1:' . $highestColumn . '1')->applyFromArray([
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER,
                        'wrapText' => true,
                    ],
                    'font' => [
                        'bold' => true,
                        //'color' => ['argb' => 'FF000000'], // Letras negras
                        'size' => 12,
                    ],
                ]);
                
                // Ajustar altura de fila título
                $sheet->getRowDimension(1)->setRowHeight(30);

                // Formateando Anio en rojo Partidos sin representación
                $this->getTextoConAnioRojo($sheet, $this->datos['distribucion']['anio_ejercicio']);

                //Finalmente agregamos filas para dar espacio
                $sheet->insertNewRowBefore(1, 1); // Insert a new row at the beginning
                $sheet->insertNewColumnBefore('A', 1); // Insert a new column at the beginning
                
                // Establecer ancho para la nueva columna
                $sheet->getColumnDimension('A')->setWidth(4); // Ancho de 8 unidades para la nueva columna


                // Ocultar columna J si tipo_distribucion no contiene '2' (por ejemplo: '1,2' o '2')
                $tipoDistribucion = $this->datos['distribucion']['tipo_distribucion'];
                if (strpos($tipoDistribucion, '2') == false) {
                    $sheet->getColumnDimension('J')->setVisible(false);
                }

            },
        ];
    }
    /*
    public function columnFormats(): array
    {
        return [
            'D' => NumberFormat::FORMAT_PERCENTAGE_00,
            'E' => '\$#,##0.00_);(\$#,##0.00\),',
            'F' => '\$#,##0.00_);(\$#,##0.00\),',
            'G' => '\$#,##0.00_);(\$#,##0.00\),',
            'H' => '\$#,##0.00_);(\$#,##0.00\),',
            'I' => '\$#,##0.00_);(\$#,##0.00\),',
        ];
    }
        */
    
    /**
     * Crea un título formateado con el año en rojo
     */
    private function crearTituloConAnio($tituloBase, $anio)
    {
        $richText = new RichText();
        $richText->createText($tituloBase);
        
        $yearRun = $richText->createTextRun($anio);
        $yearFont = $yearRun->getFont();
        $yearFont->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('FFFF0000'));
        $yearFont->setBold(true);
        $yearFont->setSize(12);
        
        return $richText;
    }

    public function getTextoConAnioRojo($sheet, $anio) {
        // Obtener la última fila con datos
        $highestRow = $sheet->getHighestRow();
        
        // Aplicar a toda la columna D
        for ($row = 1; $row <= $highestRow; $row++) {
            $cell = $sheet->getCell('D' . $row);
            $value = $cell->getValue();
            
            if (str_contains($value, (string)$anio)) {
                $richText = new RichText();
                
                // Dividir el texto en partes
                $partes = explode($anio, $value, 2);
                
                // Primera parte
                $parte1 = $richText->createTextRun($partes[0]);
                $parte1->getFont()->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('000000'));
                
                // Año en rojo
                $parteAnio = $richText->createTextRun($anio);
                $parteAnio->getFont()->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('FF0000'));
                $parteAnio->getFont()->setBold(true);
                
                // Segunda parte si existe
                if (isset($partes[1])) {
                    $parte2 = $richText->createTextRun($partes[1]);
                    $parte2->getFont()->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('000000'));
                }
                
                $sheet->setCellValue('D' . $row, $richText);
                $sheet->getStyle('D' . $row)->getAlignment()->setWrapText(true);
            }
        }
    }

    public function formatoTextoNegro($sheet, $highestColumn, $highestRow) {
        // Aplicar formato a celdas con clase 'texto-negro'
        $sheet->getStyle('A1:'.$highestColumn.$highestRow)->applyFromArray([
            'font' => [
                'color' => ['argb' => 'FF000000'] // Negro
            ]
        ]);
        
        // Aplicar formato a la fila de TOTALES
        $sheet->getStyle('A'.$highestRow.':'.$highestColumn.($highestRow+1))->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['argb' => 'FF000000'] // Negro
            ]
        ]);
    }
}
