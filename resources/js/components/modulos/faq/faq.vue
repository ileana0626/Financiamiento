<template>
  <div class="content-header center">
    <div class="container-fluid mb-5">
      <!-- Breadcrumb (navegacion) -->
      <div class="float-sm-right mr-5">
        <ul class="breadcrumb">
          <!-- <li>
            <a href="/">Inicio</a>
          </li> -->
          <li class="breadActive">
            <span>Ayuda</span>
          </li>
        </ul>
      </div>
    </div>
    <vsa-list class="w75 card shadow">
      <!-- Here you can use v-for to loop through items  -->
      <vsa-item>
        <vsa-heading>
          Pregunta 1.- ¿Cómo descargar un reporte por candidatura?
        </vsa-heading>
        <vsa-content>
          En el apartado REPORTES, se muestra un listado de reportes descargables, disponibles en PDF y/o EXCEL, 
          mostrará un botón de color rojo o verde con el nombre del "Reporte". Finalmente, hacer clic en el mismo y esperar
          a que descargue el documento. Para los documentos en PDF es importante <strong> permitir las ventanas emergentes</strong>
          para poder visualizar una vista previa del documento desde el navegador
        </vsa-content>
      </vsa-item>
      <vsa-item>
        <vsa-heading>
          Pregunta 2.- ¿Cómo descargar un reporte general de todas las candidaturas en Excel?
        </vsa-heading>
        <vsa-content>
          En el apartado REPORTES, en la sección de Reporte de registros. Se
          encuentra un botón de color verde. Al hacer clic en él, comenzará a generar el archivo y al terminar este se descargará automáticamente.
        </vsa-content>
      </vsa-item>
      <vsa-item>
        <vsa-heading>
          Pregunta 3.- ¿Para qué sirve el contenido de la Ventana Principal?
        </vsa-heading>
        <vsa-content>
          El módulo de la ventama principal mostrará el total de candidaturas por estatus, las fechas de los periodos establecidos para cada etapa y unas gráficas que agrupan las candidaturas registradas en diferentes categorías
        </vsa-content>
      </vsa-item>
    </vsa-list>
  </div>
</template>
<script>
export default {}
</script>
<style>
.vsa-list {
  --vsa-max-width: 85%;
  margin: auto;
  --vsa-highlight-color: #baa378;
  --vsa-default-icon-size: 0.7;
  --vsa-border-color: transparent;
  border-radius: 0.25rem;
  background-color: var(--iee-white) !important;
  overflow: hidden;
}

.vsa-item:not(:last-of-type) {
  border-bottom: 1px var(--iee-light-gray) solid !important;
}

.vsa-item__trigger__content{
  width: 75% !important;
}

.vsa-item__trigger:hover{  
  background-color: var(--iee-dorado-cafe);
}
.vsa-item__trigger__icon{
  right: 5px !important;
}

.vsa-item__trigger__icon.vsa-item__trigger__icon--is-default::before,
.vsa-item__trigger__icon.vsa-item__trigger__icon--is-default::after{
  background-color: var(--text-color) !important;
}
.vsa-item__trigger__content {
  text-align: left !important;
}

.vs-list-action{
  font-size: .95rem !important;
}

.vsa-item__content {
  text-align: center !important;
  color: var(--text-color) !important;
}

.vsa-item__content {
  text-align: justify !important;
}


@media screen and (max-width: 992px) {
  .vsa-list {
    /* --vsa-max-width: 72vw; */
    /* --vsa-highlight-color: #c7af5e; */
    --vsa-default-icon-size: 0.45;
    font-size: .85rem !important;
    /* --vsa-border-color: transparent; */
  }

  .vsa-item__trigger__icon--is-default {
    min-width: 40px !important;
  }

  .vsa-item__trigger__content {
    font-weight: 600 !important;
    font-size: 0.85rem !important;
  }

  .vs-list-action{
    font-size: .8rem !important;
  }
}

@media screen and (max-width: 575px) {
  .vsa-list {
    /* --vsa-max-width: 72vw; */
    /* --vsa-highlight-color: #c7af5e; */
    --vsa-default-icon-size: 0.45;

    /* --vsa-border-color: transparent; */
  }

  .vsa-item__trigger__icon--is-default {
    min-width: 40px !important;
  }

  .vsa-item__trigger__content {
    font-weight: 700;
    font-size: 0.95rem;
  }
  .badge.badge-pill.badge-main.mx-2.d-flex.justify-content-end.vs-list-action{
    display: none !important;
  }
}
</style>