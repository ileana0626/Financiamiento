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
    <title>LISTA DE CANDIDATURAS {{$nIdEleccion}}</title>
    
</head>
<body>
    <div class="container">
        <div class="cabecera">
            {{-- <img src="{{ $logo }}" alt="logo IEE Puebla" class="logo" style="width:150px;"> --}}
            <img src="https://imgs.search.brave.com/m53bIGaWBJDhpCHFmKhcyAYHa9ncrUsoyPl2mvfn7Tg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/aWVlcHVlYmxhLm9y/Zy5teC9jb250ZW5p/ZG8yL2ltZy9sb2dv/LndlYnA"
                alt="logo IEE Puebla" class="logo">
            <h1 style="padding:.2rem">
                Registro de Aspirantes a Candidaturas
                <br>
                <small>Proceso Electoral Estatal Ordinario Concurrente 2023-2024</small>
                <br>
                REPORTE DE CANDIDATURAS {{$tipoEleccion}}
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
                    <tr style="padding:.3rem; color:#595959; font-size: 0.5rem; background-color: #f6f6f6; border-bottom: 1px solid #eee">
                        <th style="padding:.3rem;">#</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">FOLIO</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">PARTIDO POLITICO/ COALICIÓN/ CANDIDATURA INDEPENDIENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">DISTRITO</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">CLAVE DE ELECTOR PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">GENERO PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">ACCIONES AFIRMATIVAS PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">CLAVE DE ELECTOR PERSONA SUPLENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">PERSONA SUPLENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">GENERO PERSONA SUPLENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">ACCIONES AFIRMATIVAS PERSONA SUPLENTE</th>
                    </tr>
                </thead>
                <tbody style="">
                    @foreach($Candidaturas as $key => $candidatura)
                        @if (($key%2)==0) <tr style="background-color:#f7f7f7; font-size: 0.45rem;">
                        @else <tr style="background-color:#FFFFFF; font-size: 0.45rem;">
                        @endif
                            <td style="padding:.25rem;">{{ $key+ 1}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->folio != '') ? $candidatura->folio : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee">
                                @if (file_exists(public_path('img/logos/'.$candidatura->siglas_partido.'_Small.webp')))
                                    <img src="{{asset('img/logos/'.$candidatura->siglas_partido.'_Small.webp')}}" alt="logo Partido" class="logoPartido">
                                    @else
                                        <img src="{{asset('img/logos/NOT_FOUND_2_Small.webp')}}" alt="logo Partido" class="logoPartido">
                                    @endif
                                <br>
                                {{ ($candidatura->siglas_partido_principal) ? ' Partido Principal: '.$candidatura->siglas_partido_principal : '' }}
                                {{ ($candidatura->partido_asociados) ? ' Partidos Asociados: '.$candidatura->partido_asociados : ''}}
                            </td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->distrito_label!= '') ? $candidatura->distrito_label: '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->clave_elector_propietario != '') ? $candidatura->clave_elector_propietario : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->nombre_propietario != '') ? $candidatura->nombre_propietario : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->propietario_genero_label != '') ? $candidatura->propietario_genero_label : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->propietario_acciones_afirmativas_label != '') ? $candidatura->propietario_acciones_afirmativas_label : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->clave_elector_suplente != '') ? $candidatura->clave_elector_suplente : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->nombre_suplente != '') ? $candidatura->nombre_suplente : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->suplente_genero_label != '') ? $candidatura->suplente_genero_label : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidatura->suplente_acciones_afirmativas_label != '') ? $candidatura->suplente_acciones_afirmativas_label : '-'}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            @if (count($Candidaturas)==0)
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
