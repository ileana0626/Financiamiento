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
            <h1>FORMATO PARA OTORGAR EL CONSENTIMIENTO DE LAS MUJERES QUE ACEPTAN <br>
                FORMAR PARTE DE LA RED DE COMUNICACIÓN ENTRE CANDIDATAS Y RED DE <br>
                MUJERES ELECTAS A CARGOS DE ELECCIÓN POPULAR DENTRO DE LOS PROCESOS <br>
                ELECTORALES ESTATALES</h1>
            <br>
            <span class="left-text">
                <strong>
                    INSTITUTO ELECTORAL DEL ESTADO
                    <br>
                    P R E S E N T E
                </strong>
            </span>
            <span class="justify-text">
                Mediante la presente, otorgo mi consentimiento para formar parte de la
                <strong> Red de Candidatas y, en su caso, de la Red de Mujeres Electas del Instituto Electoral del Estado </strong>
                mismas que buscan informar sobre temas relevantes, entre éstos legislación
                e igualdad en la participación, liderazgo político de las mujeres y sororidad, así
                como establecer un canal de comunicación institucional para prevenir, denunciar
                y/o dar seguimiento a casos de Violencia Política en Razón de Género (VPMRG)
                contra las mujeres que participen en el Proceso Electoral Estatal Ordinario
                Concurrente 2023-2024 o en su caso Extraordinario, derivado del Programa
                Operativo de la Red de Candidatas y Red de Mujeres Electas.
            
            <br><br>
            
                Manifiesto que comprendo expresamente que mi integración a la Red de
                Candidatas así como permanecer en ella y si fuera el caso una vez electa,
                pertenecer a la Red de Mujeres Electas, que implementa el
                <strong> Instituto Electoral del Estado</strong>
                , como parte de la iniciativa de la Asociación Mexicana de Consejeras
                Estatales Electorales, A.C. (AMCEE), son un vínculo de contacto con las mujeres que
                participan en la vida pública del  Estado de Puebla aspirando a ocupar un cargo
                de elección popular o una vez en el ejercicio de dicho cargo, mediante el cual se
                brinda atención, seguimiento y acompañamiento sobre sus derechos y
                obligaciones en la prevención y erradicación de la VPMRG que pudieran ser
                víctima durante su participación en el ámbito político.
            
                <br><br>

                Asimismo, que ambas Redes tiene propósitos a desarrollarse en diversos momentos
                (en un primer momento en calidad de candidata y en un segundo, en caso de ser
                electa) tales como informar y capacitar sobre la VPMRG, ser un vínculo de
                comunicación institucional para identificar estos casos en los espacios del poder
                público; coadyuvar en la erradicación de este tipo de conducta, brindar asesoría,
                seguimiento y acompañamiento, generar insumos que visibilicen la gravedad de
                la VPMRG y generar vínculos que permitan contribuir a la erradicación de la misma.
                <br><br>
                Por lo anterior, proporciono mis datos:
            </span>

            <table class="detalles-candidato">
                <tr><td><table><tr>
                    <td style="width: 450px">
                        <small>NOMBRE COMPLETO: </small>
                        <span>{{$Candidato->app}} {{$Candidato->apm}} {{$Candidato->nombre}}</span>
                    </td>
                    </tr></table></td></tr>
                <tr><td><table><tr>
                    <td style="width: 300px">
                        <small>CORREO:</small>
                        <span>{{$Candidato->correoElectronico}}</span>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td style="width: 400px">
                        <small>TELÉFONO CELULAR</small>
                        <span>{{$Candidato->telefono}}</span>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>SOY MUJER:</small>
                    </td>
                    <td>
                        <span>Aspirante</span><br>
                    </td>
                    <td>
                        <span>Precandidata</span><br>
                    </td>
                    <td>
                        <span>Candidata</span><br>
                    </td>
                    <td>
                        <span>Mujer Electa</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td style="width: 400px">
                        <small>VÍA DE POSTULACIÓN:</small>
                        <strong>{{$Candidato->tipo_candidatura_label}}</strong> por <strong>{{$Candidato->siglas_partido}}</strong>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>RANGO DE EDAD:</small><br>
                    </td>
                    <td>
                        <span>18 A 30</span><br>
                    </td>
                    <td>
                        <span>31 A 40</span><br>
                    </td>
                    <td>
                        <span>41 A 50</span><br>
                    </td>
                    <td>
                        <span>51 A 60</span><br>
                    </td>
                    <td>
                        <span>MÁS DE 60</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>TIENE CONDICIÓN DE DISCAPACIDAD:</small><br>
                    </td>
                    <td>
                        <span>SÍ</span><br>
                    </td>
                    <td>
                        <span>NO</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <span>EN CASO DE SER <small>POSITIVA LA RESPUESTA ANTERIOR, </small> SEÑALE LO QUE CORRESPONDA</span>
                    </td>
                    <td>
                        <span>PARA COMUNICAR VERBALMENTE</span><br>
                    </td>
                    <td>
                        <span>MOTRIZ</span><br>
                    </td>
                    <td>
                        <span>AUDITIVA</span><br>
                    </td>
                    <td>
                        <span>OTRA: __________________</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>¿SE RECONOCE COMO MUJER AFROMEXICANA?</small><br>
                    </td>
                    <td>
                        <span>SÍ</span><br>
                    </td>
                    <td>
                        <span>NO</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>¿SE RECONOCE COMO MUJER INDÍGENA?</small><br>
                    </td>
                    <td>
                        <span>SÍ</span><br>
                    </td>
                    <td>
                        <span>NO</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>EN CASO DE HABLAR UNA LENGUA INDÍGENA U ORIGINARIA, ¿CUÁL ES?</small>
                    </td>
                    <td>
                        <span>_____________________________________________</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>¿REQUIERE DE INTÉRPRETE?</small><br>
                    </td>
                    <td>
                        <span>SÍ</span><br>
                    </td>
                    <td>
                        <span>NO</span><br>
                    </td>
                </tr></table></td></tr>
                <tr><td><table><tr>
                    <td>
                        <small>¿PERTENECE A LA DIVERSIDAD SEXUAL?</small><br>
                    </td>
                    <td>
                        <span>SÍ</span><br>
                    </td>
                    <td>
                        <span>ESPECIFIQUE: ________________________________</span><br>
                    </td>
                    <td>
                        <span>NO</span><br>
                    </td>
                    <td>
                        <span>PREFIERO NO CONTESTAR</span><br>
                    </td>
                </tr></table></td></tr>
                
            </table>

            <span class="justify-text">
                Autorizo para que se me pueda contactar a través de mi correo electrónico y/o
                número telefónico y que me sea enviada por esta vía, información acerca de la
                Violencia Política Contra las Mujeres por Razón de Género (De divulgación y/o
                académica).
            </span>

            <br><br>

            <span class="justify-text">
                Asimismo, en caso de ser víctima de conductas que puedan constituir VPMRG,
                autorizo que mi caso sea parte de los informes que el <strong> Instituto Electoral del Estado </strong>
                elaborará con fines estadísticos y de visibilización sobre VPMRG en el Estado de
                Puebla, así como los de la Red de Candidatas.
            </span>
            
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

            <span class="justify-text">
                <strong style="font-size: 0.75rem">AVISO DE PRIVACIDAD PARA LA PROTECCIÓN DEL TRATAMIENTO DE DATOS PERSONALES</strong><br>
                <span style="font-size: 0.75rem !important; color: #595959 !important; line-height: 1.5;">
                    El Instituto Electoral del Estado, a través de la Dirección de Igualdad y No Discriminación, es responsable
                    del tratamiento de los datos personales que las mujeres candidatas y mujeres electas proporcionen al IEE, para la
                    integración de la Red de Candidatas y Mujeres Electas del Instituto Electoral del Estado, en términos de la
                    normatividad aplicable.  Consulte el aviso de privacidad integral, en el siguiente sitio:
                    <a href="https://www.ieepuebla.org.mx/2024/datosp/DIND/AVISO_INTEGRAL_CANDIDATAS_PEEOC_2023-2024.pdf">
                        https://www.ieepuebla.org.mx/2024/datosp/DIND/AVISO_INTEGRAL_CANDIDATAS_PEEOC_2023-2024.pdf
                    </a>
                    Así mismo se le informa que usted podrá ejercer sus derechos de acceso, rectificación, cancelación u oposición al
                    tratamiento de sus datos personales (derechos ARCO) directamente ante la Unidad de Transparencia de este
                    Instituto Electoral del Estado, ubicada en Calle Aquiles Serdán 416-A, San Felipe Hueyotlipan, Puebla, Puebla C.P.
                    72030 o comunicarse a los números telefónicos 2223031100 extensión 1203/1206/1298, lada sin costo 800 433 20 13,
                    correo electrónico <a href="mailto:transparencia@ieepuebla.org.mx.">transparencia@ieepuebla.org.mx.</a> o dar CTRL+CLICK a: 
                    <a href="https://www.ieepuebla.org.mx/categorias.php?Categoria=derechosarco.">https://www.ieepuebla.org.mx/categorias.php?Categoria=derechosarco.</a>
                    , o bien a través de la Plataforma
                    Nacional de Transparencia ( <a href="https://www.plataformadetransparencia.org.mx/web/guest/inicio">https://www.plataformadetransparencia.org.mx/web/guest/inicio</a> ).
                </span>
            </span>
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
        background : url("img/membrete_candidatas.jpg");
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
        margin-top: 25px;
        margin-bottom: 25px;
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