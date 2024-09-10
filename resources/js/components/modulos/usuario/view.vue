<template>
  <div class="col-sm-11 mx-auto d-flex flex-column">
    <div class="container-fluid mb-4">
      <!-- Breadcrumb (navegacion) -->
      <div class="float-sm-right">
        <ul class="breadcrumb">
          <li>
            <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
          </li>
          <li>
            <span style="color: var(--text-color) !important">Listado de Candidaturas</span>
          </li>
          <li class="breadActive">
            <span>Ver Candidatura</span>
          </li>
        </ul>
      </div>
    </div>

    <div class="card card-info shadow-lg">
      <div class="card-header d-flex align-items-center container-fluid">
        <h3 class="col card-title font-weight-bold">Información de Candidatura</h3>
        <div class="col card-tools d-flex justify-content-end">
          <vs-button @click.prevent="regresar"
            style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
            <b>
              <span class="material-symbols-rounded v-align-icon-bc"> arrow_back </span>
              Regresar
            </b>
          </vs-button>
        </div>
      </div>
      <div class="card-body p-4 container-fluid" style="background-color: var(--iee-white) !important">
        <div class="row mx-12 mb-12 p-4">

          <template v-if="userLoggedRol != 2 && userLoggedRol != 4">
            <div class="col-sm-12 col-md-12 col-xl-12 px-0 pr-sm-5 pb-3">
              <div id="Campos Obligatorios" class="col-sm-12 col-md-8 col-xl-6 py-4 mx-auto">
                <vs-alert closable color="#595959" v-model="notiCamposValidados" style="color: var(--text-color)">
                  <template #title>
                    Campos Validados
                  </template>
                  Los campos marcados con un
                  <label class="mb-0">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" class="checkNotification mx-2"
                      color="rgb(186, 163, 120)" v-model="notiCheck"></vs-checkbox>
                  </label>
                  indican que ya han sido validados por personal del Instituto
                </vs-alert>
              </div>
            </div>
          </template>

          <Transition name="slide-fade">
            <div class="cardUbicacion py-1 pl-3" v-if="showUbicacion">
              <div
                style="background-color: var(--iee-white) !important; border-radius:15px; color: var(--text-color) !important">
                <div class="row d-flex pr-1">
                  <div class="col-10 d-flex align-items-center">
                    <span class="font-weight-bold my-3">Tipo de Elección:
                      <small class="font-weight-bold">
                        <br><span v-if="vertipoEleccion != ''"> {{ vertipoEleccion }}</span>
                        <br><span v-if="verdistrito != ''">Distrito: {{ verdistrito }}</span>
                        <br><span v-if="vermunicipio != ''">Municipio: {{ vermunicipio }}</span>
                      </small>
                    </span>
                    <br>

                  </div>
                  <div class="col-2">
                    <vs-button dark circle size="mini" class="my-0 mx-1"
                      @click.prevent="showUbicacion = !showUbicacion">
                      <span style="color: white !important" class="material-symbols-rounded m-0"> close </span>
                    </vs-button>
                  </div>
                </div>
              </div>
            </div>
          </Transition>

          <!-- <Transition name="slide-fade" class="d-none">
            <div class="cardTipoEleccion py-1 pl-3"  v-if="showTipoEleccion">
            <div style="background-color: var(--iee-white) !important; border-radius:15px; color: var(--text-color) !important">
              <div class="row d-flex pr-1">
                <div class="col-10 d-flex align-items-center">
                  <span class="font-weight-bold my-3">Tipo de Elección:
                    <small class="font-weight-bold">
                      <br><span v-if="vertipoEleccion != ''">{{ vertipoEleccion }}</span>
                    </small>
                  </span>
                </div>
                <div class="col-2">
                  <vs-button dark circle size="mini" class="my-0 mx-1"
                    @click.prevent="showTipoEleccion = !showTipoEleccion">
                      <span class="material-symbols-rounded m-0"> close </span>
                  </vs-button>
                </div>
              </div>
            </div>
          </div>
          </Transition> -->
          <div class="col-6 d-flex justify-content-start align-items-center px-0 pr-sm-5 pb-3">
            <label class="mr-2" for="">Estatus:</label>
            <label v-if="estatus == 1" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-blue) !important; color: var(--iee-white)!important">PreRegistro</label>
            <label v-else-if="estatus == 2" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-green) !important; color: var(--iee-white)!important">Registro
              Completo</label>
            <label v-else-if="estatus == 3" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-gold) !important; color: var(--iee-white)!important">Solventar</label>
            <label v-else-if="estatus == 4" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-orange) !important; color: var(--iee-white)!important">Sustitución</label>
            <label v-else-if="estatus == 5" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-red) !important; color: var(--iee-white)!important">Renuncia</label>
            <label v-else-if="estatus == 6" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-black) !important; color: var(--iee-white)!important">Cancelado</label>
            <label v-else-if="estatus == 7" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-green2) !important; color: var(--iee-white)!important">Verificado</label>
            <label v-else-if="estatus == 8" class="badge rounded-pill"
              style="font-size: 1rem !important; background-color: var(--iee-teal) !important; color: var(--iee-white)!important">Aprobado
              por el Consejo</label>
            <h5 class="row col d-flex align-items-center">
              <vs-tooltip right v-if="eleccion != 1">
                <small class="m-0">
                  <vs-button icon transparent class="m-0" @click.prevent="showUbicacion = !showUbicacion">
                    <span class="material-symbols-rounded m-0"> location_on </span>
                  </vs-button>
                </small>
                <template #tooltip>
                  <span style="color: white !important;" v-if="!showUbicacion">Ver Ubicación</span>
                  <span style="color: white !important;" v-else>Ocultar Ubicación</span>
                </template>
              </vs-tooltip>
            </h5>
          </div>

          <!-- <div class="col-sm-6 col-md-6 col-xl-6 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Clave de Elector
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.claveElector">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5 class="row col d-flex align-items-center">{{ verclaveElector }}</h5>

          </div>
          <div class="col-sm-6 col-md-6 col-xl-6 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Puesto
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.puesto">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5 class="row col d-flex align-items-center">
              {{ verpuesto }}
              <vs-tooltip right v-if="eleccion != 1">
                <small class="m-0">
                  <vs-button icon transparent class="m-0" @click.prevent="showUbicacion = !showUbicacion">
                    <span class="material-symbols-rounded m-0"> location_on </span>
                  </vs-button>
                </small>
                <template #tooltip>
                  <span style="color: white !important;" v-if="!showUbicacion">Ver Ubicación</span>
                  <span style="color: white !important;" v-else>Ocultar Ubicación</span>
                </template>
              </vs-tooltip>

            </h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Nombre
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.nombre">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ vernombre }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Apellido Paterno
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.app">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verapellidoP }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Apellido Materno
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.apm">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verapelliodoM }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Género
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.genero">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ vergenero }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Sobrenombre
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.sobrenombre">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ versobrenombre }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Fecha de Nacimiento
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.fechaNacimiento">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verfechaNacimiento }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Edad
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.edad">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ veredad }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Ocupación
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.ocupacion">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verocupacion }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">OCR
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.ocr">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verocr }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Lugar de Nacimiento
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.lugarNacimiento">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verlugarnacimiento }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Domicilio
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.domicilio">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ verdomicilio }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Tiempo de Residencia en Domicilio
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.tResidencia">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template></label>
            <h5>{{ vertiempoResidencia }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Teléfono
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.telefono">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ vertelefono }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Correo electrónico
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.correo">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ vercorreo }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Acción Afirmativa
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.accionAfirmativa">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>
            <h5>{{ veraccionafir }} {{ (vertipoaccion != '') ? ' ' + vertipoaccion : '' }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Opta por Reelección
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.reeleccion">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>

            <h5>{{ reeleccion }}</h5>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label d-flex flex-nowrap align-items-center">Curso para aspirantes
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO
                <div class="d-flex pl-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.aspiranteCurso">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
            </label>

            <h5>{{ aspiranteCurso }}</h5>
          </div> -->
          <!-- <template v-if="verDocumentos">
          <div class="col mx-12 mb-12 p-4">
            f1
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.F1">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">1. Solicitud de registro</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F1 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.F1 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + '/' + documentos.F1.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span style="
                          margin-left: 7px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.F1.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.F1 && tieneDocumento.F1 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            f2
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.F2">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">2. Formato 5 en 1</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F2 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.F2 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.F2.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.F2.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.F2 && tieneDocumento.F2 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            F3. Escrito para inclusión de sobrenombre
            <div class="d-flex"> 
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.F3">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">F3. Escrito para inclusión de sobrenombre</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.F3 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.F3 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.F3.url"
                      blank
                    >
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >

                        {{ documentos.F3.name }}
                      </span>

                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.F3 && tieneDocumento.F3 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div> 
            D1. Copia simple del acta de nacimiento
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D1">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">3. Copia simple del acta de
                nacimiento</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D1 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D1 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D1.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D1.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D1 && tieneDocumento.D1 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D2. Copia simple de la credencial para votar/(SIIAP)
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D2">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">4. Copia simple de la credencial para
                votar</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D2 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D2 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D2.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D2.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D2 && tieneDocumento.D2 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D3. Constancia de residencia
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D3">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">5. Documento probatorio de la
                residencia</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D3 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D3 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D3.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D3.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D3 && tieneDocumento.D3 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D4. Documento que acredita la Ciudadanía Poblana
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D4">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">6. Documento que acredita la
                Ciudadanía
                Poblana</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D4 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D4 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D4.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D4.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D4 && tieneDocumento.D4 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D5. FAR-SNR
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D5">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">7. Formulario de aceptación de
                Registro de
                Candidatura (FAR-SNR)</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D5 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D5 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D5.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D5.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D5 && tieneDocumento.D5 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D6. FAAR-SNR
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D6">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">8. Formulario de Actualización de
                Aceptación
                (FAA-SNR)</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D6 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D6 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D6.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D6.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D6 && tieneDocumento.D6 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D7. *Informe de capacidad económica
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D7">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">9. Informe de capacidad
                económica</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D7 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D7 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D7.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D7.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D7 && tieneDocumento.D7 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            D8. Constancia de la Asistencia al curso
             <div class="d-flex">
              <template>
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.D8">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">D8. Constancia de la Asistencia al curso</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.D8 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.D8 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.D8.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.D8.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.D8 && tieneDocumento.D8 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div> 
            F4. Consentimiento para participar en la Red de Candidatas
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.F4">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">10. Manifestación de Adhesión a la Red
                de
                Candidatas</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F4 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.F4 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.F4.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.F4.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.F4 && tieneDocumento.F4 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>

            <template v-if="idCandidatura == 2">
              D10.
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D10">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Documentación de la que se desprende
                  que los órganos
                  facultados de los
                  partidos políticos o de las coaliciones aprovaron postular candidatura comunes</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D10 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.D10 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.D10.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.D10.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.D10 && tieneDocumento.D10 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              D11. Plataforma Electoral
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D11">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Constancia original que señale el
                  origen
                  partidario de la
                  candidatura</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D11 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.D11 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.D11.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.D11.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.D11 && tieneDocumento.D11 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              F5. La aceptación del partido político postulante para participar en
                 candidatura común
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F5">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">
                  La aceptación del partido político postulante para participar en
                  candidatura común
                </label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F5 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.F5 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.F5.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.F5.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.F5 && tieneDocumento.F5 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <template v-if="(accionesAfir != 7) && (accionesAfir != 8)">
              F6.
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F6">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">
                  Formato sobre acciones afirmativas en favor de grupos sociales en
                  situación de vulnerabilidad (auto adscripción)
                </label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F6 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.F6 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.F6.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.F6.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.F6 && tieneDocumento.F6 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              F7. 
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F7">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">
                  Documento probatorio de la adscripción
                </label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F7 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.F7 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.F7.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.F7.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.F7 && tieneDocumento.F7 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>



            Q8
            <template v-if="eleccion == 1 || eleccion == 2 || eleccion == 3">
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.Q8">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-4 col-form-label d-flex flex-nowrap align-items-center">Fotografía</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q8 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.Q8 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.Q8.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.Q8.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.Q8 && tieneDocumento.Q8 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              Q1
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.Q1">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Manifestación "bajo protesta de
                  decir verdad" que
                  la
                  fotografia corresponden a las persona candidata</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.Q1 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.Q1 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.Q1.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.Q1.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.Q1 && tieneDocumento.Q1 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <template v-if="idCandidatura == 4">
              Q2
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.Q2">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Emblema a colores</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.Q2 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.Q2 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.Q2.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.Q2.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.Q2 && tieneDocumento.Q2 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              Q3
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.Q3">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Plataforma Electoral</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.Q3 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.Q3 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.Q3.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.Q3.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.Q3 && tieneDocumento.Q3 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              Q4
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.Q4">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Bajo protesta de decir
                  verdad</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q4"
                        @change="selectChange('Q4')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneQ4) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneQ4 == 1">
                          Seleccione una opción
                        </template>
                        <vs-option v-for="(item, index) in selectSiNo" :key="index" :label="item.opcion"
                          :value="item.idSelect">
                          {{ item.opcion }}
                        </vs-option>
                      </vs-select>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <template v-if="tieneDocumento.Q4 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleQ4" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveQ4" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic
                          para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG
                        con un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorQ4 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q4 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.Q4 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.Q4.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: var(--acento) !important">
                          {{ documentos.ER[0].name }}
                          {{ documentos.Q4.name }}
                        </span>
                        </div>
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q4 && tieneDocumento.Q4 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>

            <template v-if="reeleccionId >= 2">
              Q5
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.Q5">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Carta para dar cumplimiento al
                  artículo 208, inciso
                  f) del
                  Código</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.Q5 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.Q5 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.Q5.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.Q5.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.Q5 && tieneDocumento.Q5 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">
                        No se cargó un documento
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              D9. *Documento mediante el que se aprueba que los órganos facultados de los P.P 
              aprobaron postular candidaturas comunes
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D9">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">
                  Formato de manifestación de no haber rendido protesta al cargo
                </label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D9 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.D9 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.D9.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.D9.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.D9 && tieneDocumento.D9 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              F8. Manifiesto de no militancia
              <div class="d-flex">
                <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                  <div class="d-flex pr-3 p-0 align-items-center">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F8">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </div>
                </template>
                <label class="col-form-label d-flex flex-nowrap align-items-center">Formato de manifestacion de no
                  militancia</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-md-6">
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.F8 == 0">
                      Documento cargado
                    </h6>
                    <div v-if="documentos.F8 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="hostname + documentos.F8.url" blank>
                        <div class="d-flex flex-start">
                        <span class="material-symbols-rounded" style="color: var(--acento) !important">
                          description
                        </span>
                        <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                          {{ documentos.ER[0].name }}
                          {{ documentos.F8.name }}
                        </span>
                        </div>
                      </vs-button>
                    </div>
                    <div v-if="!documentos.F8 && tieneDocumento.F8 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            D12.
            <div class="d-flex">
              <template> VERIFICAR SI EL DATO HA SIDO SOLVENTADO-
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                    v-model="datosSolventados.documentos.D12">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                Otro
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 && tieneDocumento.D12 == 0">
                    Documento cargado
                  </h6>
                  <div v-if="documentos.D12 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="hostname + documentos.D12.url" blank>
                      <div class="d-flex flex-start">
                      <span class="material-symbols-rounded" style="color: var(--acento) !important">
                        description
                      </span>
                      <span class="col" style="
                            margin-left: 10px;
                            text-overflow: ellipsis;
                            white-space: nowrap !important;
                            overflow: hidden !important;
                            color: var(--acento) !important;
                          ">
                        {{ documentos.ER[0].name }}
                        {{ documentos.D12.name }}
                      </span>
                      </div>
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D12 && tieneDocumento.D12 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: var(--iee-red) !important">No se cargó un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>

            F9I. Postulación indígenas. Bajo protesta de autoadscripción indígena
            <div class="d-flex">
              <template>
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.F9I">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center"
              >F9I. Postulación indígenas. Bajo protesta de autoadscripción
              indígena
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.F9I == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.F9I && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.F9I.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.F9I.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.F9I && tieneDocumento.F9I == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>

            D13. Documento que acredite el vínculo con la comunidad indígena, expedido por una autoridad competente
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.D13">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                D13. Documento que acredite el vínculo con la comunidad indígena,
                expedido por una autoridad competente
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.D13 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.D13 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.D13.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.D13.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.D13 && tieneDocumento.D13 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
            F9D. Postulación personas con discapacidad. Bajo protesta de autoadscripción de personas con discapacidad
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.F9D">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                F9D. Postulación personas con discapacidad. Bajo protesta de
                autoadscripción de personas con discapacidad
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.F9D == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.F9D && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.F9D.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.F9D.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.F9D && tieneDocumento.F9D == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
            D14. Certificado médico/ Credencial del sistema estatal del desarrollo integral de las familias
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.D14">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                D14. Certificado médico/ Credencial del sistema estatal del
                desarrollo integral de las familias
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.D14 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.D14 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.D14.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.D14.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.D14 && tieneDocumento.D14 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
            F9S. Postulación personas de la diversidad sexual. Bajo protesta de autoadscripción de la diverdidad sexual
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.F9S">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                F9S. Postulación personas de la diversidad sexual. Bajo protesta
                de autoadscripción de la diverdidad sexual
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.F9S == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.F9S && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.F9S.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.F9S.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.F9S && tieneDocumento.F9S == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
            F10. Escrito de desistimiento de plantilla
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.F10">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                F10. Escrito de desistimiento de plantilla
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 && tieneDocumento.F10 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.F10 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.F10.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.F10.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.F10 && tieneDocumento.F10 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
            AGREGADOS CULTURALES
            Q6
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.Q6">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">
                Q6. Protesta de decir la verdad
              </label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 || tieneDocumento.Q6 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.Q6 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.Q6.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.Q6.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.Q6 && tieneDocumento.Q6 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
            Q7
            <div class="d-flex">
              <template> 
                <div class="d-flex pr-3 p-0 align-items-center">
                  <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3"  color="rgb(186, 163, 120)"  v-model="datosSolventados.documentos.Q7">
                    <small class="font-weight-bold">Listo</small>
                  </vs-checkbox>
                </div>
              </template>
              <label class="col-form-label d-flex flex-nowrap align-items-center">Q7. Formato de designación para sustitución</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-md-6">
                <div class="px-0 pb-4 pl-sm-0">
                  <h6
                    class="col"
                    v-if="idDocumentacion != 0 || tieneDocumento.Q7 == 0"
                  >
                    Documento cargado
                  </h6>
                  <div
                    v-if="documentos.Q7 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6"
                  >
                    <vs-button
                      class="transparent dark fileDisplay"
                      style="color: #000 !important"
                      :href="hostname + documentos.Q7.url"
                      blank
                    >
                      
                      <span
                        class="material-symbols-rounded"
                        style="color: var(--acento) !important"
                      >
                        description
                      </span>
                      <span
                        class="col"
                        style="
                          margin-left: 10px;
                          text-overflow: ellipsis;
                          white-space: nowrap !important;
                          overflow: hidden !important;
                          color: var(--acento) !important;
                        "
                      >
                        
                        {{ documentos.Q7.name }}
                      </span>
                      
                    </vs-button>
                  </div>
                  <div
                    v-if="!documentos.Q7 && tieneDocumento.Q7 == 0"
                    class="d-flex flex-column mt-3"
                  >
                    <span
                      class="d-flex flex-row ml-3 noCarga"
                      style="color: var(--iee-red) !important"
                      >No se cargó un documento</span
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </template> -->
          <div class="card card-info shadow-lg">
            <vs-table>
              <template #thead>
                <vs-tr>
                  <vs-th>
                    Datos de Registro
                  </vs-th>
                  <vs-th>
                    Datos Registrados
                  </vs-th>
                  <vs-th>
                    Verificado
                  </vs-th>
                  <vs-th>
                    Observaciones
                  </vs-th>
                  <vs-th>
                    Editar Campo
                  </vs-th>
                </vs-tr>
              </template>
              <template #tbody>
                <vs-tr>
                  <vs-td style=" text-align: left !important;">
                    Clave de Elector
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='claveElector' autocomplete="off" color="#C2B280" icon-after
                      placeholder="Clave de Elector" v-model="verclaveElector" @input="getInputClaveElector"
                      maxlength="18" :state="(errorElector.length > 0) ? 'danger' : ''" :disabled="editarclaveElector">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.claveElector">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarclaveElector == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('clave')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('clave')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Puesto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <el-select filterable placeholder="Seleccionar Puesto" v-model="verpuesto" :disabled="editarPuesto">
                      <el-option v-for="(item, index) in catCargosRegistrados" :key="index" :label="item.nombre"
                        :disabled="editarPuesto" :value="item.idPuesto">
                        {{ item.nombre }}
                      </el-option>
                    </el-select>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.puesto">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarPuesto == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('puesto')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('puesto')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Nombre
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='nombre' autocomplete="off" color="#C2B280" icon-after placeholder="Nombre"
                      v-model="vernombre" maxlength="18" :state="(errorElector.length > 0) ? 'danger' : ''"
                      :disabled="editarNombre">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.nombre">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarNombre == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('nombre')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('nombre')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Primer Apellido
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='apellidoP' autocomplete="off" color="#C2B280" icon-after
                      placeholder="Apellido Paterno" v-model="verapellidoP" maxlength="18"
                      :state="(errorElector.length > 0) ? 'danger' : ''" :disabled="editarPrimerApellido">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.app">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarPrimerApellido == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('primerapellido')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('primerapellido')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Segundo Apellido
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='apellidoM' autocomplete="off" color="#C2B280" icon-after
                      placeholder="Segundo Apellido" v-model="verapelliodoM" maxlength="18"
                      :state="(errorElector.length > 0) ? 'danger' : ''" :disabled="editarSegundoApellido">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.apm">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarSegundoApellido == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('segundoapellido')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('segundoapellido')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Género
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-select placeholder="Seleccione un Género" v-model="vergenero" v-if="catgenero.length > 0"
                      :disabled="editarGenero">
                      <!-- <template #message-danger v-if="errorGenero.length > 0">
                        {{ errorGenero }}
                      </template> -->
                      <vs-option :disabled="editarGenero" v-for="(item, index) in catgenero" :key="index"
                        :label="item.Tipo" :value="item.idGenero">
                        {{ item.Tipo }}
                      </vs-option>
                    </vs-select>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.genero">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarGenero == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('genero')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('genero')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Sobrenombre
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='sobrenombre' autocomplete="off" color="#C2B280" icon-after placeholder="SobreNombre"
                      v-model="versobrenombre" maxlength="18" :state="(errorElector.length > 0) ? 'danger' : ''"
                      :disabled="editarSobreNombre">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.sobrenombre">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarSobreNombre == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('sobrenombre')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('sobrenombre')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Lugar de Nacimiento
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <el-select filterable placeholder="Lugar de Nacimiento" v-model="verlugarnacimiento"
                      :disabled="editarLugarNacimiento" v-if="lugar.length > 0">
                      <el-option :disabled="editarLugarNacimiento" v-for="(item, index) in lugar" :key="index"
                        :label="item.NOMBRE" :value="item.idENTIDAD">
                        {{ item.NOMBRE }}

                        <!-- <template #message-danger v-if="errorLugarNacimiento.length > 0">
                          {{ errorLugarNacimiento }}
                        </template> -->
                      </el-option>
                    </el-select>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.lugarNacimiento">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarLugarNacimiento == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('lugarNacimiento')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('lugarNacimiento')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Fecha de Nacimiento
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <el-date-picker type="date" placeholder="Fecha de Nacimiento" format="dd/MM/yyyy"
                      value-format="yyyy-MM-dd" :default-value="fechaValida" :disabled="candidato"
                      :picker-options="pickerOptions" v-model="verfechaNacimiento">
                    </el-date-picker>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.fechaNacimiento">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarFechaNacimiento == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('fechaNacimiento')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('fechaNacimiento')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>
                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Edad
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='edad' autocomplete="off" color="#C2B280" icon-after placeholder="Edad"
                      v-model="veredad" type="tel" :state="(errorElector.length > 0) ? 'danger' : ''"
                      :disabled="editaredad">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.edad">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editaredad == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('edad')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('edad')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    OCR
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-input id='ocr' autocomplete="off" color="#C2B280" icon-after placeholder="OCR" v-model="verocr"
                      maxlength="18" :state="(errorElector.length > 0) ? 'danger' : ''" :disabled="editarOcr">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.ocr">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarOcr == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('ocr')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('ocr')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Acción Afirmativa
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    {{ veraccionafir }} {{ (vertipoaccion != '') ? ' ' + vertipoaccion : '' }}
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.accionAfirmativa">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarAccionesAfirmativa == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('accionesAfirmativas')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('accionesAfirmativas')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Opta por Reelección
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <!-- <vs-input id='reeleccion' autocomplete="off" color="#C2B280" icon-after placeholder="Reelección"
                      v-model="reeleccion" maxlength="18" :state="(errorElector.length > 0) ? 'danger' : ''"
                      :disabled="editarReeleccion">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input> -->

                    <el-select filterable placeholder="Opta por Reelección" v-model="reeleccion"
                      :disabled="editarReeleccion" v-if="arrayReeleccion.length > 0">
                      <el-option v-for="(item, index) in  arrayReeleccion" :key="index" :disabled="reelecciondisable"
                        :label="item.tipo" :v-model="item.idReelecion" :value="item.idReelecion">
                        {{ item.tipo }}
                      </el-option>
                    </el-select>

                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.reeleccion">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarReeleccion == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('reeleccion')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('reeleccion')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Curso para aspirantes
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <!-- <vs-input id='Curso' autocomplete="off" color="#C2B280" icon-after placeholder="Curso"
                      v-model="aspiranteCurso" maxlength="18" :state="(errorElector.length > 0) ? 'danger' : ''"
                      :disabled="editarCurso">
                      <template #message-danger v-if="errorElector.length > 0">
                        {{ errorElector }}
                      </template>
                    </vs-input> -->
                    <vs-select placeholder="Seleccione una opción" v-model="aspiranteCurso" :disabled="editarCurso"
                      v-if="selectCurso.length > 0">
                      <!-- <template #message-danger v-if="errorCurso.length > 0">
                        {{ errorCurso }}
                      </template> -->
                      <vs-option v-for="(item, index) in selectCurso" :key="index" :disabled="editarCurso"
                        :label="item.opcion" :value="item.idSelect">
                        {{ item.opcion }}
                      </vs-option>
                    </vs-select>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.aspiranteCurso">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <template v-if="editarCurso == true">
                      <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('curso')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            edit
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                    <template v-else>
                      <el-tooltip class="item h-100" effect="dark" content="Guardar" placement="top">
                        <vs-button class="btn btn-flat btn-sm " @click.prevent="selectEdit('curso')"
                          style="background-color: var(--iee-white);border-color: var(--iee-white);">
                          <span style="color : var(--text-color) !important;" class="material-symbols-rounded">
                            save
                          </span>
                        </vs-button>
                      </el-tooltip>
                    </template>
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    1. Solicitud de registro
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F1">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    2. Formato 5 en 1
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F1">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    3. Copia simple del acta de
                    nacimiento
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D1">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    4. Copia simple de la credencial para
                    votar
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D2">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    5. Documento probatorio de la
                    residencia
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D3">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    6. Documento que acredita la
                    Ciudadanía
                    Poblana
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D4">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    7. Formulario de aceptación de
                    Registro de
                    Candidatura (FAR-SNR)
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D5">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    8. Formulario de Actualización de
                    Aceptación
                    (FAA-SNR)
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D6">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    9. Informe de capacidad
                    económica
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D7">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    10. Manifestación de Adhesión a la Red
                    de
                    Candidatas
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.F4">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

                <template v-if="idCandidatura == 2">
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Documentación de la que se desprende
                      que los órganos facultados de los
                      partidos políticos o de las coaliciones aprovaron postular candidatura comunes
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.D10">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Constancia original que señale el
                      origen partidario de la candidatura
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.D11">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      La aceptación del partido político postulante para participar en
                      candidatura común
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.F5">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                </template>
                <template v-if="(accionesAfir != 7) && (accionesAfir != 8)">
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Formato sobre acciones afirmativas en favor de grupos sociales en
                      situación de vulnerabilidad (auto adscripción)
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.F6">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>

                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Documento probatorio de la adscripción
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.F7">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                </template>

                <template v-if="eleccion == 1 || eleccion == 2 || eleccion == 3">
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Fotografía
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.Q8">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Manifestación "bajo protesta de
                      decir verdad" que
                      la
                      fotografia corresponden a las persona candidata
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.Q1">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                </template>
                <template v-if="idCandidatura == 4">
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Emblema a colores
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.Q2">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>

                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Plataforma Electoral
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.Q3">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>

                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Bajo protesta de decir
                      verdad
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.Q4">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                </template>

                <template v-if="reeleccionId >= 2">
                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Carta para dar cumplimiento al
                      artículo 208, inciso
                      f) del
                      Código
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.Q5">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>

                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Formato de manifestación de no haber rendido protesta al cargo
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.D9">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>

                  <vs-tr>
                    <vs-td style="text-align: left  !important; ">
                      Formato de manifestacion de no militancia
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                        v-model="datosSolventados.documentos.F8">
                        <small class="font-weight-bold">Listo</small>
                      </vs-checkbox>
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                      texto
                    </vs-td>
                    <vs-td style="text-align: left  !important; ">
                    </vs-td>
                  </vs-tr>
                </template>

                <vs-tr>
                  <vs-td style="text-align: left  !important; ">
                    Otro
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    <vs-checkbox v-if="userLoggedRol == 1 || userLoggedRol == 3" color="rgb(186, 163, 120)"
                      v-model="datosSolventados.documentos.D12">
                      <small class="font-weight-bold">Listo</small>
                    </vs-checkbox>
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                    texto
                  </vs-td>
                  <vs-td style="text-align: left  !important; ">
                  </vs-td>
                </vs-tr>

              </template>
            </vs-table>
          </div>
        </div>

        <template v-if="botones != 1">
          <template v-if="estatus == 1 || estatus == 3">
            <div class="row mx-auto mb-12 p-4">
              <!-- <div class="col-12 px-0 d-flex center">
							<vs-button color="#1a2e35" style="width: 19vw;" dark block @click="generarAcuseRegistro">
								<b style="font-size: medium !important;">
									Acuse de Registro
								</b>
							</vs-button>
						</div> -->

              <div class="col-md-6 d-flex justify-content-end">
                <vs-button color="#a5904a" style="width: 19vw" border @click="observacionesDialog()"
                  :disabled="fechahabil">
                  <b style="font-size: medium !important"> Prevenir </b>
                </vs-button>
              </div>
              <vs-dialog blur prevent-close width="100%" overflow-hidden scroll v-model="active"
                style="height: 100vh !important">
                <template #header>
                  <!-- <h3>Solventación</h3> -->
                </template>
                <div class="row mt-4">
                  <div class="col-6">
                    <div class="row d-flex justify-content-end my-2">
                      <h5 class="col-12 text-left"><strong>Prevención</strong></h5>
                      <span class="col-12 text-left"><strong>Detalles</strong></span>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="row d-flex justify-content-end my-2">
                      <small class="col-12 text-right"><strong>Datos Verificados: {{ totalDatosSolv }} /{{ totalDatos
                          }}</strong></small>
                      <small class="col-12 text-right"><strong>Documentos Verificados: {{ totalDocsSolv }} /{{ totalDocs
                          }}</strong></small>
                    </div>
                  </div>
                </div>
                <div class="con-content">
                  <div class="form">
                    <div class="col-12 mx-auto">
                      <div v-for="observacion in observaciones">
                        <div class="row d-flex justify-content-center" v-if="observacion.dato != ''">
                          <div class="col-3 py-1"><strong>{{ observacion.dato }} : </strong></div>
                          <div class="col-7 py-1">
                            <vs-input class="input-obs" v-model="observacion.detalles"
                              placeholder="Escribir las prevenciones"></vs-input>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <template #footer>
                  <div class="con-footer">
                    <div class="row">
                      <div class="col-md-6 con-footer">
                        <vs-button size="large" @click="active = false" color="#a5904a" border
                          class="col-12 col-md-9 col-xl-10 mt-1 csolventar">
                          Cancelar
                        </vs-button>
                      </div>
                      <div class="col-md-6 con-footer">
                        <vs-button size="large" @click.prevent="getInsertarSolventar"
                          style="background-color:var(--text-color) !important; color: var(--iee-bg-color) !important"
                          class="col-12 col-md-9 col-xl-10 mt-1 cVerificado">
                          Enviar
                        </vs-button>
                      </div>
                    </div>
                  </div>
                </template>
              </vs-dialog>
              <div class="col-md-6">
                <vs-button style="width: 19vw; background-color: var(--text-color)"
                  @click.prevent="getInsertarVerificacion" :disabled="fechahabil">
                  <b style="font-size: medium !important; color:var(--iee-bg-color) !important"> Verificar</b>
                </vs-button>
              </div>
            </div>
          </template>
        </template>
      </div>
    </div>
  </div>
