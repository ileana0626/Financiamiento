<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Nombre de la Hoja -->
    <title>Calculos</title>
</head>
<body>
    <div class="header">
    </div>
    <table style="width: 100%; border-collapse: collapse;">
        {{-- <colgroup>
            <col style="width: 100px">
            <col style="width: 800px">
            <col style="width: 200px">
        </colgroup> --}}
        <thead>
            <tr>
                <th colspan="3"></th>
            </tr>
        </thead>
        <tbody>
            {{-- Título --}}
            <tr>
                <td colspan="3">FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO {{ $datos->calculo->anioFiscal }}</td>
            </tr>
            {{-- Fundamento Legal --}}
            <tr>
                <td style="font-weight: bold;">Fundamento Legal:</td>
                <td>Artículos 41 Base II inciso a) y 116 fracción IV inciso g) de la Constitución Política de los Estados Unidos Mexicanos; 51 numerales 1 inciso a) 2 y 3 de la Ley General de Partidos Políticos; y 42 fracción III, 45 fracción I inciso a), 47 fracción I y II, 201 Quinquies, apartado A, fracción I y apartado E,  del Código de Instituciones y Procesos Electorales del Estado de Puebla. </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Unidad de Medida y Actualización, publicada en el Diario Oficial de la Federación en fecha {{ \Carbon\Carbon::parse($datos->calculo->fecha_pub)->format('d \d\e F \d\e Y')}}.</td>
                <td>{{'$' . number_format($datos->calculo->uma, 4, ".", ",")}}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>65%</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>{{'$' . number_format($datos->calculo->uma_65, 4, ".", ",")}}</td>
            </tr>
            <tr>
                <td></td>
                <td>Número total de ciudadanos inscritos en el padrón electoral de la Entidad con corte al 31 de julio de {{ \Carbon\Carbon::parse($datos->calculo->fecha_pub)->format('Y')}}.</td>
                <td>{{ $datos->calculo->personas_padron }}</td>
            </tr>
            <tr>
                <td></td>
                <td>Monto Total de Financiamiento Público a distribuir entre los partidos políticos.</td>
                <td>{{ '$' . number_format($datos->calculo->financiamiento_aop, 4, ".", ",")}}</td>
            </tr>
            {{-- Mostrar los partidos sin representación dinámicamente --}}
            @foreach($datos->partidos_sin_rep as $partido)
            <tr>
                <td></td>
                <td style="word-wrap: break-word; white-space: normal; vertical-align: top; height: 60px;">
                    2% del monto de financiamiento público para actividades ordinarias permanentes del año 2024, para partidos políticos locales que habiendo conservado el registro, no cuentan con representación en el Congreso Local ({{$partido->siglas}}).
                </td>
                <td>{{ '$' . number_format($partido->monto_2_por_ciento, 4, ".", ",")}} </td>
            </tr>
            @endforeach
            {{-- <tr>
                <td></td>
                <td>2% del monto de financiamiento público para actividades ordinarias permanentes del año 2024, para partidos políticos nacionales que habiendo obtenido el registro local, no cuentan con representación en el Congreso Local (FXMP)</td>
                <td>$6,710,700.75 </td>
            </tr> --}}

            <tr>
                <td></td>
                <td>Total de Financiamiento Público a distribuir entre {{$datos->calculo->pp_sin_repr_siglas}}</td>
                <td>{{ '$' . number_format($datos->calculo->total_fp_sin_repr, 4, ".", ",")}}</td>
            </tr>
            <tr>
                <td></td>
                <td>Financiamiento Publico a distribuir conforme al Art. 47 Fracción I del CIPEEP. </td>
                <td>{{'$' . number_format($datos->calculo->monto_total_efectivo, 4, ".", ",")}}</td>
            </tr>
            <tr>
                <td></td>
                <td>El 30% se distribuye de forma igualitaria entre los partidos políticos.</td>
                <td>30%</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>{{ '$' . number_format($datos->calculo->monto_30_por_ciento, 4, ".", ",")}}</td>
            </tr>
            <tr>
                <td></td>
                <td>Total de partidos políticos nacionales y locales que alcanzaron el 3% a nivel nacional o local (PAN, PRI, PT, PVEM, MC, PSI y Morena).</td>
                <td>{{ $datos->calculo->num_pp_con_repr }}</td>   
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>{{ '$' . number_format($datos->calculo->monto_30_por_ciento/$datos->calculo->num_pp_con_repr, 4, ".", ",")}}</td>   
            </tr>
            <tr>
                <td></td>
                <td>El 70% restante se distribuye entre los partidos políticos de acuerdo al porcentaje de votos que obtuvieron en la elección inmediata anterior de Diputados por el Principio de Mayoría Relativa del Proceso Electoral Estatal Ordinario.</td>
                <td>70%</td>   
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>{{formato_moneda($datos->calculo->monto_70_por_ciento)}}</td>
            </tr>
            <tr>
                <td></td>
                <td>TOTAL DE FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES PARA EL AÑO 2024. </td>
                <td>{{formato_moneda($datos->calculo->comprobacion_monto)}}</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td>Siglas</td>
                <td><strong>PAN.</strong> Partido Acción Nacional; PRI. Partido Revolucionario Institucional; PT. Partido del Trabajo; PVEM. Partido Verde Ecologista de México; MC. Movimiento Ciudadano; PSI. Pacto Social de Integración, Partido Político; Morena; NAP. Nueva Alianza Puebla; y, FXMP. Fuerza por México Puebla. </td>
                <td></td>
            </tr>
        </tfoot>

    </table>

   
    <div class="footer">
        <p>Fecha de generación: {{ now()->format('d/m/Y H:i:s') }}</p>
    </div>
</body>
</html>
