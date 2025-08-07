<?php
use Carbon\Carbon;

/**
 * Formatea una cantidad decimal
 * 
 * @param float $valor Valor a formatear
 * @param int $decimales Número de decimales (por defecto es 2)
 * @return string
 * 
 * @example
 * formato_moneda(1234567.89); // '$1,234,567.89'
 * formato_moneda(1234567.89, 0); // '$1,234,568'
 */
if (!function_exists('formato_moneda')) {
    function formato_moneda($valor, $decimales = 2) {
        if (is_null($valor)) return '$0.00';
        return '$' . number_format($valor, $decimales, '.', ',');
    }
}

if (!function_exists('formatear_lista')) {
    /**
     * Formatea una lista de elementos separados por comas, añadiendo ' y ' antes del último elemento
     * 
     * @param string $cadena Cadena con elementos separados por comas
     * @param string $separador Separador (por defecto es ', ')
     * @param string $conjuncion Conjunción a usar (por defecto es ' y ')
     * @return string
     * 
     * @example
     * formatear_lista('a,b,c'); // 'a, b y c'
     * formatear_lista('a,b,c', '; ', ' & '); // 'a; b & c'
     * formatear_lista('a'); // 'a'
     * formatear_lista(''); // ''
     * 
     */
    function formatear_lista($cadena, $separador = ', ', $conjuncion = ' y ') {
        if (empty(trim($cadena))) return '';
        
        $elementos = array_map('trim', explode(',', $cadena));
        
        if (count($elementos) === 1) {
            return $elementos[0];
        }
        
        $ultimo = array_pop($elementos);
        return implode($separador, $elementos) . $conjuncion . $ultimo;
    }
}

if (!function_exists('formatear_fecha')) {
    /**
     * Formatea una fecha
     * 
     * @param string $fecha Fecha a formatear
     * @param string $formato Formato de fecha (por defecto es 'd/m/Y')
     * @return string
     * 
     * @example
     * formatear_fecha('2022-01-01'); // '01/01/2022'
     * formatear_fecha('2022-01-01', 'Y-m-d'); // '2022-01-01'
     * 
     */
    function formatear_fecha($fecha, $formato = 'd/m/Y') {
        if (empty(trim($fecha))) return '';
        
        return Carbon::parse($fecha)->format($formato);
    }
}

if (!function_exists('formato_fecha_es')) {
    /**
     * Formatea una fecha en español
     * 
     * @param string|DateTime $fecha Fecha a formatear
     * @param string $formato Formato de salida (opcional)
     * @return string
     * 
     * @example
     * formato_fecha_es('2023-08-07'); // '7 de agosto de 2023'
     * formato_fecha_es(now(), 'D [de] MMMM [de] YYYY'); // 'lunes 7 de agosto de 2023'
     */
    function formato_fecha_es($fecha, $formato = 'D [de] MMMM [de] YYYY') {
        if (empty($fecha)) {
            return '';
        }

        Carbon::setLocale('es');
        
        try {
            if ($fecha instanceof DateTime) {
                $fechaCarbon = Carbon::instance($fecha);
            } elseif (preg_match('/^\d{2}-\d{2}-\d{4}$/', $fecha)) {
                // Formato dd-mm-yyyy
                $fechaCarbon = Carbon::createFromFormat('d-m-Y', $fecha);
            } else {
                $fechaCarbon = Carbon::parse($fecha);
            }
            
            return $fechaCarbon->isoFormat($formato);
        } catch (\Exception $e) {
            return $fecha; // Devuelve la fecha original si hay error
        }
    }
}
