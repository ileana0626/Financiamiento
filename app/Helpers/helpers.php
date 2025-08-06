<?php

if (!function_exists('formato_moneda')) {
    function formato_moneda($valor, $decimales = 2) {
        if (is_null($valor)) return '$0.00';
        return '$' . number_format($valor, $decimales, '.', ',');
    }
}
