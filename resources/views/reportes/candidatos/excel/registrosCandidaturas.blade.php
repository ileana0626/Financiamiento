@php
    set_time_limit(0);
    ini_set("memory_limit", "16384M");
    ini_set("max_execution_time", "3600");
@endphp
<div>
    <table>
        <tr>
            <td>
                {{-- <strong>Registro de Aspirantes a Candidaturas</strong><br> --}}
                {{-- <strong>Proceso Electoral Estatal<br>Ordinario Concurrente 2023-2024</strong><br> --}}
                <strong>REPORTE DE CANDIDATURAS</strong>
            </td>
        </tr>
    </table>

    <div>
        <table>
            <thead>
                <tr>
                    
                    <th><strong>FOLIO</strong></th>
                    <th><strong>TIPO DE ELECCIÓN</strong></th>
                    <th><strong>DISTRITO</strong></th>
                    <th><strong>MUNICIPIO</strong></th>
                    <th><strong>TIPO DE CANDIDATURA</strong></th>
                    <th><strong>PARTIDO POLITICO/<br> COALICIÓN/<br> CANDIDATURA INDEPENDIENTE</strong></th>
                    <th><strong>PARTIDOS ASOCIADOS</strong></th>
                    <th><strong>PARTIDO PRINCIPAL</strong></th>
                    <th><strong>LEMA DE CAMPAÑA</strong></th>
                    <th><strong>PUESTO</strong></th>
                    <th><strong>CLAVE DE ELECTOR</strong></th>
                    <th><strong>NOMBRE(S)</strong></th>
                    <th><strong>PRIMER APELLIDO</strong></th>
                    <th><strong>SEGUNDO APELLIDO</strong></th>
                    <th><strong>ESTATUS</strong></th>
                    <th><strong>GÉNERO</strong></th>
                    <th><strong>SOBRENOMBRE</strong></th>
                    <th><strong>FECHA DE NACIMIENTO</strong></th>
                    <th><strong>EDAD</strong></th>
                    <th><strong>OCUPACIÓN</strong></th>
                    <th><strong>OCR</strong></th>
                    <th><strong>LUGAR DE NACIMIENTO</strong></th>
                    <th><strong>DOMICILIO</strong></th>
                    <th><strong>TIEMPO DE RESIDENCIA</strong></th>
                    <th><strong>TELÉFONO</strong></th>
                    <th><strong>CORREO ELECTRÓNICO</strong></th>
                    <th><strong>ACCIONES AFIRMATIVAS</strong></th>
                    <th><strong>TIPO DE ACCIÓN AFIRMATIVA</strong></th>
                    <th><strong>OPTA POR LA REELECCIÓN</strong></th>
                </tr>
            </thead>
            <tbody>
                @foreach($Candidatos as $key => $candidato)
                    <tr>
                        <td> {{ $candidato->folio}}</td>
                        <td> {{ $candidato->tipo_eleccion_label}}</td>
                        <td> {{ $candidato->distrito_label}}</td>
                        <td>{{ $candidato->municipio_label }}</td>
                        <td>{{ $candidato->tipo_candidatura_label }}</td>
                        <td>{{ $candidato->siglas_partido }}</td>
                        <td>{{ $candidato->partido_asociados }}</td>
                        <td>{{ $candidato->siglas_partido_principal }}</td>
                        <td> {{ $candidato->Lema}}</td>
                        <td> {{ $candidato->puesto_label}}</td>
                        <td> {{ $candidato->claveElector}}</td>
                        <td> {{ $candidato->nombre}}</td>
                        <td> {{ $candidato->app}}</td>
                        <td> {{ $candidato->apm}}</td>
                        <td> 
                            @switch($candidato->state)
                                @case(1)
                                    PRE REGISTRO
                                    @break
                                @case(2)
                                    REGISTRO COMPLETO
                                    @break
                                @case(3)
                                    SOLVENTACIÓN
                                    @break
                                @case(4)
                                    SUSTITUCIÓN
                                    @break
                                @case(5)
                                    RENUNCIA
                                    @break
                                @case(6)
                                    CANCELADO
                                    @break
                                @case(7)
                                    VERIFICADO
                                    @break
                                @case(8)
                                    APROBADO POR EL CONSEJO
                                    @break
                                @case(9)
                                    DESISTIMIENTO
                                    @break
				@case(10)
                                    ELEGIBLE
                                    @break
				@case(11)
                                    NO ELEGIBLE
                                    @break
                                @default
                                    SIN ESTATUS
                            @endswitch
                        </td>
                        <td> {{ $candidato->genero_label}}</td>
                        <td> {{ $candidato->sobrenombre}}</td>
                        <td> {{ $candidato->fecha_nacimiento}}</td>
                        <td> {{ $candidato->edad}} AÑOS</td>
                        <td> {{ $candidato->ocupacion}}</td>
                        <td> {{ $candidato->ocr}}</td>
                        <td> {{ $candidato->lugar_nacimiento_label}}</td>
                        <td> {{ $candidato->domicilio}}</td>
                        <td> {{ $candidato->tRecidenciaDomicilio}} {{($candidato->tRecidenciaDomicilio == 1) ? 'AÑO' : 'AÑOS'}}</td>
                        <td> {{ $candidato->telefono}}</td>
                        <td> {{ $candidato->correoElectronico}}</td>
                        <td> {{ $candidato->acciones_afirmativas_label}}</td>
                        <td> {{ $candidato->tipo_afirmativas_label}}</td>
                        <td> {{$candidato->reeleccion}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
