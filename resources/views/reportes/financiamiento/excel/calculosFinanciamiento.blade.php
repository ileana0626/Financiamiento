<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--<title>Reporte de Financiamiento Público</title>-->
    <title>Calculos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            font-weight: bold;
            text-align: center;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .subheader {
            font-weight: bold;
            text-align: center;
            font-size: 14px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
        .text-right {
            text-align: right;
        }
        .text-center {
            text-align: center;
        }
        .total {
            font-weight: bold;
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="header">
        FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO {{ $datos->calculo->anioFiscal }}
    </div>
    
    <table>
        <thead>
            <tr>
                <th>CONCEPTO</th>
                <th>IMPORTE</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1. NÚMERO DE CIUDADANOS INSCRITOS EN EL PADRÓN ELECTORAL</td>
                <td class="text-right">{{ number_format($datos->calculo->personas_padron, 0) }}</td>
            </tr>
            <tr>
                <td>2. UNIDAD DE MEDIDA Y ACTUALIZACIÓN (UMA) VIGENTE</td>
                <td class="text-right">${{ number_format($datos->calculo->uma, 2) }}</td>
            </tr>
            <tr>
                <td>3. 65% DE LA UMA VIGENTE</td>
                <td class="text-right">${{ number_format($datos->calculo->uma_65, 2) }}</td>
            </tr>
            <tr class="total">
                <td>4. MONTO TOTAL DE FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES</td>
                <td class="text-right">${{ number_format($datos->calculo->financiamiento_aop, 2) }}</td>
            </tr>
            <tr>
                <td>5. 2% DEL MONTO TOTAL DE FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES</td>
                <td class="text-right">${{ number_format($datos->calculo->total_fp_sin_repr, 2) }}</td>
            </tr>
            <tr class="total">
                <td>6. MONTO TOTAL EFECTIVO</td>
                <td class="text-right">${{ number_format($datos->calculo->monto_total_efectivo, 2) }}</td>
            </tr>
            <tr>
                <td>7. 30% DEL MONTO TOTAL EFECTIVO</td>
                <td class="text-right">${{ number_format($datos->calculo->monto_30_por_ciento, 2) }}</td>
            </tr>
            <tr>
                <td>8. 70% DEL MONTO TOTAL EFECTIVO</td>
                <td class="text-right">${{ number_format($datos->calculo->monto_70_por_ciento, 2) }}</td>
            </tr>
            <tr>
                <td>9. NÚMERO DE PARTIDOS POLÍTICOS CON REPRESENTACIÓN EN EL CONGRESO</td>
                <td class="text-right">{{ $datos->calculo->num_pp_con_repr }}</td>
            </tr>
            <tr>
                <td>10. NÚMERO DE PARTIDOS POLÍTICOS SIN REPRESENTACIÓN EN EL CONGRESO</td>
                <td class="text-right">{{ $datos->calculo->num_pp_sin_repr }}</td>
            </tr>
            <tr class="total">
                <td>11. COMPROBACIÓN DEL MONTO TOTAL DE FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES</td>
                <td class="text-right">${{ number_format($datos->calculo->comprobacion_monto, 2) }}</td>
            </tr>
        </tbody>
    </table>
    
    <div class="footer">
        <p>Fecha de generación: {{ now()->format('d/m/Y H:i:s') }}</p>
    </div>
</body>
</html>
