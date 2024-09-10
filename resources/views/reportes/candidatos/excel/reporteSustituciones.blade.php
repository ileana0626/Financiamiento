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
    <title>Reporte de Sustituciones</title>
    
</head>
<body>
    <div>
        <table>
            <tr>
                <td>
                    <strong>Registro de Aspirantes a Candidaturas</strong><br>
                    <strong>Proceso Electoral Estatal<br>Ordinario Concurrente 2023-2024</strong><br>
                    <strong>REPORTE DE SUSTITUCIONES</strong>
                </td>
            </tr>
        </table>

        <div>
            <table>
                <thead>
                    <tr>
                        <th><strong>FOLIO</strong></th>
                        <th><strong>PARTIDO POLITICO/ COALICIÓN/ CANDIDATURA INDEPENDIENTE</strong></th>
                        {{-- <th><strong>TIPO DE SUSTITUCIÓN</strong></th> --}}
                        <th><strong>TIPO DE ELECCIÓN</strong></th>
                        <th><strong>MUNICIPIO O DISTRITO</strong></th>
                        <th><strong>CARGO</strong></th>
                        <th><strong>CLAVE DE ELECTOR PERSONA CANDIDATA QUE RENUNCIA</strong></th>
                        <th><strong>PERSONA CANDIDATA QUE RENUNCIA</strong></th>
                        <th><strong>GENERO PERSONA QUE RENUNCIA</strong></th>
                        <th><strong>CLAVE DE ELECTOR PERSONA CANDIDATA DE SUSTITUCIÓN</strong></th>
                        <th><strong>PERSONA CANDIDATA DE SUSTITUCIÓN</strong></th>
                        <th><strong>GENERO PERSONA DE SUSTITUCIÓN</strong></th>
                        {{-- <th><strong>FECHA DE PRESENTACIÓN DE SUSTITUCIÓN</strong></th> --}}
                        {{-- <th><strong>INSTRUMENTO DE APROBACIÓN</strong></th> --}}
                        {{-- <th><strong>FECHA DE CAPTURA DE SUSTITUCIÓN</strong></th> --}}
                        {{-- <th><strong>OBSERVACIONES</strong></th> --}}
                    </tr>
                </thead>
                <tbody>
                    @foreach($Candidatos as $key => $candidato)
                        @if (($key%2)==0) <tr>
                        @else <tr>
                        @endif
                            {{-- <td>{{ $candidato->folio}}</td> --}}
                            <td>{{ $candidato->siglas_partido }} {{ $candidato->partido_asociados}}</td>
                            {{-- <td>-</td> --}}
                            <td>{{ $candidato->tipo_eleccion_label}}</td>
                            <td>{{ $candidato->distrito_label}} {{($candidato->distrito_label && $candidato->municipio_label)? ' | ': ''}} {{ $candidato->municipio_label }}</td>
                            <td>{{ $candidato->cargo_label}}</td>
                            <td>{{$candidato->clave_elector_anterior}}</td>
                            <td>{{$candidato->nombre_anterior}}</td>
                            <td>{{$candidato->genero_anterior_label}}</td>
                            <td>{{$candidato->clave_elector_sustituto}}</td>
                            <td>{{$candidato->nombre_sustituto}}</td>
                            <td>{{$candidato->genero_sustituto_label}}</td>
                            {{-- <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td> --}}
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
