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
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

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
                
                $this->ajustarTamañoLogos($sheet, $worksheet);            
                // Ajustar altura de filas automáticamente
                $sheet->getDefaultRowDimension()->setRowHeight(-1);
                
                // Asegurar que la columna C tenga alineación centrada
                $sheet->getStyle('C5:C' . $highestRow)->getAlignment()->setHorizontal('center');
                
                // Establecer zoom al 85%
                $sheet->getDelegate()->getParent()->getActiveSheet()->getSheetView()->setZoomScale(85);
                
                /*Log::info('Anchos de columna configurados', [
                    'ancho_A' => $sheet->getDelegate()->getColumnDimension('A')->getWidth(),
                    'ancho_B' => $sheet->getDelegate()->getColumnDimension('B')->getWidth(),
                    'ancho_C' => $sheet->getDelegate()->getColumnDimension('C')->getWidth(),
                    'ancho_D' => $sheet->getDelegate()->getColumnDimension('D')->getWidth(),
                    'ancho_E' => $sheet->getDelegate()->getColumnDimension('E')->getWidth(),
                    'ancho_F' => $sheet->getDelegate()->getColumnDimension('F')->getWidth(),
                    'ancho_G' => $sheet->getDelegate()->getColumnDimension('G')->getWidth(),
                    'ancho_H' => $sheet->getDelegate()->getColumnDimension('H')->getWidth(),
                    'ancho_I' => $sheet->getDelegate()->getColumnDimension('I')->getWidth()
                ]);*/

                // Aplicar bordes solo a celdas con contenido
                $highestRow = $sheet->getHighestRow();
                

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

                // Aplicar bordes a todas las celdas con contenidos menos el título
                $this->aplicarBordes($sheet, $highestRow);
                
                //Aplicar estilos subtotal fondo dorado
                $this->aplicarEstilosSubtotal($sheet);

                //Insertar logos
                //$this->insertarLogos($sheet);
                // Redimensionar imágenes
                             
                // Ajustar altura de filas
                $sheet->getDefaultRowDimension()->setRowHeight(-1);

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
    public function aplicarBordes($sheet, $highestRow) {
        // Aplicar bordes a celdas con contenido
        foreach ($sheet->getRowIterator(4, $highestRow) as $row) {
            $rowIndex = $row->getRowIndex();
            $hasContent = false;
            
            // Verificar si la fila tiene contenido
            foreach (range('A', 'J') as $col) {
                if ($sheet->getCell($col . $rowIndex)->getValue() !== null) {
                    $hasContent = true;
                    break;
                }
            }
            
            // Si la fila tiene contenido, aplicar bordes solo hasta la columna I
            if ($hasContent) {
                // Primero, asegurarse de que no haya estilos aplicados más allá de I -> resetea bordes
                $sheet->getStyle('I' . $rowIndex . ':' . $sheet->getHighestColumn() . $rowIndex)->applyFromArray([
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                        ],
                    ],
                ]);
                
                // Luego aplicar bordes hasta I
                $sheet->getStyle('A' . $rowIndex . ':I' . $rowIndex)->applyFromArray([
                    'borders' => [
                        'outline' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => 'FFAE8700'],
                        ],
                        'inside' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => 'FFAE8700'],
                        ],
                    ],
                ]);
            }
        }
    }

    public function aplicarEstilosSubtotal($sheet) {
        // Buscar filas que contengan "SUBTOTAL", "TOTALES" o "GRAN TOTAL" en las columnas C a H
        $highestRow = $sheet->getHighestRow();
        $columnsToCheck = ['C', 'D', 'E', 'F', 'G', 'H'];
        $targets = ['SUBTOTAL', 'TOTALES', 'GRAN TOTAL', 'GRANTOTAL'];
        $foundCount = 0;
        $targetCount = 4; // Número de coincidencias que necesitamos encontrar
        
        // Buscar desde la fila 4 hacia abajo (asumiendo que las filas 1-3 son encabezados)
        for ($row = 4; $row <= $highestRow && $foundCount < $targetCount; $row++) {
            foreach ($columnsToCheck as $col) {
                $cell = $sheet->getCell("{$col}{$row}");
                $cellValue = $cell ? strtoupper(trim($cell->getValue())) : '';
                
                // Depuración: Mostrar valores de celdas
                if ($cellValue !=='') {
                    Log::info("Celda {$col}{$row}: Count: {$foundCount}", ['valor' => $cellValue]);
                }
                
                // Verificar si el valor de la celda contiene alguna de las palabras clave
                foreach ($targets as $target) {
                    if (str_contains($cellValue, $target)) {
                        // Aplicar estilos a la fila donde se encontró el texto
                        $sheet->getStyle($col.$row)->applyFromArray([
                            'alignment' => [
                                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_RIGHT,
                                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                            ],
                            'font' => [
                                'bold' => true,
                                'color' => ['argb' => 'FFFFFFFF'],
                            ],
                        ]);
                        $sheet->getStyle("A{$row}:I{$row}")->applyFromArray([
                            'fill' => [
                                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                                'startColor' => ['argb' => 'FFAE8700'],
                            ],
                            'font' => [
                                'bold' => true,
                            ],
                        ]);
                        $foundCount++;
                        break 2; // Salir de ambos bucles (columnas y targets)
                    }
                }
            }
        }
    }
    public function ajustarTamañoLogos($sheet, $worksheet) {
        // Ajustar tamaño y centrar imágenes
        $cellWidth = $sheet->getDelegate()->getColumnDimension('C')->getWidth();
        $targetWidth = $cellWidth * 5; // Ancho objetivo basado en el ancho de la columna
        
        // Obtener la colección de dibujos
        $drawings = $sheet->getDrawingCollection();
        Log::info('Total de imágenes encontradas: ' . $drawings->count());
        
        foreach ($drawings as $index => $drawing) {
            // Obtener coordenadas de la celda donde está la imagen
            $coordinates = $drawing->getCoordinates();
            
            // Obtener fila y columna
            preg_match('/([A-Z]+)(\d+)/', $coordinates, $matches);
            $col = $matches[1];
            $row = $matches[2];
            
            // Log::info(sprintf(
            //     'Imagen %d: Celda %s (Fila: %d, Col: %s) - Tamaño actual: %dx%d',
            //     $index + 1,
            //     $coordinates,
            //     $row,
            //     $col,
            //     $drawing->getWidth(),
            //     $drawing->getHeight()
            // ));
            
            // Tamaño deseado para la imagen
            $imageWidth = 30; // Ancho fijo para la imagen
            $imageHeight = 30; // Alto fijo para la imagen
            
            // Configurar tamaño de la imagen
            $drawing->setResizeProportional(true);
            $drawing->setWidth($imageWidth);
            //$drawing->setHeight($imageHeight);
            
            // Obtener dimensiones de la celda
            $colDimension = $sheet->getColumnDimension($col);
            $sheet->getRowDimension($row)->setRowHeight(30);
            $rowDimension = $sheet->getRowDimension($row);
            
            // Calcular ancho de celda (si es automático, usar un valor por defecto)
            $cellWidth = $colDimension->getWidth() * 7; // Aproximación de píxeles por carácter
            $cellHeight = $rowDimension->getRowHeight() ?: 15;
            
            // Calcular offsets para centrar
            $offsetX = max(0, ($cellWidth - $imageWidth) / 2);
            $offsetY = max(0, ($cellHeight-$imageHeight)/2)+7;
            
            // Aplicar offsets
            $drawing->setOffsetX((int)$offsetX);
            $drawing->setOffsetY((int)$offsetY);
           
            // Hacer que la imagen sea flotante
            //$drawing->setWorksheet($worksheet);
            
            // Ajustar altura de la fila si es necesario
            $desiredRowHeight = max($imageHeight + 4, $cellHeight); // Mínimo 4px de padding
            $sheet->getRowDimension($row)->setRowHeight($desiredRowHeight);
        }
    }

    // public function insertarLogos($sheet) {
    //     try {
    //         // Get the underlying PhpSpreadsheet worksheet
    //         $worksheet = $sheet->getDelegate();
    //         $row = 5; // Starting row for data
                    
    //         if (isset($this->datos['partidos_con_rep'])) {
    //             foreach ($this->datos['partidos_con_rep'] as $partido) {
    //                 try {
    //                     // Convert to PNG if needed
    //                     $logoFile = str_replace('.webp', '.png', $partido->logo);
    //                     $logoPath = public_path('img/logos/' . $logoFile);
                        
    //                     // Only try to add logo if file exists
    //                     if (file_exists($logoPath)) {
    //                         $drawing = new Drawing();
    //                         $drawing->setName($partido->siglas);
    //                         $drawing->setDescription('Logo de ' . $partido->nombre);
    //                         $drawing->setPath($logoPath);
    //                         $drawing->setHeight(15);
    //                         $drawing->setCoordinates('C' . $row);
    //                         $drawing->setOffsetX(5);
    //                         $drawing->setWorksheet($worksheet);
                            
    //                         // Adjust row height to fit the logo
    //                         $worksheet->getRowDimension($row)->setRowHeight(20);
    //                     }
    //                 } catch (\Exception $e) {
    //                     Log::error('Error al insertar logo en Excel: ' . $e->getMessage());
    //                 }
    //                 $row++;
    //             }
    //         }
            
    //         // Apply other styles after adding images
    //         $this->aplicarEstilosSubtotal($worksheet);
    //     } catch (\Exception $e) {
    //         Log::error('Error en insertarLogos: ' . $e->getMessage());
    //     }
    // }   
}
