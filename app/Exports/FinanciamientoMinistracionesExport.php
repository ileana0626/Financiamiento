<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
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

class FinanciamientoMinistracionesExport implements FromView, ShouldAutoSize, WithEvents, WithStyles
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
        return 'Ministraciones';
    }
    public function view(): View 
    {
        try {
            //Convertimos los datos a objetos
            $data = (object) [
                'calculo' => (object) $this->datos['calculo'],
                'ministracion' => (object) $this->datos['ministracion'],
                'partidos_sin_rep' => (array) $this->datos['partidos_sin_rep'],
                'partidos_con_rep' => (array) $this->datos['partidos_con_rep']
            ];  

            Log::info('Datos para la exportación:', ['data' => json_decode(json_encode($data), true)]);
            
            // return view('reportes.financiamiento.excel.FinanciamientoMinistraciones', [
            //     'datos' => $data
            // ]);
            // Return an empty view since we're handling the Excel generation through registerEvents
            return view('reportes.financiamiento.excel.FinanciamientoMinistraciones', [
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
        $sheet->getColumnDimension('A')->setWidth(8);
        $sheet->getColumnDimension('B')->setAutoSize(false);
        $sheet->getColumnDimension('B')->setWidth(8);
        $sheet->getColumnDimension('C')->setAutoSize(false);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setAutoSize(false);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setAutoSize(false);
        $sheet->getColumnDimension('E')->setWidth(15);
        $sheet->getColumnDimension('F')->setAutoSize(false);
        $sheet->getColumnDimension('F')->setWidth(15);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setAutoSize(false);
        $sheet->getColumnDimension('H')->setWidth(15);
        $sheet->getColumnDimension('I')->setAutoSize(false);
        $sheet->getColumnDimension('I')->setWidth(15);
        $sheet->getColumnDimension('J')->setAutoSize(false);
        $sheet->getColumnDimension('J')->setWidth(15);
        $sheet->getColumnDimension('K')->setAutoSize(false);
        $sheet->getColumnDimension('K')->setWidth(15);
        $sheet->getColumnDimension('L')->setAutoSize(false);
        $sheet->getColumnDimension('L')->setWidth(15);
        $sheet->getColumnDimension('M')->setAutoSize(false);
        $sheet->getColumnDimension('M')->setWidth(15);
        $sheet->getColumnDimension('N')->setAutoSize(false);
        $sheet->getColumnDimension('N')->setWidth(15);
        $sheet->getColumnDimension('O')->setAutoSize(false);
        $sheet->getColumnDimension('O')->setWidth(15);
        $sheet->getColumnDimension('P')->setAutoSize(false);
        $sheet->getColumnDimension('P')->setWidth(15);

        // Ajustar altura de filas
        $sheet->getDefaultRowDimension()->setRowHeight(-1);
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $sheet = $event->sheet; //Obtenemos la hoja
                $worksheet = $sheet->getDelegate();
                $highestRow = $worksheet->getHighestRow();

                $this->ajustarTamañoLogos($sheet, $worksheet, 'B');            
                // Ajustar altura de filas automáticamente
                $sheet->getDefaultRowDimension()->setRowHeight(-1);
        
                // ***** Formateando Título *****
                $titulo1raParte = "DISTRIBUCIÓN DE LAS MINISTRACIONES MENSUALES QUE SERÁN ENTREGADAS A LOS PARTIDOS POLÍTICOS EN EL AÑO ";
                $anio =  $this->datos['calculo']['anioFiscal'];
                $titulo2daParte = ",\nPOR CONCEPTO DE FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES.";
                $richText = $this->crearTituloConAnio($titulo1raParte, $anio, $titulo2daParte);
                 // Asigna valor a la celda A3 y fusiona las celdas A3:P3
                $sheet->setCellValue('A3', $richText);
                $sheet->mergeCells('A3:P3');
                // Aplica estilos
                $sheet->getStyle('A3')
                    ->getAlignment()
                    ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                    ->setVertical(Alignment::VERTICAL_CENTER);
                $sheet->getStyle('A3')
                    ->getFont()
                    ->setBold(true)
                    ->setSize(14);
                $sheet->getStyle('A3')
                    ->getAlignment()
                    ->setWrapText(true);
                $sheet->getRowDimension(3)->setRowHeight(50);
                
                // Títulos de las colúmnas
                $sheet->getStyle('A5:P5')->applyFromArray([
                    'fill' => [
                        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FFAE8700'],
                    ],
                    'font' => [
                        'bold' => true,
                        'color' => ['argb' => 'FFFFFFFF'],
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                        'vertical' => Alignment::VERTICAL_CENTER,
                    ],
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => 'FFAE8700'],
                        ],
                    ],
                ]);
                $this->FormatearValores($sheet, 'A','P',6, 25);
                $this->FormatearTotales($sheet, 'A', 6, 20, 'O', 2);
                $this->ajustarTamañoLogos($sheet, $worksheet, 'C');
                $this->aplicarBordes($sheet, 'A', 'P', 6, $highestRow);

                $sheet->removeColumn('D');
                

                // Configurar la vista de esquema
                // $sheet->getSheetView()->setView(\PhpOffice\PhpSpreadsheet\Worksheet\SheetView::SHEETVIEW_NORMAL);
                // // // Mostrar controles de esquema de la hoja
                // $sheet->setShowGridlines(true); // Muestra las líneas de cuadrícula en la hoja de Excel.
                // $sheet->setShowRowColHeaders(true); // Muestra los encabezados de filas (números) y columnas (letras)
                // $sheet->setShowSummaryRight(true);  // Muestra los controles de esquema (para expandir/contraer) a la derecha de los grupos de columnas.
                // $sheet->setShowSummaryBelow(true);  // Muestra los controles de esquema debajo de los grupos de filas.
                
                // Agrupar columnas
                // Establece el nivel de esquema de la columna A a 1 y la columna C a 2
                $sheet->getColumnDimension('A')->setOutlineLevel(1);
                $sheet->getColumnDimension('C')->setOutlineLevel(2);

                // Ocultar la columna A
                $sheet->getColumnDimension('A')->setVisible(false);  // Oculta la columna A

            }
        ];
    }

     /**
     * Crea un título formateado con el año en rojo ✅
     */
    private function crearTituloConAnio($titulo1raParte, $anio, $titulo2daParte)
    {
        $richText = new RichText(); // Crea un objeto RichText
        // Agrega la primera parte del título
        $richText->createText($titulo1raParte);
        // Agrega el año en rojo
        $yearRun = $richText->createTextRun($anio);
        $yearFont = $yearRun->getFont();
        $yearFont->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('FFFF0000')); //#FF0000 rojo
        $yearFont->setBold(true);
        $yearFont->setSize(14);
        // Agrega la segunda parte del título en negritas
        $secondPart = $richText->createTextRun($titulo2daParte);
        $secondPart->getFont()->setBold(true); 
        $secondPart->getFont()->setSize(14);
        
        return $richText;
    }

    /**
     * Formatea los valores numéricos de las celdas en formato moneda ✅
     */
    private function FormatearValores($sheet,$colIni,$colFin,$rowIni,$rowFin)
    {
        // Crear rango de columnas (ej: 'A' a 'Z')
        $columns = range($colIni, $colFin);
        
        // Recorrer cada columna
        foreach ($columns as $col) {
            // Recorrer cada fila en el rango especificado
            for ($row = $rowIni; $row <= $rowFin; $row++) {
                $cell = $col . $row;
                $value = $sheet->getCell($cell)->getValue();
                
                // Verificar si el valor es numérico
                if (is_numeric($value)) {
                    // Aplicar formato de moneda
                    $sheet->getStyle($cell)->getNumberFormat()
                        ->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');
                    //Log::debug("Formato aplicado a celda $cell: " . $value);
                }
            }
        }
    }

    /**
     * Formatea los totales en formato moneda ✅
     */
    private function FormatearTotales($sheet, $colIni, $rowIni, $rowFin, $colFin, $numBusquedas)
    {
        // Crear un rango de columnas
        $columns = range($colIni, $colFin);
        $found = 0;
        
        // Recorrer filas
        for ($row = $rowIni; $row <= $rowFin && $found < $numBusquedas; $row++) {
            // Recorrer columnas
            foreach ($columns as $col) {
                if ($found >= $numBusquedas) {
                    break;
                }
                $cell = $col . $row;
                $value = $sheet->getCell($cell)->getValue();
                
                // Verificar si el valor es 'TOTAL' (case insensitive con trim)
                if ($value && strtoupper(trim($value)) === 'TOTAL') {
                    // Crear rango desde la celda actual hasta la columna P
                    $range = $cell . ':P' . $row;
                    
                    //Aplicar color a la celda
                    $sheet->getStyle($cell)->getFont()->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('FFFFFFFF'));

                    // Aplicar formato al rango
                    $sheet->getStyle($range)->applyFromArray([
                        'font' => [
                            'bold' => true,
                        ],
                        'fill' => [
                            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                            'startColor' => ['rgb' => 'FFAE8700']
                        ],
                        'borders' => [
                            'allBorders' => [
                                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                                'color' => ['rgb' => 'FFAE8700']
                            ]
                        ],
                    ]);
                    $found++;
                    //Log::debug("Formato aplicado a celda $cell: " . $value);
                }
            }
        }
    }

    /**
     * Aplica bordes a celdas con contenido ✅
     * Aplica bordes a un rango de celdas hasta encontrar una celda con valor "TOTAL"
     * 
     * @param \PhpOffice\PhpSpreadsheet\Worksheet\Worksheet $sheet Hoja de trabajo
     * @param string $colIni Columna inicial (ej: 'A')
     * @param string $colFin Columna final (ej: 'H')
     * @param int $rowIni Fila inicial
     * @param int $rowFin Fila máxima a revisar
     */
    private function aplicarBordes($sheet, $colIni, $colFin, $rowIni, $rowFin)
    {
        // Recorrer filas
        for ($row = $rowIni; $row <= $rowFin; $row++) {
            $shouldBreak = false;
            
            // Verificar si alguna celda en la fila actual contiene "TOTAL"
            foreach (range($colIni, $colFin) as $col) {
                $cellValue = $sheet->getCell($col . $row)->getValue();
                if (trim($cellValue) === 'TOTAL') {
                    $shouldBreak = true;
                    break; // Salir del bucle si encontramos "TOTAL"
                }
            }
            
            // Aplicar bordes al rango actual
            $range = $colIni . $row . ':' . $colFin . $row;
            $sheet->getStyle($range)->applyFromArray([
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                        'color' => ['argb' => 'FFAE8700']
                    ]
                ]
            ]);
            
            // Si encontramos "TOTAL", salir del bucle
            if ($shouldBreak) {
                break;
            }
        }
    }

    /**
     * Ajustar tamaño y centrar imágenes ✅
     */
    private function ajustarTamañoLogos($sheet, $worksheet, $col) {
        // Ajustar tamaño y centrar imágenes
        $cellWidth = $sheet->getDelegate()->getColumnDimension($col)->getWidth();
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
