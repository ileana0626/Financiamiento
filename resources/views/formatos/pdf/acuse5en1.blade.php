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
            <h1>FORMATO 5 EN 1</h1>
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
                <strong>1.	ACEPTACIÓN DE LA CANDIDATURA.</strong>
                La/el que suscribe, por mi propio derecho y con fundamento
                en lo dispuesto por el artículo 208, párrafo segundo, inciso a) del Código de Instituciones y Procesos
                Electorales del Estado de Puebla, declaro que acepto la candidatura al cargo de:
            </span>
            <table class="figura-postulacion">
                <tr style="background-color: #a5904a;">
                    <th style="width: 150px">CARGO</th>
                    <th style="width: 100px">PROPIETARIA/O</th>
                    <th style="width: 100px">SUPLENTE</th>
                    <th style="width: 100px">DISTRITO / AYUNTAMIENTO</th>
                    <th style="width: 50px">NO. DE LISTA</th>
                </tr>
                <tr>
                    <td>Gubernatura</td>
                    <td>{{($Candidato->eleccion_id == 1 && $Candidato->idpuesto == 1) ? 'X' : '' }}</td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                </tr>
                <tr>
                    <td>Diputación RP</td>
                    <td>{{($Candidato->idpuesto > 2 && $Candidato->idpuesto < 33 && ($Candidato->idpuesto%2) != 0) ? 'X' : '' }}</td>
                    <td>{{($Candidato->idpuesto > 2 && $Candidato->idpuesto < 33 && ($Candidato->idpuesto%2) == 0) ? 'X' : '' }}</td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                    <td>{{($Candidato->idpuesto > 2 && $Candidato->idpuesto < 33 && ($Candidato->idpuesto%2) != 0) ? substr($Candidato->puesto_label, -2) : '' }}</td>
                </tr>
                <tr>
                    <td>Diputación MR</td>
                    <td>{{($Candidato->eleccion_id == 2 && $Candidato->idpuesto == 1) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 2 && $Candidato->idpuesto == 2) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 2) ? $Candidato->distrito_label : ''}}</td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                </tr>
                <tr>
                    <td>Presidente Municipal</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto == 33) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto == 34) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && ($Candidato->idpuesto == 33 || $Candidato->idpuesto == 34)) ? $Candidato->municipio_label : '' }}</td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                </tr>
                <tr>
                    <td>Regiduría</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto > 36 && ($Candidato->idpuesto%2) != 0) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto > 36 && ($Candidato->idpuesto%2) == 0) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto > 36) ? $Candidato->municipio_label : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto > 36) ? substr($Candidato->puesto_label, -2) : '' }}</td>
                </tr>
                <tr>
                    <td>Sindicatura</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto == 35) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && $Candidato->idpuesto == 36) ? 'X' : '' }}</td>
                    <td>{{($Candidato->eleccion_id == 4 && ($Candidato->idpuesto == 35 || $Candidato->idpuesto == 36)) ? $Candidato->municipio_label : ''}}</td>
                    <td style="background-color: #EEEEEE"><strong>N/A</strong></td>
                </tr>
            </table>

            <span class="left-text">Postulada/o bajo la figura de:</span>

            <table class="figura-postulacion">
                <tr style="background-color: #a5904a;">
                    <th style="width: 30px"></th>
                    <th style="width: 120px">Figura de postulación:</th>
                    <th style="width: 200px">Partido(s) Político(s)</th>
                </tr>
                <tr>
                    <td>{{($Candidato->tipo_candidatura_id == 1 || $Candidato->tipo_candidatura_id == 0) ? 'X' : ''}}</td>
                    <td>Candidatura Individual</td>
                    <td>{{($Candidato->tipo_candidatura_id == 1 || $Candidato->tipo_candidatura_id == 0) ? $Candidato->siglas_partido : ''}}</td>
                </tr>
                <tr>
                    <td>{{($Candidato->tipo_candidatura_id == 2) ? 'X' : ''}}</td>
                    <td>Candidatura Común</td>
                    <td>{{($Candidato->tipo_candidatura_id == 2) ? $Candidato->siglas_partido_principal. ' ' .$Candidato->partido_asociados : ''}}</td>
                </tr>
                <tr>
                    <td>{{($Candidato->tipo_candidatura_id == 3) ? 'X' : ''}}</td>
                    <td>Coalición</td>
                    <td>{{($Candidato->tipo_candidatura_id == 3) ? $Candidato->siglas_partido. ' ' .$Candidato->partido_asociados : ''}}</td>
                </tr>
            </table>

            <span class="justify-text">
                <strong>2.	BAJO PROTESTA DE DECIR VERDAD, DE QUE CUMPLE CON LOS REQUISITOS QUE EXIGE LA NORMATIVIDAD PERTINENTE.</strong>
                Asimismo, de conformidad con lo establecido por lo artículo 35,
                fracción II de la Constitución Política de los Estados Unidos Mexicanos; 20, fracción II de la
                Constitución Política del Estado Libre y Soberano de Puebla; y 208, inciso e) del Código de Instituciones
                y Procesos Electorales del Estado de Puebla; manifiesto bajo protesta de decir verdad
                que cumplo con los requisitos señalados por la Constitución Federal, la Constitución Local, el
                Código Comicial Local, la Ley Orgánica Municipal y demás disposiciones aplicables.
            </span>

            <span class="justify-text">
                <strong>3.	CONSENTIMIENTO PARA EL TRATAMIENTO DE DATOS PERSONALES.</strong>
                De igual forma, consiento que mis
                datos personales sean utilizados para llevar a cabo las distintas etapas del procedimiento de
                registro de candidaturas y que se pueda localizar o establecer contacto de inmediato con el
                partido político, coalición, candidatura común o candidatura independiente, para efecto de
                verificación, el eventual requerimiento de documentación complementaria y demás información
                o aclaraciones; así como para compulsas, estadísticas y atención a los requerimientos de las
                autoridades competentes. Los datos personales recabados estarán protegidos en términos de lo
                dispuesto por la Constitución Política de los Estados Unidos Mexicanos, la Ley General de
                Transparencia y Acceso a la Información Pública, la Ley General de Protección de Datos
                Personales en Posesión de Sujetos Obligados, la Ley de Transparencia y Acceso a la Información
                Pública del Estado en Puebla, la Ley de Protección de Datos Personales del Estado de Puebla y el
                Reglamento del Instituto Electoral del Estado en Materia de Transparencia y Acceso a la
                Información Pública y serán incorporados y tratados en los Sistemas de Datos Personales de la
                Dirección de Prerrogativas y Partidos Políticos.
            </span>

            <span class="justify-text">
                <strong>4.	BAJO PROTESTA DE DECIR VERDAD DE NO HABER SIDO SANCIONADA O SANCIONADO POR DELITOS CONTRA LAS MUJERES.</strong>
                Finalmente, por mi propio derecho manifiesto bajo protesta de decir
                verdad, no ser una persona con sentencia firme por la comisión intencional de delitos contra la
                vida y la integridad corporal; contra la libertad y seguridad sexuales, así como el normal desarrollo
                psicosexual; por violencia familiar; violencia familiar equiparada o doméstica; violación a la
                intimidad sexual, o por violencia política contra las mujeres en razón de género, en cualquiera de
                sus modalidades y tipos; ni haber sido declarada como persona deudora alimentaria morosa.
            </span>

            <span class="justify-text">
                <strong>5.	SOLICITUD DE INCLUSIÓN DE SOBRENOMBRE EN LAS BOLETAS ELECTORALES.</strong>
                Con fundamento en el Artículo 281, numeral 9 del Reglamento de Elecciones del Instituto Nacional Electoral, solicito se
                incluya mi sobrenombre en la boleta electoral, siendo el siguiente:
            </span>

            <br>
            <table class="sobrenombre">
                <tr>
                    <td>
                        <strong>{{($Candidato->sobrenombre != '') ? $Candidato->sobrenombre : 'N/A'}}</strong>
                    </td>
                </tr>
            </table>
            <br><br><br>
            
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
                        <td><u> {{$Candidato->nombre_completo}} </u></td>
                    </tr>
                    <tr>
                        <td style="padding: 0 1rem"><span>Nombre(s) y firma o huella dactilar de la persona postulada</span></td>
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