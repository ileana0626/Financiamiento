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
    <title>Reporte de Registro de Candidaturas</title>
    
</head>
<body>
    <div class="container">
        <div class="cabecera">
            <img src="{{ $logo }}" alt="logo IEE Puebla" class="logo" style="width:120px;">
            <h1 style="padding:.2rem">
                Registro de Aspirantes a Candidaturas
                <br>
                <small>Proceso Electoral Estatal Ordinario Concurrente 2023-2024</small>
                <br>
                CAPTURA DE REGISTROS
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
        @php
            $hombres = 0;
            $mujeres = 0;
            $nobinario = 0;
            $noespecificado = 0;
            foreach($Candidatos as $key => $candidato){
                switch($candidato->genero_abrev){
                    case('H'):
                            $hombres = $hombres +1;
                        break;
                    case('M'):
                        $mujeres = $mujeres +1;
                        break;
                    case('NB'):
                        $nobinario = $nobinario +1;
                        break;
                    default:
                        break;
                }

            }
        @endphp

        <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-left: 3rem !important; color:#818181; font-size: 0.7rem;">
            <i> Total: {{$hombres+$mujeres+$nobinario}}</i>
        </span>
        <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-left: 3rem !important; color:#818181; font-size: 0.7rem;">
            <i> Hombres: {{$hombres}}</i>
        </span>
        <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-left: 3rem !important; color:#818181; font-size: 0.7rem;">
            <i> Mujeres: {{$mujeres}}</i>
        </span>
        <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-left: 3rem !important; color:#818181; font-size: 0.7rem;">
            <i> No Binario: {{$nobinario}}</i>
        </span>
        {{-- <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-left: 3rem !important; color:#818181; font-size: 0.7rem;">
            <i> No Especificado: {{count($Candidaturas)-$hombres-$mujeres-$nobinario}}</i>
        </span> --}}

        <div>
            <table style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-top:20px; margin-left:-30px">
                <thead>
                    <tr style="padding:.25rem; color:#595959; font-size: 0.25rem; background-color: #f6f6f6; border-bottom: 1px solid #eee">
                        <th style="padding:.2rem;">#</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">TIPO DE ELECCIÓN</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">DISTRITO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">MUNICIPIO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">TIPO DE CANDIDATURA</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">PARTIDO POLITICO/ COALICIÓN/ CANDIDATURA INDEPENDIENTE</th>
                        {{-- <th style="padding:.2rem; border-left:1px solid #eee">PARTIDOS ASOCIADOS</th> --}}
                        {{-- <th style="padding:.2rem; border-left:1px solid #eee">PARTIDO PRINCIPAL</th> --}}
                        <th style="padding:.2rem; border-left:1px solid #eee">LEMA DE CAMPAÑA</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">CARGO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">PUESTO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">CLAVE DE ELECTOR</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">NOMBRE(S)</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">PRIMER APELLIDO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">SEGUNDO APELLIDO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">GÉNERO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">SOBRENOMBRE</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">FECHA DE NACIMIENTO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">EDAD</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">OCUPACIÓN</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">OCR</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">LUGAR DE NACIMIENTO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">DOMICILIO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">TIEMPO DE RESIDENCIA</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">TELÉFONO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">CORREO ELECTRÓNICO</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">ACCIONES AFIRMATIVAS</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">TIPO DE ACCIÓN AFIRMATIVA</th>
                        <th style="padding:.2rem; border-left:1px solid #eee">OPTA POR LA REELECCIÓN</th>
                    </tr>
                </thead>
                <tbody style="">
                    @foreach($Candidatos as $key => $candidato)
                        @if (($key%2)==0) <tr style="background-color:#f7f7f7; font-size: 0.25rem;">
                        @else <tr style="background-color:#FFFFFF; font-size: 0.25rem;">
                        @endif
                            <td style="padding:.15rem;">{{ $key+ 1}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->tipo_eleccion_label}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee"> {{ $candidato->distrito_label}}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">{{ $candidato->municipio_label }}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">{{ $candidato->tipo_candidatura_label }}</td>
                            <td style="padding:.15rem; border-left:1px solid #eee">
                                @if (file_exists(public_path('img/logos/'.$candidato->siglas_partido.'_Small.webp')))
                                    <img src="{{asset('img/logos/'.$candidato->siglas_partido.'_Small.webp')}}" alt="logo Partido" class="logoPartido">
                                    @else
                                        <img src="{{asset('img/logos/NOT_FOUND_2_Small.webp')}}" alt="logo Partido" class="logoPartido">
                                    @endif
                                <br>
                                {{ ($candidato->partido_asociados) ? 'Partidos Asociados: '.$candidato->partido_asociados : ''}} <br>
                                {{ ($candidato->siglas_partido_principal) ? 'Partido Principal: '.$candidato->siglas_partido_principal : '' }}
                                {{-- {{ $candidato->siglas_partido }} --}}
                            </td>
                            
                            {{-- <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->partido_asociados}}</td> --}}
                            {{-- <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->partido_principal}}</td> --}}
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->Lema}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->cargo_label}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->puesto_label}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->claveElector}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->nombre}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->app}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->apm}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->genero_label}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->sobrenombre}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->fecha_nacimiento}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->edad}} AÑOS</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->ocupacion}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->ocr}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->lugar_nacimiento_label}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->domicilio}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->telefono}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->correoElectronico}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->acciones_afirmativas_label}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{ $candidato->tipo_afirmativas_label}}</td>
                            <td style="padding:.1rem; border-left:1px solid #eee"> {{($candidato->reeleccion) > 0 ? 'SI' : 'NO'}}</td>
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
