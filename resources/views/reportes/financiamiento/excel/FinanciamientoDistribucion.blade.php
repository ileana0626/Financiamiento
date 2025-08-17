<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Nombre de la Hoja -->
    <title>Distribución</title>
</head>
<body>
    <div class="header">
        
    </div>
    <table>
        <thead>
            <tr>
                <th></th>
            </tr>
        </thead>
        @php
            // Contador de partidos
            $contador = 0;
        @endphp
        <tbody>
            <tr>
                <td>FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>No.</td>
                <td>Sigla Partido</td>
                <td>Partido Político</td>
                <td>% de votación por partido político de elección de diputados</td>
                <td>30% en forma igualitaria <br> ( a )</td>
                <td>70% conforme al % d      
            @foreach($datos->partidos_con_rep as $partido)
            <tr>
                <td>{{$contador++}}</td>
                <td>{{$partido->siglas}}</td>
            </tr>
            <tr>
                <td></td>
            </tr>
            @endforeach
            <tr>
                <td>SUBTOTAL</td>
            </tr>
            <tr></tr>
            @foreach($datos->partidos_sin_rep as $partido)
            <tr>
                <td>{{$contador++}}</td>
                <td></td>
                <td></td>
                <td>2% del monto de financiamiento público para actividades ordinarias permanentes del año 2024, para partidos políticos locales que habiendo conservado el registro, no cuentan con representación en el Congreso Local</td>
                <td></td>
                <td></td>
            </tr>
            @endforeach
            <tr>
                <td>SUBTOTAL</td>
            </tr>
            <tr></tr>
            <tr>
                <td>{{$contador++}}</td>
                <td></td>
                <td>Candidaturas Independientes</td>
                <td>2% del financiamiento público para actividades tendientes a la obtención del voto.</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>TOTALES</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>GRAN TOTAL</td>
                <td></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>