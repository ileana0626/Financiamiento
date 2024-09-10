<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Departamento</th>
                <th>Nombre(s)</th>
                <th>Apellido Paterno</th>
                <th>Apellido Materno</th>
                <th>Folio</th>
                <th>Fecha</th>
                <th>Plaza</th>
                <th>Cedula</th>
                <th>Factor</th>
                <th>Tipo Factor</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach($evaluaciones as $key => $value)
                <tr>
                    <td>{{ $key+ 1}}</td>
                    <td>{{ $value->departamento }}</td>
                    <td>{{ $value->firstname }}</td>
                    <td>{{ $value->secondname }}</td>
                    <td>{{ $value->lastname }}</td>
                    <td>{{ $value->folio }}</td>
                    <td>{{ $value->fecha_alta }}</td>
                    <td>{{ $value->plaza }}</td>
                    <td>{{ $value->cedula }}</td>
                    <td>{{ $value->factor }}</td>
                    <td>{{ $value->tipo_factor }}</td>
                    <td>{{ $value->TOTAL }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
