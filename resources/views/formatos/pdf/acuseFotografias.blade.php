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
            <h1>
                MANIFIESTO “BAJO PROTESTA DE DECIR VERDAD” QUE LAS FOTOGRAFÍAS <br> CORRESPONDEN A LAS PERSONAS CANDIDATAS
            </h1>
            <br>
            <span class="left-text">
                <strong>
                    MTRA. EN D. BLANCA YASSAHARA CRUZ GARCÍA <br>
                    CONSEJERA PRESIDENTA DEL CONSEJO GENERAL <br>
                    DEL INSTITUTO ELECTORAL DEL ESTADO
                    <br>
                    P R E S E N T E
                </strong>
                
            </span>
            
            @if ($Candidato->idpuesto%2 != 0)
                <table class="detalles-candidato">
                    <tr style="margin: auto;">
                        <td style="border:1px solid; display:flex; justify-content:center; width: 100px; height: 125px; margin: 20px 0">
                            <span style="text-align: center; margin:auto">
                                Foto
                            </span>
                        </td>
                        <td style="padding-left: 20px; text-align:justify !important">
                                Con fundamento en el artículo 57, fracción III, inciso c) de los
                                Lineamientos para el Registro de Candidaturas a los Diversos
                                Cargos de Elección Popular, declaro bajo protesta de decir 
                                verdad, que la fotografía proporcionada corresponde a 
                                <strong>{{$Candidato->nombre_completo}}</strong> persona candidata a
                                <strong>
                                    {{$Candidato->puesto_label}} {{$Candidato->tipo_eleccion_label}} {{$Candidato->tipo_ayuntamiento_label}}
                                    {{($Candidato->distrito_label) ? ' ( '.$Candidato->distrito_label.' ) ' : ''}} 
                                </strong>
                                postulada (o) por el <strong>{{$Candidato->siglas_partido}}</strong>.
                        </td>
                    </tr>
                </table>
                @if ($Candidato->nombre_completo_suplente != '')
                    <table class="detalles-candidato">
                        <tr style="margin: auto;">
                            <td style="border:1px solid; display:flex; justify-content:center; width: 100px; height: 125px; margin: 20px 0">
                                <span style="text-align: center; margin:auto">
                                    Foto
                                </span>
                            </td>
                            <td style="padding-left: 20px; text-align:justify !important">
                                De la misma forma, declaro bajo protesta de decir verdad, que la fotografía
                                proporcionada corresponde a
                                <strong>{{$Candidato->nombre_completo_suplente}}</strong> persona suplente
                                al mismo cargo y postulada (o) por el mismo (a) partido político/coalición/candidatura común.
                            </td>
                        </tr>
                    </table>
                @endif
            @endif

            @if ($Candidato->idpuesto%2 == 0)
                @if ($Candidato->nombre_completo_propietario != '')
                    <table class="detalles-candidato">
                        <tr style="margin: auto;">
                            <td style="border:1px solid; display:flex; justify-content:center; width: 100px; height: 150px; margin: 20px 0">
                                <span style="text-align: center; margin:auto">
                                    Foto
                                </span>
                            </td>
                            <td style="padding-left: 20px; text-align:justify !important">
                                    Con fundamento en el artículo 57, fracción III, inciso c) de los
                                    Lineamientos para el Registro de Candidaturas a los Diversos
                                    Cargos de Elección Popular, declaro bajo protesta de decir 
                                    verdad, que la fotografía proporcionada corresponde a 
                                    <strong>{{$Candidato->nombre_completo_propietario}}</strong> persona candidata propietaria a
                                    <strong>
                                        {{$Candidato->puesto_label_propietario}} {{$Candidato->tipo_eleccion_label}} {{$Candidato->tipo_ayuntamiento_label}}
                                        {{($Candidato->distrito_label) ? ' ( '.$Candidato->distrito_label.' ) ' : ''}} 
                                    </strong>
                                    postulada (o) por el <strong>{{$Candidato->siglas_partido}}</strong>.
                            </td>
                        </tr>
                    </table>
                @endif
                <table class="detalles-candidato">
                    <tr style="margin: auto;">
                        <td style="border:1px solid; display:flex; justify-content:center; width: 100px; height: 150px; margin: 20px 0">
                            <span style="text-align: center; margin:auto">
                                Foto
                            </span>
                        </td>
                        <td style="padding-left: 20px; text-align:justify !important">
                            De la misma forma, declaro bajo protesta de decir verdad, que la fotografía
                            proporcionada corresponde a
                            <strong>{{$Candidato->nombre_completo}}</strong> persona suplente
                            al mismo cargo y postulada (o) por el mismo (a) partido político/coalición/candidatura común.
                        </td>
                    </tr>
                </table>
            @endif
            

            <span class="justify-text">
                Lo anterior, para que se inserten en las boletas electorales a utilizarse en la próxima
                jornada electoral.
            </span>

            <span class="center-text">
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
                        
                    @endphp
                </span>
            </span>
            <table class="firmas">
                <tr>
                    <td>_______________________________________</td>
                </tr>
                <tr>
                    <td style="padding: 0 1rem"><span>Nombre(s) y firma o huella dactilar de la persona representante de partido</span></td>
                </tr>
            </table>
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
        /* border:1px solid red; */
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
    h1{
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 25px;
        font-size:.85rem;
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
        font-size:.85rem;
    }
    .left-text{
        text-align: left !important;
        display: flex;
        justify-content: left;
        margin-left: 75px;
        margin-right: 75px;
        font-size:.85rem;
    }
    .center-text{
        text-align: center !important;
        display: flex;
        justify-content: center;
        margin-left: 75px;
        margin-right: 75px;
        font-size:.85rem;
        font-weight: bold;
    }
    .date-text{
        text-transform: uppercase !important;
    }
    .detalles-candidato{
        border-collapse: collapse;
        width: 85%;
        margin-top: 12.5px;
        margin-bottom: 12.5px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    
    .firmas{
        border-collapse: collapse;
        width: 85%;
        margin-top: 25px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
        font-weight: bold;
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
        /* font-weight: bold; */
        line-height: 0.9rem !important;
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