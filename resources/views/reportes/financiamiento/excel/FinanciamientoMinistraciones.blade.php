<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ministraciones</title>
</head>
<body>
    <div class="header">
        {{-- <img src="{{ public_path('img/LOGO_NUEVO.png') }}" alt="Logo" style="width: 100px; height: auto;"> --}}
    </div>
    <table>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>SIGLAS PARTIDO</td>
            <td>PARTIDO POLÍTICO</td>
            <td>TOTAL FINANCIAMIENTO</td>
            <td>TOTAL FINANCIAMIENTO A DISTRIBUIR</td>
            <td>ENERO</td>
            <td>FEBRERO</td>
            <td>MARZO</td>
            <td>ABRIL</td>
            <td>MAYO</td>
            <td>JUNIO</td>
            <td>JULIO</td>
            <td>AGOSTO</td>
            <td>SEPTIEMBRE</td>
            <td>OCTUBRE</td>
            <td>NOVIEMBRE</td>
            <td>DICIEMBRE</td>
        </tr>
        @foreach ($datos->ministraciones as $ministracion)
        <tr>
            <td>{{ $ministracion->totales_mensuales_enero }}</td>
            <td>{{ $ministracion->totales_mensuales_febrero }}</td>
            <td>{{ $ministracion->totales_mensuales_marzo }}</td>
            <td>{{ $ministracion->totales_mensuales_abril }}</td>
            <td>{{ $ministracion->totales_mensuales_mayo }}</td>
            <td>{{ $ministracion->totales_mensuales_junio }}</td>
            <td>{{ $ministracion->totales_mensuales_julio }}</td>
            <td>{{ $ministracion->totales_mensuales_agosto }}</td>
            <td>{{ $ministracion->totales_mensuales_septiembre }}</td>
            <td>{{ $ministracion->totales_mensuales_octubre }}</td>
            <td>{{ $ministracion->totales_mensuales_noviembre }}</td>
            <td>{{ $ministracion->totales_mensuales_diciembre }}</td>
        </tr>
        @endforeach
    </table>
    
</body>
</html>