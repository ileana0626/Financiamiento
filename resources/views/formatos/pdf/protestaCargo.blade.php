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
                FORMATO DE MANIFESTACIÓN DE NO HABER RENDIDO PROTESTA AL CARGO
            </h1>
            <br>
            <span class="left-text">
                <strong>
                    MTRA. EN D. BLANCA YASSAHARA CRUZ GARCÍA <br>
                    CONSEJERA PRESIDENTA DEL CONSEJO GENERAL<br>
                    DEL INSTITUTO ELECTORAL DEL ESTADO
                    <br>
                    P R E S E N T E
                </strong>
                <br><br>
            </span>
            <span class="justify-text">
                Con fundamento en el artículo 208 inciso f) del Código de Instituciones y Procesos
                Electorales del Estado de Puebla, así como los artículos 16 y 19 del Reglamento
                para la reelección a Cargos de Elección Popular en el Estado de Puebla, y en
                virtud de que el/la que suscribe, C. <strong>{{$Candidato->nombre_completo}}</strong> , fui electo(a)
                al cargo de <strong>{{$Candidato->puesto_label}}</strong> ,
                @if ($Candidato->municipio_label)
                    Ayuntamiento <strong>{{$Candidato->municipio_label}}</strong>
                @else
                    Distrito <strong>{{$Candidato->distrito_label}}</strong> por el principio de <strong>{{$Candidato->tipo_eleccion_label}}</strong>
                @endif
                mediante la postulación
                realizada por el (partido político, coalición, candidatura común o candidatura
                independiente) <strong>{{$Candidato->siglas_partido}}</strong>; manifiesto
                bajo protesta de decir verdad que no he rendido protesta a dicho cargo, por lo que
                no he desempeñado las funciones propias del mismo. 
            </span>
            <br>
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
                    <td><u>{{$Candidato->nombre_completo}}</u></td>
                </tr>
                <tr>
                    <td style="padding: 0 1rem"><span>Nombre(s) y firma o huella dactilar de la persona postulada</span></td>
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
        font-weight: bold;
    }
    .date-text{
        text-transform: uppercase !important;
    }
    .accion-afirmativa{
        border-collapse: collapse;
        width: 600px;
        margin-top: 25px;
        margin-bottom: 25px;
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
    .accion-afirmativa th, .accion-afirmativa td{
        margin: auto;
        border: 1px solid #404040;
        font-family: Verdana, sans-serif;
        font-size: .8rem;
        width: 100%;
        padding: .1rem;
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