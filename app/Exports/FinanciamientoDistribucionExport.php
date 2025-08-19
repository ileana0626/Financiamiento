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
        $sheet->getColumnDimension('D')->setWidth(35); // % Votación
        $sheet->getColumnDimension('E')->setAutoSize(false);
        $sheet->getColumnDimension('E')->setWidth(35); // 30% igualitario
        // $sheet->getColumnDimension('F')->setAutoSize(false);
        // $sheet->getColumnDimension('F')->setWidth(30); // 70% votación
        $sheet->getColumnDimension('F')->setAutoSize(false);
        $sheet->getColumnDimension('F')->setWidth(35); // 70% con ajuste
        $sheet->getColumnDimension('G')->setAutoSize(false);
        $sheet->getColumnDimension('G')->setWidth(35); // Financiamiento ordinario
        $sheet->getColumnDimension('H')->setAutoSize(false);
        $sheet->getColumnDimension('H')->setWidth(35); // Financiamiento voto

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
                $highestRow = $sheet->getHighestRow();
                
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
             
                // Formato de números para columnas monetarias en rojo
                /*$sheet->getStyle('E2:H' . $highestRow)->applyFromArray([
                    'numberFormat' => [
                        'formatCode' => '[Red]\$#,##0.00_);[Red](\$#,##0.00)'
                    ],
                    // 'font' => [
                    //     'color' => ['argb' => 'FFFF0000']  // Rojo puro
                    // ]
                ]);
                */

                // Formato de porcentaje
                //$sheet->getStyle('D2:D' . $highestRow)->getNumberFormat()->setFormatCode('0.00%');
                
                // Estilo para fila 3 (negritas y color negro)
                $sheet->getStyle('A3:H3')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'color' => ['argb' => 'FFFFFFFF']  // Letras blancas
                    ],
                    'fill' => [
                        'fillType' => Fill::FILL_SOLID,
                        'startColor' => [
                            'argb' => 'FFAE8700', // Amarillo claro #AE8700
                        ],
                    ],
                ]);
                //Formateando Título
                $tituloBase = 'FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO ';
                $richText = $this->crearTituloConAnio($tituloBase, $this->datos['distribucion']['anio_ejercicio']);
                $sheet->setCellValue('A1', $richText); // Agregamos el título con el año en rojo

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
                             
                // Ajustar altura de filas
                $sheet->getDefaultRowDimension()->setRowHeight(-1);

                //Finalmente agregamos filas para dar espacio
                $sheet->insertNewRowBefore(1, 1); // Insert a new row at the beginning
                $sheet->insertNewColumnBefore('A', 1); // Insert a new column at the beginning
                // Establecer ancho para la nueva columna
                $sheet->getColumnDimension('A')->setWidth(4); // Ancho de 8 unidades para la nueva columna

                // Ocultar columna H si tipo_distribucion no contiene '2' (por ejemplo: '1,2' o '2')
                $tipoDistribucion = $this->datos['distribucion']['tipo_distribucion'];
                if (strpos($tipoDistribucion, '2') === false){ // Ocultar columna H si tipo_distribucion no contiene '2'
                    $sheet->getColumnDimension('I')->setVisible(false); // Ocultar la columna
                    $sheet->removeColumn('I'); // Eliminar la columna
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
     * Crea un título formateado con el año en rojo ✅
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

    /**
     * Aplica el texto con el año en rojo ✅
     */
    public function getTextoConAnioRojo($sheet, $anio) {
        // Obtener la última fila con datos
        $highestRow = 23; //$sheet->getHighestRow();
        
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
                // Aplicar ancho a la fila
                $sheet->getRowDimension($row)->setRowHeight(35);
                
                $sheet->setCellValue('D' . $row, $richText);
                $sheet->getStyle('D' . $row)->getAlignment()->setWrapText(true);
            }
        }
    }

    /**
     * Aplica bordes a celdas con contenido ✅
     */
    public function aplicarBordes($sheet, $highestRow) {
        // Aplicar bordes a celdas con contenido
        foreach ($sheet->getRowIterator(4, $highestRow) as $row) {
            $rowIndex = $row->getRowIndex();
            $hasContent = false;
            
            // Verificar si la fila tiene contenido
            foreach (range('A', 'H') as $col) {
                if ($sheet->getCell($col . $rowIndex)->getValue() !== null) {
                    $hasContent = true;
                    break;
                }
            }
            
            // Si la fila tiene contenido, aplicar bordes solo hasta la columna I
            if ($hasContent) {
                // Primero, asegurarse de que no haya estilos aplicados más allá de I -> resetea bordes
                $sheet->getStyle('H' . $rowIndex . ':' . $sheet->getHighestColumn() . $rowIndex)->applyFromArray([
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                        ],
                    ],
                ]);
                // Luego aplicar bordes hasta H
                $sheet->getStyle('A' . $rowIndex . ':H' . $rowIndex)->applyFromArray([
                    'borders' => [
                        'outline' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => 'FFAE8700'], // Amarillo claro #AE8700
                        ],
                        'inside' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => 'FFAE8700'], // Amarillo claro #AE8700
                        ],
                    ],
                ]);
            }
        }
    }

    public function limpiarEstilos($sheet, $col, $rowIndex) {
        // Primero, asegurarse de que no haya estilos aplicados más allá de $col -> resetea bordes
        $sheet->getStyle($col . $rowIndex . ':' . $sheet->getHighestColumn() . $rowIndex)->applyFromArray([
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                ],
            ],
        ]);
    }

    /**
     * Aplica estilos a las filas que contengan "SUBTOTAL", "TOTALES" o "GRAN TOTAL" ✅
     * el formateo es por fila
     */
    public function aplicarEstilosSubtotal($sheet) {
        //$highestRow = $sheet->getHighestRow();
        $highestRow = 23; // hasta la fila 23
        $columnsToCheck = ['A', 'C'];
        $targets = ['SUBTOTAL', 'TOTALES', 'GRAN TOTAL'];
        $foundCount = 0;
        $targetCount = 4; // Número de coincidencias que necesitamos encontrar
        
        // Buscar desde la fila 4 hacia abajo (asumiendo que las filas 1-3 son encabezados)
        for ($row = 4; $row <= $highestRow && $foundCount < $targetCount; $row++) {
            foreach ($columnsToCheck as $col) { // recorre las columnas
                $cell = $sheet->getCell("{$col}{$row}"); // Obtiene el valor de la celda
                $cellValue = $cell ? strtoupper(trim($cell->getValue())) : ''; // checa si existe, y si no, lo deja vacio ''
                if ($cellValue !=='') { // si la celda no esta vacia
                    // Verificar si el valor de la celda contiene alguna de las palabras clave
                    foreach ($targets as $target) {
                        if (str_contains($cellValue, $target)) { // si el valor de la celda contiene alguna de las palabras clave
                            // Depuración: Mostrar valores de celdas
                            Log::info("Celda {$col}{$row}: Count: {$foundCount}", ['valor' => $cellValue]);

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
                            $sheet->getStyle("A{$row}:H{$row}")->applyFromArray([
                                'fill' => [
                                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                                    'startColor' => ['argb' => 'FFAE8700'], // Amarillo claro #AE8700
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
    }

    /**
     * Ajustar tamaño y centrar imágenes ✅
     */
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
}
