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
        @foreach ($datos->partidos_con_rep as $partido)
        <tr>
            <td>{{$partido->siglas}}</td>
            <td>
                @php
                    $logoPNG = str_replace('.webp', '.png', $partido->logo);
                    $logoPath = 'img/logos/' . $logoPNG;
                @endphp
                @if (file_exists(public_path($logoPath)))
                    <img src="{{ public_path($logoPath) }}" alt="{{ $partido->siglas }}"
                        style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @else
                    <img src="{{ public_path('img/logos/NOT_FOUND_SMALL.png') }}" alt="{{ $partido->siglas }}"
                        style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @endif
            </td>
            @php
                $C_fpaop = $partido->C_fpaop;
                $monto = $C_fpaop / 12;
            @endphp
            <td>{{$C_fpaop}}</td>
            <td></td>
            <td>{{$monto}}</td> {{-- enero --}}
            <td>{{$monto}}</td> {{-- febrero --}}
            <td>{{$monto}}</td> {{-- marzo --}}
            <td>{{$monto}}</td> {{-- abril --}}
            <td>{{$monto}}</td> {{-- mayo --}}
            <td>{{$monto}}</td> {{-- junio --}}
            <td>{{$monto}}</td> {{-- julio --}}
            <td>{{$monto}}</td> {{-- agosto --}}
            <td>{{$monto}}</td> {{-- septiembre --}}
            <td>{{$monto}}</td> {{-- octubre --}}
            <td>{{$monto}}</td> {{-- noviembre --}}
            <td>{{$partido->mintr_diciembre}}</td> {{-- diciembre --}}
        </tr>
        @endforeach
        <tr><td colspan="15"></td></tr>
        <!-- Partidos sin representación -->
        @foreach ($datos->partidos_sin_rep as $partido)
        <tr>
            <td>{{$partido->siglas}}</td>
            <td>
                @php
                    $logoPNG = str_replace('.webp', '.png', $partido->logo);
                    $logoPath = 'img/logos/' . $logoPNG;
                @endphp
                @if (file_exists(public_path($logoPath)))
                    <img src="{{ public_path($logoPath) }}" alt="{{ $partido->siglas }}"
                        style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @else
                    <img src="{{ public_path('img/logos/NOT_FOUND_SMALL.png') }}" alt="{{ $partido->siglas }}"
                        style=" max-width: 12px; width: auto; display: block; margin: 0 auto;">
                @endif
            </td>
            @php
                $C_fpaop = $partido->monto_2_por_ciento;
                $monto = $C_fpaop / 12;
            @endphp
            <td>{{$C_fpaop}}</td>
            <td></td>
            <td>{{$monto}}</td> {{-- enero --}}
            <td>{{$monto}}</td> {{-- febrero --}}
            <td>{{$monto}}</td> {{-- marzo --}}
            <td>{{$monto}}</td> {{-- abril --}}
            <td>{{$monto}}</td> {{-- mayo --}}
            <td>{{$monto}}</td> {{-- junio --}}
            <td>{{$monto}}</td> {{-- julio --}}
            <td>{{$monto}}</td> {{-- agosto --}}
            <td>{{$monto}}</td> {{-- septiembre --}}
            <td>{{$monto}}</td> {{-- octubre --}}
            <td>{{$monto}}</td> {{-- noviembre --}}
            <td>{{$partido->mintr_diciembre}}</td> {{-- diciembre --}}
        </tr>
        @endforeach
        <tr>
            <td></td>
            <td>TOTAL</td>
            <td></td>
            <td></td>
            <td >{{ $datos->ministracion->total_enero }}</td>
            <td >{{ $datos->ministracion->total_febrero }}</td>
            <td >{{ $datos->ministracion->total_marzo }}</td>
            <td >{{ $datos->ministracion->total_abril }}</td>
            <td >{{ $datos->ministracion->total_mayo }}</td>
            <td >{{ $datos->ministracion->total_junio }}</td>
            <td >{{ $datos->ministracion->total_julio }}</td>
            <td >{{ $datos->ministracion->total_agosto }}</td>
            <td >{{ $datos->ministracion->total_septiembre }}</td>
            <td >{{ $datos->ministracion->total_octubre }}</td>
            <td >{{ $datos->ministracion->total_noviembre }}</td>
            <td >{{ $datos->ministracion->total_diciembre }}</td>
        </tr>
        <tr>
            <td colspan="14"></td>
            <td>TOTAL</td>
            <td>{{$datos->ministracion->gran_total}}</td>
        </tr>
        <tr>
            <td></td>
            <td style="font-weight: bold;" >Nota:</td>
        </tr>
    </table>
    
</body>
</html>