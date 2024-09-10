@php
    set_time_limit(0);
    ini_set("memory_limit", "999M");
    ini_set("max_execution_time", "999");
@endphp
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REQUERIMIENTOS</title>
    
</head>
<body>
    <div class="container">
        <div class="cabecera">
            {{-- <img src="{{ $logo }}" alt="logo IEE Puebla" class="logo" style="width:150px;"> --}}
            <img src="https://imgs.search.brave.com/m53bIGaWBJDhpCHFmKhcyAYHa9ncrUsoyPl2mvfn7Tg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/aWVlcHVlYmxhLm9y/Zy5teC9jb250ZW5p/ZG8yL2ltZy9sb2dv/LndlYnA"
                alt="logo IEE Puebla" class="logo">
            <h1 style="padding:.2rem">
                Registro de Aspirantes a candidatos
                <br>
                <small>Proceso Electoral Estatal Ordinario Concurrente 2023-2024</small>
                <br>
                REPORTE DE REQUISITOS
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
            <table style="font-family: Verdana, Geneva, Tahoma, sans-serif; margin-top:20px; width:300px">
                    <tr style="padding:.3rem; font-size: 0.55rem; background-color: #f6f6f6;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>FOLIO</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">{{$Candidatos[0]->folio}}</td>
                    </tr>
                    <tr style="padding:.3rem; font-size: 0.55rem; background-color: #fff;">
                        <td style="padding:.3rem; border: 1px solid #000"><strong>TIPO DE ELECCIÓN</strong></td>
                        <td style="padding:.3rem; border: 1px solid #000">{{$Candidatos[0]->tipo_eleccion_label}}</td>
                    </tr>
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
                            {{$Candidatos[0]->siglas_partido_principal}} {{$Candidatos[0]->partido_asociados}}</td>
                    </tr>
                    
            </table>
        </div>

        <div>
            @foreach($Candidatos as $key => $candidato)
            <div style="border:1px solid #000; margin:.5rem; margin-top:20px;">
                <table style="font-family: Verdana, Geneva, Tahoma, sans-serif;">
                    <thead>
                        <tr style="padding:.3rem; color:#595959; font-size: 0.5rem; background-color: #f6f6f6; border-bottom: 1px solid #eee">
                            <th style="padding:.3rem;">#</th>
                            <th style="padding:.3rem; border-left:1px solid #eee">PUESTO</th>
                            <th style="padding:.3rem; border-left:1px solid #eee">CLAVE DE ELECTOR PERSONA CANDIDATA</th>
                            <th style="padding:.3rem; border-left:1px solid #eee">PERSONA CANDIDATA</th>
                        </tr>
                    </thead>
                    <tbody style="">
                            <tr style="background-color:#FFFFFF; font-size: 0.45rem;">
                                <td style="padding:.25rem;">{{ $key+ 1}}</td>
                                <td style="padding:.25rem; border-left:1px solid #eee"> {{$candidato->puesto_label}} </td>
                                <td style="padding:.25rem; border-left:1px solid #eee"> {{$candidato->claveElector}} </td>
                                <td style="padding:.25rem; border-left:1px solid #eee"> {{ $candidato->nombre_candidato}}</td>
                                
                            </tr>
                    </tbody>
                </table>
                <table style="font-family: Verdana, Geneva, Tahoma, sans-serif;">
                    <thead>
                        <tr style="padding:.3rem; color:#595959; font-size: 0.5rem; background-color: #f6f6f6; border-bottom: 1px solid #eee">
                            <th style="padding:.3rem; border-left:1px solid #eee">OBSERVACIONES U OMISIONES</th>
                        </tr>
                    </thead>
                    @if ($candidato->state != 2)
                        <tbody style="white-space: pre-wrap !important;">
                            <tr style="background-color:#FFFFFF; font-size: 0.45rem; text-align:left !important">
                                <td style="padding:.25rem; border-left:1px solid #eee; text-align:left !important">
                                    <table>
                                        <tr>
                                            <td>
                                                <div style=" white-space: pre-wrap !important; text-align:left !important">
                                                    {{ ($candidato->observaciones != '') ? $candidato->observaciones : 'sin observaciones en datos personales'}}
                                                </div>
                                            </td>
                                            <td>
                                                <div style=" white-space: pre-wrap !important; text-align:left !important">
                                                    {{ ($candidato->observaciones_docs != '') ? $candidato->observaciones_docs : 'sin observaciones en documentacion'}}
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                
                            </tr>
                    </tbody>
                    @else
                        <tbody style="">
                            <tr style="background-color:#FFFFFF; font-size: 0.45rem; text-align:left">
                                <td style="padding:.25rem; border-left:1px solid #eee; text-align:left !important">
                                    <table>
                                        <tr>
                                            <td>
                                                <div style=" white-space: pre-wrap !important; text-align:left !important">
                                                    sin observaciones
                                                </div>
                                            </td>
                                            <td>
                                                <div style=" white-space: pre-wrap !important; text-align:left !important">
                                                    sin observaciones
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                
                            </tr>
                    </tbody>
                    @endif
                </table>
            </div>
            @endforeach

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
        width: 35px;
        heigth: 35px;
        margin: .3rem;
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
