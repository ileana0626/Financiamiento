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
                {{-- FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO --}}
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
            <td style="font-weight: bold; text-align: center;">70% conforme al % de votación <br>con ajuste (b)</td>
            <td style="font-weight: bold; text-align: center;">Financiamiento público para actividades ordinarias permanentes<br>(c = a + b)</td>
            @php
                $tipoPorcentaje = $datos->distribucion->tipoPorcentaje;
                if($tipoPorcentaje == 1) {
                    $factorCalculo = 0.5;
                } else {
                    $factorCalculo = 0.3;
                }
            @endphp
            <td style="font-weight: bold; text-align: center;">Financiamiento público para actividades tendientes a la obtención del voto<br>(d = c * {{ $factorCalculo }})</td>
        </tr>
        
        @foreach($datos->partidos_con_rep as $partido)
        <tr style="border: 1px solid #AE8700 !important;">
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
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->porcentaje_votacion, 2)}}%</td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->A_30_por_ciento, 2)}}</td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->B_70_por_ciento, 2)}}</td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->B_Ajuste_70_por_ciento, 2)}}</td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->C_fpaop, 2)}}</td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->D_fpatov, 2)}}</td>
        </tr>
        @endforeach
        <tr style="background-color: #AE8700 !important;">
            <td style="background-color: #AE8700 !important;"></td>
            <td style="background-color: #AE8700 !important;"></td>
            <td style="font-weight: bold; text-align: center; background-color: #AE8700 !important;">Subtotal</td>
            <td>{{number_format(collect($datos->partidos_con_rep)->sum('porcentaje_votacion'), 2) }}%</td>
            {{-- <td>{{number_format($datos->distribucion->subtotal_A_30_por_ciento, 2)}}</td>
            <td>{{number_format($datos->distribucion->subtotal_B_70_por_ciento, 2)}}</td>
            <td>{{number_format($datos->distribucion->subtotal_B_Ajuste_70_por_ciento, 2)}}</td> --}}
            <td style="text-align: right;">{{formato_moneda(collect($datos->partidos_con_rep)->sum('A_30_por_ciento'), 2)}}</td>
            <td style="text-align: right;">{{formato_moneda(collect($datos->partidos_con_rep)->sum('B_70_por_ciento'), 2)}}</td>
            <td style="text-align: right;">{{formato_moneda(collect($datos->partidos_con_rep)->sum('B_Ajuste_70_por_ciento'), 2)}}</td>
            <td>{{number_format($datos->distribucion->subtotal_C_fpaop, 2)}}</td>
            <td>{{number_format($datos->distribucion->subtotal_D_fpatov, 2)}}</td>
        </tr>
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
            <td colspan="4" class="texto-con-anio">
                2% del monto de financiamiento público para actividades ordinarias permanentes del año {{ $datos->distribucion->anio_ejercicio }}, para partidos políticos locales que habiendo conservado el registro, no cuentan con representación en el Congreso Local
            </td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->monto_2_por_ciento, 2)}}</td>
            <td style="text-align: right; color: #FF0000;">{{formato_moneda($partido->D_monto_2_por_ciento, 2)}}</td>
        </tr>
        @endforeach
        <tr>
            <td></td>
            <td></td>
            <td colspan="5" style="font-weight: bold; text-align: right;">Subtotal</td>
            <td>{{ formato_moneda($datos->distribucion->subtotal_2_por_ciento_fpaop_ppsr, 2) }}</td>
            <td>{{ formato_moneda($datos->distribucion->subtotal_D_2_por_ciento_ppsr, 2) }}</td>
        </tr>
        <tr>
            <td colspan="9"></td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td colspan="2">Candidaturas Independientes</td>
            <td colspan="4" style="color: #000000; !important;" class="texto-negro">2% del financiamiento público para actividades tendientes a la obtención del voto.</td>
            <td>{{formato_moneda($datos->distribucion->subtotal_D_candidatura, 2)}}</td>
        </tr>
        <tr>
            <td colspan="7" style="font-weight: bold; text-align: right; !important;">TOTALES</td>
            @php
                $subtotalC = $datos->distribucion->subtotal_C_fpaop + $datos->distribucion->subtotal_2_por_ciento_fpaop_ppsr;
                $subtotalD = $datos->distribucion->subtotal_D_fpatov + $datos->distribucion->subtotal_D_2_por_ciento_ppsr + $datos->distribucion->subtotal_D_candidatura;
            @endphp
            <td style="color: #ff0000;font-weight: bold;">{{formato_moneda($subtotalC, 2)}}</td>
            <td style="color: #ff0000;font-weight: bold;">{{formato_moneda($subtotalD, 2)}}</td>
        </tr>
        @php
            $tipoDistribucion = $datos->distribucion->tipo_distribucion;
        @endphp
        @if(str_contains($tipoDistribucion, '2'))
            <tr data-class="gran-total">
                <td colspan="8" style="text-align: right; !important; font-weight: bold;">GRAN TOTAL:</td>
                @php
                    $granTotal = $subtotalC + $subtotalD;
                @endphp
                <td style="text-align: right; !important; font-weight: bold; color: #ff0000; font-size: 14px !important;">
                    {{formato_moneda($granTotal, 2)}}
                </td>
            </tr>
        @endif
    </table>
</body>
</html>