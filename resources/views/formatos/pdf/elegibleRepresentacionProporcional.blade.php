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
    <title>Formato de Elegibilidad</title>

</head>

<body>
    <div class="container">
        <div class="cabecera">
            <h1>
                RESULTADO DEL ANÁLISIS DEL CUMPLIMIENTO DE ELEGIBILIDAD <br>
                DE LA LISTA DE DIPUTACIONES DE REPRESENTACION PROPORCINAL  <br>
                DEL ESTADO DE PUEBLA REGISTRADA ANTE EL CONSEJO GENERAL  <br>
                DEL INSTITUTO ELECTORAL DEL ESTADO
            </h1>
            <br>
            <span class="left-text">

                <strong>Partido Político, Candidatura Común, Coalición: </strong>{{$Candidatos[0]->siglas_partido}} <br>
                <strong>Folio de registro en SRC: </strong>{{$Candidatos[0]->folio}} <br>
                <strong>Tipo de registro: </strong>Ordinario (Consejo General) <br>

                <br>
            </span>
            <table class="figura-postulacion">
                <tr style="background-color: #a5904a;">
                    <th style="width: 120px">CARGO</th>
                    <th style="width: 120px">PERSONAS CANDIDATAS A DIPUTACIONES DE MAYORIA RELATIVA:</th>
                    <th style="width: 120px">CUMPLIMIENTO DE REQUISITOS DE ELEGIBILIDAD</th>
                </tr>
                @foreach ($Candidatos as $candidato) 
                <tr>
                    <td>{{ $candidato->puesto_label }}</td>
                    <td>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</td>
                    @if ( $candidato->state == 10 )
                    <td>Elegible</td>
                    
                    @elseif ( $candidato->state == 11 )
                    <td>No Elegible</td>
                    @else 
                    <td></td>
                    @endif
                </tr>
                @endforeach
            </table>
            <br><br>
            <span class="justify-text">
                <small>Con fundamento en lo dispuesto por el artículo 129 de los "LINEAMIENTOS PARA EL DESARROLLO DE LAS SESIONES DE CÓMPUTO DE LOS CONSEJOS ELECTORALES DEL INSTITUTO ELECTORAL DEL ESTADO, PARA EL PROCESO ELECTORAL ESTATAL ORDINARIO CONCURRENTE 2023-2024”, se emite el presente documento, que contiene los nombres de las personas ciudadanas registradas por el Consejo General del Instituto Electoral del Estado, observando el cumplimiento de los requisitos de elegibilidad previstos en la Constitución Política del Estado Libre y Soberano de Puebla, el Código de Instituciones y Procesos Electorales del Estado de Puebla, así como los "Lineamientos para el Registro de Candidaturas, en el marco del Proceso Electoral Estatal Ordinario Concurrente 2023-2024.".</small> 

            </span>

        </div>
    </div>
</body>
<style>
    @page {
        margin: 1.5in 0.25in 0.9in 0.25in;
    }

    body:before {
        display: block;
        position: fixed;
        top: -1.5in;
        right: -0.25in;
        bottom: -0.9in;
        left: -0.25in;
        box-sizing: border-box;
        background: url("img/membrete.jpg");
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        content: "";
        z-index: -1000;
        /* border:1px solid red; */
    }

    .container {
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        text-align: center;
        line-height: 1.5rem;
    }

    .logo {
        width: 120px;
        height: 65px;
    }

    .logoPartido {
        width: 35px;
        heigth: 35px;
        margin: .3rem;
    }

    .img-bg {
        position: absolute;
        width: 120%;
        height:
            left: -50px;
        top: -130px;
        margin: 0;
        border: 1px solid red;
    }

    h1 {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 25px;
        font-size: .9rem;
        font-weight: bold;
        color: #0d1616;
    }

    .justify-text {
        text-align: justify !important;
        display: flex;
        justify-content: space-between;
        margin-left: 75px;
        margin-right: 75px;
        margin-top: 10px;
        font-size: .95rem;
    }

    .left-text {
        text-align: left !important;
        display: flex;
        justify-content: left;
        margin-left: 75px;
        margin-right: 75px;
        font-size: .9rem;
    }

    .center-text {
        text-align: center !important;
        display: flex;
        justify-content: center;
        margin-left: 75px;
        margin-right: 75px;
        font-size: .9rem;
    }

    .date-text {
        text-transform: uppercase !important;
    }

    .figura-postulacion {
        border-collapse: collapse;
        width: 600px;
        margin-top: 25px;
        margin-bottom: 25px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }

    .lista-general {
        border-collapse: collapse;
        width: 85%;
        margin-top: 75px;
        margin-bottom: 75px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }

    .detalles-candidato {
        border-collapse: collapse;
        width: 85%;
        margin-top: 50px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }

    .documentacion {
        border-collapse: collapse;
        width: 85%;
        margin-top: 75px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
    }

    .firmas {
        border-collapse: collapse;
        width: 85%;
        margin-top: 125px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }

    tr table,
    td table {
        text-align: center;
        border-collapse: collapse;
        width: 100%;
        border: 0 !important;
    }

    td small,
    small {
        font-size: .55rem !important;
        font-weight: bold;
        line-height: .75rem !important;
    }

    td span {
        font-size: .6rem !important;
        /* font-weight: bold; */
        line-height: 0.9rem !important;
    }

    .figura-postulacion th,
    .figura-postulacion td,
    .lista-general th,
    .lista-general td {
        margin: auto;
        border: 1px solid #404040;
        font-family: Verdana, sans-serif;
        font-size: .8rem;
        width: 100%;
        padding: .1rem;
    }

    .detalles-candidato th,
    .detalles-candidato td,
    .documentacion th,
    .documentacion td {
        margin: auto;
        border: 1px solid #404040;
        font-family: Verdana, sans-serif;
        font-size: .8rem;
        width: 100%;
        padding: .1rem;
        line-height: 1.25rem;
        text-align: left !important;
    }

    tr .count-fojas {
        text-align: center !important;
    }

    .no-border {
        border: none !important;
        padding: 0;
    }

    .gray-bg {
        background: #E7E6E6;
        text-align: center
    }

    .darker-gray-bg {
        background: #D0CECE;
        text-align: center;
        font-weight: bold;
    }

    table {
        box-shadow: 0 0 1px 0 solid red;
    }
</style>

</html>