</template>

<script>

let methods = require('../../../methods')

export default {
  props: ["idCan", "idRC"],
  data() {
    return {
      editarclaveElector: true,
      editarPuesto: true,
      editarNombre: true,
      editarPrimerApellido: true,
      editarSegundoApellido: true,
      editarGenero: true,
      editarSobreNombre: true,
      editarLugarNacimiento: true,
      editarFechaNacimiento: true,
      editaredad: true,
      editarOcr: true,
      editarAccionesAfirmativa: true, // pendiente
      editarReeleccion: true,
      editarCurso: true,
      fechahabil: false,
      fechaLimite: 0,
      horasHoy: 0,
      fechaHoy: 0,
      fHoy: 0,
      hostname: window.location.origin + "/",
      notiCamposValidados: true,
      notiCheck: true,
      botones: 0,
      idCandidatura: 0,
      estatus: "",
      active: false,
      solventacion: "",
      error: "",
      errorEleccion: "",
      errorElector: "",
      errorcandidatura: "",
      errorPartido: "",
      errorPprincipal: "",
      errorPasociados: "",
      errorDistrito: "",
      errorMunicipio: "",
      errorCargo: "",
      candidaturaTipo: false,
      fecha: "",
      hora: "",
      verDocumentos: false,
      catDistritos: [],
      catMunicipio: [],
      catCandidatura: [],
      catEleccion: [],
      catPartidos: [],
      catCargo: [],
      catCargosRegistrados: [],
      catpuesto: [],
      catAcciones: [],
      catTipoAcciones: [],
      listPartidos: [],
      distrito: "",
      municipio: "",
      candidatura: "",
      eleccion: "",
      partidos: "",
      reeleccion: "No",
      reeleccionId: 0,
      aspiranteCurso: "",
      cargo: "",
      puesto: "",
      accionesAfir: "",
      tipoAccion: "",
      partidoAsociados: [],
      lema: "",
      disableDistrito: false,
      disableMunicipio: false,
      disableReeleccion: false,
      disablecandidatura: false,
      disableEleccion: false,
      disableParitodo: false,
      disableLema: false,
      disablePartidoAsociado: false,
      disableCargo: false,
      candidato: true,
      reelecciondisable: true,
      disablePuesto: true,
      tituloseleccion: "Partido Político",
      catgenero: [],
      claveElector: "",
      nombre: "",
      apellidoP: "",
      apelliodoM: "",
      genero: "",
      sobrenombre: "",
      fechaNacimiento: "",
      edad: "",
      fechaValida: "",
      ocupacion: "",
      ocr: "",
      lugar: [],
      arrayReeleccion: [],
      lugarNacimiento: "",
      domicilio: "",
      tiempoResidencia: "",
      telefono: "",
      correo: "",
      aspiranteboton: true,
      folio: 0,
      arrayEleccion: [],
      arrayPartidos: [],
      BuscarPartido: "",
      BuscarAsociado: "",
      verclaveElector: "",
      verpuesto: "",
      vernombre: "",
      verapellidoP: "",
      verapelliodoM: "",
      idEleccion: 0,
      vertipoEleccion: '',
      idDistrito: 0,
      verdistrito: '',
      idMunicipio: 0,
      vermunicipio: '',
      versobrenombre: "",
      verfechaNacimiento: "",
      veredad: "",
      verocupacion: "",
      verocr: "",
      verdomicilio: "",
      vertiempoResidencia: "",
      vertelefono: "",
      vercorreo: "",
      vergenero: "",
      verlugarnacimiento: "",
      veraccionafir: "",
      vertipoaccion: "",
      consultaFolio: "",
      idcandidato: "",
      PartidyPartidoAsociado: "",
      // documentos
      idDocumentacion: 0,
      form: new FormData(),
      Teleccion: 0,
      selectCurso: [
				{
					idSelect: 1,
					opcion: 'CURSO CONCLUIDO'
				},
				{
					idSelect: 2,
					opcion: 'CURSO EN PROCESO'
				},
				{
					idSelect: 3,
					opcion: 'SIN CURSO'
				},
			],
      selectSiNo: [
        {
          idSelect: 1,
          opcion: "SÍ",
        },
        {
          idSelect: 2,
          opcion: "NO",
        },
      ],

      tieneDocumento: {
        F1: 0,
        F2: 0,
        F3: 0,
        D1: 0,
        D2: 0,
        D3: 0,
        D4: 0,
        D5: 0,
        D6: 0,
        D7: 0,
        D8: 0,
        F4: 0,
        D9: 0,
        D10: 0,
        D11: 0,
        F5: 0,
        F6: 0,
        F7: 0,
        F8: 0,
        D12: 0,
        F9I: 0,
        D13: 0,
        F9D: 0,
        D14: 0,
        F9S: 0,
        F10: 0,
        Q1: 0,
        Q2: 0,
        Q3: 0,
        Q4: 0,
        Q5: 0,
        Q6: 0,
        Q7: 0,
        Q8: 0,
      },

      documentos: {
        F1: "",
        F2: "",
        F3: "",
        D1: "",
        D2: "",
        D3: "",
        D4: "",
        D5: "",
        D6: "",
        D7: "",
        D8: "",
        F4: "",
        D9: "",
        D10: "",
        D11: "",
        F5: "",
        F6: "",
        F7: "",
        F8: "",
        D12: "",
        F9I: "",
        D13: "",
        F9D: "",
        D14: "",
        F9S: "",
        F10: "",
        Q1: "",
        Q2: "",
        Q3: "",
        Q4: "",
        Q5: "",
        Q6: "",
        Q7: "",
        Q8: "",
      },
      datosSolventados: {
        claveElector: false,
        puesto: false,
        nombre: false,
        app: false,
        apm: false,
        genero: false,
        sobrenombre: false,
        fechaNacimiento: false,
        edad: false,
        ocupacion: false,
        ocr: false,
        lugarNacimiento: false,
        domicilio: false,
        tResidencia: false,
        telefono: false,
        correo: false,
        accionAfirmativa: false,
        tipoAfirmativa: false,
        reeleccion: false,
        aspiranteCurso: false,
        documentos: {
          F1: false, F2: false, F3: false, D1: false, F4: false, F5: false, F6: false, F7: false, F8: false, F10: false,
          D1: false, D2: false, D3: false, D4: false, D5: false, D6: false, D7: false, D8: false, D9: false, D10: false, D11: false, D12: false, D13: false, D14: false,
          F9I: false, F9D: false, F9S: false,
          Q1: false, Q2: false, Q3: false, Q4: false, Q5: false, Q6: false, Q7: false, Q8: false,
        },
      },
      observaciones: [],
      totalDatosSolv: 0,
      totalDatos: 0,
      totalDocsSolv: 0,
      totalDocs: 0,
      showUbicacion: true,
      showTipoEleccion: true,
      userLoggedRol: JSON.parse(sessionStorage.getItem('rolUsuario')),
      pickerOptions: {
        disabledDate(time) {
          var date = new Date();
          date.setFullYear(date.getFullYear() - 18);
          return time.getTime() > date;
        },
      },
    };
  },
  created() {
    this.cargarGenero();
    this.Estados();
    this.accionesAfirmativas();
    this.mostrarBotones();
    this.cargarDistritos();
    this.cargarCandidatura();
    this.cargarEleccion();
    this.cargarMunicipios();
    this.cargarPartidos();
    this.cargarCargos();
    this.cargarPuestos();
    this.fechaDeshabilitar();
  },
  mounted() {
    this.consularCandidaturaCandidato();
    this.subtractYears();
    this.consultarCandidatoID();
    window.scrollTo(0, 0);
  },
  computed: {},
  methods: {
    formatoFecha(fecha) {
      let d = new Date(fecha);
      let Horas = d.getHours();
      let Minutos = d.getMinutes();
      let Segundos = d.getSeconds();
      let day = d.getUTCDate();
      if (day >= 1 && day < 10) {
        day = "0" + day;
      }
      let month = d.getUTCMonth() + 1;
      if (month >= 1 && month < 10) {
        month = "0" + month;
      }
      let year = d.getUTCFullYear();
      let fechaH = year + "-" + month + "-" + day;
      this.horasHoy = Horas + ":" + Minutos + ":" + Segundos;
      this.fechaHoy = fechaH;

    },
    fechaDeshabilitar() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let url = "/administracion/usuario/getObtenerFechaValidado";
      axios.get(url, {
        params: {
          'tipo': 2
        }
      }).then((response) => {
        this.fechaLimite = response.data[0].fechaFin;
        let finicio = response.data[0].fechaInicio;
        ("inicio", finicio);
        this.fHoy = new Date();
        this.formatoFecha(this.fHoy);
        if (this.fechaHoy > this.fechaLimite) {
          this.fechahabil = true;
        } else {
          this.fechahabil = false;

          loading.close();
        }
        loading.close();
      });
    },
    getInputClaveElector() {
      this.claveElector = this.fnToUpperCase(this.claveElector);
    },
    fnToUpperCase(cadena) {
      cadena = cadena.toUpperCase();
      return cadena;
    },
    subtractYears() {
      var date = new Date();
      date.setFullYear(date.getFullYear() - 18);
      this.fechaValida = date;
    },
    cargarDistritos() {
      let url = "/administracion/usuario/cargarDistritos";
      axios
        .get(url)
        .then((response) => {
          this.catDistritos = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarMunicipios() {
      let url = "/administracion/usuario/cargarMunicipios";
      axios
        .get(url)
        .then((response) => {
          this.catMunicipio = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarMunicipiosDistrito() {
      if (this.distrito != "") {
        this.catMunicipio = [];
        let url = "/administracion/usuario/cargarMunicipiosDistrito";
        axios
          .get(url, {
            params: {
              idDistrito: this.distrito,
            },
          })
          .then((response) => {
            this.catMunicipio = response.data;
          })
          .catch(error => {
            let nombreMetodo = url.split('/');
            methods.catchHandler(error, nombreMetodo[3]);
          });
      }
    },
    cargarCandidatura() {
      let url = "/administracion/usuario/cargarCandidatura";
      axios
        .get(url)
        .then((response) => {
          this.catCandidatura = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarEleccion() {
      let url = "/administracion/usuario/cargarEleccion";
      axios
        .get(url)
        .then((response) => {
          this.catEleccion = response.data;
          this.arrayEleccion = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarPartidos() {
      let url = "/administracion/usuario/cargarPartidos";
      axios
        .get(url)
        .then((response) => {
          this.catPartidos = response.data;
          this.listPartidos = response.data;
          this.arrayPartidos = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarCargos() {
      let url = "/administracion/usuario/TodosPuestos";
      axios
        .get(url)
        .then((response) => {
          this.catCargo = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    accionesAfirmativas() {
      let url = "/administracion/usuario/accionesAfirmativas";
      axios
        .get(url)
        .then((response) => {
          this.catAcciones = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    paritdosIndependites(valor) {
      let url = "/administracion/usuario/paritdosIndependites";
      axios
        .get(url, {
          params: {
            tipo: valor,
          },
        })
        .then((response) => {
          this.catPartidos = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarPuestos() {
      let url = "/administracion/usuario/cargarPuestos";
      axios
        .get(url)
        .then((response) => {
          this.catpuesto = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    Estados() {
      let url = "/administracion/usuario/getEstados";
      axios
        .get(url)
        .then((response) => {
          this.lugar = response.data;
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    async consultarCandidatoID() {
      let ayu = 0;
      const loading = this.$vs.loading({
        type: "square",
        color: "#00a19a",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      let url = "/administracion/usuario/getConsultarCandidatoID";
      await axios.get(url, { params: { idCandidato: this.idRC } })
        .then((response) => {
          if (response.data.length > 0) {
            this.estatus = response.data[0].state;
            this.verclaveElector = response.data[0].claveElector;
            this.vernombre = response.data[0].nombre;
            this.verapellidoP = response.data[0].app;
            this.verapelliodoM = response.data[0].apm;

            this.idEleccion = response.data[0].idEleccion;
            this.catEleccion.forEach(eleccion => {
              if (eleccion.idEleccion == this.idEleccion) {
                this.vertipoEleccion = eleccion.Tipo;
              }
            });

            this.idDistrito = response.data[0].idDistrito;
            this.catDistritos.forEach(distrito => {
              if (distrito.idDISTRITO == this.idDistrito) {
                this.verdistrito = distrito.CABECERA;
              }
            });
            this.idMunicipio = response.data[0].idMunicipio;
            this.catMunicipio.forEach(municipio => {
              if (municipio.idMUNICIPIO == this.idMunicipio) {
                this.vermunicipio = municipio.NOMBRE
              }
            });
            this.idCandidatura = response.data[0].idTcandidatura;


            this.genero = response.data[0].idGenero;

            if (response.data[0].idGenero != 4) {
              this.vergenero = response.data[0].idGenero;
            } else {
              this.vergenero = '';
            }

            this.eleccion = response.data[0].idEleccion;
            this.versobrenombre = response.data[0].sobrenombre;
            if (response.data[0].fechaNacimiento != '0000-00-00') {
              this.verfechaNacimiento = response.data[0].fechaNacimiento;
            }
            if (response.data[0].edad != '') {
              this.veredad = response.data[0].edad;
            }
            // this.verocupacion = response.data[0].ocupacion;
            this.verocr = response.data[0].ocr;
            // this.lugarNacimiento = response.data[0].idlugarnacimiento;
            if (response.data[0].idlugarnacimiento != 0) {
              this.verlugarnacimiento = response.data[0].idlugarnacimiento
            } else {
              this.verlugarnacimiento = '';
            }
            // this.verdomicilio = response.data[0].domicilio;
            // this.vertiempoResidencia = response.data[0].tRecidenciaDomicilio;
            // this.vertelefono = response.data[0].telefono;
            // this.vercorreo = response.data[0].correoElectronico;
            this.accionesAfir = response.data[0].idaccioneAfirmativas;
            this.tipoAccion = response.data[0].tipoAccionAfirmativa;


            if (this.accionesAfir != 8) {
              this.getTipoAccionesAfirmativas();
              this.catAcciones.forEach(accion => {
                if (this.accionesAfir == accion.idAccionesAfirmativas) {
                  this.veraccionafir = accion.Nombre;
                }
              });

            }
            if (this.accionesAfir == 7) {
              this.veraccionafir = "NINGUNA";
            } else if (this.accionesAfir == 8) {
              this.veraccionafir = "Sin Acciones Afirmativas";
            }
            this.getReelecion()


            this.reeleccionId = response.data[0].reeleccion;
            if (response.data[0].reeleccion != 0) {
              this.reeleccion = response.data[0].reeleccion
            } else {
              this.reeleccion = ''
            }
            if (response.data[0].curso == 0 || response.data[0].curso == 3) {
              this.aspiranteCurso = response.data[0].curso
            } else if (response.data[0].curso == 1 ||  response.data[0].curso == 2) {
              this.aspiranteCurso = response.data[0].curso
            } else {
              this.aspiranteCurso = ''
            }
            // Agregar consulta puestos hola
            this.consultarPuestoCandidatura(response.data[0].idCandidatura)

            ayu = response.data[0].tAyuntamiento;
            // this.verDocumentos = true;
            if (response.data[0].idpuesto != 0) {
              this.verpuesto = response.data[0].idpuesto;
            } else {
              this.verpuesto = '';
            }
            this.getDatosDocumentacion(loading);
          }
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    getTipoAccionesAfirmativas() {
      this.catTipoAcciones = []
      let url = '/administracion/usuario/getTipoAccionesAfirmativas';
      axios.get(url, {
        params: {
          'tipo': this.accionesAfir
        }
      }).then(response => {
        this.catTipoAcciones = response.data;
        this.catTipoAcciones.forEach(tipoAfir => {
          if (this.tipoAccion == tipoAfir.id) {
            this.vertipoaccion = tipoAfir.descripcion;
          }
        });
      }).catch(error => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },

    cargarPuestosMunicipio() {
      let url = "/administracion/usuario/cargarPuestosMunicipio";
      axios
        .get(url, {
          params: {
            idMunicpio: this.municipio,
          },
        })
        .then((response) => {
          if (response.data.length == 0) {
            this.filerPuestos(0);
          } else {
            this.filerPuestos(response.data[0].noRegidurias);
          }
        })
        .catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    getDatosDocumentacion(loading) {
      let url = "/administracion/usuario/getDatosDocumentacion";
      axios
        .get(url, {
          params: {
            idcdto: this.idRC,
          },
        })
        .then((response) => {
          if (response.data.length > 0) {
            this.idDocumentacion = response.data[0].id;

            if (response.data[0].idF1 != null) {
              this.tieneDocumento.F1 = 1;
              this.documentos.F1 = {
                name: response.data[0].F1Name,
                url: response.data[0].F1Ruta,
              };
            }
            if (response.data[0].idF2 != null) {
              this.tieneDocumento.F2 = 1;
              this.documentos.F2 = {
                name: response.data[0].F2Name,
                url: response.data[0].F2Ruta,
              };
            }
            if (response.data[0].idF3 != null) {
              this.tieneDocumento.F3 = 1;
              this.documentos.F3 = {
                name: response.data[0].F3Name,
                url: response.data[0].F3Ruta,
              };
            }
            if (response.data[0].idD1 != null) {
              this.tieneDocumento.D1 = 1;
              this.documentos.D1 = {
                name: response.data[0].D1Name,
                url: response.data[0].D1Ruta,
              };
            }
            if (response.data[0].idD2 != null) {
              this.tieneDocumento.D2 = 1;
              this.documentos.D2 = {
                name: response.data[0].D2Name,
                url: response.data[0].D2Ruta,
              };
            }
            if (response.data[0].idD3 != null) {
              this.tieneDocumento.D3 = 1;
              this.documentos.D3 = {
                name: response.data[0].D3Name,
                url: response.data[0].D3Ruta,
              };
            }
            if (response.data[0].idD4 != null) {
              this.tieneDocumento.D4 = 1;
              this.documentos.D4 = {
                name: response.data[0].D4Name,
                url: response.data[0].D4Ruta,
              };
            }
            if (response.data[0].idD5 != null) {
              this.tieneDocumento.D5 = 1;
              this.documentos.D5 = {
                name: response.data[0].D5Name,
                url: response.data[0].D5Ruta,
              };
            }
            if (response.data[0].idD6 != null) {
              this.tieneDocumento.D6 = 1;
              this.documentos.D6 = {
                name: response.data[0].D6Name,
                url: response.data[0].D6Ruta,
              };
            }
            if (response.data[0].idD7 != null) {
              this.tieneDocumento.D7 = 1;
              this.documentos.D7 = {
                name: response.data[0].D7Name,
                url: response.data[0].D7Ruta,
              };
            }
            if (response.data[0].idD8 != null) {
              this.tieneDocumento.D8 = 1;
              this.documentos.D8 = {
                name: response.data[0].D8Name,
                url: response.data[0].D8Ruta,
              };
            }
            if (response.data[0].idF4 != null) {
              this.tieneDocumento.F4 = 1;
              this.documentos.F4 = {
                name: response.data[0].F4Name,
                url: response.data[0].F4Ruta,
              };
            }
            if (response.data[0].idD9 != null) {
              this.tieneDocumento.D9 = 1;
              this.documentos.D9 = {
                name: response.data[0].D9Name,
                url: response.data[0].D9Ruta,
              };
            }
            if (response.data[0].idD10 != null) {
              this.tieneDocumento.D10 = 1;
              this.documentos.D10 = {
                name: response.data[0].D10Name,
                url: response.data[0].D10Ruta,
              };
            }
            if (response.data[0].idD11 != null) {
              this.tieneDocumento.D11 = 1;
              this.documentos.D11 = {
                name: response.data[0].D11Name,
                url: response.data[0].D11Ruta,
              };
            }
            if (response.data[0].idF5 != null) {
              this.tieneDocumento.F5 = 1;
              this.documentos.F5 = {
                name: response.data[0].F5Name,
                url: response.data[0].F5Ruta,
              };
            }
            if (response.data[0].idF6 != null) {
              this.tieneDocumento.F6 = 1;
              this.documentos.F6 = {
                name: response.data[0].F6Name,
                url: response.data[0].F6Ruta,
              };
            }
            if (response.data[0].idF7 != null) {
              this.tieneDocumento.F7 = 1;
              this.documentos.F7 = {
                name: response.data[0].F7Name,
                url: response.data[0].F7Ruta,
              };
            }
            if (response.data[0].idF8 != null) {
              this.tieneDocumento.F8 = 1;
              this.documentos.F8 = {
                name: response.data[0].F8Name,
                url: response.data[0].F8Ruta,
              };
            }
            if (response.data[0].idD12 != null) {
              this.tieneDocumento.D12 = 1;
              this.documentos.D12 = {
                name: response.data[0].D12Name,
                url: response.data[0].D12Ruta,
              };
            }
            if (response.data[0].idF9I != null) {
              this.tieneDocumento.F9I = 1;
              this.documentos.F9I = {
                name: response.data[0].F9IName,
                url: response.data[0].F9IRuta,
              };
            }
            if (response.data[0].idD13 != null) {
              this.tieneDocumento.D13 = 1;
              this.documentos.D13 = {
                name: response.data[0].D13Name,
                url: response.data[0].D13Ruta,
              };
            }
            if (response.data[0].idF9D != null) {
              this.tieneDocumento.F9D = 1;
              this.documentos.F9D = {
                name: response.data[0].F9DName,
                url: response.data[0].F9DRuta,
              };
            }
            if (response.data[0].idD14 != null) {
              this.tieneDocumento.D14 = 1;
              this.documentos.D14 = {
                name: response.data[0].D14Name,
                url: response.data[0].D14Ruta,
              };
            }
            if (response.data[0].idF9S != null) {
              this.tieneDocumento.F9S = 1;
              this.documentos.F9S = {
                name: response.data[0].F9SName,
                url: response.data[0].F9SRuta,
              };
            }
            if (response.data[0].idF10 != null) {
              this.tieneDocumento.F10 = 1;
              this.documentos.F10 = {
                name: response.data[0].F10Name,
                url: response.data[0].F10Ruta,
              };
            }
            if (response.data[0].idQ1 != null) {
              this.tieneDocumento.Q1 = 1;
              this.documentos.Q1 = {
                name: response.data[0].Q1Name,
                url: response.data[0].Q1Ruta,
              };
            }
            if (response.data[0].idQ2 != null) {
              this.tieneDocumento.Q2 = 1;
              this.documentos.Q2 = {
                name: response.data[0].Q2Name,
                url: response.data[0].Q2Ruta,
              };
            }
            if (response.data[0].idQ3 != null) {
              this.tieneDocumento.Q3 = 1;
              this.documentos.Q3 = {
                name: response.data[0].Q3Name,
                url: response.data[0].Q3Ruta,
              };
            }
            if (response.data[0].idQ4 != null) {
              this.tieneDocumento.Q4 = 1;
              this.documentos.Q4 = {
                name: response.data[0].Q4Name,
                url: response.data[0].Q4Ruta,
              };
            }
            if (response.data[0].idQ5 != null) {
              this.tieneDocumento.Q5 = 1;
              this.documentos.Q5 = {
                name: response.data[0].Q5Name,
                url: response.data[0].Q5Ruta,
              };
            }
            if (response.data[0].idQ6 != null) {
              this.tieneDocumento.Q6 = 1;
              this.documentos.Q6 = {
                name: response.data[0].Q6Name,
                url: response.data[0].Q6Ruta,
              };
            }
            if (response.data[0].idQ7 != null) {
              this.tieneDocumento.Q7 = 1;
              this.documentos.Q7 = {
                name: response.data[0].Q7Name,
                url: response.data[0].Q7Ruta,
              };
            }
            if (this.eleccion != 4) {
              if (response.data[0].idQ8 != null) {
                this.tieneDocumento.Q8 = 1;
                this.documentos.Q8 = {
                  name: response.data[0].Q8Name,
                  url: response.data[0].Q8Ruta,
                };
              }
            }
          }
          this.consultarSolventacion(loading);
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    async consultarSolventacion(loading) {
      let url = "/administracion/usuario/consultarSolventacion";
      await axios.get(url, {
        params: {
          idcandidato: this.idRC,
        },
      })
        .then((response) => {
          this.totalDatos = 19;

          if (this.accionesAfir != 8) {
            this.totalDatos = this.totalDatos - 1;
          }

          if (response.data != '') {
            this.solventacion = response.data[0].descripcion;
            this.datosSolventados.claveElector = (response.data[0].claveElector == 1) ? true : false;
            this.datosSolventados.puesto = (response.data[0].puesto == 1) ? true : false;
            this.datosSolventados.nombre = (response.data[0].nombre == 1) ? true : false;
            this.datosSolventados.app = (response.data[0].app == 1) ? true : false;
            this.datosSolventados.apm = (response.data[0].apm == 1) ? true : false;
            this.datosSolventados.genero = (response.data[0].genero == 1) ? true : false;
            this.datosSolventados.sobrenombre = (response.data[0].sobrenombre == 1) ? true : false;
            this.datosSolventados.fechaNacimiento = (response.data[0].fechaNacimiento == 1) ? true : false;
            this.datosSolventados.edad = (response.data[0].edad == 1) ? true : false;
            // this.datosSolventados.ocupacion = (response.data[0].ocupacion == 1) ? true : false;
            this.datosSolventados.ocr = (response.data[0].ocr == 1) ? true : false;
            // this.datosSolventados.lugarNacimiento = (response.data[0].lugarNacimiento == 1) ? true : false;
            // this.datosSolventados.domicilio = (response.data[0].domicilio == 1) ? true : false;
            // this.datosSolventados.tResidencia = (response.data[0].tResidencia == 1) ? true : false;
            // this.datosSolventados.telefono = (response.data[0].telefono == 1) ? true : false;
            // this.datosSolventados.correo = (response.data[0].correo == 1) ? true : false;
            this.datosSolventados.accionAfirmativa = (response.data[0].accionAfirmativa == 1) ? true : false;
            this.datosSolventados.reeleccion = (response.data[0].reeleccion == 1) ? true : false;
            this.datosSolventados.aspiranteCurso = (response.data[0].aspiranteCurso == 1) ? true : false;

            if (this.accionesAfir != 8) {
              this.datosSolventados.tipoAfirmativa = (response.data[0].tipoAfirmativa == 1) ? true : false;
            }

            this.contarTotalDatos();
          }
          this.consultarObservaciones(loading);
          // this.consultarSolventacionDocumentos(loading);

          // loading.close(); 
        }).catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    contarTotalDatos() {
      this.totalDatos = 19;

      if (this.datosSolventados.claveElector) { this.totalDatosSolv++ }
      if (this.datosSolventados.puesto) { this.totalDatosSolv++ }
      if (this.datosSolventados.nombre) { this.totalDatosSolv++ }
      if (this.datosSolventados.app) { this.totalDatosSolv++ }
      if (this.datosSolventados.apm) { this.totalDatosSolv++ }
      if (this.datosSolventados.genero) { this.totalDatosSolv++ }
      if (this.datosSolventados.sobrenombre) { this.totalDatosSolv++ }
      if (this.datosSolventados.fechaNacimiento) { this.totalDatosSolv++ }
      if (this.datosSolventados.edad) { this.totalDatosSolv++ }
      // if (this.datosSolventados.ocupacion) { this.totalDatosSolv++ }
      if (this.datosSolventados.ocr) { this.totalDatosSolv++ }
      if (this.datosSolventados.lugarNacimiento) { this.totalDatosSolv++ }
      // if (this.datosSolventados.domicilio) { this.totalDatosSolv++ }
      // if (this.datosSolventados.tResidencia) { this.totalDatosSolv++ }
      // if (this.datosSolventados.telefono) { this.totalDatosSolv++ }
      // if (this.datosSolventados.correo) { this.totalDatosSolv++ }
      if (this.datosSolventados.accionAfirmativa) { this.totalDatosSolv++ }
      if (this.datosSolventados.tipoAfirmativa) { this.totalDatosSolv++ }
      if (this.datosSolventados.reeleccion) { this.totalDatosSolv++ }
      if (this.datosSolventados.aspiranteCurso) { this.totalDatosSolv++ }
    },

    async consultarObservaciones(loading) {
      let url = "/administracion/usuario/consultarObservaciones";
      await axios.get(url, {
        params: {
          idcandidato: this.idRC,
        },
      })
        .then((response) => {

          if (response.data != '') {
            let newObs = '';


            if (!this.datosSolventados.claveElector) {
              this.observaciones.push(newObs = { dato: 'Clave de Elector', detalles: response.data[0].claveElector });
            }
            if (!this.datosSolventados.puesto) {
              this.observaciones.push(newObs = { dato: 'Puesto', detalles: response.data[0].puesto });
            }
            if (!this.datosSolventados.nombre) {
              this.observaciones.push(newObs = { dato: 'Nombre', detalles: response.data[0].nombre });
            }
            if (!this.datosSolventados.app) {
              this.observaciones.push(newObs = { dato: 'Primer Apellido', detalles: response.data[0].app });
            }
            if (!this.datosSolventados.apm) {
              this.observaciones.push(newObs = { dato: 'Segundo Apellido', detalles: response.data[0].apm });
            }
            if (!this.datosSolventados.genero) {
              this.observaciones.push(newObs = { dato: 'Género', detalles: response.data[0].genero });
            }
            if (!this.datosSolventados.sobrenombre) {
              this.observaciones.push(newObs = { dato: 'Sobrenombre', detalles: response.data[0].sobrenombre });
            }
            if (!this.datosSolventados.fechaNacimiento) {
              this.observaciones.push(newObs = { dato: 'Fecha de Nacimiento', detalles: response.data[0].fechaNacimiento });
            }
            if (!this.datosSolventados.edad) {
              this.observaciones.push(newObs = { dato: 'Edad', detalles: response.data[0].edad });
            }
            // if (!this.datosSolventados.ocupacion) {
            //   this.observaciones.push(newObs = { dato: 'Ocupación', detalles: response.data[0].ocupacion });
            // }
            if (!this.datosSolventados.ocr) {
              this.observaciones.push(newObs = { dato: 'OCR', detalles: response.data[0].ocr });
            }
            if (!this.datosSolventados.lugarNacimiento) {
              this.observaciones.push(newObs = { dato: 'Lugar de Nacimiento', detalles: response.data[0].lugarNacimiento });
            }
            // if (!this.datosSolventados.domicilio) {
            //   this.observaciones.push(newObs = { dato: 'Domicilio', detalles: response.data[0].domicilio });
            // }
            // if (!this.datosSolventados.tResidencia) {
            //   this.observaciones.push(newObs = { dato: 'Tiempo de Residencia', detalles: response.data[0].tResidencia });
            // }
            // if (!this.datosSolventados.telefono) {
            //   this.observaciones.push(newObs = { dato: 'Teléfono', detalles: response.data[0].telefono });
            // }
            // if (!this.datosSolventados.correo) {
            //   this.observaciones.push(newObs = { dato: 'Correo', detalles: response.data[0].correo });
            // }
            if (!this.datosSolventados.accionAfirmativa) {
              this.observaciones.push(newObs = { dato: 'Acción Afirmativa', detalles: response.data[0].accionAfirmativa });
            }
            if (!this.datosSolventados.aspiranteCurso) {
              this.observaciones.push(newObs = { dato: 'Curso para Aspirantes', detalles: response.data[0].aspiranteCurso });
            }
            if (this.accionesAfir != 8) {
              // this.observaciones.push ({  dato:'Tipo Afirmativa', detalles: response.data[0].tipoAfirmativa } );
            }

          }

          this.consultarSolventacionDocumentos(loading);

        }).catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    async consultarSolventacionDocumentos(loading) {
      let url = "/administracion/usuario/consultarSolventacionDocumentos";
      await axios.get(url, {
        params: {
          idcandidato: this.idRC,
        },
      })
        .then((response) => {
          this.totalDocs = 11;
          // CANDIDATURAS INDEPENDIENTES
          if (this.idCandidatura == 4) {
            this.totalDocs = this.totalDocs + 3;
          }
          // CANDIDATURAS COMUNES
          // console.log(this.idCandidatura);
          if (this.idCandidatura == 2) {
            this.totalDocs = this.totalDocs + 3;
          }
          // REELECCIONES
          if (this.reeleccionId >= 2) {
            this.totalDocs = this.totalDocs + 3;
          }

          // ACCIONES AFIRMATIVAS
          if ((this.accionesAfir != 7) && (this.accionesAfir != 8)) {
            this.totalDocs = this.totalDocs + 2;
          }
          // FOTOGRAFÍAS
          if (this.eleccion != 4) {
            this.totalDocs = this.totalDocs + 2;
            // console.log(this.totalDocs);
          }

          if (response.data != '') {
            // DOCUMENTOS GENERALES
            this.datosSolventados.documentos.F1 = (response.data[0].F1 == 1) ? true : false;
            this.datosSolventados.documentos.F2 = (response.data[0].F2 == 1) ? true : false;
            this.datosSolventados.documentos.D1 = (response.data[0].D1 == 1) ? true : false;
            this.datosSolventados.documentos.D2 = (response.data[0].D2 == 1) ? true : false;
            this.datosSolventados.documentos.D3 = (response.data[0].D3 == 1) ? true : false;
            this.datosSolventados.documentos.D4 = (response.data[0].D4 == 1) ? true : false;
            this.datosSolventados.documentos.D5 = (response.data[0].D5 == 1) ? true : false;
            this.datosSolventados.documentos.D6 = (response.data[0].D6 == 1) ? true : false;
            this.datosSolventados.documentos.D7 = (response.data[0].D7 == 1) ? true : false;
            this.datosSolventados.documentos.F4 = (response.data[0].F4 == 1) ? true : false;

            // CANDIDATURA COMÚN
            if (this.idCandidatura == 2) {
              this.datosSolventados.documentos.D10 = (response.data[0].D10 == 1) ? true : false;
              this.datosSolventados.documentos.D11 = (response.data[0].D11 == 1) ? true : false;
              this.datosSolventados.documentos.F5 = (response.data[0].F5 == 1) ? true : false;
            }
            // ACCIONES AFIRMATIVAS
            if ((this.accionesAfir != 7) && (this.accionesAfir != 8)) {
              this.datosSolventados.documentos.F6 = (response.data[0].F6 == 1) ? true : false;
              this.datosSolventados.documentos.F7 = (response.data[0].F7 == 1) ? true : false;
            }
            // CANDIDATURAS INDEPENDIENTES
            if (this.idCandidatura == 4) {
              this.datosSolventados.documentos.Q2 = (response.data[0].Q2 == 1) ? true : false;
              this.datosSolventados.documentos.Q3 = (response.data[0].Q3 == 1) ? true : false;
              this.datosSolventados.documentos.Q4 = (response.data[0].Q4 == 1) ? true : false;
            }
            // REELECCION
            if (this.reeleccionId >= 2) {
              this.datosSolventados.documentos.Q5 = (response.data[0].Q5 == 1) ? true : false;
              this.datosSolventados.documentos.D9 = (response.data[0].D9 == 1) ? true : false;
              this.datosSolventados.documentos.F8 = (response.data[0].F8 == 1) ? true : false;
            }
            // FOTOGRAFÍAS
            if (this.eleccion != 4) {
              this.datosSolventados.documentos.Q8 = (response.data[0].Q8 == 1) ? true : false;
              this.datosSolventados.documentos.Q1 = (response.data[0].Q1 == 1) ? true : false;
            }
            // OTROS
            this.datosSolventados.documentos.D12 = (response.data[0].D12 == 1) ? true : false;

            // this.datosSolventados.documentos.F3   = (response.data[0].F3  == 1) ? true : false;
            // this.datosSolventados.documentos.F10  = (response.data[0].F10 == 1) ? true : false;
            // this.datosSolventados.documentos.F9I  = (response.data[0].F9I == 1) ? true : false;
            // this.datosSolventados.documentos.F9D  = (response.data[0].F9D == 1) ? true : false;
            // this.datosSolventados.documentos.F9S  = (response.data[0].F9S == 1) ? true : false;
            // this.datosSolventados.documentos.D8   = (response.data[0].D8  == 1) ? true : false;
            // this.datosSolventados.documentos.D13  = (response.data[0].D13 == 1) ? true : false;
            // this.datosSolventados.documentos.D14  = (response.data[0].D14 == 1) ? true : false;
            // this.datosSolventados.documentos.Q6   = (response.data[0].Q6  == 1) ? true : false;
            // this.datosSolventados.documentos.Q7   = (response.data[0].Q7  == 1) ? true : false;

            this.contarTotalDocs();
          }

          // loading.close(); 
          this.consultarObservacionesDocumentos(loading);
        }).catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    async consultarObservacionesDocumentos(loading) {
      let url = "/administracion/usuario/consultarObservacionesDocumentos";
      await axios.get(url, {
        params: {
          idcandidato: this.idRC,
        },
      })
        .then((response) => {

          let newObs = '';
          let newObsDoc = '';
          if (!this.datosSolventados.documentos.F1) {
            this.observaciones.push(newObsDoc = { dato: '1. Solicitud de registro', detalles: (response.data != '') ? response.data[0].F1 : '' });
          }
          if (!this.datosSolventados.documentos.F2) {
            this.observaciones.push(newObsDoc = { dato: '2. Formato 5 en 1', detalles: (response.data != '') ? response.data[0].F2 : '' });
          }
          if (!this.datosSolventados.documentos.D1) {
            this.observaciones.push(newObsDoc = { dato: '3. Copia simple del acta de nacimiento', detalles: (response.data != '') ? response.data[0].D1 : '' });
          }
          if (!this.datosSolventados.documentos.D2) {
            this.observaciones.push(newObsDoc = { dato: '4. Copia de la credencial para votar', detalles: (response.data != '') ? response.data[0].D2 : '' });
          }
          if (!this.datosSolventados.documentos.D3) {
            this.observaciones.push(newObsDoc = { dato: '5. Documento probatorio de la residencia', detalles: (response.data != '') ? response.data[0].D3 : '' });
          }
          if (!this.datosSolventados.documentos.D4) {
            this.observaciones.push(newObsDoc = { dato: '6. Documento que acredita la Ciudadanía Poblana', detalles: (response.data != '') ? response.data[0].D4 : '' });
          }
          if (!this.datosSolventados.documentos.D5) {
            this.observaciones.push(newObsDoc = { dato: '7. Formulario de aceptación de Registro de Candidatura (FAR-SNR)', detalles: (response.data != '') ? response.data[0].D5 : '' });
          }
          if (!this.datosSolventados.documentos.D6) {
            this.observaciones.push(newObsDoc = { dato: '8. Formulario de Actualización de Aceptación (FAA-SNR)', detalles: (response.data != '') ? response.data[0].D6 : '' });
          }
          if (!this.datosSolventados.documentos.D7) {
            this.observaciones.push(newObsDoc = { dato: '9. Informe de capacidad económica', detalles: (response.data != '') ? response.data[0].D7 : '' });
          }
          if (!this.datosSolventados.documentos.F4) {
            this.observaciones.push(newObsDoc = { dato: '10. Manifestación de Adhesión a la Red de Candidatas', detalles: (response.data != '') ? response.data[0].F4 : '' });
          }

          // CANDIDATURA COMÚN
          if (this.idCandidatura == 2) {
            if (!this.datosSolventados.documentos.D10) {
              this.observaciones.push(newObsDoc = { dato: 'Documentación de la que se desprende que los órganos facultados de los partidos políticos o de las coaliciones aprovaron postular candidatura comunes', detalles: (response.data != '') ? response.data[0].D10 : '' });
            }
            if (!this.datosSolventados.documentos.D11) {
              this.observaciones.push(newObsDoc = { dato: 'Constancia original que señale el origen partidario de la candidatura', detalles: (response.data != '') ? response.data[0].D11 : '' });
            }
            if (!this.datosSolventados.documentos.F5) {
              this.observaciones.push(newObsDoc = { dato: 'La aceptación del partido político postulante para participar en candidatura común', detalles: (response.data != '') ? response.data[0].F5 : '' });
            }
          }

          // ACCIONES AFIRMATIVAS
          if (this.accionesAfir != 7 && this.accionesAfir != 8) {
            if (!this.datosSolventados.documentos.F6) {
              this.observaciones.push(newObsDoc = { dato: 'Formato sobre acciones afirmativas en favor de grupos sociales en situación de vulnerabilidad (auto adscripción)', detalles: (response.data != '') ? response.data[0].F6 : '' });
            }
            if (!this.datosSolventados.documentos.F7) {
              this.observaciones.push(newObsDoc = { dato: 'Documento probatorio de la adscripción', detalles: (response.data != '') ? response.data[0].F7 : '' });
            }
          }

          // CANDIDATURAS INDEPENDIENTES
          if (this.idCandidatura == 4) {
            if (!this.datosSolventados.documentos.Q2) {
              this.observaciones.push(newObsDoc = { dato: 'Emblema a colores', detalles: (response.data != '') ? response.data[0].Q2 : '' });
            }
            if (!this.datosSolventados.documentos.Q3) {
              this.observaciones.push(newObsDoc = { dato: 'Plataforma Electoral', detalles: (response.data != '') ? response.data[0].Q3 : '' });
            }
            if (!this.datosSolventados.documentos.Q4) {
              this.observaciones.push(newObsDoc = { dato: 'Bajo protesta de decir verdad', detalles: (response.data != '') ? response.data[0].Q4 : '' });
            }
          }

          // REELECCION
          if (this.reeleccionId >= 2) {
            if (!this.datosSolventados.documentos.Q5) {
              this.observaciones.push(newObsDoc = { dato: 'Carta para dar cumplimiento al artículo 208, inciso f) del Código', detalles: (response.data != '') ? response.data[0].Q5 : '' });
            }
            if (!this.datosSolventados.documentos.D9) {
              this.observaciones.push(newObsDoc = { dato: 'Formato de manifestación de no haber rendido protesta al cargo', detalles: (response.data != '') ? response.data[0].D9 : '' });
            }
            if (!this.datosSolventados.documentos.F8) {
              this.observaciones.push(newObsDoc = { dato: 'Formato de manifestacion de no militancia', detalles: (response.data != '') ? response.data[0].F8 : '' });
            }
          }

          // FOTOGRAFÍAS
          if (this.eleccion != 4) {
            if (!this.datosSolventados.documentos.Q8) {
              this.observaciones.push(newObsDoc = { dato: 'Fotografía', detalles: (response.data != '') ? response.data[0].Q8 : '' });
            }
            if (!this.datosSolventados.documentos.Q1) {
              this.observaciones.push(newObsDoc = { dato: 'Manifestación "bajo protesta de decir verdad" que la fotografia corresponden a las persona candidata', detalles: (response.data != '') ? response.data[0].Q1 : '' });
            }
          }

          if (!this.datosSolventados.documentos.D12) {
            this.observaciones.push(newObsDoc = { dato: 'Otro', detalles: (response.data != '') ? response.data[0].D12 : '' });
          }

          // if (!this.datosSolventados.documentos.F3) {
          //   this.observaciones.push ( newObsDoc = { dato: 'F3', detalles: response.data[0].F3 } );
          // }
          // if (!this.datosSolventados.documentos.F10) {
          //   this.observaciones.push ( newObsDoc = { dato: 'F10', detalles: response.data[0].F10 } );
          // }
          // if (!this.datosSolventados.documentos.F9I) {
          //   this.observaciones.push ( newObsDoc = { dato: 'F9I', detalles: response.data[0].F9I } );
          // }
          // if (!this.datosSolventados.documentos.F9D) {
          //   this.observaciones.push ( newObsDoc = { dato: 'F9D', detalles: response.data[0].F9D } );
          // }
          // if (!this.datosSolventados.documentos.F9S) {
          //   this.observaciones.push ( newObsDoc = { dato: 'F9S', detalles: response.data[0].F9S } );
          // }
          // if (!this.datosSolventados.documentos.D8) {
          //   this.observaciones.push ( newObsDoc = { dato: 'D8', detalles: response.data[0].D8 } );
          // }
          // if (!this.datosSolventados.documentos.D13) {
          //   this.observaciones.push ( newObsDoc = { dato: 'D13', detalles: response.data[0].D13 } );
          // }
          // if (!this.datosSolventados.documentos.D14) {
          //   this.observaciones.push ( newObsDoc = { dato: 'D14', detalles: response.data[0].D14 } );
          // }
          // if (!this.datosSolventados.documentos.Q6) {
          //   this.observaciones.push ( newObsDoc = { dato: 'Q6', detalles: response.data[0].Q6 } );
          // }
          // if (!this.datosSolventados.documentos.Q7) {
          //   this.observaciones.push ( newObsDoc = { dato: 'Q7', detalles: response.data[0].Q7 } );
          // }
          loading.close();
        }).catch((error) => {
          loading.close();
          console.log(error)
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    observacionesDialog() {
      this.active = !this.active;
      this.totalDatos = 0;
      this.totalDatosSolv = 0;
      this.totalDocs = 0;
      this.totalDocsSolv = 0;
      this.contarTotalDatos();
      this.contarTotalDocs();
      let newObs = '';
      let newObsDoc = '';
      this.observaciones = [];
      const loading = this.$vs.loading({
        type: "square",
        color: "#00a19a",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      let url = "/administracion/usuario/consultarObservaciones";
      axios.get(url, {
        params: {
          idcandidato: this.idRC,
        },
      })
        .then((response) => {
          let newObs = '';
          if (!this.datosSolventados.claveElector) {
            this.observaciones.push(newObs = { dato: 'Clave de Elector', detalles: (response.data != '') ? response.data[0].claveElector : '' });
          }
          if (!this.datosSolventados.puesto) {
            this.observaciones.push(newObs = { dato: 'Puesto', detalles: (response.data != '') ? response.data[0].puesto : '' });
          }
          if (!this.datosSolventados.nombre) {
            this.observaciones.push(newObs = { dato: 'Nombre', detalles: (response.data != '') ? response.data[0].nombre : '' });
          }
          if (!this.datosSolventados.app) {
            this.observaciones.push(newObs = { dato: 'Primer Apellido', detalles: (response.data != '') ? response.data[0].app : '' });
          }
          if (!this.datosSolventados.apm) {
            this.observaciones.push(newObs = { dato: 'Segundo Apellido', detalles: (response.data != '') ? response.data[0].apm : '' });
          }
          if (!this.datosSolventados.genero) {
            this.observaciones.push(newObs = { dato: 'Género', detalles: (response.data != '') ? response.data[0].genero : '' });
          }
          if (!this.datosSolventados.sobrenombre) {
            this.observaciones.push(newObs = { dato: 'Sobrenombre', detalles: (response.data != '') ? response.data[0].sobrenombre : '' });
          }
          if (!this.datosSolventados.fechaNacimiento) {
            this.observaciones.push(newObs = { dato: 'Fecha de Nacimiento', detalles: (response.data != '') ? response.data[0].fechaNacimiento : '' });
          }
          if (!this.datosSolventados.edad) {
            this.observaciones.push(newObs = { dato: 'Edad', detalles: (response.data != '') ? response.data[0].edad : '' });
          }
          // if (!this.datosSolventados.ocupacion) {
          //   this.observaciones.push(newObs = { dato: 'Ocupación', detalles: (response.data != '') ? response.data[0].ocupacion : '' });
          // }
          if (!this.datosSolventados.ocr) {
            this.observaciones.push(newObs = { dato: 'OCR', detalles: (response.data != '') ? response.data[0].ocr : '' });
          }
          // if (!this.datosSolventados.lugarNacimiento) {
          //   this.observaciones.push(newObs = { dato: 'Lugar de Nacimiento', detalles: (response.data != '') ? response.data[0].lugarNacimiento : '' });
          // }
          // if (!this.datosSolventados.domicilio) {
          //   this.observaciones.push(newObs = { dato: 'Domicilio', detalles: (response.data != '') ? response.data[0].domicilio : '' });
          // }
          // if (!this.datosSolventados.tResidencia) {
          //   this.observaciones.push(newObs = { dato: 'Tiempo de Residencia', detalles: (response.data != '') ? response.data[0].tResidencia : '' });
          // }
          // if (!this.datosSolventados.telefono) {
          //   this.observaciones.push(newObs = { dato: 'Teléfono', detalles: (response.data != '') ? response.data[0].telefono : '' });
          // }
          // if (!this.datosSolventados.correo) {
          //   this.observaciones.push(newObs = { dato: 'Correo', detalles: (response.data != '') ? response.data[0].correo : '' });
          // }
          if (!this.datosSolventados.accionAfirmativa) {
            this.observaciones.push(newObs = { dato: 'Acción Afirmativa', detalles: (response.data != '') ? response.data[0].accionAfirmativa : '' });
          }
          if (!this.datosSolventados.reeleccion) {
            this.observaciones.push(newObs = { dato: 'Reelección', detalles: (response.data != '') ? response.data[0].reeleccion : '' });
          }
          if (!this.datosSolventados.aspiranteCurso) {
            this.observaciones.push(newObs = { dato: 'Curso para Aspirantes', detalles: (response.data != '') ? response.data[0].aspiranteCurso : '' });
          }
          if (this.accionesAfir != 8) {
            // this.observaciones.push ({  dato:'Tipo Afirmativa', detalles: (response.data != '') ? response.data[0].tipoAfirmativa : '' } );
          }

          url = "/administracion/usuario/consultarObservacionesDocumentos";
          axios.get(url, {
            params: {
              idcandidato: this.idRC,
            },
          })
            .then((response) => {


              let newObs = '';
              let newObsDoc = '';
              if (!this.datosSolventados.documentos.F1) {
                this.observaciones.push(newObsDoc = { dato: '1. Solicitud de registro', detalles: (response.data != '') ? response.data[0].F1 : '' });
              }
              if (!this.datosSolventados.documentos.F2) {
                this.observaciones.push(newObsDoc = { dato: '2. Formato 5 en 1', detalles: (response.data != '') ? response.data[0].F2 : '' });
              }
              if (!this.datosSolventados.documentos.D1) {
                this.observaciones.push(newObsDoc = { dato: '3. Copia simple del acta de nacimiento', detalles: (response.data != '') ? response.data[0].D1 : '' });
              }
              if (!this.datosSolventados.documentos.D2) {
                this.observaciones.push(newObsDoc = { dato: '4. Copia de la credencial para votar', detalles: (response.data != '') ? response.data[0].D2 : '' });
              }
              if (!this.datosSolventados.documentos.D3) {
                this.observaciones.push(newObsDoc = { dato: '5. Documento probatorio de la residencia', detalles: (response.data != '') ? response.data[0].D3 : '' });
              }
              if (!this.datosSolventados.documentos.D4) {
                this.observaciones.push(newObsDoc = { dato: '6. Documento que acredita la Ciudadanía Poblana', detalles: (response.data != '') ? response.data[0].D4 : '' });
              }
              if (!this.datosSolventados.documentos.D5) {
                this.observaciones.push(newObsDoc = { dato: '7. Formulario de aceptación de Registro de Candidatura (FAR-SNR)', detalles: (response.data != '') ? response.data[0].D5 : '' });
              }
              if (!this.datosSolventados.documentos.D6) {
                this.observaciones.push(newObsDoc = { dato: '8. Formulario de Actualización de Aceptación (FAA-SNR)', detalles: (response.data != '') ? response.data[0].D6 : '' });
              }
              if (!this.datosSolventados.documentos.D7) {
                this.observaciones.push(newObsDoc = { dato: '9. Informe de capacidad económica', detalles: (response.data != '') ? response.data[0].D7 : '' });
              }
              if (!this.datosSolventados.documentos.F4) {
                this.observaciones.push(newObsDoc = { dato: '10. Manifestación de Adhesión a la Red de Candidatas', detalles: (response.data != '') ? response.data[0].F4 : '' });
              }

              // CANDIDATURA COMÚN
              if (this.idCandidatura == 2) {
                if (!this.datosSolventados.documentos.D10) {
                  this.observaciones.push(newObsDoc = { dato: 'Documentación de la que se desprende que los órganos facultados de los partidos políticos o de las coaliciones aprovaron postular candidatura comunes', detalles: (response.data != '') ? response.data[0].D10 : '' });
                }
                if (!this.datosSolventados.documentos.D11) {
                  this.observaciones.push(newObsDoc = { dato: 'Constancia original que señale el origen partidario de la candidatura', detalles: (response.data != '') ? response.data[0].D11 : '' });
                }
                if (!this.datosSolventados.documentos.F5) {
                  this.observaciones.push(newObsDoc = { dato: 'La aceptación del partido político postulante para participar en candidatura común', detalles: (response.data != '') ? response.data[0].F5 : '' });
                }
              }

              // ACCIONES AFIRMATIVAS
              if (this.accionesAfir != 7 && this.accionesAfir != 8) {
                if (!this.datosSolventados.documentos.F6) {
                  this.observaciones.push(newObsDoc = { dato: 'Formato sobre acciones afirmativas en favor de grupos sociales en situación de vulnerabilidad (auto adscripción)', detalles: (response.data != '') ? response.data[0].F6 : '' });
                }
                if (!this.datosSolventados.documentos.F7) {
                  this.observaciones.push(newObsDoc = { dato: 'Documento probatorio de la adscripción', detalles: (response.data != '') ? response.data[0].F7 : '' });
                }
              }

              // CANDIDATURAS INDEPENDIENTES
              if (this.idCandidatura == 4) {
                if (!this.datosSolventados.documentos.Q2) {
                  this.observaciones.push(newObsDoc = { dato: 'Emblema a colores', detalles: (response.data != '') ? response.data[0].Q2 : '' });
                }
                if (!this.datosSolventados.documentos.Q3) {
                  this.observaciones.push(newObsDoc = { dato: 'Plataforma Electoral', detalles: (response.data != '') ? response.data[0].Q3 : '' });
                }
                if (!this.datosSolventados.documentos.Q4) {
                  this.observaciones.push(newObsDoc = { dato: 'Bajo protesta de decir verdad', detalles: (response.data != '') ? response.data[0].Q4 : '' });
                }
              }

              // REELECCION
              if (this.reeleccionId >= 2) {
                if (!this.datosSolventados.documentos.Q5) {
                  this.observaciones.push(newObsDoc = { dato: 'Carta para dar cumplimiento al artículo 208, inciso f) del Código', detalles: (response.data != '') ? response.data[0].Q5 : '' });
                }
                if (!this.datosSolventados.documentos.D9) {
                  this.observaciones.push(newObsDoc = { dato: 'Formato de manifestación de no haber rendido protesta al cargo', detalles: (response.data != '') ? response.data[0].D9 : '' });
                }
                if (!this.datosSolventados.documentos.F8) {
                  this.observaciones.push(newObsDoc = { dato: 'Formato de manifestacion de no militancia', detalles: (response.data != '') ? response.data[0].F8 : '' });
                }
              }

              // FOTOGRAFÍAS
              if (this.eleccion != 4) {
                if (!this.datosSolventados.documentos.Q8) {
                  this.observaciones.push(newObsDoc = { dato: 'Fotografía', detalles: (response.data != '') ? response.data[0].Q8 : '' });
                }
                if (!this.datosSolventados.documentos.Q1) {
                  this.observaciones.push(newObsDoc = { dato: 'Manifestación "bajo protesta de decir verdad" que la fotografia corresponden a las persona candidata', detalles: (response.data != '') ? response.data[0].Q1 : '' });
                }
              }

              if (!this.datosSolventados.documentos.D12) {
                this.observaciones.push(newObsDoc = { dato: 'Otro', detalles: (response.data != '') ? response.data[0].D12 : '' });
              }

              // if (!this.datosSolventados.documentos.F3) {
              //   this.observaciones.push ( newObsDoc = { dato: 'F3', detalles: response.data[0].F3 } );
              // }
              // if (!this.datosSolventados.documentos.F10) {
              //   this.observaciones.push ( newObsDoc = { dato: 'F10', detalles: response.data[0].F10 } );
              // }
              // if (!this.datosSolventados.documentos.F9I) {
              //   this.observaciones.push ( newObsDoc = { dato: 'F9I', detalles: response.data[0].F9I } );
              // }
              // if (!this.datosSolventados.documentos.F9D) {
              //   this.observaciones.push ( newObsDoc = { dato: 'F9D', detalles: response.data[0].F9D } );
              // }
              // if (!this.datosSolventados.documentos.F9S) {
              //   this.observaciones.push ( newObsDoc = { dato: 'F9S', detalles: response.data[0].F9S } );
              // }
              // if (!this.datosSolventados.documentos.D8) {
              //   this.observaciones.push ( newObsDoc = { dato: 'D8', detalles: response.data[0].D8 } );
              // }
              // if (!this.datosSolventados.documentos.D13) {
              //   this.observaciones.push ( newObsDoc = { dato: 'D13', detalles: response.data[0].D13 } );
              // }
              // if (!this.datosSolventados.documentos.D14) {
              //   this.observaciones.push ( newObsDoc = { dato: 'D14', detalles: response.data[0].D14 } );
              // }
              // if (!this.datosSolventados.documentos.Q6) {
              //   this.observaciones.push ( newObsDoc = { dato: 'Q6', detalles: response.data[0].Q6 } );
              // }
              // if (!this.datosSolventados.documentos.Q7) {
              //   this.observaciones.push ( newObsDoc = { dato: 'Q7', detalles: response.data[0].Q7 } );
              // }
              loading.close();
            }).catch((error) => {
              loading.close();
              let nombreMetodo = url.split('/');
              methods.catchHandler(error, nombreMetodo[3]);
            });

        }).catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });


    },

    contarTotalDocs() {
      this.totalDocs = 11;
      if (this.idCandidatura == 4) {
        this.totalDocs = this.totalDocs + 3;
      }

      if (this.idCandidatura == 2) {
        this.totalDocs = this.totalDocs + 3;
      }
      if (this.reeleccionId >= 2) {
        this.totalDocs = this.totalDocs + 3;
      }

      if ((this.accionesAfir != 7) && (this.accionesAfir != 8)) {
        this.totalDocs = this.totalDocs + 2;
      }

      if (this.eleccion != 4) {
        this.totalDocs = this.totalDocs + 2;
      }

      if (this.datosSolventados.documentos.F1) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.F2) { this.totalDocsSolv++ }
      // if(this.datosSolventados.documentos.F3 ) { this.totalDocsSolv++}
      if (this.datosSolventados.documentos.F4) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.F5) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.F6) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.F7) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.F8) { this.totalDocsSolv++ }
      // if(this.datosSolventados.documentos.F10) { this.totalDocsSolv++}
      // if(this.datosSolventados.documentos.F9I) { this.totalDocsSolv++}
      // if(this.datosSolventados.documentos.F9D) { this.totalDocsSolv++}
      // if(this.datosSolventados.documentos.F9S) { this.totalDocsSolv++}
      if (this.datosSolventados.documentos.D1) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D2) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D3) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D4) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D5) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D6) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D7) { this.totalDocsSolv++ }
      // if(this.datosSolventados.documentos.D8 ) { this.totalDocsSolv++}
      if (this.datosSolventados.documentos.D9) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D10) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D11) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.D12) { this.totalDocsSolv++ }
      // if(this.datosSolventados.documentos.D13) { this.totalDocsSolv++}
      // if(this.datosSolventados.documentos.D14) { this.totalDocsSolv++}
      if (this.datosSolventados.documentos.Q1) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.Q2) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.Q3) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.Q4) { this.totalDocsSolv++ }
      if (this.datosSolventados.documentos.Q5) { this.totalDocsSolv++ }
      // if(this.datosSolventados.documentos.Q6 ) { this.totalDocsSolv++}
      // if(this.datosSolventados.documentos.Q7 ) { this.totalDocsSolv++}
      if (this.datosSolventados.documentos.Q8) { this.totalDocsSolv++ }

    },

    consularCandidaturaCandidato() {
      let url = "/administracion/usuario/consularCandidaturaCandidato";

      axios
        .get(url, {
          params: {
            idcandidatura: this.idCan,
          },
        })
        .then((response) => {
          this.Teleccion = response.data[0].idEleccion;
        }).catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    filerPuestos(numero) {
      this.catCargo = [];
      let url = "";
      url = "/administracion/usuario/filerPuestos";
      axios
        .get(url, {
          params: {
            Tcargos: numero,
          },
        })
        .then((response) => {
          this.catCargo = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    filercargos(valor) {
      let url = "/administracion/usuario/filercargos";
      axios
        .get(url, {
          params: {
            tipo: valor,
          },
        })
        .then((response) => {
          this.catCargo = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    generarAcuseRegistro() {
      const loading = this.$vs.loading({
        type: "square",
        color: "#00a19a",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      let config = {
        responseType: "blob",
        params: {
          nIdCandidato: this.idRC,
        },
      };

      let url = "/reportes/registro/getAcuseRegistroCandidatoPDF";
      axios
        .get(url, config)
        .then((response) => {
          let oMyBlob = new Blob([response.data], { type: "application/pdf" });
          let urlpdf = URL.createObjectURL(oMyBlob);
          window.open(urlpdf);
          loading.close();
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getInsertarSolventar() {

      let validador = sessionStorage.getItem("idUsuario");
      this.active = false;
      Swal.fire({
        icon: "warning",
        title: "¿Está seguro que desea guardar estas prevenciones?",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonText: "Cancelar",
        confirmButtonText: "De acuerdo",
        reverseButtons: true,
      }).then((result) => {
        if (result.isConfirmed) {
          const loading = this.$vs.loading({
            type: 'square',
            color: '#00a19a',
            background: '#FFFFFF',
            text: 'Cargando...'
          });
          let url = "/administracion/usuario/getInsertarSolventacion";
          axios.get(url, {
            params: {
              'idCandidato': this.idRC,
              'validador': validador,
              'cDescripcion': this.solventacion,

              'claveElector': (this.datosSolventados.claveElector) ? 1 : 0,
              'puesto': (this.datosSolventados.puesto) ? 1 : 0,
              'nombre': (this.datosSolventados.nombre) ? 1 : 0,
              'app': (this.datosSolventados.app) ? 1 : 0,
              'apm': (this.datosSolventados.apm) ? 1 : 0,
              'genero': (this.datosSolventados.genero) ? 1 : 0,
              'sobrenombre': (this.datosSolventados.sobrenombre) ? 1 : 0,
              'fechaNacimiento': (this.datosSolventados.fechaNacimiento) ? 1 : 0,
              'edad': (this.datosSolventados.edad) ? 1 : 0,
              'ocupacion': (this.datosSolventados.ocupacion) ? 1 : 0,
              'ocr': (this.datosSolventados.ocr) ? 1 : 0,
              'lugarNacimiento': (this.datosSolventados.lugarNacimiento) ? 1 : 0,
              'domicilio': (this.datosSolventados.domicilio) ? 1 : 0,
              'tResidencia': (this.datosSolventados.tResidencia) ? 1 : 0,
              'telefono': (this.datosSolventados.telefono) ? 1 : 0,
              'correo': (this.datosSolventados.correo) ? 1 : 0,
              'accionAfirmativa': (this.datosSolventados.accionAfirmativa) ? 1 : 0,
              'tipoAfirmativa': (this.datosSolventados.tipoAfirmativa) ? 1 : 0,
              'reeleccion': (this.datosSolventados.reeleccion) ? 1 : 0,
              'aspiranteCurso': (this.datosSolventados.aspiranteCurso) ? 1 : 0,
            },
          })
            .then((response) => {
              this.getInsertarObservaciones(loading)
              // this.getInsertarSolventarDocumentos();
            })
            .catch((error) => {
              loading.close();
              let nombreMetodo = url.split('/');
              methods.catchHandler(error, nombreMetodo[3]);
            });
        }
      });
    },

    getInsertarObservaciones(loading) {
      let validador = sessionStorage.getItem("idUsuario");
      let obsClaveElector = '';
      let obsPuesto = '';
      let obsNombre = '';
      let obsApp = '';
      let obsApm = '';
      let obsGenero = '';
      let obsSobrenombre = '';
      let obsFechaNacimiento = '';
      let obsEdad = '';
      let obsOcupacion = '';
      let obsOcr = '';
      let obsLugarNacimiento = '';
      let obsDomicilio = '';
      let obsTResidencia = '';
      let obsTelefono = '';
      let obsCorreo = '';
      let obsAccionAfirmativa = '';
      let obsTipoAfirmativa = '';
      let obsReeleccion = '';
      let obsAspiranteCurso = '';

      this.observaciones.forEach(observacion => {

        switch (observacion.dato) {
          case 'Clave de Elector':
            obsClaveElector = observacion.detalles;
            break;
          case 'Puesto':
            obsPuesto = observacion.detalles;
            break;
          case 'Nombre':
            obsNombre = observacion.detalles;
            break;
          case 'Primer Apellido':
            obsApp = observacion.detalles;
            break;
          case 'Segundo Apellido':
            obsApm = observacion.detalles;
            break;
          case 'Género':
            obsGenero = observacion.detalles;
            break;
          case 'Sobrenombre':
            obsSobrenombre = observacion.detalles;
            break;
          case 'Fecha de Nacimiento':
            obsFechaNacimiento = observacion.detalles;
            break;
          case 'Edad':
            obsEdad = observacion.detalles;
            break;
          case 'Ocupación':
            obsOcupacion = observacion.detalles;
            break;
          case 'OCR':
            obsOcr = observacion.detalles;
            break;
          case 'Lugar de Nacimiento':
            obsLugarNacimiento = observacion.detalles;
            break;
          case 'Domicilio':
            obsDomicilio = observacion.detalles;
            break;
          case 'Tiempo de Residencia':
            obsTResidencia = observacion.detalles;
            break;
          case 'Teléfono':
            obsTelefono = observacion.detalles;
            break;
          case 'Correo':
            obsCorreo = observacion.detalles;
            break;
          case 'Acción Afirmativa':
            obsAccionAfirmativa = observacion.detalles;
            break;
          case 'Tipo Afirmativa':
            obsTipoAfirmativa = observacion.detalles;
            break;
          case 'Reelección':
            obsReeleccion = observacion.detalles;
            break;
          case 'Curso para Aspirantes':
            obsAspiranteCurso = observacion.detalles;
            break;
          default:
            break;
        }
      });
      let url = "/administracion/usuario/getInsertarObservaciones";
      axios.get(url, {
        params: {
          'idCandidato': this.idRC,
          'validador': validador,

          'claveElector': obsClaveElector,
          'puesto': obsPuesto,
          'nombre': obsNombre,
          'app': obsApp,
          'apm': obsApm,
          'genero': obsGenero,
          'sobrenombre': obsSobrenombre,
          'fechaNacimiento': obsFechaNacimiento,
          'edad': obsEdad,
          'ocupacion': obsOcupacion,
          'ocr': obsOcr,
          'lugarNacimiento': obsLugarNacimiento,
          'domicilio': obsDomicilio,
          'tResidencia': obsTResidencia,
          'telefono': obsTelefono,
          'correo': obsCorreo,
          'accionAfirmativa': obsAccionAfirmativa,
          'tipoAfirmativa': obsTipoAfirmativa,
          'reeleccion': obsReeleccion,
          'aspiranteCurso': obsAspiranteCurso,
        },
      })
        .then((response) => {

          this.getInsertarSolventarDocumentos(loading);
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    getInsertarSolventarDocumentos(loading) {
      let validador = sessionStorage.getItem("idUsuario");
      let url = "/administracion/usuario/getInsertarSolventacionDocumentos";
      axios.get(url, {
        params: {
          'idCandidato': this.idRC,
          'validador': validador,

          'F1': (this.datosSolventados.documentos.F1) ? 1 : 0,
          'F2': (this.datosSolventados.documentos.F2) ? 1 : 0,
          'F3': (this.datosSolventados.documentos.F3) ? 1 : 0,
          'F4': (this.datosSolventados.documentos.F4) ? 1 : 0,
          'F5': (this.datosSolventados.documentos.F5) ? 1 : 0,
          'F6': (this.datosSolventados.documentos.F6) ? 1 : 0,
          'F7': (this.datosSolventados.documentos.F7) ? 1 : 0,
          'F8': (this.datosSolventados.documentos.F8) ? 1 : 0,
          'F10': (this.datosSolventados.documentos.F10) ? 1 : 0,
          'F9I': (this.datosSolventados.documentos.F9I) ? 1 : 0,
          'F9D': (this.datosSolventados.documentos.F9D) ? 1 : 0,
          'F9S': (this.datosSolventados.documentos.F9S) ? 1 : 0,
          'D1': (this.datosSolventados.documentos.D1) ? 1 : 0,
          'D2': (this.datosSolventados.documentos.D2) ? 1 : 0,
          'D3': (this.datosSolventados.documentos.D3) ? 1 : 0,
          'D4': (this.datosSolventados.documentos.D4) ? 1 : 0,
          'D5': (this.datosSolventados.documentos.D5) ? 1 : 0,
          'D6': (this.datosSolventados.documentos.D6) ? 1 : 0,
          'D7': (this.datosSolventados.documentos.D7) ? 1 : 0,
          'D8': (this.datosSolventados.documentos.D8) ? 1 : 0,
          'D9': (this.datosSolventados.documentos.D9) ? 1 : 0,
          'D10': (this.datosSolventados.documentos.D10) ? 1 : 0,
          'D11': (this.datosSolventados.documentos.D11) ? 1 : 0,
          'D12': (this.datosSolventados.documentos.D12) ? 1 : 0,
          'D13': (this.datosSolventados.documentos.D13) ? 1 : 0,
          'D14': (this.datosSolventados.documentos.D14) ? 1 : 0,
          'Q1': (this.datosSolventados.documentos.Q1) ? 1 : 0,
          'Q2': (this.datosSolventados.documentos.Q2) ? 1 : 0,
          'Q3': (this.datosSolventados.documentos.Q3) ? 1 : 0,
          'Q4': (this.datosSolventados.documentos.Q4) ? 1 : 0,
          'Q5': (this.datosSolventados.documentos.Q5) ? 1 : 0,
          'Q6': (this.datosSolventados.documentos.Q6) ? 1 : 0,
          'Q7': (this.datosSolventados.documentos.Q7) ? 1 : 0,
          'Q8': (this.datosSolventados.documentos.Q8) ? 1 : 0,
        },
      })
        .then((response) => {
          this.getInsertarObservacionesDocumentos(loading);
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });

    },

    getInsertarObservacionesDocumentos(loading) {
      let validador = sessionStorage.getItem("idUsuario");
      let obsF1 = '';
      let obsF2 = '';
      let obsF3 = '';
      let obsF4 = '';
      let obsF5 = '';
      let obsF6 = '';
      let obsF7 = '';
      let obsF8 = '';
      let obsF10 = '';
      let obsF9I = '';
      let obsF9D = '';
      let obsF9S = '';
      let obsD1 = '';
      let obsD2 = '';
      let obsD3 = '';
      let obsD4 = '';
      let obsD5 = '';
      let obsD6 = '';
      let obsD7 = '';
      let obsD8 = '';
      let obsD9 = '';
      let obsD10 = '';
      let obsD11 = '';
      let obsD12 = '';
      let obsD13 = '';
      let obsD14 = '';
      let obsQ1 = '';
      let obsQ2 = '';
      let obsQ3 = '';
      let obsQ4 = '';
      let obsQ5 = '';
      let obsQ6 = '';
      let obsQ7 = '';
      let obsQ8 = '';

      this.observaciones.forEach(observacion => {
        switch (observacion.dato) {
          case '1. Solicitud de registro':
            obsF1 = observacion.detalles;
            break;
          case '2. Formato 5 en 1':
            obsF2 = observacion.detalles;
            break;
          case 'F3':
            obsF3 = observacion.detalles;
            break;
          case '10. Manifestación de Adhesión a la Red de Candidatas':
            obsF4 = observacion.detalles;
            break;
          case 'La aceptación del partido político postulante para participar en candidatura común':
            obsF5 = observacion.detalles;
            break;
          case 'Formato sobre acciones afirmativas en favor de grupos sociales en situación de vulnerabilidad (auto adscripción)':
            obsF6 = observacion.detalles;
            break;
          case 'Documento probatorio de la adscripción':
            obsF7 = observacion.detalles;
            break;
          case 'Formato de manifestacion de no militancia':
            obsF8 = observacion.detalles;
            break;
          case 'F10':
            obsF10 = observacion.detalles;
            break;
          case 'F9I':
            obsF9I = observacion.detalles;
            break;
          case 'F9D':
            obsF9D = observacion.detalles;
            break;
          case 'F9S':
            obsF9S = observacion.detalles;
            break;
          case '3. Copia simple del acta de nacimiento':
            obsD1 = observacion.detalles;
            break;
          case '4. Copia de la credencial para votar':
            obsD2 = observacion.detalles;
            break;
          case '5. Documento probatorio de la residencia':
            obsD3 = observacion.detalles;
            break;
          case '6. Documento que acredita la Ciudadanía Poblana':
            obsD4 = observacion.detalles;
            break;
          case '7. Formulario de aceptación de Registro de Candidatura (FAR-SNR)':
            obsD5 = observacion.detalles;
            break;
          case '8. Formulario de Actualización de Aceptación (FAA-SNR)':
            obsD6 = observacion.detalles;
            break;
          case '9. Informe de capacidad económica':
            obsD7 = observacion.detalles;
            break;
          case 'D8':
            obsD8 = observacion.detalles;
            break;
          case 'Formato de manifestación de no haber rendido protesta al cargo':
            obsD9 = observacion.detalles;
            break;
          case 'Documentación de la que se desprende que los órganos facultados de los partidos políticos o de las coaliciones aprovaron postular candidatura comunes':
            obsD10 = observacion.detalles;
            break;
          case 'Constancia original que señale el origen partidario de la candidatura':
            obsD11 = observacion.detalles;
            break;
          case 'Otro':
            obsD12 = observacion.detalles;
            break;
          case 'D13':
            obsD13 = observacion.detalles;
            break;
          case 'D14':
            obsD14 = observacion.detalles;
            break;
          case 'Manifestación "bajo protesta de decir verdad" que la fotografia corresponden a las persona candidata':
            obsQ1 = observacion.detalles;
            break;
          case 'Emblema a colores':
            obsQ2 = observacion.detalles;
            break;
          case 'Plataforma Electoral':
            obsQ3 = observacion.detalles;
            break;
          case 'Bajo protesta de decir verdad':
            obsQ4 = observacion.detalles;
            break;
          case 'Carta para dar cumplimiento al artículo 208, inciso f) del Código':
            obsQ5 = observacion.detalles;
            break;
          case 'Q6':
            obsQ6 = observacion.detalles;
            break;
          case 'Q7':
            obsQ7 = observacion.detalles;
            break;
          case 'Fotografía':
            obsQ8 = observacion.detalles;
            break;

          default:
            break;
        }
      });

      let url = "/administracion/usuario/getInsertarObservacionesDocumentos";
      axios.get(url, {
        params: {
          'idCandidato': this.idRC,
          'validador': validador,

          'F1': obsF1,
          'F2': obsF2,
          'F3': obsF3,
          'F4': obsF4,
          'F5': obsF5,
          'F6': obsF6,
          'F7': obsF7,
          'F8': obsF8,
          'F10': obsF10,
          'F9I': obsF9I,
          'F9D': obsF9D,
          'F9S': obsF9S,
          'D1': obsD1,
          'D2': obsD2,
          'D3': obsD3,
          'D4': obsD4,
          'D5': obsD5,
          'D6': obsD6,
          'D7': obsD7,
          'D8': obsD8,
          'D9': obsD9,
          'D10': obsD10,
          'D11': obsD11,
          'D12': obsD12,
          'D13': obsD13,
          'D14': obsD14,
          'Q1': obsQ1,
          'Q2': obsQ2,
          'Q3': obsQ3,
          'Q4': obsQ4,
          'Q5': obsQ5,
          'Q6': obsQ6,
          'Q7': obsQ7,
          'Q8': obsQ8,
        },
      })
        .then((response) => {
          loading.close();
          this.getInsertarEstadoCandidato(idUsuarioRegistro, this.idRC, "Prevenciones", "Ver", 3);
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getInsertarEstadoCandidato(usuario, candidato, accion, estado, idEstado) {
      let url = "/administracion/usuario/getInsertarEstadoCandidato";
      axios
        .get(url, {
          params: {
            candidato: candidato,
            persona: usuario,
            modulo: estado,
            accion: accion
          },
        })
        .then((response) => {
          this.getCambiarEstadoCandidato(idEstado)
        }).catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getCambiarEstadoCandidato(idEstado) {
      let url = '/administracion/usuario/getCambiarEstadoCandidato'
      axios.get(url, {
        params: {
          id: this.id,
          estado: idEstado
        }
      }).then((response) => {
      }).catch((error) => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
    getInsertarVerificacion() {
      this.totalDatos = 0;
      this.totalDatosSolv = 0;
      this.totalDocs = 0;
      this.totalDocsSolv = 0;
      this.contarTotalDatos();
      this.contarTotalDocs();
      if (this.totalDatos == this.totalDatosSolv && this.totalDocs == this.totalDocsSolv) {
        let validador = sessionStorage.getItem("idUsuario");
        Swal.fire({
          title: "¿Desea verificar el registro?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Sí, verificar",
          cancelButtonText: "Cancelar",
          reverseButtons: true,
        }).then((result) => {
          if (result.value) {
            let url = "/administracion/usuario/getInsertarSolventacion";
            axios.get(url, {
              params: {
                'idCandidato': this.idRC,
                'validador': validador,
                'cDescripcion': this.solventacion,

                'claveElector': (this.datosSolventados.claveElector) ? 1 : 0,
                'puesto': (this.datosSolventados.puesto) ? 1 : 0,
                'nombre': (this.datosSolventados.nombre) ? 1 : 0,
                'app': (this.datosSolventados.app) ? 1 : 0,
                'apm': (this.datosSolventados.apm) ? 1 : 0,
                'genero': (this.datosSolventados.genero) ? 1 : 0,
                'sobrenombre': (this.datosSolventados.sobrenombre) ? 1 : 0,
                'fechaNacimiento': (this.datosSolventados.fechaNacimiento) ? 1 : 0,
                'edad': (this.datosSolventados.edad) ? 1 : 0,
                'ocr': (this.datosSolventados.ocr) ? 1 : 0,
                'lugarNacimiento': (this.datosSolventados.lugarNacimiento) ? 1 : 0,
                'accionAfirmativa': (this.datosSolventados.accionAfirmativa) ? 1 : 0,
                'tipoAfirmativa': (this.datosSolventados.tipoAfirmativa) ? 1 : 0,
                'reeleccion': (this.datosSolventados.reeleccion) ? 1 : 0,
                'aspiranteCurso': (this.datosSolventados.aspiranteCurso) ? 1 : 0,
                // 'tResidencia': (this.datosSolventados.tResidencia) ? 1 : 0,
                // 'domicilio': (this.datosSolventados.domicilio) ? 1 : 0,
                // 'correo': (this.datosSolventados.correo) ? 1 : 0,
                // 'telefono': (this.datosSolventados.telefono) ? 1 : 0,
                // 'ocupacion': (this.datosSolventados.ocupacion) ? 1 : 0,
              },
            })
              .then((response) => {
                let validador = sessionStorage.getItem("idUsuario");
                let url = "/administracion/usuario/getInsertarSolventacionDocumentos";
                axios.get(url, {
                  params: {
                    'idCandidato': this.idRC,
                    'validador': validador,

                    'F1': (this.datosSolventados.documentos.F1) ? 1 : 0,
                    'F2': (this.datosSolventados.documentos.F2) ? 1 : 0,
                    'F3': (this.datosSolventados.documentos.F3) ? 1 : 0,
                    'F4': (this.datosSolventados.documentos.F4) ? 1 : 0,
                    'F5': (this.datosSolventados.documentos.F5) ? 1 : 0,
                    'F6': (this.datosSolventados.documentos.F6) ? 1 : 0,
                    'F7': (this.datosSolventados.documentos.F7) ? 1 : 0,
                    'F8': (this.datosSolventados.documentos.F8) ? 1 : 0,
                    'F10': (this.datosSolventados.documentos.F10) ? 1 : 0,
                    'F9I': (this.datosSolventados.documentos.F9I) ? 1 : 0,
                    'F9D': (this.datosSolventados.documentos.F9D) ? 1 : 0,
                    'F9S': (this.datosSolventados.documentos.F9S) ? 1 : 0,
                    'D1': (this.datosSolventados.documentos.D1) ? 1 : 0,
                    'D2': (this.datosSolventados.documentos.D2) ? 1 : 0,
                    'D3': (this.datosSolventados.documentos.D3) ? 1 : 0,
                    'D4': (this.datosSolventados.documentos.D4) ? 1 : 0,
                    'D5': (this.datosSolventados.documentos.D5) ? 1 : 0,
                    'D6': (this.datosSolventados.documentos.D6) ? 1 : 0,
                    'D7': (this.datosSolventados.documentos.D7) ? 1 : 0,
                    'D8': (this.datosSolventados.documentos.D8) ? 1 : 0,
                    'D9': (this.datosSolventados.documentos.D9) ? 1 : 0,
                    'D10': (this.datosSolventados.documentos.D10) ? 1 : 0,
                    'D11': (this.datosSolventados.documentos.D11) ? 1 : 0,
                    'D12': (this.datosSolventados.documentos.D12) ? 1 : 0,
                    'D13': (this.datosSolventados.documentos.D13) ? 1 : 0,
                    'D14': (this.datosSolventados.documentos.D14) ? 1 : 0,
                    'Q1': (this.datosSolventados.documentos.Q1) ? 1 : 0,
                    'Q2': (this.datosSolventados.documentos.Q2) ? 1 : 0,
                    'Q3': (this.datosSolventados.documentos.Q3) ? 1 : 0,
                    'Q4': (this.datosSolventados.documentos.Q4) ? 1 : 0,
                    'Q5': (this.datosSolventados.documentos.Q5) ? 1 : 0,
                    'Q6': (this.datosSolventados.documentos.Q6) ? 1 : 0,
                    'Q7': (this.datosSolventados.documentos.Q7) ? 1 : 0,
                    'Q8': (this.datosSolventados.documentos.Q8) ? 1 : 0,
                  },
                })
                  .then((response) => {
                    this.getInsertarEstadoCandidato(idUsuarioRegistro, this.idRC, "Registro Completo", "Ver", 2);
                  })
                  .catch((error) => {
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);
                  });
              })
              .catch((error) => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
              });
            // this.getInsertarEstadoCandidato(
            //   validador,
            //   this.idRC,
            //   "Ver",
            //   7,
            //   "su verificación"
            // );
          }
        });
      }
      else {

        Swal.fire({
          title: "Verificación Incompleta",
          html: ` <small><strong>Datos Verificados: ${this.totalDatosSolv} / ${this.totalDatos}</strong></small><br>
                  <small><strong>Documentos Verificados: ${this.totalDocsSolv} / ${this.totalDocs}</strong></small><br>
                  <small class="d-none">Todos los datos y documentos deben tener marcada la casilla de verificado</small>`
          ,
          icon: "warning",
          // showCancelButton: true,
          confirmButtonColor: "#3085d6",
          // cancelButtonColor: "#d33",
          confirmButtonText: "De acuerdo",
          // cancelButtonText: "Cancelar",
          reverseButtons: true,
        }).then((result) => { });
      }

    },
    getCambiarEstadoCandidato() {
      let url = '/administracion/usuario/getCambiarEstadoCandidato'
      axios.get(url, {
        params: {
          id: this.id,
          estado: 2
        }
      }).then((response) => {
        console.log(response.data);
      }).catch((error) => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
    mostrarBotones() {
      let permiso = sessionStorage.getItem("rolUsuario");

      if (permiso == 2 || permiso == 4) {
        this.botones = 1;
      } else {
        this.botones = 0;
      }
    },
    regresar() {
      window.history.back();
    },
    selectEdit(tipo) {
      console.log(tipo);

      switch (tipo) {
        case 'clave':
          this.editarclaveElector = !this.editarclaveElector
          break;
        case 'puesto':
          this.editarPuesto = !this.editarPuesto
          break;
        case 'nombre':
          this.editarNombre = !this.editarNombre
          break;
        case 'primerapellido':
          this.editarPrimerApellido = !this.editarPrimerApellido
          break;
        case 'segundoapellido':
          this.editarSegundoApellido = !this.editarSegundoApellido
          break;
        case 'genero':
          this.editarGenero = !this.editarGenero
          break;
        case 'genero':
          this.editarGenero = !this.editarGenero
          break;
        case 'sobrenombre':
          this.editarSobreNombre = !this.editarSobreNombre
          break;
        case 'lugarNacimiento':
          this.editarLugarNacimiento = !this.editarLugarNacimiento
          break;
        case 'fechaNacimiento':
          this.editarFechaNacimiento = !this.editarFechaNacimiento
          break;
        case 'edad':
          this.editaredad = !this.editaredad
          break;
        case 'ocr':
          this.editarOcr = !this.editarOcr
          break;
        case 'accionesAfirmativas': //pendiente
          this.editarAccionesAfirmativa = !this.editarAccionesAfirmativa
          break;
        case 'reeleccion':
          this.editarReeleccion = !this.editarReeleccion
          break;
        case 'curso':
          this.editarCurso = !this.editarCurso
          break;
        default:
          break;
      }
    },
    getInputClaveElector() {

      this.verclaveElector = this.fnToUpperCase(this.verclaveElector);
      if (!(/[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}/g.test(this.verclaveElector))) {
        this.errorElector = 'Ingrese una Clave de Elector Válida';
      }
      if (this.verclaveElector.length == 18) {
        this.errorElector = ''
        this.consultarCandidatoClaveElector();
      }
    },
    consultarCandidatoClaveElector() {
      this.errorRepetidaClaveElector = '0'
      let url = '/administracion/usuario/consultarCandidatoClaveElector'
      axios.get(url, {
        params: {
          'clave': this.verclaveElector
        }
      }).then(response => {
        if (response.data.length > 0) {
          Swal.fire({
            icon: 'warning',
            title: 'El Candidato Se Encuentra Registrado',
            showConfirmButton: true,
            confirmButtonText: 'De acuerdo'
          })
        }
      }).catch(error => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
    consultarPuestoCandidatura(id) {
      let url = '/administracion/usuario/consultarPuestoCandidatura'
      axios.get(url, {
        params: {
          'idCandidatura': id
        }
      }).then(response => {
        this.catCargosRegistrados = response.data
      }).catch(error => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
    cargarGenero() {
      let url = '/administracion/usuario/cargarGenero';
      axios.get(url).then(response => {
        this.catgenero = response.data
      }).catch(error => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },
    getReelecion() {
      let tRee = 0
      if (this.idEleccion == 3) {
        tRee = 4
      } else if (this.idEleccion == 4) {
        tRee = 2
      } else {
        tRee = 3
      }
      this.arrayReeleccion = []
      let url = '/administracion/usuario/getReelecion';
      axios.get(url, {
        params: {
          'tipo': tRee
        }
      }).then(response => {
        this.arrayReeleccion = response.data;
      }).catch(error => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
  },
};
</script>

<style>
.position-reverse {
  flex-direction: row-reverse !important;
}

.img-max-height {
  max-height: 100px !important;
}

.vs-checkbox-mask {
  width: 90% !important;
  height: 90% !important;
}

.checkNotification div div {
  margin-top: .5rem !important;
  /* margin-left: .25rem !important;
  margin-right: .25rem !important; */
}

.vs-input {
  /* background: var(--iee-light-gray) !important; */
  background-color: var(--iee-light-gray) !important;
  color: var(--text-color) !important;
}

.tableObservaciones {
  border-collapse: collapse;
  width: 100%;

}

.vs-checkbox-mask::before {
  border: 1px solid var(--text-color) !important;
  /* border: 1px solid var(--iee-dorado-cafe) !important; */
}

.vs-checkbox-mask:hover {
  border: 1px solid var(--iee-dorado-cafe) !important;
}

.cardUbicacion {
  position: fixed !important;
  z-index: 1000 !important;
  background-color: var(--iee-white) !important;
  /* padding: 1rem 1.5rem; */
  border-radius: 15px !important;
  top: 250px !important;
  bottom: 10px !important;
  right: 10px !important;
  width: 320px !important;
  /* min-height: 10% !important; */
  height: 120px !important;
  /* max-height: 50% !important; */
  overflow-y: scroll !important;
  overflow-x: hidden !important;
  box-shadow: var(--iee-shadow) !important;
}

.cardTipoEleccion {
  position: fixed !important;
  z-index: 1000 !important;
  background-color: var(--iee-white) !important;
  /* padding: 1rem 1.5rem; */
  border-radius: 15px !important;
  top: 250px !important;
  bottom: 10px !important;
  left: 280px !important;
  width: 320px !important;
  /* min-height: 10% !important; */
  height: 120px !important;
  /* max-height: 50% !important; */
  overflow-y: scroll !important;
  overflow-x: hidden !important;
  box-shadow: var(--iee-shadow) !important;
}

.vs-button--size-mini .vs-button__content {
  padding: 3px !important;
}
</style>