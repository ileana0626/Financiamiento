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
    <title>Reporte de Solventaciones</title>
    
</head>
<body>
    <div class="container">
        <table>
            <tr>
                <td>
                    <strong>Registro de Aspirantes a Candidaturas</strong><br>
                    <strong>Proceso Electoral Estatal<br>Ordinario Concurrente 2023-2024</strong><br>
                    <strong>REPORTE DE SOLVENTACIONES</strong>
                </td>
            </tr>
        </table>

        <table>
            <thead>
                <tr>
                    {{-- <th>#</th> --}}
                    <th>FOLIO</th>
                    <th>PARTIDO POLITICO/ COALICIÓN/ CANDIDATURA INDEPENDIENTE</th>
                    <th>TIPO DE ELECCIÓN</th>
                    <th>DISTRITO</th>
                    <th>MUNICIPIO</th>
                    <th>CLAVE DE ELECTOR</th>
                    <th>NOMBRE</th>
                    <th>GENERO</th>
                    <th>PUESTO</th>
                    <th>DOCUMENTOS INICIALES</th>
                    <th>DOCUMENTOS VALIDADOS</th>
                    {{-- <th>FECHA DE SOLVENTACIÓN</th> --}}
                    <th>FECHA DE CARGA EN EL SISTEMA</th>
                </tr>
            </thead>
            <tbody>
                @foreach($Candidatos as $key => $candidato)
                    <tr>
                        {{-- <td>{{ $key+ 1}}</td> --}}
                        <td> {{ $candidato->folio}}</td>
                        <td>
                            {{ $candidato->siglas_partido }}
                            <br> Partidos Asocidos: {{ $candidato->partido_asociados}}
                            <br> Partido Principal: {{ $candidato->siglas_partido_principal}}
                        </td>
                        <td> {{ $candidato->tipo_eleccion_label}}</td>
                        <td> {{ $candidato->distrito_label}}</td>
                        <td>{{ $candidato->municipio_label }}</td>
                        <td>{{ $candidato->claveElector }}</td>
                        <td>{{$candidato->nombre}} {{$candidato->app}} {{$candidato->apm}}</td>
                        <td> {{ $candidato->genero_label}}</td>
                        <td> {{ $candidato->puesto_label}}</td>
                        <td>
                            @foreach ($candidato->documentos_iniciales as $documento)
                                {{-- <span><a href="{{ asset("storage/$adjunto->path_adjunto_prop") }}">{{$adjunto->filename_adjunto_prop}}</a> | </span> --}}
                                <p>{{$documento->desc_doc}} </p> <br>
                            @endforeach
                        </td>
                        <td> 
                            @foreach ($candidato->documentos_solventados as $documento)
                                <p>{{$documento->documentos}} </p> <br>
                            @endforeach
                        </td>
                        <td> {{ $candidato->fecha_captura}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>
