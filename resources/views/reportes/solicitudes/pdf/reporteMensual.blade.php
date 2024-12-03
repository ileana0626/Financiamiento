@php
set_time_limit(0);
ini_set("memory_limit", "16384M");
ini_set("max_execution_time", "3600");
@endphp
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IEE | Sistema de la Dirección Administrativa</title>
</head>

<body>
  <table id="headLogos">
    <tr class="no-border">
      <td class="no-border" style="max-width: 120px !important;">
        <img src="{{ $logoIEE }}" alt="logo IEE Puebla" class="logo" style="width:120px;">
      </td>
      <td class="no-border" style="max-width: 60px !important;">
        <img src="{{ $logoNORMA }}" alt="Logo NMILyND" class="logo" style="width:60px; margin: 0 0 0 -30px;">
      </td>
      <td class="no-border">
        <h1 style="padding: 1rem 0; margin: 0 0 0 180px; text-transform: uppercase;">
          Instituto Electoral del Estado
          <br>
          Dirección Administrativa
          <br>
          COORDINACIÓN DE INFORMÁTICA
        </h1>
      </td>
      <td class="no-border">
        <div style="width:135px;">&nbsp;</div>
      </td>
    </tr>
  </table>
  <h4 style="text-align: center; padding-top: 0;" class="fonts">Historial de solicitudes del mes de @php echo $mes. ' de '. $anio @endphp</h4>
  <table id="bodyContenido" class="table-round-color">
    <thead>
      <tr style="font-size: .7rem" class="no-border fonts">
        <th>#</th>
        <th>Tipo</th>
        <th>Número</th>
        <th>Remitente</th>
        <th>Cargo</th>
        <th>Asunto</th>
        <th>Fecha Recibido</th>
        <th>Hora Recibido</th>
        <th>Termino</th>
        <th>Fecha Termino</th>
        <th>Área Asignada</th>
        <th>Área Emite</th>
        <th>Área Solicita</th>
        <th>Requiere respuesta</th>
        <th>Estatus</th>
      </tr>
    </thead>
    <tbody>
      @foreach($data as $key => $value)
      <tr style="font-size: .7rem;" class="no-border">
        <td class="data-td">{{ $key + 1}}</td>
        <td class="data-td">{{ $value->solicitud}}</td>
        <td class="data-td">
          @if ($value->numFolio)
            {{ $value->numFolio }}
          @elseif ($value->numMemo)
            {{ $value->numMemo }}
          @elseif ($value->numOficio)
            {{ $value->numOficio}}
          @else 
            -
          @endif
        </td>
        <td class="data-td">@if($value->remitente) {{$value->remitente}} @else - @endif</td>
        <td class="data-td">@if($value->cargo) {{$value->cargo}} @else - @endif</td>
        <td class="data-td">@if($value->asunto) {{$value->asunto}} @else - @endif</td>
        <td class="data-td">@if($value->fechaRecibido) {{$value->fechaRecibido}} @else - @endif</td>
        <td class="data-td">@if($value->horaRecibido) {{$value->horaRecibido}} @else - @endif</td>
        <td class="data-td">@if($value->termino) {{$value->termino}} @else - @endif</td>
        <td class="data-td">@if($value->fechaTermino) {{$value->fechaTermino}} @else - @endif</td>
        <td class="data-td">@if($value->areaAsignar) {{$value->areaAsignar}} @else - @endif</td>
        <td class="data-td">@if($value->areaEmite) {{$value->areaEmite}} @else - @endif</td>
        <td class="data-td">@if($value->areaSolicita) {{$value->areaSolicita}} @else - @endif</td>
        <td class="data-td">
          @php
            if($value->respuesta)
              echo $value->respuesta == 1 ? 'Si' : 'No';
            else 
              echo '-';
          @endphp
        </td>
        <td class="data-td">{{ $value->estatus }}</td>
      </tr>
      @endforeach
    </tbody>
  </table>
  <br>
</body>

<style>
  body {
    margin: -5px !important;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
  }

  .logo {
    width: 120px;
    height: 65px;
  }

  .logoPartido {
    width: 35px;
    margin: .3rem;
    height: 35px;
  }

  h1 {
    width: 400px;
    margin: auto;
    font-size: .9rem;
    font-weight: bold;
    color: #595959;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
  }

  table {
    border-collapse: collapse;
    width: 100%;
  }

  td span {
    text-align: center;
    /* text-transform: uppercase; */
  }

  .label-td {
    text-align: left;
    text-transform: uppercase;
    font-weight: 700;
    font-size: 0.66125rem;
    width: fit-content;
  }

  .data-th {
    padding-top: 5px;
    padding-bottom: 5px;
  }

  .data-td {
    text-align: center;
    text-transform: uppercase;
    font-weight: 400;
    font-size: 0.66125rem;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    background-color: #fff;
    padding-left: 5px;
    padding-right: 5px;
    border: 1px solid #f9f7f5 !important;
  }

  .data-rs {
    text-align: left;
    font-weight: 400;
    font-size: 0.66125rem;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    background-color: #fff;
  }

  .data-site {
    text-align: center;
    font-weight: 700;
    font-size: 0.91125rem;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    background-color: #fff;
    border-top: 2px solid #111;
  }

  .border-firma {
    border-top: 1px solid #111;
    border-left: none;
    border-right: none;
    border-bottom: none;
  }

  .icon-rs {
    width: 12px;
    height: 12px;
  }

  .round-bt-r {
    border-top-right-radius: 15px;
  }

  .round-bb-r {
    border-bottom-right-radius: 15px;
  }

  .title-th {
    text-transform: uppercase;
    text-align: left;
    font-size: 0.7125rem;
    font-family: Verdana, Geneva, Tahoma, sans-serif;

  }

  .txt-right {
    text-align: right;
  }

  .p-section {
    text-align: justify;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    padding-bottom: 15px;
  }

  .fonts {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
  }

  .bg-table-left {
    background-color: #F5F8F9;
    border-top-left-radius: 15px;
    border-bottom-left-radius: 15px;
  }

  .bg-table-right {
    background-color: #F5F8F9;
    /* border-radius: 15px; */
  }

  .bg-td-right {
    background-color: #f9f7f5;
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
  }

  .table-round-color {
    /* border-radius: 15px; */
    /* background-color: #aeadac;    */
    background-color: #f9f7f5;
  }

  .p-td {
    border-top: 2px solid #96771a;
    border-left: none;
    border-right: none;
    border-bottom: none;
  }

  #acuse {
    margin-top: 20px;
    border-collapse: collapse;
    width: 100%;
  }

  td table {
    text-align: center;
  }

  td {
    border: 1px solid;
    font-family: Verdana, sans-serif;
    font-size: .85rem;
    /* margin-left: 20px; */
    /* margin-right: 20px; */
    padding: .2rem;
  }

  .no-border {
    border: none !important;
    /* padding: 0; */
  }

  .gray-bg {
    background: #E7E6E6;
    text-align: center
  }

  .darker-gray-bg {
    background: #D0CECE;
    text-align: center;
    font-weight: bold;
  }

  .img-border {
    border: 2px solid #ddd;
    border-radius: 15px;
    width: 155px;
    height: 155px;
  }

  .img-pp {
    border: 2px solid #ddd;
    border-radius: 10px;
    width: 40px;
    height: 40px;
  }

  .logo-pp {
    border: 2px solid #ddd;
    border-radius: 10px;
    width: 45px;
    height: 45px;
    margin-top: 2px;
  }

  .fuerza {
    font-weight: 700;
    text-transform: uppercase;
  }

  .txt-justify {
    text-align: justify;
  }
</style>

</html>