<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        @page{
            margin: 1.3rem;
            margin-top: 1.9rem;
            padding: 1rem;
        }
        body{
            margin : 0px;
        }
        *{
            font-family:verdana, arial, sans-serif;
        }
        .cabecera {
            background-color: #fefefe;
            color : #000000;
            padding : 2rem;
            padding-top : .2rem;
            padding-bottom : 0px;
        }
        .cabecera .logo{
            margin : 5px;
        }
        .cabecera table{
            padding: 1px;
            margin-bottom : .2rem;
        }
        table{
            font-size : x-small;
        }
        tfoot tr td{
            font-weight: bold;
            font-size: x-small;
        }
    </style>
</head>
<body>
    <div class="cabecera">
        <table  width="100%" cellspacing="0">
            <tr>
                <td>
                    <table width="100%" cellspacing="0">
                        <tr>
                            <td>
                                <img src="{{ $logo }}" class="logo" width="150" height="90">
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table  width="100%" cellspacing="0">
                        <tr>
                            <td></td>
                            <td><strong>Día</strong></td>
                            <td><strong>Mes </strong></td>
                            <td><strong>año</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Fecha</strong></td>
                            <td>{{ date('d')}}</td>
                            <td>{{ date('m')}}</td>
                            <td>{{ date('Y')}} </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" cellspacing="0" cellspacing="1" align="center">
            <thead style="background-color: lightgray;">
                <tr align="center" align="middle">
                    <th colspan="5">Detalle de Preguntas</th>
                </tr>
                <tr>
                    <th>#</th>
                    <th>Pregunta</th>
                    <th>Respuesta Usuario</th>
                    <th>Respuesta Correcta</th>
                    <th>Calificación</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($rpta as $key => $value)
                    <tr>
                        <td align="center">{{ $key + 1 }}</td>
                        <td>{{ $value->PREGUNTA }}</td>
                        <td align="center">{{ $value->OPCION }}</td>
                        <td align="center">{{ $value->OPCION_CORRECTA }}</td>
                        <td align="center">{{ $value->CALIFICACION }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>