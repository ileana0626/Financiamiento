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
    <title>PARIDAD VERTICAL</title>
    
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
                PARIDAD VERTICAL EN CANDIDATURAS PARA MIEMBROS DE AYUNTAMIENTO
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

        @if ($Candidatos)
        <div>
            <table style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-top:20px; margin-left:-30px; width:300px">
                    <tr style="padding:.3rem; font-size: 0.55rem; background-color: #f6f6f6;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>FOLIO</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">{{$Candidatos[0]->folio}}</td>
                    </tr>
                    {{-- <tr style="padding:.3rem; font-size: 0.55rem; background-color: #fff;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>TIPO DE ELECCIÓN</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">{{$Candidatos[0]->tipo_eleccion_label}}</td>
                    </tr> --}}
                    <tr style="padding:.3rem; font-size: 0.55rem; background-color: #f6f6f6;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>DISTRITO</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">{{$Candidatos[0]->distrito_label}}</td>
                    </tr>
                    <tr style="padding:.3rem; font-size: 0.55rem; background-color: #fff;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>MUNICIPIO</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">{{$Candidatos[0]->municipio_label}}</td>
                    </tr>
                    <tr style="padding:.3rem; font-size: 0.55rem; background-color: #f6f6f6;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>PARTIDO POLITICO/ COALICIÓN/ CANDIDATURA INDEPENDIENTE</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">
                            @if (file_exists(public_path('img/logos/'.$Candidatos[0]->siglas_partido.'_Small.webp')))
                                <img src="{{asset('img/logos/'.$Candidatos[0]->siglas_partido.'_Small.webp')}}" alt="logo Partido" class="logoPartido">
                            @else
                                <img src="{{asset('img/logos/NOT_FOUND_2_Small.webp')}}" alt="logo Partido" class="logoPartido">
                            @endif
                            <br>
                            {{$Candidatos[0]->siglas_partido_principal}} {{$Candidatos[0]->partido_asociados}}
                        </td>
                            
                    </tr>
                    
            </table>
        </div>
        @endif
        

        @php
            $hombres = 0;
            $mujeres = 0;
            $nobinario = 0;
            foreach($Candidatos as $key => $candidato){
                switch($candidato->propietario_genero_abrev){
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
            foreach($Candidatos as $key => $candidato){
                switch($candidato->suplente_genero_abrev){
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
        <br>
        <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-left: 3rem !important; color:#818181; font-size: 0.7rem;">
            <i> EL CUMPLIMIENTO DE LA PARIDAD INDIVIDUAL NO EQUIVALE AL CUMPLIMIENTO DE LA PARIDAD GLOBAL</i>
        </span>
        <div>
            @if (count($Candidatos)==0)
                <span style=" font-family: Verdana, Geneva, Tahoma, sans-serif; margin: auto !important; color:#818181; font-size: 0.7rem; text-align:center !important;"><i><center> No hay representantes que coincidan con el filtro</center></i></span>                
            @else
            <table style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-top:20px; margin-left:-30px">
                <thead>
                    <tr style="padding:.3rem; color:#595959; font-size: 0.5rem; background-color: #f6f6f6; border-bottom: 1px solid #eee">
                        <th style="padding:.3rem;">#</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">CLAVE DE ELECTOR PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">ACCIONES AFIRMATIVAS PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">GENERO PERSONA PROPIETARIA</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">CLAVE DE ELECTOR PERSONA SUPLENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">PERSONA SUPLENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">ACCIONES AFIRMATIVAS PERSONA SUPLENTE</th>
                        <th style="padding:.3rem; border-left:1px solid #eee">GENERO PERSONA SUPLENTE</th>
                    </tr>
                </thead>
                <tbody style="">
                    
                    @foreach($Candidatos as $key => $candidato)
                        @if (($key%2)==0) <tr style="background-color:#f7f7f7; font-size: 0.45rem;">
                        @else <tr style="background-color:#FFFFFF; font-size: 0.45rem;">
                        @endif
                            <td style="padding:.25rem;">{{ $key+ 1}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->clave_elector_propietario != '') ? $candidato->clave_elector_propietario : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->nombre_propietario != '') ? $candidato->nombre_propietario : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->propietario_acciones_afirmativas_label != '') ? $candidato->propietario_acciones_afirmativas_label : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->propietario_genero_label != '') ? $candidato->propietario_genero_label : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->clave_elector_suplente != '') ? $candidato->clave_elector_suplente : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->nombre_suplente != '') ? $candidato->nombre_suplente : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->suplente_acciones_afirmativas_label != '') ? $candidato->suplente_acciones_afirmativas_label : '-'}}</td>
                            <td style="padding:.25rem; border-left:1px solid #eee"> {{ ($candidato->suplente_genero_label != '') ? $candidato->suplente_genero_label: '-' }} </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
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
