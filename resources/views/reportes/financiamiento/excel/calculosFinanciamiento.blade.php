<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Nombre de la Hoja -->
    <title>Calculos</title>
</head>
<body>
    <div class="header">
        {{-- <img src="{{ public_path('img/LOGO_NUEVO.png') }}" alt="Logo" style="width: 100px; height: auto;"> --}}
    </div>
    <table style="width: 100%; border-collapse: collapse; ">
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
                <td colspan="3" style="word-wrap: break-word; white-space: normal; vertical-align: top; text-align: center; height: 60px; font-weight: bold;">
                    FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES Y ACTIVIDADES TENDIENTES A LA OBTENCIÓN DEL VOTO DE LOS PARTIDOS POLÍTICOS Y CANDIDATURAS INDEPENDIENTES EN EL AÑO &nbsp;
                    '<span style="color: #ff0000;"> {{ $datos->calculo->anioFiscal }}</span>'
                </td>
            </tr>
            {{-- Fundamento Legal --}}
            <tr>
                <td style="font-weight: bold; vertical-align: top;">Fundamento Legal:</td>
                <td colspan="2" style="word-wrap: break-word; white-space: normal; vertical-align: top; text-align: left; height: 60px;">
                    Artículos 41 Base II inciso a) y 116 fracción IV inciso g) de la Constitución Política de los Estados Unidos Mexicanos; 51 numerales 1 inciso a) 2 y 3 de la Ley General de Partidos Políticos; y 42 fracción III, 45 fracción I inciso a), 47 fracción I y II, 201 Quinquies, apartado A, fracción I y apartado E,  del Código de Instituciones y Procesos Electorales del Estado de Puebla.
                </td>
            </tr>
            <tr>
                <td></td>
                <td>Unidad de Medida y Actualización, publicada en el Diario Oficial de la Federación en fecha &nbsp; '<span style="color: #ff0000">{{ formato_fecha_es($datos->calculo->fecha_pub) }}'.</span></td>
                <td style="color: #ff0000">{{formato_moneda($datos->calculo->uma)}}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="border-bottom: 1px solid #000;">65%</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="color: #ff0000">{{ formato_moneda($datos->calculo->uma_65)}}</td>
            </tr>
            <tr>
                <td></td>
                <td>Número total de ciudadanos inscritos en el padrón electoral de la Entidad con corte al 31 de julio de '{{ \Carbon\Carbon::parse($datos->calculo->fecha_pub)->format('Y')}}'.</td>
                <td style="color: #ff0000; border-bottom: 1px solid #000;">{{ number_format($datos->calculo->personas_padron) }}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b>Monto Total de Financiamiento Público a distribuir entre los partidos políticos.</b></td>
                <td style="color: #ff0000">{{ formato_moneda($datos->calculo->financiamiento_aop)}}</td>
            </tr>
            {{-- Muestra los partidos sin representación dinámicamente --}}
            @foreach($datos->partidos_sin_rep as $partido)
            <tr>
                <td></td>
                <td style="word-wrap: break-word; white-space: normal; vertical-align: top; height: 60px;">
                    2% del monto de financiamiento público para actividades ordinarias permanentes del año '{{ $datos->calculo->anioFiscal }}', para partidos políticos locales que habiendo conservado el registro, no cuentan con representación en el Congreso Local ({{$partido->siglas}}).
                </td>
                <td style="color: #ff0000">{{ formato_moneda($partido->monto_2_por_ciento) }} </td>
            </tr>
            @endforeach
            <tr>
                <td></td>
                <td style="font-weight: bold;">Total de Financiamiento Público a distribuir entre {{formatear_lista($datos->calculo->pp_sin_repr_siglas)}}</td>
                <td style="color: #ff0000; font-weight: bold;">{{ formato_moneda($datos->calculo->total_fp_sin_repr)}}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b>Financiamiento Publico a distribuir conforme al Art. 47 Fracción I del CIPEEP.</b></td>
                <td style="color: #ff0000; font-weight: bold;">{{ formato_moneda($datos->calculo->monto_total_efectivo)}}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b>El 30% se distribuye de forma igualitaria entre los partidos políticos.</b></td>
                <td style="border-bottom: 1px solid #000;">30%</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="color: #ff0000; font-weight: bold;">{{ formato_moneda($datos->calculo->monto_30_por_ciento)}}</td>
            </tr>
            <tr>
                <td></td>
                <td>Total de partidos políticos nacionales y locales que alcanzaron el 3% a nivel nacional o local ({{formatear_lista($datos->calculo->pp_con_repr_siglas)}}).</td>
                <td style="color: #ff0000; border-bottom: 1px solid #000;">{{ $datos->calculo->num_pp_con_repr }}</td>   
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="color: #ff0000">{{ formato_moneda($datos->calculo->monto_30_por_ciento/$datos->calculo->num_pp_con_repr)}}</td>   
            </tr>
            <tr>
                <td></td>
                <td><b>El 70% restante se distribuye entre los partidos políticos de acuerdo al porcentaje de votos que obtuvieron en la elección inmediata anterior de Diputados por el Principio de Mayoría Relativa del Proceso Electoral Estatal Ordinario.</b>
                <td style="border-bottom: 1px solid #000;">70%</td>   
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="color: #ff0000; font-weight: bold;">{{formato_moneda($datos->calculo->monto_70_por_ciento)}}</td>
            </tr>
            <tr>
                <td></td>
                <td style="font-weight: bold;">TOTAL DE FINANCIAMIENTO PÚBLICO PARA ACTIVIDADES ORDINARIAS PERMANENTES PARA EL AÑO '{{ $datos->calculo->anioFiscal }}'.</td>
                <td style="border-bottom: 1px double solid #000; color: #ff0000; font-weight: bold;">{{formato_moneda($datos->calculo->comprobacion_monto)}}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td style="vertical-align: top; font-weight: bold;">
                    <span> Siglas</span>
                </td>
                <td style="word-wrap: break-word; white-space: normal; vertical-align: top; height: 60px;" colspan="2">
                    <span style="font-weight: bold;">PAN.</span> Partido Acción Nacional; PRI. Partido Revolucionario Institucional; PT. Partido del Trabajo; PVEM. Partido Verde Ecologista de México; MC. Movimiento Ciudadano; PSI. Pacto Social de Integración, Partido Político; Morena; NAP. Nueva Alianza Puebla; FXMP. Fuerza por México Puebla.
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; font-weight: bold;">Nota: </td>
                <td style="word-wrap: break-word; white-space: normal; vertical-align: top; height: 80px;" colspan="2"></td>
            </tr>
        </tfoot>

    </table>

   
    <div class="footer">
        {{-- <p>Fecha de generación: {{ now()->format('d/m/Y') }}</p> --}}
    </div>
</body>
</html>
