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
                <th>Nombre Completo</th>
                <th>Calificación</th>
                <th>Folio del Aspirante</th>
                <th>Distrito</th>
                <th>Sede</th>
                <th>Municipio</th>
                <th>%</th>
            </tr>
        </thead>
        <tbody>
            @foreach($users as $key => $value)
                <tr>
                    <td>{{ $key+ 1}}</td>
                    <td>{{ $value->fullname }}</td>
                    <td>{{ $value->total  }}</td>
                    <td>{{ $value->FOLIO_ASPIRANTE }}</td>
                    <td>{{ $value->DTTO }}</td>
                    <td>{{ $value->SEDE }}</td>
                    <td>{{ $value->MPIO }}</td>
                    <td>{{ $value->Porcentaje }}</td>
                </tr>
                
            @endforeach
        </tbody>
    </table>
</body>
</html>
