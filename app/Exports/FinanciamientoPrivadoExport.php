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
use Mockery\Undefined;
use PhpOffice\PhpSpreadsheet\RichText\RichText;
use PhpOffice\PhpSpreadsheet\Cell\Coordinate;

class FinanciamientoPrivadoExport implements FromView, ShouldAutoSize, WithEvents, WithStyles
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
        return 'Financiamiento Privado';
    }
    public function view(): View 
    {
        try {
            //Convertimos los datos a objetos
            /*$data = (object) [
                'calculo' => (object) $this->datos['calculo'],
                'finan_Privado' => (object) $this->datos['finan_Privado'],
                'partidos_sin_rep' => (array) $this->datos['partidos_sin_rep'],
                'partidos_con_rep' => (array) $this->datos['partidos_con_rep']
            ];*/
            /*Log::info('Datos para la exportación:', ['data' => json_decode(json_encode($data), true)]);*/
            //return view('reportes.financiamiento.excel.FinanciamientoPrivado', ['datos' => $data]);
            //return view('reportes.financiamiento.excel.FinanciamientoPrivado');
            return view('reportes.financiamiento.excel');
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
                'wrapText' => true,
            ],
        ]);
        $sheet->getStyle('B1:Z1000')->applyFromArray([
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            ],
        ]);

         // Ajustar el ancho de las columnas
         $sheet->getColumnDimension('A')->setAutoSize(false);
         $sheet->getColumnDimension('A')->setWidth(30);
         $sheet->getColumnDimension('B')->setAutoSize(false);
         $sheet->getColumnDimension('B')->setWidth(2);

        // Ajustar altura de filas
        $sheet->getDefaultRowDimension()->setRowHeight(-1);
    }

    public function columnFormats(): array
    {
        return [
            //Ejemplo de formato de moneda
            // 'B' => NumberFormat::FORMAT_NUMBER_00,
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $sheet = $event->sheet; //Obtenemos la hoja
                $worksheet = $sheet->getDelegate();
                $highestRow = $worksheet->getHighestRow();

                // Obtenemos el número de partidos políticos
                $numPPsinRep = count($this->datos['partidos_sin_rep']);
                $numPPconRep = count($this->datos['partidos_con_rep']);
                $numPP = $numPPsinRep + $numPPconRep;

                // ***** Formateando Título *****
                $titulo1raParte = "DETERMINACIÓN DE LOS LÍMITES DE APORTACIONES ANUALES DE PERSONAS MILITANTES Y SIMPATIZANTES DE LOS PARTIDOS POLÍTICOS \n CORRESPONDIENTES AL FINANCIAMIENTO PRIVADO DEL AÑO ";
                $anio =  $this->datos['calculo']['anioFiscal'];
                $richText = $this->crearTituloConAnio($titulo1raParte, $anio);
                $sheet->setCellValue('A2', $richText);
                Log::info('👹 Número de partidos políticos: ' . $numPP);
                // Convert number of parties to Excel column letters
                $endColumn = Coordinate::stringFromColumnIndex($numPP * 2 + 1);
                $sheet->mergeCells('A2:' . $endColumn . '2');
                $sheet->getStyle('A2')
                    ->getAlignment()
                    ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                    ->setVertical(Alignment::VERTICAL_CENTER);
                $sheet->getRowDimension(2)->setRowHeight(40);

                // ***** Formateando Textos *****
                $sheet->setCellValue('A6', $this->crearTexto_0($anio));
                $sheet->setCellValue('A8', $this->crearTexto_1());
                $sheet->setCellValue('A10', $this->crearTexto_2());
                // Combinar filas
                $sheet->mergeCells('A10:' . 'A11');
                // Combinar columnas
                $sheet->mergeCells('C10:' . $endColumn . '10');
                $sheet->setCellValue('A12', $this->crearTexto_3());
                // Combinar filas
                $sheet->mergeCells('A12:' . 'A13');
                // Combinar columnas
                $sheet->mergeCells('C12:' . $endColumn . '12');
                $sheet->setCellValue('A14', $this->crearTexto_4());
                // Combinar filas
                $sheet->mergeCells('A14:' . 'A15');
                // Combinar columnas
                $sheet->mergeCells('C14:' . $endColumn . '14');
                $sheet->setCellValue('A16', $this->crearTexto_5());
                // Combinar filas
                $sheet->mergeCells('A16:' . 'A17');
                // Combinar columnas
                $sheet->mergeCells('C16:' . $endColumn . '16');
                $sheet->setCellValue('A19', $this->crearFooter());
                // Combinar columnas
                $sheet->mergeCells('A19:' . $endColumn . '19');

                $wrapStyle = [
                    'alignment' => [
                        'wrapText' => true,
                    ]
                ];
                // Aplicamos el estilo de envoltura a las celdas
                $sheet->getStyle('A6:A16')->applyFromArray($wrapStyle);

                // ***** Agregando Partidos Con Representación***** Empieza desde C5
                $sheet->getRowDimension(4)->setRowHeight(30);
                //$this->procesarPartidos($sheet, 'C', 4);

                // for ($i = 1; $i <= $numPP; $i++) {

                //     $sheet->getStyle('A'.($i * 2))
                //         ->getAlignment()
                //         ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                //         ->setVertical(Alignment::VERTICAL_CENTER);
                // }

            }
        ];
    }
    /**
     * Crea un título formateado con el año en rojo ✅
     */
    private function crearTituloConAnio($titulo1raParte, $anio)
    {
        $richText = new RichText(); // Crea un objeto RichText
        // Agrega la primera parte del título
        $textRun = $richText->createTextRun($titulo1raParte);
        $textRun->getFont()
            ->setBold(true)
            ->setSize(12);
        // Agrega el año en rojo
        $yearRun = $richText->createTextRun($anio);
        $yearRun->getFont()
            ->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('FFFF0000'))
            ->setBold(true)
            ->setSize(12);
        return $richText;
    }
    private function crearTexto_0($anio) // ✅
    {
        $richText = new RichText();
        $richText->createText('Monto a entregar a cada partido político en el año ');
        $yearRun = $richText->createTextRun($anio);
        $yearRun->getFont()->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color('FFFF0000'));
        $richText->createText(', por concepto de ');
        $textRun1 = $richText->createTextRun('financiamiento público para actividades ordinarias permanentes.');
        $textRun1->getFont()->setBold(true);
        return $richText;
    }
    private function crearTexto_1() // ✅
    {
        $richText = new RichText();
        $textRun1 = $richText->createTextRun("1. ");
        $textRun1->getFont()->setBold(true);
        $richText->createText("El límite de financiamiento privado de los institutos políticos no será mayor al cincuenta por ciento del financiamiento público que le corresponda");
        $textRun2 = $richText->createTextRun(" (Art. 45 fracción II del CIPEEP).");
        $textRun2->getFont()->setBold(true);
        return $richText;
    }
    private function crearTexto_2() // ✅
    {
        $richText = new RichText();  
        $textRun1 = $richText->createTextRun("2. Cada partido político no podrá recibir anualmente aportaciones en dinero y/o en especie de personas militantes, por una cantidad superior al dos por ciento del financiamiento público otorgado a la totalidad de los partidos políticos");
        $textRun1->getFont()->setBold(true);
        $richText->createText(" para el sostenimiento de sus actividades ordinarias en el año de que se trate, cuidando que el importe que por financiamiento público reciba cada partido político prevalezca sobre el financiamiento privado de que los institutos políticos se alleguen.");
        $textRun2 = $richText->createTextRun(" (Art. 48 párrafo segundo, inciso a) del CIPEEP y art. 56 numeral 1, inciso a) y numeral 2, inciso a) de la LGPP).");
        $textRun2->getFont()->setBold(true);
        return $richText;
    }
    private function crearTexto_3() // ✅
    {
        $richText = new RichText();  
        $textRun1 = $richText->createTextRun("3. Las aportaciones  en dinero o en especie de personas simpatizantes");
        $textRun1->getFont()->setBold(true);
        $richText->createText(", tendrán como límite individual anual el");
        $textRun2 = $richText->createTextRun(" 0.5 por ciento del tope de gasto para la elección presidencial inmediata anterior. (Art. 48 último párrafo del CIPEEP y art. 56 numeral 2, inciso d) de la LGPP).");
        $textRun2->getFont()->setBold(true);
        return $richText;
    }
    private function crearTexto_4() // ✅
    {
        $richText = new RichText();  
        $textRun1 = $richText->createTextRun("4. Las aportaciones que en dinero realice cada persona simpatizante ");
        $textRun1->getFont()->setBold(true);
        $richText->createText(", tendrán como límite anual el equivalente al");
        $textRun2 = $richText->createTextRun(" 0.5 por ciento del tope de gasto para la elección a la Gubernatura inmediata anterior. (Art. 48 fracción II, inciso c) del CIPEEP.)");
        $textRun2->getFont()->setBold(true);
        return $richText;
    }
    private function crearTexto_5() // ✅
    {
        $richText = new RichText();  
        $textRun1 = $richText->createTextRun("5. El financiamiento por rendimientos financieros de los partidos políticos");
        $textRun1->getFont()->setBold(true);
        $richText->createText(", tendrán un límite anual equivalente al");
        $textRun2 = $richText->createTextRun(" 0.5% del tope de gastos para la elección a la elección a la Gubernatura inmediata anterior. (Art. 48 fracción IV inciso a) del CIPEEP.)");
        $textRun2->getFont()->setBold(true);
        return $richText;
    }
    private function crearFooter() // ✅
    {
        $richText = new RichText();  
        $textRun1 = $richText->createTextRun("SIGLAS: ");
        $textRun1->getFont()->setBold(true);
        $richText->createText("LGPP. Ley General de Partidos Políticos; CIPEEP. Código de Instituciones y Procesos Electorales del Estado de Puebla.");
        return $richText;
    }

    /**
     * Procesa los partidos políticos para agregar sus logos y nombres
     * @param $sheet Hoja de cálculo
     * @param $colInit Columna inicial tipo string
     * @param $rowInit Fila inicial tipo int
     */
    private function procesarPartidos($sheet, $colInit, $rowInit)
    {
        $col = $colInit;
        
        $partidos = [...$this->datos['partidos_con_rep'],...$this->datos['partidos_sin_rep']]; // mezcla los arreglos

        // Encabezados, logos de los partidos
        foreach ($partidos as $key => $partido) {
            $row = $rowInit;
            // ***** Logo *****
            //$sheet->setCellValue($col . $row, $partido->siglas); // Siglas
            $sheet->getColumnDimension($col)->setWidth(20);
            $this->procesarLogo($sheet, $col, $row, $partido);
            $sheet->getStyle($col . $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('FFAE8700'); // Color #AE8700 
            

            // ***** Financiamiento público para actividades ordinarias permanentes *****
            $row = $row + 2; // Avanza 2 filas
            $value = $partido->C_fpaop ?? $partido->monto_2_por_ciento ?? 'Valor no disponible';
            $sheet->setCellValue($col . $row, $value);
            if (isset($partido->C_fpaop) && $partido->C_fpaop !== null) {
                $value = $partido->C_fpaop;
            } elseif (isset($partido->monto_2_por_ciento)) {
                $value = $partido->monto_2_por_ciento;
            } else {
                $value = 'Valor no disponible';
            }
            $sheet->setCellValue($col . $row, $value); // Asignamos el valor de Financiamiento público
             // Aplicar formato de moneda
             $sheet->getStyle($col . $row)->getNumberFormat()->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');
        
            // ***** 1. El límite de financiamiento privado de los institutos políticos
            $row = $row + 2;
            $sheet->setCellValue($col . $row, $partido->finpriv_limite_finPrivado ?? 'Valor no disponible');
            // Aplicar formato de moneda
            $sheet->getStyle($col . $row)->getNumberFormat()->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');
            
            // ***** 2. Las aportaciones en dinero y/o en especie de personas militantes
            $row = $row + 2;
            $sheet->setCellValue($col . $row, $partido->finpriv_aportaciones_militantes ?? 'Valor no disponible');
            // Aplicar formato de moneda
            $sheet->getStyle($col . $row)->getNumberFormat()->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');

            // ***** 3. Las aportaciones en dinero o en especie de personas simpatizantes
            $row = $row + 2;
            $sheet->setCellValue($col . $row, $partido->finpriv_aportaciones_simpPres ?? 'Valor no disponible');
            // Aplicar formato de moneda
            $sheet->getStyle($col . $row)->getNumberFormat()->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');
            
            // ***** 4. Las aportaciones que en dinero realice cada persona simpatizante
            $row = $row + 2;
            $sheet->setCellValue($col . $row, $partido->finpriv_aportaciones_simpGuber ?? 'Valor no disponible');
            // Aplicar formato de moneda
            $sheet->getStyle($col . $row)->getNumberFormat()->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');

            // ***** 5.  El financiamiento por rendimientos financieros de los partidos políticos
            $row = $row + 2;
            $sheet->setCellValue($col . $row, $partido->finpriv_rendimientos ?? 'Valor no disponible');
            // Aplicar formato de moneda
            $sheet->getStyle($col . $row)->getNumberFormat()->setFormatCode('[Red]$#,##0.00_);[Blue]($#,##0.00)');
            
            // Avanzamos a la siguiente columna
            $col = Coordinate::stringFromColumnIndex( Coordinate::columnIndexFromString($col) + 1); // avanza una columna
            $sheet->getColumnDimension($col)->setWidth(2); // asigna un ancho de 2 caracteres a la columna
            $col = Coordinate::stringFromColumnIndex( Coordinate::columnIndexFromString($col) + 1); // avanza una columna
        }
        // foreach ($this->datos['partidos_sin_rep'] as $key => $partido) {
        //     $sheet->setCellValue('C' . ($key + 5), $partido->l);
        // }
    }


    /**
     * Procesa el logo de un partido político
     * @param $sheet Hoja de cálculo
     * @param $col Columna tipo string
     * @param $row Fila tipo int
     * @param $partido Objeto partido político
     */
    private function procesarLogo($sheet, $col, $row, $partido)
    {
        $phpsheet = $sheet->getDelegate(); // Obtiene la hoja de cálculo
        // Cambia el formato del logo
        $partido->logoPNG = str_replace('.webp', '.png', $partido->logo);
        $logoPath = 'img/logos/' . $partido->logoPNG;

        // Se procesa la ubicación del logo
        $cellWidth = $sheet->getDelegate()->getColumnDimension($col)->getWidth();
        $cellHeight = $sheet->getRowDimension($row)->getRowHeight();

        $imageWidth = 30; // Ancho fijo para la imagen
        $imageHeight = 30; // Alto fijo para la imagen
        
        // Calcular offsets para centrar
        $pixelsPerUnitW = 7.5; // Para el ancho de columna: 1 unidad ≈ 7.5 píxeles
        $pixelsPerUnitH = 1.33; // Para la altura de fila: 1 punto = 1.33 píxeles
        $offsetX = max(0, (($cellWidth * $pixelsPerUnitW) - $imageWidth) / 2);
        $offsetY = max(0, (($cellHeight * $pixelsPerUnitH) - $imageHeight) / 2);
        $offsetY = $offsetY + 1; // Ajuste vertical, se le agrega un extra para bajar la imagen

        Log::info('👽 Partido: ' . $partido->siglas . ' logo: ' . $logoPath . '\n anchoC: ' . $cellWidth . ' altoC: ' . $cellHeight);

        $cellCoordinate = $col . $row;
        // Checa si el logo existe y no está vacío
        if (!empty($partido->logo)) {
            try {
                $logoPath = public_path($logoPath);
                
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                if (file_exists($logoPath)) {
                    $drawing->setPath($logoPath); // Ruta del logo
                    $drawing->setName('Logo-'.$partido->siglas); // Nombre de la imagen
                    $drawing->setDescription($partido->siglas); // Descripción de la imagen
                }
                else {
                    $drawing->setPath(public_path('img/logos/NOT_FOUND_SMALL.png'));
                    $drawing->setName('Logo-Default');
                    $drawing->setDescription('Default');
                }
                $drawing->setWidth($imageWidth); // Ancho fijo para la imagen
                $drawing->setResizeProportional(true); // Mantiene la proporción de la imagen
                $drawing->setCoordinates($cellCoordinate); // Coordenadas de la celda
                 // Aplicar offsets
                $drawing->setOffsetX((int)$offsetX);
                $drawing->setOffsetY((int)$offsetY);
                $drawing->setWorksheet($phpsheet); // Hoja donde se agregará la imagen
                // Aplicar el color de fondo después de agregar la imagen
                $phpsheet->getStyle($cellCoordinate)
                ->getFill()
                ->setFillType(Fill::FILL_SOLID)
                ->getStartColor()
                ->setARGB('#AE8700');
            } catch (\Exception $e) {
                Log::error('Error cargando logo: ' . $e->getMessage());
            }
        }
    }

}
