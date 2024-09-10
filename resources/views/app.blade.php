<!DOCTYPE html>
<html lang="es">

  @include('sections.head')

<body>
  <div id="watermark"></div>
  {{-- <script src="https://www.infomexsinaloa.org/accesibilidadweb/js_api.aspx?api_key=C0EC26F9-3D41-4EBA-8C40-6797E40A7C1A&tipo=body&aut=ieepuebla.org.mx" type="text/javascript"></script> --}}
<div class="wrapper" id="app">
  @if (Auth::check())
      <App ruta="{{ route('basepath') }}" :usuario="{{ Auth::user() -> load('file') }}"></App>
  @else 
      <Auth ruta="{{ route('basepath') }}" ></Auth>
  @endif
  
</div>

  @include('sections.script')
</body>
</html>
