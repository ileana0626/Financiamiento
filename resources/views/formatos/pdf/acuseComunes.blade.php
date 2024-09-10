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
    <div class="container">
        <div class="cabecera">
            <h1>APROBACIÓN POR LOS PARTIDOS POLÍTICOS PARA CANDIDATURAS <br>COMUNES Y AVISO DE ORIGEN PARTIDARIO</h1>
            <br>
            <span class="left-text">
                <strong>
                    MTRA. EN D. BLANCA YASSAHARA CRUZ GARCÍA <br>
                    CONSEJERA PRESIDENTA DEL CONSEJO GENERAL<br>
                    DEL INSTITUTO ELECTORAL DEL ESTADO
                    <br>
                    P R E S E N T E
                </strong>
            </span>
            <span class="justify-text">
                Con fundamento en el numeral 4.1 y 4.4 de los LINEAMIENTOS PARA POSTULAR
                CANDIDATURAS COMUNES A LOS CARGOS QUE CORRESPONDAN EN CADA
                PROCESO ELECTORAL DEL ESTADO DE PUEBLA, las autoridades facultadas o las
                representaciones partidistas de <strong>{{($Candidato->siglas_partido) ? $Candidato->siglas_partido.',' : $Candidato->siglas_partido_principal.','}} {{$Candidato->partido_asociados}}</strong>
                informamos que hemos convenido celebrar
                la Candidatura común en términos de los artículos 58 y 58 bis, del código
                de Instituciones y Procesos Electorales del Estado de Puebla. <br><br>
                Así mismo se informa a este Instituto Electoral el origen partidario de la postulación
                en los términos siguientes:
            </span>

            <br>
            <span class="center-text">
                <u>
                    <strong>1.	SIGLA Y DESIGNA CANDIDATURAS PROPIETARIO Y SUPLENTE EL PARTIDO</strong>
                </u>
            </span>

            <table class="figura-postulacion">
                <tr>
                    @if ($Candidato->eleccion_id != 1)
                        <th>MUNICIPIO O DISTRITO</th>
                    @endif
                    <th>ORIGEN PARTIDARIO</th>
                    @if ($Candidato->eleccion_id == 2)
                        <th>FRACCIÓN PARLAMENTARIA</th>
                    @endif
                </tr>
                <tr>
                    @if ($Candidato->eleccion_id != 1)
                    <td>{{($Candidato->municipio_label) ? $Candidato->municipio_label : $Candidato->distrito_label}}</td>
                    @endif
                    <td>{{$Candidato->siglas_partido}}</td>
                    @if ($Candidato->eleccion_id == 2)
                        <td>________________</td>
                    @endif
                    
                </tr>
            </table>
            
            <span class="center-text">
                <strong>
                    A T E N T A M E N T E <br>
                    <span class="date-text">
                        @php
                            use Carbon\Carbon;
                            use Illuminate\Support\Str;
                            use Illuminate\Support\Facades\Hash;
                            Carbon::setLocale('es_MX');
                            $dt = Carbon::now('America/Mexico_City');
                            $dt = $dt->addHours(6);
                            echo 'CUATRO VECES HEROICA PUEBLA DE ZARAGOZA, A '. $dt->day.' DE '.$dt->monthName.' DE '.$dt->year;
                            // echo '<br>' . $dt->hour. ':' .$dt->minute;
                        @endphp
                    </span>
                </strong>
            </span>
            <strong>
                <table class="firmas">
                    <tr>
                        <td><span> ________________________ </span></td>
                        <td><span> ________________________ </span></td>
                    </tr>
                    <tr>
                        <td style="padding: 0 1rem"><span>Nombre, Firma, Cargo y Partido Político</span></td>
                        <td style="padding: 0 1rem"><span>Nombre, Firma, Cargo y Partido Político</span></td>
                    </tr>

                    <br><br>
                    <tr>
                        <td><span> ________________________ </span></td>
                        <td><span> ________________________ </span></td>
                    </tr>
                    <tr>
                        <td style="padding: 0 1rem"><span>Nombre, Firma, Cargo y Partido Político</span></td>
                        <td style="padding: 0 1rem"><span>Nombre, Firma, Cargo y Partido Político</span></td>
                    </tr>
                </table>
            </strong>
        </div>
    </div>
</body>
<style>
    @page { margin: 1.5in 0.25in 0.9in 0.25in;}

    body:before{
        display: block;
        position: fixed;
        top: -1.5in; right: -0.25in; bottom: -0.9in; left: -0.25in;
        box-sizing: border-box;
        background : url("img/membrete.jpg");
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        content: "";
        z-index: -1000;
    }
    .container{
        font-family: Verdana, Geneva, Tahoma, sans-serif; text-align:center;
        line-height: 1.5rem;
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
    .img-bg{
        position: absolute;
        width:120%;
        height: 
        left: -50px;
        top: -130px;
        margin: 0;
        border:1px solid red;
    }
    h1{
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 25px;
        font-size:.9rem;
        font-weight:bold;
        color:#0d1616;
    }
    .justify-text{
        text-align: justify !important;
        display: flex;
        justify-content: space-between;
        margin-left: 75px;
        margin-right: 75px;
        margin-top: 25px;
        font-size:.95rem;
    }
    .left-text{
        text-align: left !important;
        display: flex;
        justify-content: left;
        margin-left: 75px;
        margin-right: 75px;
        font-size:.9rem;
    }
    .center-text{
        text-align: center !important;
        display: flex;
        justify-content: center;
        margin-left: 75px;
        margin-right: 75px;
        font-size:.9rem;
    }
    .date-text{
        text-transform: uppercase !important;
    }
    
    
    .figura-postulacion{
        border-collapse: collapse;
        width: 600px;
        margin-top: 25px;
        margin-bottom: 25px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    .lista-general{
        border-collapse: collapse;
        width: 85%;
        margin-top: 75px;
        margin-bottom: 75px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    .detalles-candidato{
        border-collapse: collapse;
        width: 85%;
        margin-top: 75px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    .documentacion{
        border-collapse: collapse;
        width: 85%;
        margin-top: 75px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }

    .sobrenombre{
        border-collapse: collapse;
        width: 600px;
        margin-top: 25px;
        margin-bottom: 25px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    .sobrenombre th, .sobrenombre td{
        margin: auto;
        border: 1px solid #404040;
        font-family: Verdana, sans-serif;
        font-size: .8rem;
        width: 100%;
        padding: .1rem;
    }
    .firmas{
        border-collapse: collapse;
        width: 85%;
        margin-top: 50px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    tr table, td table{
        text-align: center;
        border-collapse: collapse;
        width: 100%;
        border: 0 !important;
    }
    td small, small{
        font-size: .55rem !important;
        font-weight: bold;
        line-height: .75rem !important;
    }
    td span{
        font-size: .6rem !important;
        line-height: 0.9rem !important;
    }
    .figura-postulacion th, .figura-postulacion td,
    .lista-general th, .lista-general td{
        margin: auto;
        border: 1px solid #404040;
        font-family: Verdana, sans-serif;
        font-size: .8rem;
        width: 100%;
        padding: .1rem;
    }
    
    .detalles-candidato th, .detalles-candidato td,
    .documentacion th, .documentacion td{
        margin: auto;
        border: 1px solid #404040;
        font-family: Verdana, sans-serif;
        font-size: .8rem;
        width: 100%;
        padding: .1rem;
        line-height: 1.25rem;
        text-align: left !important;
    }
    .no-border{
        border: none !important;
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