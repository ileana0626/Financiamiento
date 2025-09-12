<?php
/*
* @description Archivo de ayuda para formatear datos de la base de datos 
* y mostrar en platillas .blade.php, para exportar a Excel y PDF
* @author Tony
* @version 1.2.0
* @date 19/08/2025
Se hace la carga del archivo en composer.json
    "autoload": {
    ...
        "files": [
                    "app/Helpers/helpers.php"
                ]
        ...
    }
*/
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
     * @param string $fecha Fecha a formatear YYYY-MM-DD
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
     * @param string|DateTime $fecha Fecha a formatear YYYY-MM-DD
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
            } else { // Formato YYYY-MM-DD
                $fechaCarbon = Carbon::parse($fecha);
            }
            
            return $fechaCarbon->isoFormat($formato);
        } catch (\Exception $e) {
            return $fecha; // Devuelve la fecha original si hay error
        }
    }
}

if (!function_exists('formato_porcentaje')) {
    /**
     * Formatea un valor numérico como porcentaje
     * 
     * @param mixed $valor Valor a formatear
     * @param int $decimales Número de decimales (opcional, por defecto 5)
     * @return string
     * 
     * @example
     * formato_porcentaje(25.5);        // '25.50000 %'
     * formato_porcentaje('10.5', 2);   // '10.50 %'
     * formato_porcentaje('123.4567', 3) // '123.457 %'
     * formato_porcentaje(null);        // '0.00000 %'
     */
    function formato_porcentaje($valor, $decimales = 5) {
        if ($valor === null || $valor === '') {
            return '0' . ($decimales > 0 ? '.' . str_repeat('0', $decimales) : '') . ' %';
        }

        // Asegurar que sea numérico
        $numero = is_numeric($valor) ? (float)$valor : 0;
        
        // Formatear con el número de decimales especificado
        return number_format($numero, $decimales, '.', '') . ' %';
    }
}
