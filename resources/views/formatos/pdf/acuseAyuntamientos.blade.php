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
                SOLICITUD DE REGISTRO DE CANDIDATURAS PARA INTEGRANTES DE AYUNTAMIENTO SELECCIONADAS CONFORME A LOS ESTATUTOS DEL PARTIDO POLITICO
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
                Con fundamento en los dispuesto por los artículos 42, fracción V, y 206, fracción III,
                del Código de Instituciones y Procesos Electorales del Estado de Puebla (CIPEEP),
                y en cumplimiento con las normas estatutarias del <strong>{{$Candidatos[0]->siglas_partido}}</strong>
                que represento, solicito el registro de la planilla de integrantes a miembros de ayuntamiento relativa al municipio <strong>{{$Candidatos[0]->municipio_label}}</strong>
                , que contenderá en el Proceso Electoral Estatal Ordinario Concurrente
                2023-2024, bajo la figura de:
            </span>
            <table class="figura-postulacion">
                <tr style="background-color: #a5904a;">
                    <th style="width: 30px"></th>
                    <th style="width: 120px">Figura de postulación:</th>
                    <th style="width: 200px">Partido(s) Político(s)</th>
                </tr>
                <tr>
                    <td>{{($Candidatos[0]->tipo_candidatura_id == 1) ? 'X' : ''}}</td>
                    <td>Candidatura Individual</td>
                    <td>{{($Candidatos[0]->tipo_candidatura_id == 1) ? $Candidatos[0]->siglas_partido : ''}}</td>
                </tr>
                <tr>
                    <td>{{($Candidatos[0]->tipo_candidatura_id == 2) ? 'X' : ''}}</td>
                    <td>Candidatura Común</td>
                    <td>{{($Candidatos[0]->tipo_candidatura_id == 2) ? $Candidatos[0]->siglas_partido_principal. ' ' .$Candidatos[0]->partido_asociados : ''}}</td>
                </tr>
                <tr>
                    <td>{{($Candidatos[0]->tipo_candidatura_id == 3) ? 'X' : ''}}</td>
                    <td>Coalición</td>
                    <td>{{($Candidatos[0]->tipo_candidatura_id == 3) ? $Candidatos[0]->siglas_partido. ' ' .$Candidatos[0]->partido_asociados : ''}}</td>
                </tr>
            </table>
            <span class="left-text">Señalando los datos siguientes:</span>

            <table class="lista-general">
                <tr  style="background-color: #a5904a;">
                    <table>
                        <tr style="background-color: #a5904a;">
                            <th>
                                CARGO
                            </th>
                            <th>
                                PERSONA
                            </th>
                        </tr>
                    </table>
                    <th>
                        NOMBRE
                    </th>
                </tr>
                <tr>
                    <td>
                        <table style="background-color: #a5904a;">
                            <td style="no-border">PRESIDENCIA MUNICIPAL</td>
                            <td>
                                <table>
                                    <tr style="no-border">
                                        <td style="no-border">PROPIETARIA</td>
                                    </tr>
                                    <tr style="no-border">
                                        <td style="no-border">SUPLENTE</td>
                                    </tr>
                                </table>
                            </td>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    @foreach ($Candidatos as $candidato)
                                        @if ($candidato->idpuesto == 33)
                                            {{$candidato->nombre_completo}}
                                        @endif
                                    @endforeach
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    @foreach ($Candidatos as $candidato)
                                        @if ($candidato->idpuesto == 34)
                                            {{$candidato->nombre_completo}}
                                        @endif
                                    @endforeach
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                @php $countPuesto  = 0;
                    if ($Candidatos[0]->nRegidurias == null){
                        $Candidatos[0]->nRegidurias = 6;
                    }
                @endphp
                @for ($regidurias = 0; $regidurias < $Candidatos[0]->nRegidurias; $regidurias++)
                    <tr>
                        <td>
                            <table style="background-color: #a5904a;">
                                <td>{{$regidurias + 1}}ª REGIDURÍA</td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>PROPIETARIA</td>
                                        </tr>
                                        <tr>
                                            <td>SUPLENTE</td>
                                        </tr>
                                    </table>
                                </td>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        @foreach ($Candidatos as $candidato)
                                            @if (($candidato->idpuesto == $countPuesto+37))
                                                {{$candidato->nombre_completo}}
                                            @endif
                                        @endforeach
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        @foreach ($Candidatos as $candidato)
                                            @if (($candidato->idpuesto == $countPuesto+38))
                                                {{$candidato->nombre_completo}}
                                            @endif
                                        @endforeach
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    @php $countPuesto = $countPuesto+2 @endphp
                @endfor
                <tr>
                    <td>
                        <table style="background-color: #a5904a;">
                            <td>SINDICATURA</td>
                            <td>
                                <table>
                                    <tr>
                                        <td>PROPIETARIA</td>
                                    </tr>
                                    <tr>
                                        <td>SUPLENTE</td>
                                    </tr>
                                </table>
                            </td>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    @foreach ($Candidatos as $candidato)
                                        @if ($candidato->idpuesto == 35)
                                            {{$candidato->nombre_completo}}
                                        @endif
                                    @endforeach
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    @foreach ($Candidatos as $candidato)
                                        @if ($candidato->idpuesto == 36)
                                            {{$candidato->nombre_completo}}
                                        @endif
                                    @endforeach
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <span class="justify-text">
                A fin de dar cumplimiento a lo establecido en el artículo 208 del CIPEEP, se
                especifican a continuación los datos personales de las candidaturas anteriores
                citadas:
            </span>
            
            <table class="detalles-candidato">
                <tr style="background-color: #a5904a;">
                    <td><table><tr><th>PRESIDENCIA MUNICIPAL &nbsp;&nbsp;&nbsp;&nbsp; PERSONA PROPIETARIA</th></tr></table></td>
                </tr>
                @foreach ($Candidatos as $candidato)
                    @if ($candidato->idpuesto == 33)
                        <tr><td><table><tr>
                            <td style="width: 450px">
                                <small>PRIMER APELLIDO, SEGUNDO APELLIDO, NOMBRE(S): </small><br>
                                <span>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</span>
                            </td>
                            <td>
                                <small>SOBRENOMBRE (EN SU CASO):</small><br>
                                <span>{{$candidato->sobrenombre}}</span>
                            </td>
                            </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 300px">
                                <small>LUGAR DE NACIMIENTO (ENTIDAD Y MUNICIPIO)</small><br>
                                <span>{{$candidato->lugar_nacimiento_label}}</span>
                            </td>
                            <td>
                                <small>FECHA DE NACIMIENTO (DIA, MES Y AÑO)</small><br>
                                <span>{{$candidato->fecha_nacimiento}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 400px">
                                <small>DOMICILIO DE RESIDENCIA (CALLE, NÚMERO EXTERIOR, INTERIOR, COLONIA, MUNICIPIO, ENTIDAD FEDERARIVA, CÓDIGO POSTAL):</small><br>
                                <span>{{$candidato->domicilio}}</span>
                            </td>
                            <td>
                                <small>TIEMPO DE RESIDENCIA EN EL DOMICILIO SEÑALADO:</small><br>
                                <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="background-color: #a5904a; line-height: 1rem !important; width: 75px;"><small>CLAVE DE CREDENCIAL PARA VOTAR: </small></td>
                            @php
                                for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                    echo '<td style="width: 10px; text-align: center !important">'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                }
                            @endphp
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>GÉNERO:</small><br>
                                <span>{{$candidato->genero_label}}</span>
                            </td>
                            <td>
                                <small>OCUPACIÓN: </small><br>
                                <span>{{$candidato->ocupacion}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>CORREO ELECTRÓNICO*:</small><br>
                                <span>{{$candidato->correoElectronico}}</span>
                            </td>
                            <td>
                                <small>NÚMERO TELEFÓNICO:</small><br>
                                <span>{{$candidato->telefono}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr><td>
                            <small>DOMICILIO PARA RECIBIR NOTIFICACIONES (EN CASO DE SER EL MISMO QUE EL DE RESIDENCIA, DEJAR CAMPOS VACÍOS)</small><br>
                            <span>{{$candidato->domicilio}}</span>
                        </td></tr></table></td></tr>
                    @endif
                @endforeach
                @foreach ($Candidatos as $candidato)
                    @if ($candidato->idpuesto == 34)
                        <tr style="background-color: #a5904a;"><td><table><tr>
                            <th>PRESIDENCIA MUNICIPAL &nbsp;&nbsp;&nbsp;&nbsp; PERSONA SUPLENTE</th>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 450px">
                                <small>PRIMER APELLIDO, SEGUNDO APELLIDO, NOMBRE(S): </small><br>
                                <span>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</span>
                            </td>
                            <td>
                                <small>SOBRENOMBRE (EN SU CASO):</small><br>
                                <span>{{$candidato->sobrenombre}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 300px">
                                <small>LUGAR DE NACIMIENTO (ENTIDAD Y MUNICIPIO)</small><br>
                                <span>{{$candidato->lugar_nacimiento_label}}</span>
                            </td>
                            <td>
                                <small>FECHA DE NACIMIENTO (DIA, MES Y AÑO)</small><br>
                                <span>{{$candidato->fecha_nacimiento}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 400px">
                                <small>DOMICILIO DE RESIDENCIA (CALLE, NÚMERO EXTERIOR, INTERIOR, COLONIA, MUNICIPIO, ENTIDAD FEDERARIVA, CÓDIGO POSTAL):</small><br>
                                <span>{{$candidato->domicilio}}</span>
                            </td>
                            <td>
                                <small>TIEMPO DE RESIDENCIA EN EL DOMICILIO SEÑALADO:</small><br>
                                <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="background-color: #a5904a; line-height: 1rem !important; width: 75px;"><small>CLAVE DE CREDENCIAL PARA VOTAR: </small></td>
                            @php
                                for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                    echo '<td style="width: 10px; text-align: center !important">'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                }
                            @endphp
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>GÉNERO:</small><br>
                                <span>{{$candidato->genero_label}}</span>
                            </td>
                            <td>
                                <small>OCUPACIÓN: </small><br>
                                <span>{{$candidato->ocupacion}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>CORREO ELECTRÓNICO*:</small><br>
                                <span>{{$candidato->correoElectronico}}</span>
                            </td>
                            <td>
                                <small>NÚMERO TELEFÓNICO:</small><br>
                                <span>{{$candidato->telefono}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr><td>
                            <small>DOMICILIO PARA RECIBIR NOTIFICACIONES (EN CASO DE SER EL MISMO QUE EL DE RESIDENCIA, DEJAR CAMPOS VACÍOS)</small><br>
                            <span>{{$candidato->domicilio}}</span>
                        </td></tr></table></td></tr>
                    @endif
                @endforeach
            </table>
            {{-- REGIDURÍAS --}}
            @php $countPuesto = 0 @endphp
            @for ($regidurias = 0; $regidurias < $Candidatos[0]->nRegidurias; $regidurias++)
                <table class="detalles-candidato">
                    @foreach ($Candidatos as $candidato)
                        @if ($candidato->idpuesto == $countPuesto+37)
                            <tr style="background-color: #a5904a;">
                                <td><table><tr><th>{{$regidurias+1}}ª REGIDURÍA &nbsp;&nbsp;&nbsp;&nbsp; PERSONA PROPIETARIA</th></tr></table></td>
                            </tr>
                            <tr><td><table><tr>
                                <td style="width: 450px">
                                    <small>PRIMER APELLIDO, SEGUNDO APELLIDO, NOMBRE(S): </small><br>
                                    <span>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</span>
                                </td>
                                <td>
                                    <small>SOBRENOMBRE (EN SU CASO):</small><br>
                                    <span>{{$candidato->sobrenombre}}</span>
                                </td>
                                </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 300px">
                                    <small>LUGAR DE NACIMIENTO (ENTIDAD Y MUNICIPIO)</small><br>
                                    <span>{{$candidato->lugar_nacimiento_label}}</span>
                                </td>
                                <td>
                                    <small>FECHA DE NACIMIENTO (DIA, MES Y AÑO)</small><br>
                                    <span>{{$candidato->fecha_nacimiento}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 400px">
                                    <small>DOMICILIO DE RESIDENCIA (CALLE, NÚMERO EXTERIOR, INTERIOR, COLONIA, MUNICIPIO, ENTIDAD FEDERARIVA, CÓDIGO POSTAL):</small><br>
                                    <span>{{$candidato->domicilio}}</span>
                                </td>
                                <td>
                                    <small>TIEMPO DE RESIDENCIA EN EL DOMICILIO SEÑALADO:</small><br>
                                    <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="background-color: #a5904a; line-height: 1rem !important; width: 75px;"><small>CLAVE DE CREDENCIAL PARA VOTAR: </small></td>
                                @php
                                    for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                        echo '<td style="width: 10px; text-align: center !important">'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                    }
                                @endphp
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 325px">
                                    <small>GÉNERO:</small><br>
                                    <span>{{$candidato->genero_label}}</span>
                                </td>
                                <td>
                                    <small>OCUPACIÓN: </small><br>
                                    <span>{{$candidato->ocupacion}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 325px">
                                    <small>CORREO ELECTRÓNICO*:</small><br>
                                    <span>{{$candidato->correoElectronico}}</span>
                                </td>
                                <td>
                                    <small>NÚMERO TELEFÓNICO:</small><br>
                                    <span>{{$candidato->telefono}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr><td>
                                <small>DOMICILIO PARA RECIBIR NOTIFICACIONES (EN CASO DE SER EL MISMO QUE EL DE RESIDENCIA, DEJAR CAMPOS VACÍOS)</small><br>
                                <span>{{$candidato->domicilio}}</span>
                            </td></tr></table></td></tr>
                        @endif
                        @if ($candidato->idpuesto == $countPuesto+38)
                            <tr style="background-color: #a5904a;">
                                <td><table><tr><th>{{$regidurias+1}}ª REGIDURÍA &nbsp;&nbsp;&nbsp;&nbsp; PERSONA SUPLENTE</th></tr></table></td>
                            </tr>
                            <tr><td><table><tr>
                                <td style="width: 450px">
                                    <small>PRIMER APELLIDO, SEGUNDO APELLIDO, NOMBRE(S): </small><br>
                                    <span>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</span>
                                </td>
                                <td>
                                    <small>SOBRENOMBRE (EN SU CASO):</small><br>
                                    <span>{{$candidato->sobrenombre}}</span>
                                </td>
                                </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 300px">
                                    <small>LUGAR DE NACIMIENTO (ENTIDAD Y MUNICIPIO)</small><br>
                                    <span>{{$candidato->lugar_nacimiento_label}}</span>
                                </td>
                                <td>
                                    <small>FECHA DE NACIMIENTO (DIA, MES Y AÑO)</small><br>
                                    <span>{{$candidato->fecha_nacimiento}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 400px">
                                    <small>DOMICILIO DE RESIDENCIA (CALLE, NÚMERO EXTERIOR, INTERIOR, COLONIA, MUNICIPIO, ENTIDAD FEDERARIVA, CÓDIGO POSTAL):</small><br>
                                    <span>{{$candidato->domicilio}}</span>
                                </td>
                                <td>
                                    <small>TIEMPO DE RESIDENCIA EN EL DOMICILIO SEÑALADO:</small><br>
                                    <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="background-color: #a5904a; line-height: 1rem !important; width: 75px;"><small>CLAVE DE CREDENCIAL PARA VOTAR: </small></td>
                                @php
                                    for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                        echo '<td style="width: 10px; text-align: center !important">'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                    }
                                @endphp
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 325px">
                                    <small>GÉNERO:</small><br>
                                    <span>{{$candidato->genero_label}}</span>
                                </td>
                                <td>
                                    <small>OCUPACIÓN: </small><br>
                                    <span>{{$candidato->ocupacion}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr>
                                <td style="width: 325px">
                                    <small>CORREO ELECTRÓNICO*:</small><br>
                                    <span>{{$candidato->correoElectronico}}</span>
                                </td>
                                <td>
                                    <small>NÚMERO TELEFÓNICO:</small><br>
                                    <span>{{$candidato->telefono}}</span>
                                </td>
                            </tr></table></td></tr>
                            <tr><td><table><tr><td>
                                <small>DOMICILIO PARA RECIBIR NOTIFICACIONES (EN CASO DE SER EL MISMO QUE EL DE RESIDENCIA, DEJAR CAMPOS VACÍOS)</small><br>
                                <span>{{$candidato->domicilio}}</span>
                            </td></tr></table></td></tr>
                        @endif
                    @endforeach
                </table>
                @php $countPuesto = $countPuesto+2 @endphp
            @endfor

            <table class="detalles-candidato">
                @foreach ($Candidatos as $candidato)
                    @if ($candidato->idpuesto == 35)
                        <tr style="background-color: #a5904a;">
                            <td><table><tr><th>SINDICATURA MUNICIPAL &nbsp;&nbsp;&nbsp;&nbsp; PERSONA PROPIETARIA</th></tr></table></td>
                        </tr>
                        <tr><td><table><tr>
                            <td style="width: 450px">
                                <small>PRIMER APELLIDO, SEGUNDO APELLIDO, NOMBRE(S): </small><br>
                                <span>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</span>
                            </td>
                            <td>
                                <small>SOBRENOMBRE (EN SU CASO):</small><br>
                                <span>{{$candidato->sobrenombre}}</span>
                            </td>
                            </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 300px">
                                <small>LUGAR DE NACIMIENTO (ENTIDAD Y MUNICIPIO)</small><br>
                                <span>{{$candidato->lugar_nacimiento_label}}</span>
                            </td>
                            <td>
                                <small>FECHA DE NACIMIENTO (DIA, MES Y AÑO)</small><br>
                                <span>{{$candidato->fecha_nacimiento}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 400px">
                                <small>DOMICILIO DE RESIDENCIA (CALLE, NÚMERO EXTERIOR, INTERIOR, COLONIA, MUNICIPIO, ENTIDAD FEDERARIVA, CÓDIGO POSTAL):</small><br>
                                <span>{{$candidato->domicilio}}</span>
                            </td>
                            <td>
                                <small>TIEMPO DE RESIDENCIA EN EL DOMICILIO SEÑALADO:</small><br>
                                <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="background-color: #a5904a; line-height: 1rem !important; width: 75px;"><small>CLAVE DE CREDENCIAL PARA VOTAR: </small></td>
                            @php
                                for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                    echo '<td style="width: 10px; text-align: center !important">'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                }
                            @endphp
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>GÉNERO:</small><br>
                                <span>{{$candidato->genero_label}}</span>
                            </td>
                            <td>
                                <small>OCUPACIÓN: </small><br>
                                <span>{{$candidato->ocupacion}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>CORREO ELECTRÓNICO*:</small><br>
                                <span>{{$candidato->correoElectronico}}</span>
                            </td>
                            <td>
                                <small>NÚMERO TELEFÓNICO:</small><br>
                                <span>{{$candidato->telefono}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr><td>
                            <small>DOMICILIO PARA RECIBIR NOTIFICACIONES (EN CASO DE SER EL MISMO QUE EL DE RESIDENCIA, DEJAR CAMPOS VACÍOS)</small><br>
                            <span>{{$candidato->domicilio}}</span>
                        </td></tr></table></td></tr>
                    @endif
                @endforeach
                @foreach ($Candidatos as $candidato)
                    @if ($candidato->idpuesto == 36)
                        <tr style="background-color: #a5904a;"><td><table><tr>
                            <th>SINDICATURA MUNICIPAL &nbsp;&nbsp;&nbsp;&nbsp; PERSONA SUPLENTE</th>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 450px">
                                <small>PRIMER APELLIDO, SEGUNDO APELLIDO, NOMBRE(S): </small><br>
                                <span>{{$candidato->app}} {{$candidato->apm}} {{$candidato->nombre}}</span>
                            </td>
                            <td>
                                <small>SOBRENOMBRE (EN SU CASO):</small><br>
                                <span>{{$candidato->sobrenombre}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 300px">
                                <small>LUGAR DE NACIMIENTO (ENTIDAD Y MUNICIPIO)</small><br>
                                <span>{{$candidato->lugar_nacimiento_label}}</span>
                            </td>
                            <td>
                                <small>FECHA DE NACIMIENTO (DIA, MES Y AÑO)</small><br>
                                <span>{{$candidato->fecha_nacimiento}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 400px">
                                <small>DOMICILIO DE RESIDENCIA (CALLE, NÚMERO EXTERIOR, INTERIOR, COLONIA, MUNICIPIO, ENTIDAD FEDERARIVA, CÓDIGO POSTAL):</small><br>
                                <span>{{$candidato->domicilio}}</span>
                            </td>
                            <td>
                                <small>TIEMPO DE RESIDENCIA EN EL DOMICILIO SEÑALADO:</small><br>
                                <span>{{$candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="background-color: #a5904a; line-height: 1rem !important; width: 75px;"><small>CLAVE DE CREDENCIAL PARA VOTAR: </small></td>
                            @php
                                for ($i=0; $i < strlen($candidato->claveElector); $i++) { 
                                    echo '<td style="width: 10px; text-align: center !important">'.Str::substr($candidato->claveElector, $i, 1).'</td>';
                                }
                            @endphp
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>GÉNERO:</small><br>
                                <span>{{$candidato->genero_label}}</span>
                            </td>
                            <td>
                                <small>OCUPACIÓN: </small><br>
                                <span>{{$candidato->ocupacion}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr>
                            <td style="width: 325px">
                                <small>CORREO ELECTRÓNICO*:</small><br>
                                <span>{{$candidato->correoElectronico}}</span>
                            </td>
                            <td>
                                <small>NÚMERO TELEFÓNICO:</small><br>
                                <span>{{$candidato->telefono}}</span>
                            </td>
                        </tr></table></td></tr>
                        <tr><td><table><tr><td>
                            <small>DOMICILIO PARA RECIBIR NOTIFICACIONES (EN CASO DE SER EL MISMO QUE EL DE RESIDENCIA, DEJAR CAMPOS VACÍOS)</small><br>
                            <span>{{$candidato->domicilio}}</span>
                        </td></tr></table></td></tr>
                    @endif
                @endforeach
            </table>
            <br>
            <span class="justify-text">
                Asimismo, manifiesto que las personas candidatas cuyo registro solicito, fueron seleccionadas
                de conformidad con los <strong>Estatutos del partido político o el convenio de la coalición</strong> que represento. <br><br>

                De igual manera, autorizo el uso de notificaciones electrónicas que se utilizaran desde el inicio
                del plazo de presentación de la presente solicitud, siendo aplicables para las prevenciones o
                requerimientos, renuncias, sustituciones y cualquier otro acto, fase o aspecto relacionado con
                el registro de candidaturas. <br><br>

                {{-- Finalmente, señalo que la presente solicitud es acompañada de la siguiente documentación
                adjunta para el registro de Candidaturas de Miembros de Ayuntamiento: --}}
            </span>

            @php
                $totalF1 = 0;
                $totalF2 = 0;
                $totalD1 = 0;
                $totalD2 = 0;
                $totalD3 = 0;
                $totalD4 = 0;
                $totalD5 = 0;
                $totalD6 = 0;
                $totalQ8 = 0;
                $totalQ1 = 0;
                $totalQ5 = 0;
                $totalD9 = 0;
                $totalF8 = 0;
                $totalF6 = 0;
                $totalF7 = 0;

                foreach ($Candidatos as $candidato) {
                    ($candidato->idF1) ? $totalF1 = $totalF1+1 : $totalF1 = $totalF1;
                    ($candidato->idF2) ? $totalF2 = $totalF2+1 : $totalF2 = $totalF2;
                    ($candidato->idD1) ? $totalD1 = $totalD1+1 : $totalD1 = $totalD1;
                    ($candidato->idD2) ? $totalD2 = $totalD2+1 : $totalD2 = $totalD2;
                    ($candidato->idD3) ? $totalD3 = $totalD3+1 : $totalD3 = $totalD3;
                    ($candidato->idD4) ? $totalD4 = $totalD4+1 : $totalD4 = $totalD4;
                    ($candidato->idD5) ? $totalD5 = $totalD5+1 : $totalD5 = $totalD5;
                    ($candidato->idD6) ? $totalD6 = $totalD6+1 : $totalD6 = $totalD6;
                    ($candidato->idQ8) ? $totalQ8 = $totalQ8+1 : $totalQ8 = $totalQ8;
                    ($candidato->idQ1) ? $totalQ1 = $totalQ1+1 : $totalQ1 = $totalQ1;
                    ($candidato->idQ5) ? $totalQ5 = $totalQ5+1 : $totalQ5 = $totalQ5;
                    ($candidato->idD9) ? $totalD9 = $totalD9+1 : $totalD9 = $totalD9;
                    ($candidato->idF8) ? $totalF8 = $totalF8+1 : $totalF8 = $totalF8;
                    ($candidato->idF6) ? $totalF6 = $totalF6+1 : $totalF6 = $totalF6;
                    ($candidato->idF7) ? $totalF7 = $totalF7+1 : $totalF7 = $totalF7;
                }
            @endphp

            {{-- <table class="documentacion">
                <tr style="background-color: #a5904a;">
                    <th style="width: 500px">Documentos</th>
                    <th style="width: 50px">N° de fojas</th>
                </tr>
                <tr>
                    <td>Solicitud de Registro de Candidatura</td>
                    <td class="count-fojas">{{$totalF1 }}</td>
                </tr>
                <tr>
                    <td>Formato 5 en 1: <br>
                        &nbsp;&nbsp;Declaración a la aceptación a la candidatura <br>
                        &nbsp;&nbsp;Declaración, bajo protesta de decir Verdad, de que cumple con los requisitos que exigen la <br>
                        &nbsp;&nbsp;Constitución Federal, la Constitución Local y el presente Código <br>
                        &nbsp;&nbsp;Consentimiento para el Uso de datos personales <br>
                        &nbsp;&nbsp;Declaración bajo protesta de no haber sido sancionada o sancionado por:  <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>Violencia política contra las mujeres en razón de género o delito equivalente;</strong> <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>Violencia familiar;</strong> <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>Incumplimiento de la obligación alimentaria.</strong> <br>
                        &nbsp;&nbsp;Solicitud de sobrenombre
                        </td>
                    <td class="count-fojas">{{$totalF2 }}</td>
                </tr>
                <tr>
                    <td>Acta de Nacimiento (copia).</td>
                    <td class="count-fojas">{{$totalD1 }}</td>
                </tr>
                <tr>
                    <td>Credencial para Votar (copia).</td>
                    <td class="count-fojas">{{$totalD2 }}</td>
                </tr>
                <tr>
                    <td>Documento original probatorio de la residencia y/o  documento original que acredite la Ciudadanía Poblana.</td>
                    <td class="count-fojas">
                        {{$totalD3 + $totalD4}}
                    </td>
                </tr>
                <tr>
                    <td>Formularios del Sistema Nacional de Registro (SNR).</td>
                    <td class="count-fojas">
                        {{$totalD5 + $totalD6}}
                    </td>
                </tr>
                <tr>
                    <td>Carta para dar cumplimiento al artículo 208 inciso f) del Código.</td>
                    <td class="count-fojas">{{$totalQ5}}</td>
                </tr>
                <tr>
                    <td>Manifestación de no haber rendido protesta al cargo.</td>
                    <td class="count-fojas">{{$totalD9}}</td>
                </tr>
                <tr>
                    <td>Manifestación de no militancia.</td>
                    <td class="count-fojas">{{$totalF8}}</td>
                </tr>
                <tr>
                    <td>Bajo protesta de decir verdad para acciones afirmativas.</td>
                    <td class="count-fojas">{{$totalF6}}</td>
                </tr>
                <tr>
                    <td>Documentos probatorios para demostrar la adscripción calificada para alguna acción afirmativa.</td>
                    <td class="count-fojas">{{$totalF7}}</td>
                </tr>
                <tr>
                    <td>Otros (señalar tipo de documentos).</td>
                    <td class="count-fojas">__</td>
                    
                </tr>
            </table> --}}
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
                            
                        @endphp
                    </span>
                </strong>
            </span>
            <table class="firmas">
                <tr>
                    <td><u>_______________________</u></td>
                    <td><u>_______________________</u></td>
                </tr>
                <tr>
                    <td style="padding: 0 1rem"><span>(NOMBRE COMPLETO, FIRMA AUTOGRAFA, CARGO Y PARTIDO POLITICO DE LA PERSONA FACULTADA POR LOS ESTATUTOS DE CADA PARTIDO POLITICO O DE LAS PERSONAS AUTORIZADAS EN EL CONVENIO DE COALICION O CANDIDATURA COMUN O POR LA PERSONA REPRESENTANTE ANTE EL CONSEJO GENERAL, SEGÚN CORRESPONDA.)</span></td>
                    <td style="padding: 0 1rem"><span>(NOMBRE COMPLETO, FIRMA AUTOGRAFA, CARGO Y PARTIDO POLITICO DE LA PERSONA FACULTADA POR LOS ESTATUTOS DE CADA PARTIDO POLITICO O DE LAS PERSONAS AUTORIZADAS EN EL CONVENIO DE COALICION O CANDIDATURA COMUN O POR LA PERSONA REPRESENTANTE ANTE EL CONSEJO GENERAL, SEGÚN CORRESPONDA.)</span></td>
                </tr>
            </table>
        </div>
    </div>
</body>
<style>
    /* @page {
        margin: 0; 
    } */
    @page { margin: 1.5in 0.25in 0.9in 0.25in;}

    /* html, body{
        margin: 0;
        padding: 0;
    } */
    /* *{
        box-shadow: 0 0 1px 0 red !important;
    } */

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
    .date-text{
        text-transform: uppercase !important;
    }
    tr .count-fojas{
        text-align: center !important;
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
        margin-top: 50px;
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
    /* td span {
        text-align: center;
        text-transform: uppercase;
    }
    #acuse{
        margin-top: 20px;
        border-collapse: collapse;
        width: 100%;
    } */
    .figura-postulacion{
        border-collapse: collapse;
        width: 600px;
        margin-top: 50px;
        margin-bottom: 50px;
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

    .firmas{
        border-collapse: collapse;
        width: 85%;
        margin-top: 125px;
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
        /* font-weight: bold; */
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
    table{
        box-shadow: 0 0 1px 0 solid red;
    }
</style>
</html>