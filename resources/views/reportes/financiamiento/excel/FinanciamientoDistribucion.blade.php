<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Nombre de la Hoja -->
    <title>Distribución</title>
</head>
<body>
    <div class="header">
        {{-- <img src="{{ public_path('img/LOGO_NUEVO.png') }}" alt="Logo" style="width: 100px; height: auto;"> --}}
    </div>
    <table>
        <tr>
            <td colspan="9" style="font-weight: bold; text-align: center; font-size: 12px !important;">
                FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        @php
            $contador = 1;
        @endphp
        <tr>
            <td style="font-weight: bold; text-align: center;">No.</td>
            <td style="font-weight: bold; text-align: center;">Sigla Partido</td>
            <td style="font-weight: bold; text-align: center;">Partido Político</td>
            <td style="font-weight: bold; text-align: center;">% de votación por partido político de elección de diputados</td>
            <td style="font-weight: bold; text-align: center;">30% en forma igualitaria <br>(a)</td>
            <td style="font-weight: bold; text-align: center;">70% conforme al % de votación <br>(b)</td>
            <td style="font-weight: bold; text-align: center;">70% conforme al % de votación <br>(b)</td>
            <td style="font-weight: bold; text-align: center;">Financiamiento público para actividades ordinarias permanentes<br>(c = a + b)</td>
            <td style="font-weight: bold; text-align: center;">Financiamiento público para actividades tendientes a la obtención del voto<br>(d = c * 0.5)</td>
        </tr>
        
        @foreach($datos->partidos_con_rep as $partido)
        <tr>
            <td style="text-align: center;">{{$contador++}}</td>
            <td style="text-align: center;">{{$partido->siglas}}</td>
            <td style="text-align: center;">{{ $partido->nombre }}
                {{-- @php
                // Convertir el nombre del archivo a PNG
                $logoFile = str_replace('.webp', '.png', $partido->logo);
                $logoPath = 'img/logos/' . $logoFile;
                @endphp
                @if(file_exists(public_path($logoPath)))
                    <img src="{{ asset($logoPath) }}" alt="{{ $partido->siglas }}" style="max-height: 10px; max-width: 10px;">
                @else
                    <!-- Mostrar texto alternativo si la imagen no existe -->
                    {{ $partido->nombre }}
                @endif --}}
            </td>
            {{-- <td style="text-align: center;"><img src="{{ asset('img/logos/'.$partido->logo) }}" alt="{{ $partido->siglas }}" style="max-height: 40px; max-width: 40px;"></td> --}}
            <td style="text-align: right;">{{number_format($partido->porcentaje_votacion, 2)}}%</td>
            <td style="text-align: right;">{{number_format($partido->A_30_por_ciento, 2)}}</td>
            <td style="text-align: right;">{{number_format($partido->B_70_por_ciento, 2)}}</td>
            <td style="text-align: right;">{{number_format($partido->B_Ajuste_70_por_ciento, 2)}}</td>
            <td style="text-align: right;">{{number_format($partido->C_fpaop, 2)}}</td>
            <td style="text-align: right;">{{number_format($partido->D_fpatov, 2)}}</td>
        </tr>
        @endforeach
        <tr>
            <td colspan="9"></td>
        </tr>
        @foreach($datos->partidos_sin_rep as $partido)
        <tr>
            <td>{{$contador++}}</td>
            <td>{{$partido->siglas}}</td>
            <td style="text-align: center;">{{ $partido->nombre }}
                {{-- @php// Convertir el nombre del archivo a PNG
                    $logoFile = str_replace('.webp', '.png', $partido->logo);
                    $logoPath = 'img/logos/' . $logoFile;
                @endphp
                @if(file_exists(public_path($logoPath)))
                    <img src="{{ asset($logoPath) }}" alt="{{ $partido->siglas }}" style="max-height: 10px; max-width: 10px;">
                @else
                    <!-- Mostrar texto alternativo si la imagen no existe -->
                    {{ $partido->nombre }}
                @endif --}}
            </td>
            <td colspan="4">2% del monto de financiamiento público para actividades ordinarias permanentes</td>
            <td style="text-align: right;">{{number_format($partido->monto_2_por_ciento, 2)}}</td>
            <td style="text-align: right;">{{number_format($partido->D_monto_2_por_ciento, 2)}}</td>
        </tr>
        @endforeach
        <tr>
            <td colspan="9"></td>
        </tr>
        <tr>
            <td colspan="7" style="font-weight: bold; padding-top: 15px;">TOTALES</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="8" style="text-align: right; font-weight: bold;">GRAN TOTAL:</td>
            <td style="text-align: right; font-weight: bold; border-top: 1px solid #000;">
                {{number_format(collect($datos->partidos_con_rep)->sum('D_fpatov') + collect($datos->partidos_sin_rep)->sum('D_monto_2_por_ciento'), 2)}}
            </td>
        </tr>
    </table>
</body>
</html>