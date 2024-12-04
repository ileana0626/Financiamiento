@php
set_time_limit(0);
ini_set("memory_limit", "16384M");
ini_set("max_execution_time", "3600");
@endphp
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{$mes . ' '. $anio}}</title>
</head>

<body>
    <table> <!--Espacio para los encabezados-->
        <tbody>
            @for($i = 0; $i < 4; $i++)
                <tr>
                <td></td>
                </tr>
                @endfor
        </tbody>
    </table>
    <table>
        <thead>
            <tr>
                <th style="background-color: #FFFFFF">#</th>
                <th style="background-color: #FFFFFF">Tipo</th>
                <th style="background-color: #FFFFFF">Número</th>
                <th style="background-color: #FFFFFF">Remitente</th>
                <th style="background-color: #FFFFFF">Cargo</th>
                <th style="background-color: #FFFFFF">Asunto</th>
                <th style="background-color: #FFFFFF">Fecha Recibido</th>
                <th style="background-color: #FFFFFF">Hora Recibido</th>
                <th style="background-color: #FFFFFF">Termino</th>
                <th style="background-color: #FFFFFF">Fecha Termino</th>
                <th style="background-color: #FFFFFF">Área Asignada</th>
                <th style="background-color: #FFFFFF">Área Emite</th>
                <th style="background-color: #FFFFFF">Área Solicita</th>
                <th style="background-color: #FFFFFF">Requiere respuesta</th>
                <th style="background-color: #FFFFFF">Estatus</th>
            </tr>
        </thead>
        <tbody>
            @foreach($datos as$key => $value)
            <tr>
                <td>{{ $key + 1}}</td>
                <td>{{ $value->solicitud}}</td>
                <td>
                @if ($value->numFolio)
                    {{ $value->numFolio }}
                @elseif ($value->numMemo)
                    {{ $value->numMemo }}
                @elseif ($value->numOficio)
                    {{ $value->numOficio}}
                @else 
                    -
                @endif
                </td>
                <td>@if($value->remitente) {{$value->remitente}} @else - @endif</td>
                <td>@if($value->cargo) {{$value->cargo}} @else - @endif</td>
                <td>@if($value->asunto) {{$value->asunto}} @else - @endif</td>
                <td>@if($value->fechaRecibido) {{$value->fechaRecibido}} @else - @endif</td>
                <td>@if($value->horaRecibido) {{$value->horaRecibido}} @else - @endif</td>
                <td>@if($value->termino) {{$value->termino}} @else - @endif</td>
                <td>@if($value->fechaTermino) {{$value->fechaTermino}} @else - @endif</td>
                <td>@if($value->areaAsignar) {{$value->areaAsignar}} @else - @endif</td>
                <td>@if($value->areaEmite) {{$value->areaEmite}} @else - @endif</td>
                <td>@if($value->areaSolicita) {{$value->areaSolicita}} @else - @endif</td>
                <td>
                @php
                    if($value->respuesta)
                        echo $value->respuesta == 1 ? 'Si' : 'No';
                    else 
                        echo '-';
                @endphp
                </td>
                <td>{{ $value->estatus }}</td>
            </tr>
            @endforeach
            <tr></tr>
        </tbody>
    </table>
</body>
<style>

</style>

</html>