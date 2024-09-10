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
    <title>Acuse de Registro</title>
    
</head>
<body>
    <div class="container" >
        <div class="cabecera">
            <img src="{{ $logoIEE }}" alt="logo IEE Puebla" class="logo" style="width:120px;">
            <h1 style="padding:.2rem">
                Registro de Aspirantes a Candidaturas
                <br>
                <small>Proceso Electoral Estatal Ordinario Concurrente 2023-2024</small>
                <br>
                ACUSE DE REGISTRO
                <small style="position:absolute; bottom:0px; right:20px">
                    <i><?php
                        use Carbon\Carbon;
                        use Illuminate\Support\Str;
                        use Illuminate\Support\Facades\Hash;
                        Carbon::setLocale('es_MX');
                        $dt = Carbon::now('America/Mexico_City');
                        $dt = $dt->addHours(6);
                        echo 'Cuatro veces Heroica Puebla de Zaragoza, a '. $dt->day.' de '.$dt->monthName.' de '.$dt->year;
                        echo '<i style="margin-left:5px">Hora: '. ($dt)->format('H').':'.$dt->format('i').' hrs.</i>';
                        echo '<br><br><small style="text-align:justify; overflow-wrap: anywhere !important; margin:0 !important">
                                '.$Candidato[0]->fullHash.
                            '</small>'
                    ?></i>
                </small>
                
            </h1>
        </div>

        <div>
            @foreach($Candidato as $key => $candidato)
                <table id="acuse">
                    <tr>
                        <td>
                            <strong>FOLIO:</strong>
                            <span>{{$candidato->folio}}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>TIPO DE ELECCIÓN:</strong>
                            <span>{{$candidato->tipo_eleccion_siglas}} ({{$candidato->tipo_eleccion_label}})</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="no-border">
                                    <td>
                                        <strong>MUNICIPIO:</strong>
                                        <span>{{$candidato->municipio_label}}</span>
                                    </td>
                                    <td>
                                        <strong>DISTRITO:</strong>
                                        <span>{{$candidato->distrito_label}}</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>PARTIDO POLÍTICO, COALICIÓN, CANDIDATURA COMÚN O CANDIDATURA INDEPENDIENTE:</strong>
                            <br><br> <img src="{{ $logoPartido }}" alt="logo Partido o Coalición" class="logoPartido"> &nbsp;
                            <span>
                                {{-- {{$candidato->siglas_partido}}  --}}
                                @if ($candidato->partido_asociados)
                                    <span>Partidos Asociados: {{$candidato->partido_asociados}}</span>
                                @endif
                            ({{$candidato->tipo_candidatura_label}})</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>TIPO DE CARGO:</strong>
                            @if ($candidato->puesto_label)
                                <span>{{$candidato->puesto_label}}</span>
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <span>{{$candidato->app}}</span>
                                    </td>
                                    <td>
                                        <span>{{$candidato->apm}}</span>
                                    </td>
                                    <td>
                                        <span>{{$candidato->nombre}}</span>
                                    </td>
                                </tr>
                                <tr class="gray-bg">
                                    <td>
                                        <span>PRIMER APELLIDO</span>
                                    </td>
                                    <td>
                                        <span>SEGUNDO APELLIDO</span>
                                    </td>
                                    <td>
                                        <span>NOMBRE(S)</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="darker-gray-bg">
                        <td>
                            <span>NOMBRE COMPLETO</span>
                        </td>
                    <tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="no-border">
                                                <td>
                                                    <span>{{$candidato->lugar_nacimiento_label}}</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="no-border">
                                                <td>
                                                    <span>{{$candidato->diaNacimiento}}</span>
                                                </td>
                                                <td>
                                                    <span>{{$candidato->mesNacimiento}}</span>
                                                </td>
                                                <td>
                                                    <span>{{$candidato->anioNacimiento}}</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="gray-bg no-border">
                                    <td>
                                        <span>ENTIDAD FEDERATIVA</span>
                                    </td>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="no-border">
                                                <td>
                                                    <span>DÍA</span>
                                                </td>
                                                <td>
                                                    <span>MES</span>
                                                </td>
                                                <td>
                                                    <span>AÑO</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="darker-gray-bg">
                                    <td>
                                        <span>LUGAR DE NACIMIENTO</span>
                                    </td>
                                    <td>
                                        <span>FECHA DE NACIMIENTO</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <span>{{$candidato->domicilio}}</span>
                                    </td>
                                    <td>
                                        <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}} </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="gray-bg">
                                    <td>
                                        <span>DOMICILIO</span>
                                    </td>
                                    <td>
                                        <span>TIEMPO DE RESIDENCIA</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <span>{{$candidato->ocupacion}}</span>
                                    </td>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="no-border">
                                                <?php
                                                    for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                                        echo '<td>'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                                    }
                                                ?>
                                                {{-- <td>
                                                    <span>{{$candidato->claveElector}}</span>
                                                </td> --}}
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="gray-bg">
                                    <td>
                                        <span>OCUPACIÓN</span>
                                    </td>
                                    <td>
                                        <span>CLAVE DE CREDENCIAL PARA VOTAR</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="darker-gray-bg">
                        <td>
                            <span>DATOS ADICIONALES</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <span>{{$candidato->genero_label}}</span>
                                    </td>
                                    <td>
                                        <span>{{($candidato->sobrenombre != '') ? $candidato->sobrenombre : 'N/A'}}</span>
                                    </td>
                                    <td>
                                        <span>{{$candidato->edad}} AÑOS</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="gray-bg">
                                    <td>
                                        <span>GÉNERO</span>
                                    </td>
                                    <td>
                                        <span>SOBRENOMBRE</span>
                                    </td>
                                    <td>
                                        <span>EDAD</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="no-border">
                                                <?php
                                                    for ($i=0; $i < strlen($candidato->ocr); $i++) { 
                                                        echo '<td>'.Str::substr($candidato->ocr, $i, 1).'</td>';
                                                    }
                                                ?>
                                                {{-- <td>
                                                    <span>{{$candidato->ocr}}</span>
                                                </td> --}}
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="no-border">
                                                <?php
                                                    for ($i=0; $i < strlen($candidato->telefono); $i++) { 
                                                        echo '<td>'.Str::substr($candidato->telefono, $i, 1).'</td>';
                                                    }
                                                ?>
                                                {{-- <td>
                                                    <span>{{$candidato->ocr}}</span>
                                                </td> --}}
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="darker-gray-bg">
                                    <td>
                                        <span>OCR</span>
                                    </td>
                                    <td>
                                        <span>TELÉFONO</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <span>{{$candidato->correoElectronico}}</span>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <small>
                                                        {{($candidato->acciones_afirmativas_label) ? $candidato->acciones_afirmativas_label : 'NINGUNO'}}
                                                    </small>
                                                </td>
                                                <td>
                                                    <small>
                                                        {{($candidato->tipo_afirmativas_label) ? $candidato->tipo_afirmativas_label : 'NINGUNO'}}
                                                    </small>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding:0 !important;">
                                                    <small>GRUPO</small>
                                                </td>
                                                <td style="padding:0 !important;">
                                                    <small>TIPO</small>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <span> {{$candidato->reeleccion}} </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="gray-bg">
                                    <td>
                                        <span>CORREO ELECTRÓNICO</span>
                                    </td>
                                    <td>
                                        <span>ACCIONES AFIRMATIVAS</span>
                                    </td>
                                    <td>
                                        <span>OPTA POR REELECCIÓN</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr class="no-border">
                                    <td>
                                        {{-- <span>{{$candidato->observaciones}}</span> --}}
                                        {{-- <i>OBSERVACIONES</i> --}}
                                        {{-- {{$logoPartido}} --}}
                                    </td>
                                    <td>
                                        <table>
                                            <tr class="no-border">
                                                <td class="gray-bg">
                                                    <span>Fecha y hora de captura</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="no-border">
                                                    <table class="no-border">
                                                        <tr>
                                                            <td>{{$candidato->dia_captura}}</td>
                                                            <td>{{$candidato->mes_captura}}</td>
                                                            <td>{{$candidato->anio_captura}}</td>
                                                            <td>{{$candidato->hora_captura}}</td>
                                                            <td>{{$candidato->minuto_captura}}</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="no-border">
                                <tr style="text-align:center">
                                    <td style="no-border">
                                        <span>OBSERVACIONES</span>
                                    </td>
                                    <td class="no-border">
                                        <table class="no-border">
                                            <tr class="gray-bg">
                                                <td>DÍA</td>
                                                <td>MES</td>
                                                <td>AÑO</td>
                                                <td>HORA</td>
                                                <td>MINUTO</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            @endforeach
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
    td span {
        text-align: center;
        text-transform: uppercase;
    }
    #acuse{
        margin-top: 20px;
        border-collapse: collapse;
        width: 100%;
    }
    table{
        border-collapse: collapse;
        width: 100%;
        
    }
    td table{
        text-align: center;
    }
    td{
        border: 1px solid;
        font-family: Verdana, sans-serif;
        font-size: .85rem;
        width: 100%;
        /* margin-left: 20px; */
        /* margin-right: 20px; */
        padding: .2rem;
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