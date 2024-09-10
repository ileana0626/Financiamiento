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
    <title>LISTADO DE CANDIDATURAS {{$nIdEleccion}}</title>
</head>
<body>
    <div>
        <table>
            <tr>
                <td>
                    <strong>Registro de Aspirantes a Candidaturas</strong><br>
                    <strong>Proceso Electoral Estatal<br>Ordinario Concurrente 2023-2024</strong><br>
                    <strong>REPORTE DE CANDIDATURAS <br>{{$tipoEleccion}}</strong>
                </td>
            </tr>
        </table>

        <div>
            <table>
                <thead>
                    <tr>
                        <th>FOLIO</th>
                        <th>PARTIDO POLÍTICO/<br>COALICIÓN/<br>CANDIDATURA INDEPENDIENTE</th>
                        <th>DISTRITO</th>
                        <th>CLAVE DE ELECTOR PERSONA PROPIETARIA</th>
                        <th>PERSONA PROPIETARIA</th>
                        <th>GENERO PERSONA PROPIETARIA</th>
                        <th>ACCIONES AFIRMATIVAS PERSONA PROPIETARIA</th>
                        <th>CLAVE DE ELECTOR PERSONA SUPLENTE</th>
                        <th>PERSONA SUPLENTE</th>
                        <th>GENERO PERSONA SUPLENTE</th>
                        <th>ACCIONES AFIRMATIVAS PERSONA SUPLENTE</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($Candidaturas as $key => $candidatura)
                        @if (($key%2)==0) <tr>
                        @else <tr>
                        @endif
                            <td> {{ $candidatura->folio}}</td>
                            <td>
                                {{ $candidatura->siglas_partido }}
                                {{ ($candidatura->siglas_partido_principal) ? ' Partido Principal: '.$candidatura->siglas_partido_principal : '' }}
                                {{ ($candidatura->partido_asociados) ? ' Partidos Asociados: '.$candidatura->partido_asociados : ''}}
                            </td>
                            <td> {{ $candidatura->distrito_label}}</td>
                            <td> {{ $candidatura->clave_elector_propietario}}</td>
                            <td> {{ $candidatura->nombre_propietario}}</td>
                            <td> {{ $candidatura->propietario_genero_label}}</td>
                            <td> {{ $candidatura->propietario_acciones_afirmativas_label}}</td>
                            <td> {{ $candidatura->clave_elector_suplente}}</td>
                            <td> {{ $candidatura->nombre_suplente}}</td>
                            <td> {{ $candidatura->suplente_genero_label}}</td>
                            <td> {{ $candidatura->suplente_acciones_afirmativas_label}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
