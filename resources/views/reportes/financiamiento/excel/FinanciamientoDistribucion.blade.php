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
            <th style="font-weight: bold; text-align: center;">No.</th>
            <th style="font-weight: bold; text-align: center;">Sigla Partido</th>
            <th style="font-weight: bold; text-align: center;">Partido Político</th>
            <th style="font-weight: bold; text-align: center;">% de votación por partido político de elección de diputados</th>
            <th style="font-weight: bold; text-align: center;">30% en forma igualitaria <br>(a)</th>
            <th style="font-weight: bold; text-align: center;">70% conforme al % de votación <br>(b)</th>
            <th style="font-weight: bold; text-align: center;">70% conforme al % de votación <br>con ajuste (b)</th>
            <th style="font-weight: bold; text-align: center;">Financiamiento público para actividades ordinarias permanentes<br>(c = a + b)</th>
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
        <tr>
            <td style="text-align: center;">{{$contador++}}</td>
            <td style="text-align: center;">{{$partido->siglas}}</td>
            <td style="text-align: center; vertical-align: middle;">
                @php
                    $partido->logoPNG = str_replace('.webp', '.png', $partido->logo);
                    $logoPath = 'img/logos/' . $partido->logoPNG;
                @endphp
                @if(file_exists(public_path($logoPath)))
                    <img src="{{ public_path($logoPath) }}" alt="{{ $partido->siglas }}" style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @else
                    <img src="{{ public_path('img/logos/NOT_FOUND_SMALL.png') }}" alt="{{ $partido->siglas }}" style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @endif
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
        <tr>
            <td></td>
            <td></td>
            <td style="font-weight: bold; text-align: center; color: #FFFFFF;">SUBTOTAL</td>
            <td style="color: #FF0000;">{{number_format(collect($datos->partidos_con_rep)->sum('porcentaje_votacion'), 2) }}%</td>
            {{-- <td>{{number_format($datos->distribucion->subtotal_A_30_por_ciento, 2)}}</td>
            <td>{{number_format($datos->distribucion->subtotal_B_70_por_ciento, 2)}}</td>
            <td>{{number_format($datos->distribucion->subtotal_B_Ajuste_70_por_ciento, 2)}}</td> --}}
            <td style="color: #FF0000;">{{formato_moneda(collect($datos->partidos_con_rep)->sum('A_30_por_ciento'), 2)}}</td>
            <td style="color: #FF0000;">{{formato_moneda(collect($datos->partidos_con_rep)->sum('B_70_por_ciento'), 2)}}</td>
            <td style="color: #FF0000;">{{formato_moneda(collect($datos->partidos_con_rep)->sum('B_Ajuste_70_por_ciento'), 2)}}</td>
            <td style="color: #FF0000;">{{formato_moneda($datos->distribucion->subtotal_C_fpaop, 2)}}</td>
            <td style="color: #FF0000;">{{formato_moneda($datos->distribucion->subtotal_D_fpatov, 2)}}</td>
        </tr>
        <tr>
            <td colspan="9"></td>
        </tr>
        @foreach($datos->partidos_sin_rep as $partido)
        <tr>
            <td>{{$contador++}}</td>
            <td>{{$partido->siglas}}</td>
            <td style="text-align: center; vertical-align: middle;">
                @php
                    $partido->logoPNG = str_replace('.webp', '.png', $partido->logo);
                    $logoPath = 'img/logos/' . $partido->logoPNG;
                @endphp
                @if(file_exists(public_path($logoPath)))
                    <img src="{{ public_path($logoPath) }}" alt="{{ $partido->siglas }}" style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @else
                    <img src="{{ public_path('img/logos/NOT_FOUND_SMALL.png') }}" alt="{{ $partido->siglas }}" style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @endif
            </td>
            <td colspan="4" class="texto-con-anio">
                2% del monto de financiamiento público para actividades ordinarias permanentes del año {{ $datos->distribucion->anio_ejercicio }}, para partidos políticos locales que habiendo conservado el registro, no cuentan con representación en el Congreso Local
            </td>
            <td style="color: #FF0000;">{{formato_moneda($partido->monto_2_por_ciento, 2)}}</td>
            <td style="color: #FF0000;">{{formato_moneda($partido->D_monto_2_por_ciento, 2)}}</td>
        </tr>
        @endforeach
        <tr>
            <td></td>
            <td></td>
            <td colspan="5" style="font-weight: bold; text-align: right; color: #FFFFFF;">SUBTOTAL</td>
            <td style="color: #FF0000;">{{ formato_moneda($datos->distribucion->subtotal_2_por_ciento_fpaop_ppsr, 2) }}</td>
            <td style="color: #FF0000;">{{ formato_moneda($datos->distribucion->subtotal_D_2_por_ciento_ppsr, 2) }}</td>
        </tr>
        <tr>
            <td colspan="9"></td>
        </tr>
        <tr>
            <td colspan="1">{{$contador++}}</td>
            <td colspan="3">Candidaturas Independientes</td>
            <td colspan="4" style="color: #000000; !important;" class="texto-negro">2% del financiamiento público para actividades tendientes a la obtención del voto.</td>
            <td style="color: #FF0000;">{{formato_moneda($datos->distribucion->subtotal_D_candidatura, 2)}}</td>
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
            <tr>
                <td colspan="8" style="text-align: right; !important; font-weight: bold;">GRAN TOTAL</td>
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