@php
    set_time_limit(0);
    ini_set("memory_limit", "999M");
    ini_set("max_execution_time", "999");
@endphp
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Solventaciones</title>
    
</head>
<body>
    <div class="container">
        <div class="cabecera">
            <img src="{{ $logo }}" alt="logo IEE Puebla" class="logo" style="width:150px;">
            <h1 style="padding:.2rem">
                Registro de Aspirantes a Candidaturas
                <br>
                <small>Proceso Electoral Estatal Ordinario Concurrente 2023-2024</small>
                <br>
                REPORTE DE SOLVENTACIONES
                <small style="position:absolute; bottom:20px; right:20px">
                    <i><?php
                        use Carbon\Carbon;
                        use Illuminate\Support\Str;
                        Carbon::setLocale('es_MX');
                        $dt = Carbon::now('America/Mexico_City');
                        $dt = $dt->addHours(6);
                        echo 'Cuatro veces Heroica Puebla de Zaragoza, a '. $dt->day.' de '.$dt->monthName.' de '.$dt->year;
                        echo '<i style="margin-left:5px">Hora: '. $dt->format('H').':'.$dt->format('i').' hrs.</i>';
                    ?></i>
                </small>
            </h1>
        </div>

        <div>
            <table style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-top:20px; margin-left:-30px">
                <thead>
                    <tr style="padding:.25rem; color:#595959; font-size: 0.5rem; background-color: #f6f6f6; border-bottom: 1px solid #eee">
                        <th style="padding:.25rem;">#</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">FOLIO</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">PARTIDO POLITICO/ COALICIÓN/ CANDIDATURA INDEPENDIENTE</th>
                        {{-- <th style="padding:.25rem; border-left:1px solid #eee">PARTIDOS ASOCIADOS</th> --}}
                        {{-- <th style="padding:.25rem; border-left:1px solid #eee">PARTIDO PRINCIPAL</th> --}}
                        <th style="padding:.25rem; border-left:1px solid #eee">TIPO DE ELECCIÓN</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">DISTRITO</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">MUNICIPIO</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">CLAVE DE ELECTOR</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">NOMBRE</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">GENERO</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">PUESTO</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">DOCUMENTOS INICIALES</th>
                        <th style="padding:.25rem; border-left:1px solid #eee">DOCUMENTOS VALIDADOS</th>
                        {{-- <th style="padding:.25rem; border-left:1px solid #eee">FECHA DE SOLVENTACIÓN</th> --}}
                        <th style="padding:.25rem; border-left:1px solid #eee">FECHA DE CARGA EN EL SISTEMA</th>
                    </tr>
                </thead>
                <tbody style="">
                    @foreach($Candidatos as $key => $candidato)
                        @if (($key%2)==0) <tr style="background-color:#f7f7f7; font-size: 0.45rem;">
                        @else <tr style="background-color:#FFFFFF; font-size: 0.45rem;">
                        @endif
                            <td style="padding:.15rem;">{{ $key+ 1}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->folio}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">
                                @if (file_exists(public_path('img/logos/'.$candidato->siglas_partido.'_Small.webp')))
                                    <img src="{{asset('img/logos/'.$candidato->siglas_partido.'_Small.webp')}}" alt="logo Partido" class="logoPartido">
                                    @else
                                        <img src="{{asset('img/logos/NOT_FOUND_Small.webp')}}" alt="logo Partido" class="logoPartido">
                                    @endif
                                <br>
                                {{ ($candidato->partido_asociados) ? 'Partidos Asociados: '.$candidato->partido_asociados : ''}} <br>
                                {{ ($candidato->siglas_partido_principal) ? 'Partido Principal: '.$candidato->siglas_partido_principal : '' }}
                                {{-- {{ $candidato->siglas_partido }} --}}
                            </td>
                            {{-- <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->partido_asociados}}</td> --}}
                            {{-- <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->siglas_partido_principal}}</td> --}}
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->tipo_eleccion_label}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->distrito_label}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">{{ $candidato->municipio_label }}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">{{ $candidato->claveElector }}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{$candidato->nombre}} {{$candidato->app}} {{$candidato->apm}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->genero_label}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->puesto_label}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">
                                @foreach ($candidato->documentos_iniciales as $documento)
                                    {{-- <span><a href="{{ asset("storage/$adjunto->path_adjunto_prop") }}">{{$adjunto->filename_adjunto_prop}}</a> | </span> --}}
                                    <span>{{$documento->nombre_doc}} &nbsp; </span>
                                @endforeach
                            </td>
                            <td style="padding:.15rem; border-left:1px solid #eee">
                                @foreach ($candidato->documentos_solventados as $documento)
                                    {{-- <span><a href="{{ asset("storage/$adjunto->path_adjunto_prop") }}">{{$adjunto->filename_adjunto_prop}}</a> | </span> --}}
                                    <span>{{$documento->documentos}}</span>
                                @endforeach
                            </td>
                            {{-- <td style="padding:.15rem; border-left:1px solid #eee"> - </td> --}}
                            {{-- <td style="padding:.15rem; border-left:1px solid #eee"> - </td> --}}
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->fecha_captura}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            @if (count($Candidatos)==0)
                <span style=" font-family: Verdana, Geneva, Tahoma, sans-serif; margin: auto !important; color:#818181; font-size: 0.7rem; text-align:center !important;"><i><center> No hay representantes que coincidan con el filtro</center></i></span>                
            @endif
        </div>
    </div>
</body>
<style>
    body{
        margin: 0;
    }
    .logo{
        width: 120px;
        height: 65px;
    }
    .logoPartido{
        width: 15px;
        height: 15px;
    }
    h1{
        width:500px;
        margin:auto;
        margin-top:-80px;
        font-size:.9rem;
        font-weight:bold;
        color:#595959;
        font-family: Verdana, Geneva, Tahoma, sans-serif; text-align:center;
    }
    td {
        text-align: center;
        text-transform: uppercase;
        font-family: Verdana, sans-serif;
        width: 100%;
    }
    table{
        border-collapse: collapse;
        width: 100%;
    }
    td table{
        text-align: center;
    }
    .no-border{
        border:none !important;
        padding: 0;
    }
    .gray-bg{
        background: #E7E6E6;
        text-align: center
    }
    .darker-gray-bg{
        background: #D0CECE;
        text-align: center;
        font-weight: bold;
    }
</style>
</html>
