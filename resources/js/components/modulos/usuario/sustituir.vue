<template>
  <div class="col">
    <div class="row mb-3 float-sm-right mr-5 ml-3 ml-sm-0">
      <ul class="breadcrumb">
        <li>
          <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
        </li>
        <li class="breadActive">
          <span>Sustitución de Candidatura</span>
        </li>
      </ul>
    </div>
    <div class="row col-md-11 col-10 mx-auto card card-info px-0" style="
        border-radius: 1.25rem !important;
        margin-bottom: 2.7rem;
        box-shadow: var(--iee-shadow) !important;
      ">
      <div class="card-header d-flex align-items-center container-fluid">
        <h3 class="col card-title font-weight-bold">
          Carga y Captura de Documentos para la Sustitución de Candidatura
        </h3>
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
      <!-- <div class="card-header">
        <h3>
          Carga y Captura de Documentos para la Sustitución de Candidatura
        </h3>
        <div class="card-tools">
          <vs-button @click.prevent="regresar"
            style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
            <b>
              <span class="material-symbols-rounded v-align-icon-bc">
                arrow_back
              </span>
              Regresar
            </b>
          </vs-button>
        </div>
      </div> -->
      <div class="card-body p-4 container-fluid" style="background-color: var(--iee-white)">
        <div class="row mx-12 mb-12 p-4">
          <div class="col-sm-4 col-md-4 col-xl-4 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Persona a Sustituir: </label>
            <h5>{{ nombresustituir }}</h5>
          </div>
          <div class="col-sm-4 col-md-4 col-xl-4 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Motivo de la Sustitución: </label>
            <vs-select placeholder="Acción Afirmativa" v-model="motivoSustitucion" v-if="catSustituciones.length > 0" :state="errorMotivoSustitucion.length > 0 ? 'danger' : ''">
              <template #message-danger v-if="errorMotivoSustitucion.length > 0">
                  {{ errorMotivoSustitucion }}
                </template>
              <vs-option :disabled="candidato" v-for="(item, index) in catSustituciones" :key="index" :label="item.tipo"
                :value="item.idEstatus">
                {{ item.tipo }}
              </vs-option>
            </vs-select>
          </div>
          <div class="col-sm-4 col-md-4 col-xl-4 px-0 pr-sm-5 pb-3">

          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Clave de Elector *</label>
            <vs-input id="claveElector" autocomplete="off" color="#C2B280" icon-after placeholder="Clave de Elector"
              v-model="claveElector" :disabled="candidato" @input="getInputClaveElector" maxlength="18"
              :state="errorElector.length > 0 ? 'danger' : ''">
              <template #message-danger v-if="errorElector.length > 0">
                {{ errorElector }}
              </template>
            </vs-input>
            <vs-button icon color="#a5904a" size="large" :disabled="candidato" @click="verificarTiempoApi">
              <span class="material-symbols-rounded" style="color: #fff !important; font-size: 20px !important; ">
                search
              </span>
              Consultar en el SNR - INE
            </vs-button>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Nombre (s) *</label>
            <vs-input id="nombre" color="#C2B280" icon-after placeholder="Nombre" v-model="nombre" :disabled="candidato"
              @input="getInputNombre" :state="errorNombre.length > 0 ? 'danger' : ''">
              <template #message-danger v-if="errorNombre.length > 0">
                {{ errorNombre }}
              </template>
            </vs-input>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Primer Apellido *</label>
            <vs-input id="appa" color="#C2B280" icon-after placeholder="Primer Apellido" v-model="apellidoP"
              :disabled="candidato" @input="getInputApellidoPa">
              <template #message-danger v-if="errorApellidoPaterno.length > 0">
                {{ errorApellidoPaterno }}
              </template>
            </vs-input>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Segundo Apellido</label>
            <vs-input id="apm" color="#C2B280" icon-after placeholder="Segundo Apellido" v-model="apelliodoM"
              :disabled="candidato" @input="getInputApellidoMa">
              <template #message-danger v-if="errorApellidoMaterno.length > 0">
                {{ errorApellidoMaterno }}
              </template>
            </vs-input>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Género *</label>
            <vs-select placeholder="Selecionar un Género" v-model="genero" v-if="catgenero.length > 0"
              :disabled="candidato">
              <vs-option :disabled="candidato" v-for="(item, index) in catgenero" :key="index" :label="item.Tipo"
                :value="item.idGenero">
                {{ item.Tipo }}
                <template #message-danger v-if="genero.length > 0">
                  {{ genero }}
                </template>
              </vs-option>
            </vs-select>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Sobrenombre</label>
            <vs-input id="sobrenombre" color="#C2B280" icon-after placeholder="Sobrenombre" v-model="sobrenombre"
              :disabled="candidato" @input="getInputSobreNombre">
              <template #message-danger v-if="errorSobrenombre.length > 0">
                {{ errorSobrenombre }}
              </template>
            </vs-input>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Fecha de Nacimiento</label>
            <el-date-picker type="date" placeholder="Fecha de Nacimiento" format="dd/MM/yyyy" value-format="yyyy-MM-dd"
              :default-value="fechaValida" :disabled="candidato" :picker-options="pickerOptions"
              v-model="fechaNacimiento" @change="getAge">
            </el-date-picker>
            <div class="danger-message">
              <template v-if="errorFechaNacimietno.length > 0">
                {{ errorFechaNacimietno }}
              </template>
            </div>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Edad</label>
            <h6>{{ edad }}</h6>
          </div>
          <!-- <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Ocupación</label>
            <vs-input id="ocupacion" placeholder="Ocupación" v-model="ocupacion" :disabled="candidato"
              @input="getInputOcupacion">
              <template #message-danger v-if="errorOcupacion.length > 0">
                {{ errorOcupacion }}
              </template>
            </vs-input>
          </div> -->
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">OCR *</label>
            <vs-input id="ocr" autocomplete="off" color="#C2B280" icon-after placeholder="OCR" v-model="ocr" type="tel"
              :disabled="candidato" maxlength="13">
              <template #message-danger v-if="errorOCR.length > 0">
                {{ errorOCR }}
              </template>
            </vs-input>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Lugar de Nacimiento</label>
            <el-select filterable placeholder="Lugar de Nacimiento" v-model="lugarNacimiento" :disabled="candidato">
              <el-option :disabled="candidato" v-for="(item, index) in lugar" :key="index" :label="item.NOMBRE"
                :value="item.idENTIDAD">
                {{ item.NOMBRE }}
                <template #message-danger v-if="errorLugarNacimiento.length > 0">
                  {{ errorLugarNacimiento }}
                </template>
              </el-option>
            </el-select>
          </div>
          <!-- <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Domicilio</label>
            <vs-input id="domicilio" color="#C2B280" placeholder="Domicilio" v-model="domicilio" :disabled="candidato"
              @input="getInputDomicilio">
              <template #message-danger v-if="errorDomicilio.length > 0">
                {{ errorDomicilio }}
              </template>
            </vs-input>
          </div> -->
          <!-- <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Tiempo de Residencia en Domicilio (Años)
            </label>
            <vs-input id="tresidencia" placeholder="Tiempo de Residencia en Domicilio" v-model="tiempoResidencia"
              :disabled="candidato" @input="getInputTRecidencia">
              <template #message-danger v-if="errorResidencia.length > 0">
                {{ errorResidencia }}
              </template>
            </vs-input>
          </div> -->
          <!-- <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Teléfono</label>
            <vs-input color="#C2B280" id="telefono" icon-after placeholder="Teléfono" v-model="telefono" type="tel"
              :disabled="candidato" maxlength="10">
              <template #message-danger v-if="errorTelefono.length > 0">
                {{ errorTelefono }}
              </template>
            </vs-input>
          </div> -->
          <!-- <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Correo electrónico</label>
            <vs-input color="#C2B280" icon-after placeholder="Correo electrónico" v-model="correo" :disabled="candidato">
              <template #message-danger v-if="errorEmail.length > 0">
                {{ errorEmail }}
              </template>
              <template #message-danger v-if="validEmail == false && correo.length > 0">
                Correo Electrónico Invalido
              </template>
            </vs-input>
          </div> -->
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Acción Afirmativa</label>
            <vs-select placeholder="Acción Afirmativa" v-model="accionesAfir" v-if="catAcciones.length > 0"
              @change="getTipoAccionesAfirmativas" :disabled="candidato">
              <vs-option :disabled="candidato" v-for="(item, index) in catAcciones" :key="index" :label="item.Nombre"
                :value="item.idAccionesAfirmativas">
                {{ item.Nombre }}
                <template #message-danger v-if="errorAccionAfirmativa.length > 0">
                  {{ errorAccionAfirmativa }}
                </template>
              </vs-option>
            </vs-select>
          </div>
          <template v-if="accionesAfir === 1 || accionesAfir === 2 || accionesAfir === 4
            ">
            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
              <label class="col-form-label">Tipo Acción Afirmativa</label>
              <el-select filterable placeholder="Tipo Acción Afirmativa" v-model="tAccionAfirmativa"
                v-if="catTipoAcciones.length > 0" :disabled="candidato">
                <el-option :disabled="candidato" v-for="(item, index) in catTipoAcciones" :key="index"
                  :label="item.descripcion" :value="item.id">
                  {{ item.descripcion }}
                  <template #message-danger v-if="errorTipoAccionAfirmativa.length > 0">
                    {{ errorTipoAccionAfirmativa }}
                  </template>
                </el-option>
              </el-select>
            </div>
          </template>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Opta por Reelección</label>
            <el-select filterable placeholder="Opta por Reelección" v-model="reeleccion" :disabled="reelecciondisable">
              <el-option v-for="(item, index) in arrayReeleccion" :key="index" :disabled="reelecciondisable"
                :label="item.tipo" :v-model="item.idReelecion" :value="item.idReelecion">
                {{ item.tipo }}
              </el-option>
            </el-select>
          </div>
          <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
            <label class="col-form-label">Curso para aspirantes *</label>
            <vs-select placeholder="Seleccione una opción" v-model="curso" v-if="selectCurso.length > 0"
              :disabled="cursodisabled">
              <vs-option v-for="(item, index) in selectCurso" :key="index" :label="item.opcion" :value="item.idSelect"
                :disabled="cursodisabled">
                {{ item.opcion }}
                <template #message-danger v-if="errorCurso.length > 0">
                  {{ errorCurso }}
                </template>
              </vs-option>
            </vs-select>
            <vs-button icon color="#a5904a" size="large" @click="populares">
              <b style="font-size: medium !important;">
                Consultar
              </b>
            </vs-button>
          </div>
        </div>
        <template v-if="!verDocumentos">
          <div class="row mx-12 mb-12 p-4">
            <div class="col-sm-12 col-md-8 col-xl-6 px-0 pr-sm-5 pb-3">
              <center>
                <vs-button style="width: 19vw; background-color: var(--iee-black) !important; color: white !important"
                  block @click="guardarCandidato" :disabled="aspiranteboton">
                  <b style="font-size: medium !important">
                    Guardar
                  </b>
                </vs-button>
              </center>
            </div>
          </div>
        </template>
        <template v-if="verDocumentos">
          <div class="col mx-12 mb-12 p-4">
            <!-- f1 -->
            <div class="con-content d-flex align-items-center">
              <div class="d-flex align-items-center justify-content-start">
                <!-- <vs-button class="btn btn-flat btn-sm text-left file-link"
									@click.prevent="generarAcuseRegistro">
									<span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
										file_save
									</span>
								</vs-button> -->
              </div>
              <label class="col-form-label">1. Solicitud de registro</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F1"
                      @change="selectChange('F1')" v-if="selectSiNo.length > 0" :state="(errorTieneF1) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneF1 == 1">
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
                <template v-if="tieneDocumento.F1 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleF1" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveF1" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorF1 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F1 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.F1 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.F1.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span
                        style="margin-left: 7px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.F1.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>
                  </div>
                  <div v-if="!documentos.F1 && tieneDocumento.F1 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- f2 -->
            <div class="con-content d-flex align-items-center">
              <div class="d-flex align-items-center justify-content-start">
                <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuse5en1">
                  <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                    file_save
                  </span>
                  <!-- <span class="pl-2" style="color: var(--text-color) !important">
									Formato 5 en 1
								</span> -->
                </vs-button>
              </div>
              <label class="col-form-label">2. Formato 5 en 1</label>
            </div>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F2"
                      @change="selectChange('F2')" v-if="selectSiNo.length > 0" :state="(errorTieneF2) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneF2 == 1">
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
                <template v-if="tieneDocumento.F2 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleF2" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveF2" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorF2 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F2 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.F2 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.F2.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.F2.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.F2 && tieneDocumento.F2 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- F3. Escrito para inclusión de sobrenombre -->
            <!-- <label class="col-form-label">F3. Escrito para inclusión de sobrenombre</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F3"
											@change="selectChange('F3')" v-if="selectSiNo.length > 0"
											:state="(errorTieneF3) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneF3 == 1">
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
								<template v-if="tieneDocumento.F3 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF3"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveF3" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorF3 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F3 == 0">Documento cargado
									</h6>
									<div v-if="documentos.F3 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.F3.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.F3.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.F3 && tieneDocumento.F3 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- D1. Copia simple del acta de nacimiento -->
            <label class="col-form-label">3. Copia simple del acta de nacimiento</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D1"
                      @change="selectChange('D1')" v-if="selectSiNo.length > 0" :state="(errorTieneD1) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD1 == 1">
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
                <template v-if="tieneDocumento.D1 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD1" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD1" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD1 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D1 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D1 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D1.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D1.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D1 && tieneDocumento.D1 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D2. Copia simple de la credencial para votar/(SIIAP) -->
            <label class="col-form-label">4. Copia simple de la credencial para votar</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D2"
                      @change="selectChange('D2')" v-if="selectSiNo.length > 0" :state="(errorTieneD2) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD2 == 1">
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
                <template v-if="tieneDocumento.D2 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD2" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD2" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD2 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D2 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D2 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D2.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D2.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>
                  </div>
                  <div v-if="!documentos.D2 && tieneDocumento.D2 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D3. Constancia de residencia -->
            <label class="col-form-label">5. Documento probatorio de la residencia</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D3"
                      @change="selectChange('D3')" v-if="selectSiNo.length > 0" :state="(errorTieneD3) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD3 == 1">
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
                <template v-if="tieneDocumento.D3 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD3" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD3" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD3 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D3 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D3 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D3.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D3.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.D3 && tieneDocumento.D3 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D4. Documento que acredita la Ciudadanía Poblana -->
            <label class="col-form-label">6. Documento que acredita la Ciudadanía Poblana</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D4"
                      @change="selectChange('D4')" v-if="selectSiNo.length > 0" :state="(errorTieneD4) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD4 == 1">
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
                <template v-if="tieneDocumento.D4 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD4" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD4" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD4 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D4 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D4 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D4.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D4.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.D4 && tieneDocumento.D4 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D5. FAR-SNR -->
            <label class="col-form-label">7. Formulario de aceptación de Registro de Candidatura
              (FAR-SNR)</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D5"
                      @change="selectChange('D5')" v-if="selectSiNo.length > 0" :state="(errorTieneD5) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD5 == 1">
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
                <template v-if="tieneDocumento.D5 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD5" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD5" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD5 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D5 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D5 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D5.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D5.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.D5 && tieneDocumento.D5 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D6. FAAR-SNR -->
            <label class="col-form-label">8. Formulario de Actualización de Aceptación (FAA-SNR)</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D6"
                      @change="selectChange('D6')" v-if="selectSiNo.length > 0" :state="(errorTieneD6) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD6 == 1">
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
                <template v-if="tieneDocumento.D6 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD6" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD6" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD6 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D6 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D6 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D6.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D6.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.D6 && tieneDocumento.D6 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D7. *Informe de capacidad económica -->
            <label class="col-form-label">9. Informe de capacidad económica</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D7"
                      @change="selectChange('D7')" v-if="selectSiNo.length > 0" :state="(errorTieneD7) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD7 == 1">
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
                <template v-if="tieneDocumento.D7 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD7" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD7" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD7 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D7 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.D7 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D7.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D7.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.D7 && tieneDocumento.D7 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- D8. Constancia de la Asistencia al curso -->
            <!-- <label class="col-form-label">D8. Constancia de la Asistencia al curso</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D8"
											@change="selectChange('D8')" v-if="selectCurso.length > 0"
											:state="(errorTieneD8) ? 'danger' : ''" disabled="false">
											<template #message-danger v-if="errorTieneD8 == 1">
												Seleccione una opción
											</template>
											<vs-option v-for="(item, index) in selectCurso" :key="index"
												:label="item.opcion" :value="item.idSelect" disabled="false" >
												{{ item.opcion }}
											</vs-option>
										</vs-select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<br>
								<div class="col-md-4 col-lg-11 col-xl-10">
									<vs-button icon color="#a5904a" size="large"
										@click="">
										<b style="font-size: medium !important;">
											Consultar Curso
										</b>
									</vs-button>
								</div> -->
            <!-- <template v-if="tieneDocumento.D8 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleD8"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveD8" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorD8 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D8 == 0">Documento cargado
									</h6>
									<div v-if="documentos.D8 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.D8.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.D8.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.D8 && tieneDocumento.D8 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
											un
											documento</span>
									</div>
								</div> -->
            <!-- </div>
						</div> -->
            <!-- F4. Consentimiento para participar en la Red de Candidatas -->
            <label class="col-form-label">10. Manifestación de Adhesión a la Red de Candidatas</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F4"
                      @change="selectChange('F4')" v-if="selectSiNo.length > 0" :state="(errorTieneF4) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneF4 == 1">
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
                <template v-if="tieneDocumento.F4 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleF4" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveF4" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorF4 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F4 == 0">Documento cargado
                  </h6>
                  <div v-if="documentos.F4 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.F4.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.F4.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.F4 && tieneDocumento.F4 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- F9I. Postulación indígenas. Bajo protesta de autoadscripción indígena -->
            <!-- <label class="col-form-label">F9I. Postulación indígenas. Bajo protesta de autoadscripción
							indígena</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F9I"
											@change="selectChange('F9I')" v-if="selectSiNo.length > 0"
											:state="(errorTieneF9I) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneF9I == 1">
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
								<template v-if="tieneDocumento.F9I == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF9I"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveF9I" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
											un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorF9I == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F9I == 0">Documento
										cargado
									</h6>
									<div v-if="documentos.F9I && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.F9I.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.F9I.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.F9I && tieneDocumento.F9I == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
											cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- D13. Documento que acredite el vínculo con la comunidad indígena, expedido por una autoridad competente -->
            <!-- <label class="col-form-label">D13. Documento que acredite el vínculo con la comunidad indígena,
							expedido por
							una autoridad competente</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D13"
											@change="selectChange('D13')" v-if="selectSiNo.length > 0"
											:state="(errorTieneD13) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneD13 == 1">
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
								<template v-if="tieneDocumento.D13 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleD13"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveD13" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
											un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorD13 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D13 == 0">Documento
										cargado
									</h6>
									<div v-if="documentos.D13 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.D13.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.D13.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.D13 && tieneDocumento.D13 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
											cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- F9D. Postulación personas con discapacidad. Bajo protesta de autoadscripción de personas con discapacidad -->
            <!-- <label class="col-form-label">F9D. Postulación personas con discapacidad. Bajo protesta de
							autoadscripción
							de personas con discapacidad</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F9D"
											@change="selectChange('F9D')" v-if="selectSiNo.length > 0"
											:state="(errorTieneF9D) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneF9D == 1">
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
								<template v-if="tieneDocumento.F9D == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF9D"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveF9D" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
											un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorF9D == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F9D == 0">Documento
										cargado
									</h6>
									<div v-if="documentos.F9D && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.F9D.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.F9D.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.F9D && tieneDocumento.F9D == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
											cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- D14. Certificado médico/ Credencial del sistema estatal del desarrollo integral de las familias -->
            <!-- <label class="col-form-label">D14. Certificado médico/ Credencial del sistema estatal del
							desarrollo
							integral de las familias</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D14"
											@change="selectChange('D14')" v-if="selectSiNo.length > 0"
											:state="(errorTieneD14) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneD14 == 1">
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
								<template v-if="tieneDocumento.D14 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleD14"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveD14" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
											un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorD14 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D14 == 0">Documento
										cargado
									</h6>
									<div v-if="documentos.D14 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.D14.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.D14.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.D14 && tieneDocumento.D14 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
											cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- F9S. Postulación personas de la diversidad sexual. Bajo protesta de autoadscripción de la diverdidad sexual -->
            <!-- <label class="col-form-label">F9S. Postulación personas de la diversidad sexual. Bajo protesta
							de
							autoadscripción de la diverdidad sexual</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F9S"
											@change="selectChange('F9S')" v-if="selectSiNo.length > 0"
											:state="(errorTieneF9S) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneF9S == 1">
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
								<template v-if="tieneDocumento.F9S == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF9S"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveF9S" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
											un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorF9S == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F9S == 0">Documento
										cargado
									</h6>
									<div v-if="documentos.F9S && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.F9S.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.F9S.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.F9S && tieneDocumento.F9S == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
											cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- F10. Escrito de desistimiento de plantilla -->
            <!-- <label class="col-form-label">F10. Escrito de desistimiento de plantilla</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F10"
											@change="selectChange('F10')" v-if="selectSiNo.length > 0"
											:state="(errorTieneF10) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneF10 == 1">
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
								<template v-if="tieneDocumento.F10 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF10"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveF10" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
											un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorF10 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F10 == 0">Documento
										cargado
									</h6>
									<div v-if="documentos.F10 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.F10.url" blank>
											<div class="d-flex flex-start">
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.ER[0].name }}
												{{ documentos.F10.name }}
											</span>
											</div>
										</vs-button>

									</div>
									<div v-if="!documentos.F10 && tieneDocumento.F10 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
											cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->

            <template v-if="eleccion == 1 || eleccion == 2 || eleccion == 3">
              <!-- Q8 -->

              <label class="col-form-label">Fotografía</label>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q8"
                        @change="selectChange('Q8')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneQ8) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneQ8 == 1">
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
                  <template v-if="tieneDocumento.Q8 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleQ8" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveQ8" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic
                          para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG
                        con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorQ8 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q8 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.Q8 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.Q8.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.Q8.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q8 && tieneDocumento.Q8 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Q1 -->
              <div class="con-content d-flex align-items-center">
                <div class="d-flex align-items-center justify-content-start" v-if="eleccion != 4">
                  <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuseFotografias">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                    <!-- <span class="pl-2" style="color: var(--text-color) !important">
										Manifiesto "Bajo Protesta De Decir Verdad" Que Las Fotografías Corresponden A Las Personas Candidatas
									</span> -->
                  </vs-button>
                </div>
                <label class="col-form-label">Manifestación "bajo protesta de decir verdad" que la
                  fotografia corresponden a las persona candidata</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q1"
                        @change="selectChange('Q1')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneQ1) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneQ1 == 1">
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
                  <template v-if="tieneDocumento.Q1 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleQ1" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveQ1" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
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
                      <template v-if="errorQ1 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q1 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.Q1 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.Q1.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.Q1.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q1 && tieneDocumento.Q1 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <!-- AGREGADOS CULTURALES -->
            <template v-if="candidatura == 4">
              <!-- Q2 -->
              <label class="col-form-label">Emblema a colores</label>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q2"
                        @change="selectChange('Q2')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneQ2) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneQ2 == 1">
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
                  <template v-if="tieneDocumento.Q2 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleQ2" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveQ2" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
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
                      <template v-if="errorQ2 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q2 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.Q2 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.Q2.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.Q2.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q2 && tieneDocumento.Q2 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Q3 -->
              <label class="col-form-label">Plataforma Electoral</label>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q3"
                        @change="selectChange('Q3')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneQ3) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneQ3 == 1">
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
                  <template v-if="tieneDocumento.Q3 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleQ3" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveQ3" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
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
                      <template v-if="errorQ3 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q3 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.Q3 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.Q3.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.Q3.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q3 && tieneDocumento.Q3 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Q4 -->
              <label class="col-form-label">Bajo protestya de decir verdad</label>
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
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.Q4.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q4 && tieneDocumento.Q4 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <template v-if="reeleccion >= 2">
              <!-- Q5 -->
              <div class="con-content d-flex align-items-center">
                <div class="d-flex align-items-center justify-content-start"
                  v-if="eleccion == 4 && candidatoSelected.reeleccion > 1">
                  <vs-button class="btn btn-flat btn-sm text-left file-link"
                    @click.prevent="generarAcuseReeleccionAyunta">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                    <!-- <span class="pl-2" style="color: var(--text-color) !important">
										Formato de Carta para dar Cumplimiento del Artículo 208 Inciso F) del CIPEEP (Integrantes del Ayuntamiento)
									</span> -->
                  </vs-button>
                </div>
                <div class="d-flex align-items-center justify-content-start"
                  v-if="(eleccion == 2 || eleccion == 3) && candidatoSelected.reeleccion > 1">
                  <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuseReeleccionDip">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                    <!-- <span class="pl-2" style="color: var(--text-color) !important">
										Formato de Carta para dar Cumplimiento del Artículo 208 Inciso F) del CIPEEP (Candidaturas a Diputaciones)
									</span> -->
                  </vs-button>
                </div>
                <label class="col-form-label">Carta para dar cumplimiento al artículo 208, inciso f) del
                  Código</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q5"
                        @change="selectChange('Q5')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneQ5) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneQ5 == 1">
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
                  <template v-if="tieneDocumento.Q5 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleQ5" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveQ5" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
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
                      <template v-if="errorQ5 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q5 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.Q5 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.Q5.url" blank>
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          {{ documentos.Q5.name }}
                        </span>
                      </vs-button>

                    </div>
                    <div v-if="!documentos.Q5 && tieneDocumento.Q5 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- D9 -->
              <div class="con-content d-flex align-items-center">
                <div class="d-flex align-items-center justify-content-start"
                  v-if="candidatoSelected.reeleccion > 1 && (candidatoSelected.idpuesto % 2) == 0">
                  <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuseProtestaCargo">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                  </vs-button>
                </div>
                <label class="col-form-label">
                  Formato de manifestación de no haber rendido protesta al cargo
                </label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D9"
                        @change="selectChange('D9')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneD9) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneD9 == 1">
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
                  <template v-if="tieneDocumento.D9 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleD9" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveD9" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
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
                      <template v-if="errorD9 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D9 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.D9 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.D9.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.D9.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.D9 && tieneDocumento.D9 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No
                        se cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- F8-->
              <div class="con-content d-flex align-items-center">
                <div class="col-12 d-flex align-items-center justify-content-start"
                  v-if="candidatoSelected.reeleccion > 1">
                  <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuseNoMilitancia">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                    <!-- <span class="pl-2" style="color: var(--text-color) !important">
										Formato de Manifestación de no Militancia
									</span> -->
                  </vs-button>
                </div>
                <label class="col-form-label">Formato de manifestacion de no militancia</label>
              </div>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F8"
                        @change="selectChange('F8')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneF8) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneF8 == 1">
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
                  <template v-if="tieneDocumento.F8 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleF8" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveF8" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorF8 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F8 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.F8 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.F8.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.F8.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.F8 && tieneDocumento.F8 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <template v-if="candidatura == 2">
              <!-- D10-->
              <label class="col-form-label">Documentación de la que se desprende que los órganos facultados de
                los
                partidos políticos o de las coaliciones aprovaron postular candidatura comunes</label>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D10"
                        @change="selectChange('D10')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneD10) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneD10 == 1">
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
                  <template v-if="tieneDocumento.D10 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleD10" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveD10" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorD10 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D10 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.D10 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.D10.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.D10.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.D10 && tieneDocumento.D10 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- D11 -->
              <label class="col-form-label">Constancia original que señale el origen partidario de la
                candidatura</label>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D11"
                        @change="selectChange('D11')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneD11) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneD11 == 1">
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
                  <template v-if="tieneDocumento.D11 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleD11" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveD11" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorD11 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D11 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.D11 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.D11.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.D11.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.D11 && tieneDocumento.D11 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- F5-->
              <div class="con-content d-flex align-items-center">
                <div class="d-flex align-items-center justify-content-start">
                  <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuseComunes">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                    <!-- <span class="pl-2" style="color: var(--text-color) !important">
										Formato Sobre Acciones Afirmativas
									</span> -->
                  </vs-button>
                </div>
                <label class="col-form-label">La aceptación del partido político postulante para participar
                  en
                  candidatura común</label>
              </div>

              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F5"
                        @change="selectChange('F5')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneF5) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneF5 == 1">
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
                  <template v-if="tieneDocumento.F5 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleF5" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveF5" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorF5 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F5 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.F5 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.F5.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.F5.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.F5 && tieneDocumento.F5 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <!-- Accciones Afirmativas -->
            <template v-if="accionesAfir != 8 && accionesAfir != 7">
              <!-- F6 -->
              <div class="con-content d-flex align-items-center">
                <div class="d-flex align-items-center justify-content-start"
                  v-if="candidatoSelected.idaccioneAfirmativas < 7">
                  <vs-button class="btn btn-flat btn-sm text-left file-link" @click.prevent="generarAcuseAfirmativas">
                    <span style=" color : var(--text-color) !important ;" class="material-symbols-rounded">
                      file_save
                    </span>
                    <!-- <span class="pl-2" style="color: var(--text-color) !important">
										Formato Sobre Acciones Afirmativas
									</span> -->
                  </vs-button>
                </div>
                <label class="col-form-label">Formato sobre acciones afirmativas en favor de grupos sociales
                  en
                  situación de vulberabilidad (auto adscripción)</label>
              </div>

              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F6"
                        @change="selectChange('F6')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneF6) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneF6 == 1">
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
                  <template v-if="tieneDocumento.F6 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleF6" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveF6" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorF6 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F6 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.F6 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.F6.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.F6.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.F6 && tieneDocumento.F6 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- F7-->
              <label class="col-form-label">Documento probatorio de la adscripción</label>
              <div class="row px-0 pr-sm-5 pb-3">
                <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                  <div class="col px-0 pb-3 pl-sm-0">
                    <h6 class="col">¿Cuenta con el documento?</h6>
                    <div class="col-md-4 col-lg-11 col-xl-10 ">
                      <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.F7"
                        @change="selectChange('F7')" v-if="selectSiNo.length > 0"
                        :state="(errorTieneF7) ? 'danger' : ''">
                        <template #message-danger v-if="errorTieneF7 == 1">
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
                  <template v-if="tieneDocumento.F7 == 1 && idDocumentacion == 0">
                    <h6 class="col">Seleccione el documento</h6>
                    <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                      :on-change="handleF7" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                      :on-remove="handleRemoveF7" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                      ref="upload">
                      <el-button size="small" type="primary"
                        style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                          subir
                          archivo</strong></el-button>
                      <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                        un
                        tamaño
                        menor
                        a 5MB</div>
                    </el-upload>
                    <div class="danger-message">
                      <template v-if="errorF7 == 1">
                        Seleccione un archivo para subir
                      </template>
                    </div>
                  </template>
                  <div class="px-0 pb-4 pl-sm-0">
                    <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.F7 == 0">Documento
                      cargado
                    </h6>
                    <div v-if="documentos.F7 && idDocumentacion != 0"
                      class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                      <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                        :href="'../' + documentos.F7.url" blank>
                        <!-- <div class="d-flex flex-start"> -->
                        <span class="material-symbols-rounded" style="color: #00a099">
                          description
                        </span>
                        <span class="col"
                          style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                          <!-- {{ documentos.ER[0].name }} -->
                          {{ documentos.F7.name }}
                        </span>
                        <!-- </div> -->
                      </vs-button>

                    </div>
                    <div v-if="!documentos.F7 && tieneDocumento.F7 == 0" class="d-flex flex-column mt-3">
                      <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                        cargó
                        un
                        documento</span>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <!-- D12 -->
            <label class="col-form-label">Otro</label>
            <div class="row px-0 pr-sm-5 pb-3">
              <div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
                <div class="col px-0 pb-3 pl-sm-0">
                  <h6 class="col">¿Cuenta con el documento?</h6>
                  <div class="col-md-4 col-lg-11 col-xl-10 ">
                    <vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.D12"
                      @change="selectChange('D12')" v-if="selectSiNo.length > 0"
                      :state="(errorTieneD12) ? 'danger' : ''">
                      <template #message-danger v-if="errorTieneD12 == 1">
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
                <template v-if="tieneDocumento.D12 == 1 && idDocumentacion == 0">
                  <h6 class="col">Seleccione el documento</h6>
                  <el-upload class="upload-demo col-md-7" action="https://jsonplaceholder.typicode.com/posts/"
                    :on-change="handleD12" accept="application/pdf, image/jpeg" :on-preview="handlePreview"
                    :on-remove="handleRemoveD12" multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false"
                    ref="upload">
                    <el-button size="small" type="primary"
                      style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
                        subir
                        archivo</strong></el-button>
                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con
                      un
                      tamaño
                      menor
                      a 5MB</div>
                  </el-upload>
                  <div class="danger-message">
                    <template v-if="errorD12 == 1">
                      Seleccione un archivo para subir
                    </template>
                  </div>
                </template>
                <div class="px-0 pb-4 pl-sm-0">
                  <h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.D12 == 0">Documento
                    cargado
                  </h6>
                  <div v-if="documentos.D12 && idDocumentacion != 0"
                    class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
                    <vs-button class="transparent dark fileDisplay" style="color: #000 !important"
                      :href="'../' + documentos.D12.url" blank>
                      <!-- <div class="d-flex flex-start"> -->
                      <span class="material-symbols-rounded" style="color: #00a099">
                        description
                      </span>
                      <span class="col"
                        style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
                        <!-- {{ documentos.ER[0].name }} -->
                        {{ documentos.D12.name }}
                      </span>
                      <!-- </div> -->
                    </vs-button>

                  </div>
                  <div v-if="!documentos.D12 && tieneDocumento.D12 == 0" class="d-flex flex-column mt-3">
                    <span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se
                      cargó
                      un
                      documento</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Q6
						<label class="col-form-label">Q6. Protesta de decir la verdad</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q6"
											@change="selectChange('Q6')" v-if="selectSiNo.length > 0"
											:state="(errorTieneQ6) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneQ6 == 1">
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
								<template v-if="tieneDocumento.Q6 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleQ6"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveQ6" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorQ6 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q6 == 0">Documento cargado
									</h6>
									<div v-if="documentos.Q6 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.Q6.url" blank>
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.Q6.name }}
											</span>
										</vs-button>

									</div>
									<div v-if="!documentos.Q6 && tieneDocumento.Q6 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div>
						 --Q7--
						<label class="col-form-label">Q7. Formato de designación para sustitución</label>
						<div class="row px-0 pr-sm-5 pb-3">
							<div class="col-lg-6 col-xl-3" v-if="idDocumentacion == 0">
								<div class="col px-0 pb-3 pl-sm-0">
									<h6 class="col">¿Cuenta con el documento?</h6>
									<div class="col-md-4 col-lg-11 col-xl-10 ">
										<vs-select placeholder="Seleccione una opción" v-model="tieneDocumento.Q7"
											@change="selectChange('Q7')" v-if="selectSiNo.length > 0"
											:state="(errorTieneQ7) ? 'danger' : ''">
											<template #message-danger v-if="errorTieneQ7 == 1">
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
								<template v-if="tieneDocumento.Q7 == 1 && idDocumentacion == 0">
									<h6 class="col">Seleccione el documento</h6>
									<el-upload class="upload-demo col-md-7"
										action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleQ7"
										accept="application/pdf, image/jpeg" :on-preview="handlePreview"
										:on-remove="handleRemoveQ7" multiple :limit="1" :on-exceed="handleExceed"
										:auto-upload="false" ref="upload">
										<el-button size="small" type="primary"
											style="background-color: #af8909; border-color: #af8909;"><strong>Clic para
												subir
												archivo</strong></el-button>
										<div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF, JPG o JPEG con un
											tamaño
											menor
											a 5MB</div>
									</el-upload>
									<div class="danger-message">
										<template v-if="errorQ7 == 1">
											Seleccione un archivo para subir
										</template>
									</div>
								</template>
								<div class="px-0 pb-4 pl-sm-0">
									<h6 class="col" v-if="idDocumentacion != 0 || tieneDocumento.Q7 == 0">Documento cargado
									</h6>
									<div v-if="documentos.Q7 && idDocumentacion != 0"
										class="d-flex justify-content-between fileContainer col-sm-9 col-lg-8 col-xl-6">
										<vs-button class="transparent dark fileDisplay" style="color: #000 !important"
											:href="'../' + documentos.Q7.url" blank>
											<span class="material-symbols-rounded" style="color: #00a099">
												description
											</span>
											<span class="col"
												style="margin-left: 10px; text-overflow: ellipsis; white-space: nowrap !important; overflow:hidden !important; color: #00a099">
												{{ documentos.Q7.name }}
											</span>
										</vs-button>

									</div>
									<div v-if="!documentos.Q7 && tieneDocumento.Q7 == 0" class="d-flex flex-column mt-3">
										<span class="d-flex flex-row ml-3 noCarga" style="color: red !important">No se cargó
											un
											documento</span>
									</div>
								</div>
							</div>
						</div> -->
            <!-- Btn guardar -->
            <div class="row mx-auto mb-12 p-4" v-if="idDocumentacion == 0">
              <div class="col-sm-12 col-md-8 col-xl-6 px-0 pr-sm-5 pb-3">
                <vs-button style="width: 19vw; background-color: var(--iee-black) !important" block
                  @click.prevent="registrarDocumentos">
                  <b style="font-size: medium !important;">
                    Guardar Registro
                  </b>
                </vs-button>
              </div>
            </div>

          </div>
        </template>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["idCan", "id"],
  data() {
    return {
      motivoSustitucion: "",
      curso: 0,
      nombresustituir: "",
      cursodisabled: true,
      idCandidatura: 0,
      error: "",
      errorCurso: '',
      errorEleccion: "",
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
      catSustituciones: [],
      catDistritos: [],
      catMunicipio: [],
      catCandidatura: [],
      catEleccion: [],
      catPartidos: [],
      catCargo: [],
      catpuesto: [],
      catAcciones: [],
      catTipoAcciones: [],
      listPartidos: [],
      listPartidosAsociados: [],
      distrito: "",
      municipio: "",
      candidatura: "",
      eleccion: "",
      partidos: "",
      reeleccion: "",
      reeleccionId: 0,
      cargo: "",
      puesto: "",
      accionesAfir: "",
      tAccionAfirmativa: "",
      partidoPrincipalDPPP: "",
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
      candidato: false,
      candidatoSelected: [],
      idCandidatoSelected: 0,
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
      edad: "Seleccione una fecha de nacimiento",
      fechaValida: "",
      ocupacion: "",
      ocr: "",
      lugar: [],
      lugarNacimiento: "",
      domicilio: "",
      tiempoResidencia: "",
      telefono: "",
      correo: "",
      aspiranteboton: true,
      errorMotivoSustitucion: "",
      errorPuesto: "",
      errorElector: "",
      errorNombre: "",
      errorApellidoPaterno: "",
      errorApellidoMaterno: "",
      errorGenero: "",
      errorSobrenombre: "",
      errorFechaNacimietno: "",
      errorEdad: "",
      errorOcupacion: "",
      errorOCR: "",
      errorLugarNacimiento: "",
      errorDomicilio: "",
      errorResidencia: "",
      errorTelefono: "",
      errorEmail: "",
      errorAccionAfirmativa: "",
      errorTipoAccionAfirmativa: "",
      errorRepetidaClaveElector: "",
      folio: 0,
      arrayEleccion: [],
      arrayPartidos: [],
      arrayReeleccion: [],
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
      BuscarPartido: "",
      BuscarAsociado: "",
      consultaFolio: "",
      idcandidato: "",
      PartidyPartidoAsociado: "",
      pickerOptions: {
        disabledDate(time) {
          var date = new Date();
          date.setFullYear(date.getFullYear() - 18);
          return time.getTime() > date;
        },
      },
      // documentos
      idDocumentacion: 0,
      form: new FormData(),
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

      error: 0,

      errorTieneF1: 0,
      errorF1: "",
      errorTieneF2: 0,
      errorF2: "",
      errorTieneF3: 0,
      errorF3: "",
      errorTieneD1: 0,
      errorD1: "",
      errorTieneD2: 0,
      errorD2: "",
      errorTieneD3: 0,
      errorD3: "",
      errorTieneD4: 0,
      errorD4: "",
      errorTieneD5: 0,
      errorD5: "",
      errorTieneD6: 0,
      errorD6: "",
      errorTieneD7: 0,
      errorD7: "",
      errorTieneD8: 0,
      errorD8: "",
      errorTieneF4: 0,
      errorF4: "",
      errorTieneD9: 0,
      errorD9: "",
      errorTieneD10: 0,
      errorD10: "",
      errorTieneD11: 0,
      errorD11: "",
      errorTieneF5: 0,
      errorF5: "",
      errorTieneF6: 0,
      errorF6: "",
      errorTieneF7: 0,
      errorF7: "",
      errorTieneF8: 0,
      errorF8: "",
      errorTieneD12: 0,
      errorD12: "",
      errorTieneF9I: 0,
      errorF9I: "",
      errorTieneD13: 0,
      errorD13: "",
      errorTieneF9D: 0,
      errorF9D: "",
      errorTieneD14: 0,
      errorD14: "",
      errorTieneF9S: 0,
      errorF9S: "",
      errorTieneF10: 0,
      errorF10: "",
      errorTieneQ1: 0,
      errorQ1: "",
      errorTieneQ2: 0,
      errorQ2: "",
      errorTieneQ3: 0,
      errorQ3: "",
      errorTieneQ4: 0,
      errorQ4: "",
      errorTieneQ5: 0,
      errorQ5: "",
      errorTieneQ6: 0,
      errorQ6: "",
      errorTieneQ7: 0,
      errorQ7: "",
      errorTieneQ8: 0,
      errorQ8: "",
    };
  },
  mounted() {
    // this.cargarDistritos();
    // this.cargarCandidatura();
    // this.cargarEleccion();
    // this.cargarMunicipios();
    // this.cargarPartidos();
    // this.cargarCargos();
    // this.cargarPuestos();
    this.accionesAfirmativas();
    this.subtractYears();
    this.cargarGenero();
    this.Estados();
    this.getReelecion();
    this.checkInputIntegrity();
    this.consultarCandidatoID();
    this.getListarTipoSustituciones();
  },
  computed: {
    validEmail() {
      return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.correo);
    },
  },
  methods: {
    checkInputIntegrity() {
      var claveE = document.getElementById("claveElector");
      var nom = document.getElementById("nombre");
      var apema = document.getElementById("apm");
      var sobren = document.getElementById("sobrenombre");
      // var ocupa = document.getElementById("ocupacion");
      // var dom = document.getElementById("domicilio");

      claveE.addEventListener("keypress", (event) => {
        if (
          !`${event.target.value}${event.key}`.match(
            /^[ a-zA-ZáíóéúÁÉÍÓÚ0-9]{0,255}$/
          )
        ) {
          // block the input if result does not match
          event.preventDefault();
          event.stopPropagation();
          return false;
        }
      });

      nom.addEventListener("keypress", (event) => {
        if (
          !`${event.target.value}${event.key}`.match(
            /^[ a-zA-ZáíóéúÁÉÍÓÚ0-9]{0,255}$/
          )
        ) {
          // block the input if result does not match
          event.preventDefault();
          event.stopPropagation();
          return false;
        }
      });

      document.getElementById("appa").addEventListener("keypress", (event) => {
        if (
          !`${event.target.value}${event.key}`.match(
            /^[ a-zA-ZáíóéúÁÉÍÓÚ0-9]{0,255}$/
          )
        ) {
          // block the input if result does not match
          event.preventDefault();
          event.stopPropagation();
          return false;
        }
      });


      apema.addEventListener("keypress", (event) => {
        if (
          !`${event.target.value}${event.key}`.match(
            /^[ a-zA-ZáíóéúÁÉÍÓÚ0-9]{0,255}$/
          )
        ) {
          // block the input if result does not match
          event.preventDefault();
          event.stopPropagation();
          return false;
        }
      });


      sobren.addEventListener("keypress", (event) => {
        if (
          !`${event.target.value}${event.key}`.match(
            /^[ a-zA-ZáíóéúÁÉÍÓÚ0-9]{0,255}$/
          )
        ) {
          // block the input if result does not match
          event.preventDefault();
          event.stopPropagation();
          return false;
        }
      });

      // ocupa.addEventListener("keypress", (event) => {
      //   if (
      //     !`${event.target.value}${event.key}`.match(
      //       /^[ a-zA-ZáíóéúÁÉÍÓÚ0-9]{0,255}$/
      //     )
      //   ) {
      //     // block the input if result does not match
      //     event.preventDefault();
      //     event.stopPropagation();
      //     return false;
      //   }
      // });
      // document
      //   .getElementById("telefono")
      //   .addEventListener("keypress", (event) => {
      //     if (!`${event.target.value}${event.key}`.match(/^[0-9]{0,10}$/)) {
      //       // block the input if result does not match
      //       event.preventDefault();
      //       event.stopPropagation();
      //       return false;
      //     }
      //   });

      // document
      //   .getElementById("tresidencia")
      //   .addEventListener("keypress", (event) => {
      //     if (!`${event.target.value}${event.key}`.match(/^[0-9]{0,10}$/)) {
      //       // block the input if result does not match
      //       event.preventDefault();
      //       event.stopPropagation();
      //       return false;
      //     }
      //   });

      document.getElementById("ocr").addEventListener("keypress", (event) => {
        if (!`${event.target.value}${event.key}`.match(/^[0-9]{0,13}$/)) {
          // block the input if result does not match
          event.preventDefault();
          event.stopPropagation();
          return false;
        }
      });
      document.getElementById("ocr").onpaste = function (e) {
        e.preventDefault();
      };
      document.getElementById("ocr").oncopy = function (e) {
        e.preventDefault();
      };
    },
    getAge() {
      this.edad = "Seleccione una fecha de nacimiento";
      if (this.fechaNacimiento != null) {
        const getAge = Math.floor(
          (new Date() - new Date(this.fechaNacimiento).getTime()) / 3.15576e10
        );
        this.edad = getAge;
      }
    },
    getInputClaveElector() {
      this.claveElector = this.fnToUpperCase(this.claveElector);
      if (this.claveElector.length == 18) {
        // this.consultarCandidatoClaveElector();
      }
    },
    getInputLema() {
      this.lema = this.fnToUpperCase(this.lema);
    },
    getInputNombre() {
      this.nombre = this.fnToUpperCase(this.nombre);
    },
    getInputApellidoPa() {
      this.apellidoP = this.fnToUpperCase(this.apellidoP);
    },
    getInputApellidoMa() {
      this.apelliodoM = this.fnToUpperCase(this.apelliodoM);
    },
    getInputSobreNombre() {
      this.sobrenombre = this.fnToUpperCase(this.sobrenombre);
    },
    getInputOcupacion() {
      this.ocupacion = this.fnToUpperCase(this.ocupacion);
    },
    getInputDomicilio() {
      this.domicilio = this.fnToUpperCase(this.domicilio);
    },
    getInputTRecidencia() {
      this.tiempoResidencia = this.fnToUpperCase(this.tiempoResidencia);
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
    cargarGenero() {
      let url = "/administracion/usuario/cargarGenero";
      axios
        .get(url)
        .then((response) => {
          this.catgenero = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarDistritos() {
      let url = "/administracion/usuario/cargarDistritos";
      axios
        .get(url)
        .then((response) => {
          this.catDistritos = response.data;
        })
        .catch((error) => {
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
        .catch((error) => {
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
          .catch((error) => {
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
        .catch((error) => {
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
        .catch((error) => {
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
          this.listPartidosAsociados = response.data;
          this.arrayPartidos = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    cargarCargos() {
      let url = "/administracion/usuario/cargarCargos";
      axios
        .get(url)
        .then((response) => {
          this.catCargo = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    //Regiduria
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
        .catch((error) => {
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
    }, //Regiduria
    TipoEleccion() {
      this.distrito = "";
      this.municipio = "";
      this.candidatura = "";
      this.partidos = "";
      this.partidoAsociados = [];
      this.candidaturaTipo = true;
      if (this.eleccion == 1) {
        this.disableDistrito = true;
        this.disableMunicipio = true;
        this.disablecandidatura = false;
        this.disablePartidoAsociado = false;
      } else if (this.eleccion == 2) {
        this.disableDistrito = false;
        this.disableMunicipio = true;
        this.disablecandidatura = false;
        this.disablePartidoAsociado = false;
      } else if (this.eleccion == 3) {
        this.disableDistrito = true;
        this.disableMunicipio = true;
        this.disablecandidatura = true;
        this.disablePartidoAsociado = true;
      } else if (this.eleccion == 4) {
        this.disableDistrito = false;
        this.disableMunicipio = false;
        this.disablecandidatura = false;
        this.disablePartidoAsociado = false;
      }
      this.cargarMunicipios();
    },
    async guardarCandidatura() {
      await this.ConsultarRegistro();
      this.validarCandidatura();
      if (this.partidoAsociados.length > 0) {
        this.ValidarPartidyPartidoAsociado();
        if (this.PartidyPartidoAsociado == 1) {
          Swal.fire({
            icon: "warning",
            title:
              "Verifique los Partido Político Asociados .\n No se pueden seleccionar el mismo Partido Político Principal",
            showConfirmButton: true,
            confirmButtonText: "De acuerdo",
          });
          return;
        }
      }
      let url = "/administracion/usuario/guardarCandidatura";

      const loading = this.$vs.loading({
        type: "square",
        color: "#C2B280",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      if (this.error == 1) {
        loading.close();
        Swal.fire({
          icon: "warning",
          title:
            "Algunos de los campos se encuentran vacíos. \n Verifique los datos e inténtelo de nuevo.",
          showConfirmButton: true,
          confirmButtonText: "De acuerdo",
        });
      } else if (this.idCandidatura > 0 || this.idCandidatura != "") {
        this.candidaturaTipo = false;
        loading.close();
        Swal.fire({
          icon: "info",
          title: "Se ha encontrado información registrada",
          showConfirmButton: true,
          confirmButtonText: "De acuerdo",
        });
        this.activarDesactivar(true);
        this.habilitarCandato();
      } else {
        let partidosA = this.partidoAsociados.sort();
        axios
          .post(url, {
            eleccion: this.eleccion,
            distrito: this.distrito,
            municipio: this.municipio,
            tcandidatura: this.candidatura,
            partido: this.partidos,
            partisoAsociados: partidosA.toString(),
            lema: this.lema,
            partidoPrincipal: this.partidoPrincipalDPPP,
          })
          .then((response) => {
            loading.close();
            Swal.fire({
              icon: "success",
              title: "Los datos se han registrado correctamente",
              showConfirmButton: true,
              confirmButtonText: "De acuerdo",
            });
            this.candidaturaTipo = false;
            this.activarDesactivar(true);
            this.fecha = response.data[0].fecha;
            this.hora = response.data[0].hora;
            this.habilitarCandato();
          })
          .catch((error) => {
            loading.close();
            let nombreMetodo = url.split('/');
            methods.catchHandler(error, nombreMetodo[3]);
          });
      }
    },
    accionesAfirmativas() {
      let url = "/administracion/usuario/accionesAfirmativas";
      axios
        .get(url)
        .then((response) => {
          this.catAcciones = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    independiete() {
      if (this.candidatura == 4) {
        this.tituloseleccion = "Candidatura Independiente";
        this.disablePartidoAsociado = true;
        this.paritdosIndependites("IND");
      } else if (this.candidatura == 3) {
        this.tituloseleccion = "Coalición";
        this.disablePartidoAsociado = true;
        this.paritdosIndependites("CUL");
      } else if (this.candidatura == 2) {
        this.tituloseleccion = "Partido Político";
        this.disablePartidoAsociado = false;
        this.paritdosIndependites("PP");
      } else if (this.candidatura == 1) {
        this.tituloseleccion = "Partido Político";
        this.disablePartidoAsociado = true;
        this.paritdosIndependites("PP");
      }
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
          this.arrayPartidos = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    //puestos
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
    cargarPuestos() {
      let url = "/administracion/usuario/cargarPuestos";
      axios
        .get(url)
        .then((response) => {
          this.catpuesto = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    validarCandidatura() {
      this.limpiarErrorCandidato();
      this.error = 0;
      if (this.eleccion == "") {
        this.error = 1;
        this.errorEleccion = "Seleccione un tipo de Elección";
        return this.error;
      } else {
        if (this.eleccion == 1) {
          this.validarEleccion1();
          if (this.error == 1) {
            return this.error;
          }
        } else if (this.eleccion == 2) {
          this.validarEleccion2();
          if (this.error == 1) {
            return this.error;
          }
        } else if (this.eleccion == 3) {
          this.validarEleccion3();
          if (this.error == 1) {
            return this.error;
          }
        } else if (this.eleccion == 4) {
          this.validarEleccion4();
          if (this.error == 1) {
            return this.error;
          }
        }
      }
    },
    limpiarErrorCandidato() {
      this.errorcandidatura = "";
      this.errorPasociados = "";
      this.errorPartido = "";
      this.errorDistrito = "";
      this.errorMunicipio = "";
      this.errorCargo = "";
      this.errorEleccion = "";
    },
    validarEleccion1() {
      if (this.candidatura == "") {
        this.error = 1;
        this.errorcandidatura = "Seleccione un candidatura";
      }
      if (this.candidatura == 2 && this.partidoAsociados.length == 0) {
        this.error = 1;
        this.errorPasociados = "Seleccione los partidos asociados";
      }
      if (this.partidos == "") {
        this.error = 1;
        this.errorPartido = "Tiene que seleccionar un";
      }
      return this.error;
    },
    validarEleccion2() {
      if (this.candidatura == "") {
        this.error = 1;
        this.errorcandidatura = "Seleccione un candidatura";
      }
      if (this.distrito == "") {
        this.error = 1;
        this.errorDistrito = "Seleccione un distrito";
      }
      // if (this.municipio == '') {
      // 	this.error = 1;
      // 	this.errorMunicipio = 'Seleccione un municipio';
      // }
      if (this.candidatura == 2 && this.partidoAsociados.length == 0) {
        this.error = 1;
        this.errorPasociados = "Seleccione los partidos asociados";
      }
      if (this.partidos == "") {
        this.error = 1;
        this.errorPartido = "Tiene que seleccionar un";
      }
      return this.error;
    },
    validarEleccion3() {
      // if (this.candidatura == '') {
      // 	this.error = 1;
      // 	this.errorcandidatura = 'Seleccione un candidatura';
      // }
      if (this.candidatura == 2 && this.partidoAsociados.length == 0) {
        this.error = 1;
        this.errorPasociados = "Seleccione los partidos asociados";
      }
      if (this.partidos == "") {
        this.error = 1;
        this.errorPartido = "Seleccione un";
      }
      return this.error;
    },
    validarEleccion4() {
      if (this.candidatura == "") {
        this.error = 1;
        this.errorcandidatura = "Seleccione un candidatura";
      }
      if (this.distrito == "") {
        this.error = 1;
        this.errorDistrito = "Seleccione un distrito";
      }
      if (this.municipio == "") {
        this.error = 1;
        this.errorMunicipio = "Seleccione un municipio";
      }
      if (this.candidatura == 2 && this.partidoAsociados.length == 0) {
        this.error = 1;
        this.errorPasociados = "Seleccione los partidos asociados";
      }
      if (this.partidos == "") {
        this.error = 1;
        this.errorPartido = "Seleccione un";
      }

      return this.error;
    },

    habilitarCargosAyutanmientos() {
      if (this.puesto == 1) {
        this.filercargos(3);
      } else if (this.puesto == 2) {
        this.cargarPuestosMunicipio();
      } else if (this.pusto == 3) {
        this.filercargos(4);
      }
    },
    Estados() {
      let url = "/administracion/usuario/getEstados";
      axios
        .get(url)
        .then((response) => {
          this.lugar = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    async ConsultarRegistro() {
      let url = "/administracion/usuario/ConsultarRegistro";
      await axios
        .get(url, {
          params: {
            eleccion: this.eleccion,
            distrito: this.distrito,
            municipio: this.municipio,
            candidatura: this.candidatura,
            partido: this.partidos,
          },
        })
        .then((response) => {
          if (response.data.length > 0) {
            this.idCandidatura = response.data[0].idCandidatura;
            this.partidoAsociados = response.data[0].PartidoAsociados;
            this.lema = response.data[0].Lema;
            this.folio = response.data[0].folio;
            this.fecha = response.data[0].fecha;
            this.hora = response.data[0].hora;
            this.consultaFolio = response.data[0].folio;
            this.partidoPrincipalDPPP = response.data[0].idPartidoPrincipal;
          }
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    activarDesactivar(valor) {
      this.disableDistrito = valor;
      this.disableMunicipio = valor;
      this.disableReeleccion = valor;
      this.disablecandidatura = valor;
      this.disableEleccion = valor;
      this.disableParitodo = valor;
      this.disableLema = valor;
      this.disablePartidoAsociado = valor;
      this.disableCargo = valor;
    },
    guardarCandidato() {
      let idUsuarioRegistro = sessionStorage.getItem("idUsuario");
      let accionidUsuario = idUsuarioRegistro + "A,";

      Swal.fire({
        title: "¿Quieres realizar la sustitución?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, Sustituir",
        cancelButtonText: "Cancelar",
        reverseButtons: true,
      }).then((result) => {
        if (result.value) {
          if (this.errorRepetidaClaveElector == "1") {
            Swal.fire({
              icon: "warning",
              title: "El candidato se encuentra registrado, verifica los datos",
              showConfirmButton: true,
              confirmButtonText: "De acuerdo",
            });
          } else {
            const loading = this.$vs.loading({
              type: "square",
              color: "#C2B280",
              background: "#FFFFFF",
              text: "Cargando...",
            });
            let url = "/administracion/usuario/guardarCandidato";
            this.validarCandidato();
            if (this.edad == "Seleccione una fecha de nacimiento") {
              this.edad = "";
            }
            if (this.error == 1) {
              loading.close();
              Swal.fire({
                icon: "warning",
                title:
                  "Algunos de los campos se encuentran vacíos. \n Verifique los datos e inténtelo de nuevo.",
                showConfirmButton: true,
                confirmButtonText: "De acuerdo",
              });
            } else {
              axios
                .post(url, {
                  puesto: this.cargo,
                  clave: this.claveElector,
                  nom: this.nombre,
                  apellidop: this.apellidoP,
                  apellidom: this.apelliodoM,
                  genero: this.genero,
                  otroNom: this.sobrenombre,
                  fecha: this.fechaNacimiento,
                  edad: this.edad,
                  ocupa: this.ocupacion,
                  ocr: this.ocr,
                  lugarnacimiento: this.lugarNacimiento,
                  domi: this.domicilio,
                  recidencia: this.tiempoResidencia,
                  tel: this.telefono,
                  mail: this.correo,
                  accionesA: this.accionesAfir,
                  reelec: this.reeleccion,
                  idcan: this.idCandidatura,
                  cargo: this.puesto,
                  tacciones: this.tAccionAfirmativa,
                  idUsuarioAccion: accionidUsuario,
                  curso: this.curso
                })
                .then((response) => {
                  loading.close();
                  this.idcandidato = response.data[0].idcandidato;
                  Swal.fire({
                    icon: "success",
                    title: "Los datos se han registrado correctamente",
                    showConfirmButton: true,
                    confirmButtonText: "De acuerdo",
                  });
                  this.setSustitucionCandidato();
                  this.verDocumentos = false;
                  this.getDatosDocumentacion(loading);
                })
                .catch((error) => {
                  loading.close();
                  let nombreMetodo = url.split('/');
                  methods.catchHandler(error, nombreMetodo[3]);
                });
            }
          }
        }
      });
    },
    async generarFolio() {
      await this.consultarFolio();
      this.insertarFolio();
    },
    consutlarCandidato() {
      const loading = this.$vs.loading({
        type: "square",
        color: "#C2B280",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      let url = "/administracion/usuario/consutlarCandidato";
      axios
        .get(url, {
          params: {
            idCandidatura: this.idCandidatura,
            idpuesto: this.cargo,
          },
        })
        .then((response) => {
          loading.close();
          this.verDocumentos = true;
          if (response.data.length) {
            this.candidato = true;
            Swal.fire({
              icon: "info",
              title: "Se ha encontrado información registrada",
              showConfirmButton: true,
              confirmButtonText: "De acuerdo",
            });
            this.aspiranteboton = true;
            this.verclaveElector = response.data[0].claveElector;
            this.vernombre = response.data[0].nombre;
            this.verapellidoP = response.data[0].app;
            this.verapelliodoM = response.data[0].apm;
            this.genero = response.data[0].idGenero;
            this.versobrenombre = response.data[0].sobrenombre;
            this.verfechaNacimiento = response.data[0].fechaNacimiento;
            this.veredad = response.data[0].edad;
            this.verocupacion = response.data[0].ocupacion;
            this.verocr = response.data[0].ocr;
            this.lugarNacimiento = response.data[0].idlugarnacimiento;
            this.verdomicilio = response.data[0].domicilio;
            this.vertiempoResidencia = response.data[0].tRecidenciaDomicilio;
            this.vertelefono = response.data[0].telefono;
            this.vercorreo = response.data[0].correoElectronico;
            this.accionesAfir = response.data[0].idaccioneAfirmativas;
            this.idcandidato = response.data[0].idCandidato;
            this.reeleccion = response.data[0].reeleccion;
            this.reeleccionId = response.data[0].reeleccion;
            const loading = this.$vs.loading({
              type: "square",
              color: "#C2B280",
              background: "#FFFFFF",
              text: "Cargando...",
            });
            this.getDatosDocumentacion(loading);
          } else {
            loading.close();
            this.verDocumentos = false;
            this.candidato = false;
            this.limpiarCampos();
            this.aspiranteboton = false;
          }
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    // consultarCandidatoClaveElector() {
    //   this.errorRepetidaClaveElector = "0";
    //   let url = "/administracion/usuario/consultarCandidatoClaveElector";
    //   axios
    //     .get(url, {
    //       params: {
    //         clave: this.claveElector,
    //       },
    //     })
    //     .then((response) => {
    //       if (response.data.length > 0) {
    //         this.errorRepetidaClaveElector = 1;
    //         Swal.fire({
    //           icon: "warning",
    //           title: "El Candidato Se Encuentra Registrado",
    //           showConfirmButton: true,
    //           confirmButtonText: "De acuerdo",
    //         });
    //       }
    //     })
    //     .catch((error) => {
    //       let nombreMetodo = url.split('/');
    //       methods.catchHandler(error, nombreMetodo[3]);
    //     });
    // },
    limpiarCampos() {
      this.claveElector = "";
      this.nombre = "";
      this.apellidoP = "";
      this.apelliodoM = "";
      this.genero = 0;
      this.sobrenombre = "";
      this.fechaNacimiento = "";
      this.edad = "";
      this.ocupacion = "";
      this.ocr = "";
      this.lugarNacimiento = 0;
      this.domicilio = "";
      this.tiempoResidencia = "";
      this.telefono = "";
      this.correo = "";
      this.accionesAfir = 0;
      this.reeleccion = 0;
      this.verclaveElector = "";
      this.vernombre = "";
      this.verapellidoP = "";
      this.verapelliodoM = "";
      this.versobrenombre = "";
      this.verfechaNacimiento = "";
      this.veredad = "";
      this.verocupacion = "";
      this.verocr = "";
      this.verdomicilio = "";
      this.vertiempoResidencia = "";
      this.vertelefono = "";
      this.vercorreo = "";
    },
    limpiarMensajesError() {
      this.errorMotivoSustitucion = "";
      this.errorPuesto = "";
      this.errorElector = "";
      this.errorNombre = "";
      this.errorApellidoPaterno = "";
      this.errorApellidoMaterno = "";
      this.errorGenero = "";
      this.errorSobrenombre = "";
      this.errorFechaNacimietno = "";
      this.errorEdad = "";
      this.errorOcupacion = "";
      this.errorOCR = "";
      this.errorLugarNacimiento = "";
      this.errorDomicilio = "";
      this.errorResidencia = "";
      this.errorTelefono = "";
      this.errorEmail = "";
      this.errorAccionAfirmativa = "";
      this.errorTipoAccionAfirmativa = "";
    },
    validarCandidato() {
      this.limpiarMensajesError();
      this.error = 0;
      if (this.claveElector == "") {
        this.errorElector = "Escriba su Clave de Elector";
        this.error = 1;
      } else if (this.claveElector.length < 18) {
        this.errorElector = "Clave de Elector incorrecta";
        this.error = 1;
      } else if (!/[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}/g.test(this.claveElector)) {
        this.errorElector = "Ingrese una Clave de Elector Válida";
        this.error = 1;
      }
      if (this.nombre == "") {
        this.errorNombre = "Escriba su Nombre";
        this.error = 1;
      }
      if (this.apellidoP == '') {
        this.errorApellidoPaterno = 'Escriba su Primer Apellido'
        this.error = 1;
      }
      if (this.genero == 0) {
        this.errorGenero = 'Seleccione su Genero'
        this.error = 1;
      }
      if (this.ocr == '') {
        this.errorOCR = 'Escriba su OCR'
        this.error = 1;
      } else if (this.ocr.length < 12 || this.ocr.length > 13) {
        this.errorOCR = 'Escriba su OCR Valido'
        this.error = 1;
      }
      if (this.curso == '') {
        this.errorCurso = 'Verificar curso'
        this.error = 1;
      }
      if ( this.motivoSustitucion == '' ){
        this.errorMotivoSustitucion = 'Verificar motivo de sustitución'
        this.error = 1;
      }
      // if (this.sobrenombre == '') {
      // 	this.errorSobrenombre = 'Escriba su Sobrenombre'
      // 	this.error = 1;
      // }
      // if (this.fechaNacimiento == '') {
      // 	this.errorFechaNacimietno = 'Seleccione su Fecha de Nacimiento'
      // 	this.error = 1;
      // }
      // if (this.edad <= 17) {
      // 	this.errorEdad = 'Escriba su Edad'
      // 	this.error = 1;
      // }
      // if (this.ocupacion == '') {
      // 	this.errorOcupacion = 'Escriba su Ocupación'
      // 	this.error = 1;
      // }
      // if (this.lugarNacimiento == 0) {
      // 	this.errorLugarNacimiento = 'Seleccione su Lugar de Nacimiento'
      // 	this.error = 1;
      // }
      // if (this.domicilio == '') {
      // 	this.errorDomicilio = 'Escriba su domicilio'
      // 	this.error = 1;
      // }
      // if (this.tiempoResidencia == '') {
      // 	this.errorResidencia = 'Escriba el Tiempo de Residencia en el Domicilio'
      // 	this.error = 1;
      // }
      // if (this.telefono == '') {
      // 	this.errorTelefono = 'Escriba su numero de Teléfono'
      // 	this.error = 1;
      // }
      // if (this.correo == '') {
      // 	this.errorEmail = 'Escriba su Correo Electrónico'
      // 	this.error = 1;
      // }
      // if (this.accionesAfir == 0) {
      // 	this.errorAccionAfirmativa = 'Seleccione una Accion Afirmativa'
      // 	this.error = 1;
      // }
      // if (this.accionesAfir == 1 || this.accionesAfir == 2 || this.accionesAfir == 4) {
      // 	if (this.tAccionAfirmativa == 0) {
      // 		this.errorTipoAccionAfirmativa = 'Seleccione un Tipo de Accion Afirmativa'
      // 		this.error = 1;
      // 	}
      // }
      // if (this.puesto == "" && this.eleccion == 4) {
      //   this.error = 1;
      //   this.errorCargo = "Seleccione un Cargo";
      // }
    },
    buscarRegistroPartidoAsociado() {
      let par = "";
      let partidoPrincipal = "";
      let listpartidos = this.catPartidos;
      for (var i = 0; i < listpartidos.length; i++) {
        if (this.partidos == listpartidos[i].id) {
          par = listpartidos[i].siglas;
        }
      }
      let url = "/administracion/admin/buscarRegistroPartidoAsociado";
      axios
        .get(url, {
          params: {
            eleccion: this.eleccion,
            distrito: this.distrito,
            municipio: this.municipio,
            candidatura: this.candidatura,
            partidos: par,
          },
        })
        .then((response) => {
          this.BuscarPartido = response.data;
          if (this.BuscarPartido.length > 0) {
            this.candidaturaTipo = false;
            for (var a = 0; a < listpartidos.length; a++) {
              if (this.BuscarPartido[0].idPartido == listpartidos[a].id) {
                partidoPrincipal = listpartidos[a].siglas;
                this.mensaje(partidoPrincipal);
              }
            }
          } else {
            this.candidaturaTipo = true;
            this.quitarPartidoAsociado(par);
          }
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    mensaje(partido) {
      let mensaje =
        "Se ha encontrado un registro con el partido " +
        partido +
        ". \n Verifique los datos e inténtelo de nuevo.";
      Swal.fire({
        icon: "warning",
        title: mensaje,
        showConfirmButton: true,
        confirmButtonText: "De acuerdo",
      });
    },
    quitarPartidoAsociado(partido) {
      let url = "/administracion/usuario/cargarPartidos";
      axios
        .get(url)
        .then((response) => {
          let newarray = [];
          newarray = response.data;
          this.listPartidosAsociados = newarray.filter(
            (newarray) => newarray.siglas != partido
          );
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    ValidarPartidyPartidoAsociado() {
      let par = "";
      let asociado = 0;
      for (var a = 0; a < this.catPartidos.length; a++) {
        if (this.partidos == this.catPartidos[a].id) {
          par = this.catPartidos[a].siglas;
        }
      }
      for (var i = 0; i < this.partidoAsociados.length; i++) {
        if (par == this.partidoAsociados[i]) {
          asociado = 1;
        }
      }
      if (asociado == 1) {
        this.PartidyPartidoAsociado = 1;
      } else {
        this.PartidyPartidoAsociado = 0;
      }
    },

    // Métodos para Documentos
    selectChange(who) {
      switch (who) {
        case "F1":
          if (this.tieneDocumento.F1 == 0) {
            this.documentos.F1 = "";
          }
          break;
        case "F2":
          if (this.tieneDocumento.F2 == 0) {
            this.documentos.F2 = "";
          }
          break;
        case "F3":
          if (this.tieneDocumento.F3 == 0) {
            this.documentos.F3 = "";
          }
          break;
        case "D1":
          if (this.tieneDocumento.D1 == 0) {
            this.documentos.D1 = "";
          }
          break;
        case "D2":
          if (this.tieneDocumento.D2 == 0) {
            this.documentos.D2 = "";
          }
          break;
        case "D3":
          if (this.tieneDocumento.D3 == 0) {
            this.documentos.D3 = "";
          }
          break;
        case "D4":
          if (this.tieneDocumento.D4 == 0) {
            this.documentos.D4 = "";
          }
          break;
        case "D5":
          if (this.tieneDocumento.D5 == 0) {
            this.documentos.D5 = "";
          }
          break;
        case "D6":
          if (this.tieneDocumento.D6 == 0) {
            this.documentos.D6 = "";
          }
          break;
        case "D7":
          if (this.tieneDocumento.D7 == 0) {
            this.documentos.D7 = "";
          }
          break;
        case "D8":
          if (this.tieneDocumento.D8 == 0) {
            this.documentos.D8 = "";
          }
          break;
        case "F4":
          if (this.tieneDocumento.F4 == 0) {
            this.documentos.F4 = "";
          }
          break;
        case "D9":
          if (this.tieneDocumento.D9 == 0) {
            this.documentos.D9 = "";
          }
          break;
        case "D10":
          if (this.tieneDocumento.D10 == 0) {
            this.documentos.D10 = "";
          }
          break;
        case "D11":
          if (this.tieneDocumento.D11 == 0) {
            this.documentos.D11 = "";
          }
          break;
        case "F5":
          if (this.tieneDocumento.F5 == 0) {
            this.documentos.F5 = "";
          }
          break;
        case "F6":
          if (this.tieneDocumento.F6 == 0) {
            this.documentos.F6 = "";
          }
          break;
        case "F7":
          if (this.tieneDocumento.F7 == 0) {
            this.documentos.F7 = "";
          }
          break;
        case "F8":
          if (this.tieneDocumento.F8 == 0) {
            this.documentos.F8 = "";
          }
          break;
        case "D12":
          if (this.tieneDocumento.D12 == 0) {
            this.documentos.D12 = "";
          }
          break;
        case "F9I":
          if (this.tieneDocumento.F9I == 0) {
            this.documentos.F9I = "";
          }
          break;
        case "D13":
          if (this.tieneDocumento.D13 == 0) {
            this.documentos.D13 = "";
          }
          break;
        case "F9D":
          if (this.tieneDocumento.F9D == 0) {
            this.documentos.F9D = "";
          }
          break;
        case "D14":
          if (this.tieneDocumento.D14 == 0) {
            this.documentos.D14 = "";
          }
          break;
        case "F9S":
          if (this.tieneDocumento.F9S == 0) {
            this.documentos.F9S = "";
          }
          break;
        case "F10":
          if (this.tieneDocumento.F10 == 0) {
            this.documentos.F10 = "";
          }
          break;
        case "Q1":
          if (this.tieneDocumento.Q1 == 0) {
            this.documentos.Q1 = "";
          }
          break;
        case "Q2":
          if (this.tieneDocumento.Q2 == 0) {
            this.documentos.Q2 = "";
          }
          break;
        case "Q3":
          if (this.tieneDocumento.Q3 == 0) {
            this.documentos.Q3 = "";
          }
          break;
        case "Q3":
          if (this.tieneDocumento.Q3 == 0) {
            this.documentos.Q3 = "";
          }
          break;
        case "Q4":
          if (this.tieneDocumento.Q4 == 0) {
            this.documentos.Q4 = "";
          }
          break;
        case "Q5":
          if (this.tieneDocumento.Q5 == 0) {
            this.documentos.Q5 = "";
          }
          break;
        case "Q6":
          if (this.tieneDocumento.Q6 == 0) {
            this.documentos.Q6 = "";
          }
          break;
        case "Q7":
          if (this.tieneDocumento.Q7 == 0) {
            this.documentos.Q7 = "";
          }
          break;
        case "Q8":
          if (this.tieneDocumento.Q8 == 0) {
            this.documentos.Q8 = "";
          }
          break;
        default:
          break;
      }
    },

    handleF1(file, fileList) {
      this.documentos.F1 = this.handleChange(file, fileList);
    },
    handleF2(file, fileList) {
      this.documentos.F2 = this.handleChange(file, fileList);
    },
    handleF3(file, fileList) {
      this.documentos.F3 = this.handleChange(file, fileList);
    },
    handleD1(file, fileList) {
      this.documentos.D1 = this.handleChange(file, fileList);
    },
    handleD2(file, fileList) {
      this.documentos.D2 = this.handleChange(file, fileList);
    },
    handleD3(file, fileList) {
      this.documentos.D3 = this.handleChange(file, fileList);
    },
    handleD4(file, fileList) {
      this.documentos.D4 = this.handleChange(file, fileList);
    },
    handleD5(file, fileList) {
      this.documentos.D5 = this.handleChange(file, fileList);
    },
    handleD6(file, fileList) {
      this.documentos.D6 = this.handleChange(file, fileList);
    },
    handleD7(file, fileList) {
      this.documentos.D7 = this.handleChange(file, fileList);
    },
    handleD8(file, fileList) {
      this.documentos.D8 = this.handleChange(file, fileList);
    },
    handleF4(file, fileList) {
      this.documentos.F4 = this.handleChange(file, fileList);
    },
    handleD9(file, fileList) {
      this.documentos.D9 = this.handleChange(file, fileList);
    },
    handleD10(file, fileList) {
      this.documentos.D10 = this.handleChange(file, fileList);
    },
    handleD11(file, fileList) {
      this.documentos.D11 = this.handleChange(file, fileList);
    },
    handleF5(file, fileList) {
      this.documentos.F5 = this.handleChange(file, fileList);
    },
    handleF6(file, fileList) {
      this.documentos.F6 = this.handleChange(file, fileList);
    },
    handleF7(file, fileList) {
      this.documentos.F7 = this.handleChange(file, fileList);
    },
    handleF8(file, fileList) {
      this.documentos.F8 = this.handleChange(file, fileList);
    },
    handleD12(file, fileList) {
      this.documentos.D12 = this.handleChange(file, fileList);
    },
    handleF9I(file, fileList) {
      this.documentos.F9I = this.handleChange(file, fileList);
    },
    handleD13(file, fileList) {
      this.documentos.D13 = this.handleChange(file, fileList);
    },
    handleF9D(file, fileList) {
      this.documentos.F9D = this.handleChange(file, fileList);
    },
    handleD14(file, fileList) {
      this.documentos.D14 = this.handleChange(file, fileList);
    },
    handleF9S(file, fileList) {
      this.documentos.F9S = this.handleChange(file, fileList);
    },
    handleF10(file, fileList) {
      this.documentos.F10 = this.handleChange(file, fileList);
    },
    handleQ1(file, fileList) {
      this.documentos.Q1 = this.handleChange(file, fileList);
    },
    handleQ2(file, fileList) {
      this.documentos.Q2 = this.handleChange(file, fileList);
    },
    handleQ3(file, fileList) {
      this.documentos.Q3 = this.handleChange(file, fileList);
    },
    handleQ4(file, fileList) {
      this.documentos.Q4 = this.handleChange(file, fileList);
    },
    handleQ5(file, fileList) {
      this.documentos.Q5 = this.handleChange(file, fileList);
    },
    handleQ6(file, fileList) {
      this.documentos.Q6 = this.handleChange(file, fileList);
    },
    handleQ7(file, fileList) {
      this.documentos.Q7 = this.handleChange(file, fileList);
    },
    handleQ8(file, fileList) {
      this.documentos.Q8 = this.handleChange(file, fileList);
    },

    handleRemoveF1(file, fileList) {
      this.documentos.F1 = "";
    },
    handleRemoveF2(file, fileList) {
      this.documentos.F2 = "";
    },
    handleRemoveF3(file, fileList) {
      this.documentos.F3 = "";
    },
    handleRemoveD1(file, fileList) {
      this.documentos.D1 = "";
    },
    handleRemoveD2(file, fileList) {
      this.documentos.D2 = "";
    },
    handleRemoveD3(file, fileList) {
      this.documentos.D3 = "";
    },
    handleRemoveD4(file, fileList) {
      this.documentos.D4 = "";
    },
    handleRemoveD5(file, fileList) {
      this.documentos.D5 = "";
    },
    handleRemoveD6(file, fileList) {
      this.documentos.D6 = "";
    },
    handleRemoveD7(file, fileList) {
      this.documentos.D7 = "";
    },
    handleRemoveD8(file, fileList) {
      this.documentos.D8 = "";
    },
    handleRemoveF4(file, fileList) {
      this.documentos.F4 = "";
    },
    handleRemoveD9(file, fileList) {
      this.documentos.D9 = "";
    },
    handleRemoveD10(file, fileList) {
      this.documentos.D10 = "";
    },
    handleRemoveD11(file, fileList) {
      this.documentos.D11 = "";
    },
    handleRemoveF5(file, fileList) {
      this.documentos.F5 = "";
    },
    handleRemoveF6(file, fileList) {
      this.documentos.F6 = "";
    },
    handleRemoveF7(file, fileList) {
      this.documentos.F7 = "";
    },
    handleRemoveF8(file, fileList) {
      this.documentos.F8 = "";
    },
    handleRemoveD12(file, fileList) {
      this.documentos.D12 = "";
    },
    handleRemoveF9I(file, fileList) {
      this.documentos.F9I = "";
    },
    handleRemoveD13(file, fileList) {
      this.documentos.D13 = "";
    },
    handleRemoveF9D(file, fileList) {
      this.documentos.F9D = "";
    },
    handleRemoveD14(file, fileList) {
      this.documentos.D14 = "";
    },
    handleRemoveF9S(file, fileList) {
      this.documentos.F9S = "";
    },
    handleRemoveF10(file, fileList) {
      this.documentos.F10 = "";
    },
    handleRemoveQ1(file, fileList) {
      this.documentos.Q1 = "";
    },
    handleRemoveQ2(file, fileList) {
      this.documentos.Q2 = "";
    },
    handleRemoveQ3(file, fileList) {
      this.documentos.Q3 = "";
    },
    handleRemoveQ4(file, fileList) {
      this.documentos.Q4 = "";
    },
    handleRemoveQ5(file, fileList) {
      this.documentos.Q5 = "";
    },
    handleRemoveQ6(file, fileList) {
      this.documentos.Q6 = "";
    },
    handleRemoveQ7(file, fileList) {
      this.documentos.Q7 = "";
    },
    handleRemoveQ8(file, fileList) {
      this.documentos.Q8 = "";
    },

    handlePreview(file) { },

    limpiarDocumentos() {
      this.idDocumentacion = 0;
      this.documentos.F1 = "";
      this.documentos.F2 = "";
      this.documentos.F3 = "";
      this.documentos.D1 = "";
      this.documentos.D2 = "";
      this.documentos.D3 = "";
      this.documentos.D4 = "";
      this.documentos.D5 = "";
      this.documentos.D6 = "";
      this.documentos.D7 = "";
      this.documentos.D8 = "";
      this.documentos.F4 = "";
      this.documentos.D9 = "";
      this.documentos.D10 = "";
      this.documentos.D11 = "";
      this.documentos.F5 = "";
      this.documentos.F6 = "";
      this.documentos.F7 = "";
      this.documentos.F8 = "";
      this.documentos.D12 = "";
      this.documentos.F9I = "";
      this.documentos.D13 = "";
      this.documentos.F9D = "";
      this.documentos.D14 = "";
      this.documentos.F9S = "";
      this.documentos.F10 = "";
      this.documentos.Q1 = "";
      this.documentos.Q2 = "";
      this.documentos.Q3 = "";
      this.documentos.Q4 = "";
      this.documentos.Q5 = "";
      this.documentos.Q6 = "";
      this.documentos.Q7 = "";
      this.documentos.Q8 = "";
      this.tieneDocumento.F1 = 0;
      this.tieneDocumento.F2 = 0;
      this.tieneDocumento.F3 = 0;
      this.tieneDocumento.D1 = 0;
      this.tieneDocumento.D2 = 0;
      this.tieneDocumento.D3 = 0;
      this.tieneDocumento.D4 = 0;
      this.tieneDocumento.D5 = 0;
      this.tieneDocumento.D6 = 0;
      this.tieneDocumento.D7 = 0;
      this.tieneDocumento.D8 = 0;
      this.tieneDocumento.F4 = 0;
      this.tieneDocumento.D9 = 0;
      this.tieneDocumento.D10 = 0;
      this.tieneDocumento.D11 = 0;
      this.tieneDocumento.F5 = 0;
      this.tieneDocumento.F6 = 0;
      this.tieneDocumento.F7 = 0;
      this.tieneDocumento.F8 = 0;
      this.tieneDocumento.D12 = 0;
      this.tieneDocumento.F9I = 0;
      this.tieneDocumento.D13 = 0;
      this.tieneDocumento.F9D = 0;
      this.tieneDocumento.D14 = 0;
      this.tieneDocumento.F9S = 0;
      this.tieneDocumento.F10 = 0;
      this.tieneDocumento.Q1 = 0;
      this.tieneDocumento.Q2 = 0;
      this.tieneDocumento.Q3 = 0;
      this.tieneDocumento.Q4 = 0;
      this.tieneDocumento.Q5 = 0;
      this.tieneDocumento.Q6 = 0;
      this.tieneDocumento.Q7 = 0;
      this.tieneDocumento.Q8 = 0;
    },

    handleExceed(files, fileList) {
      Swal.fire({
        icon: "error",
        title: "Solo puede subir un documento para acreditar.",
        showConfirmButton: true,
        confirmButtonText: "De acuerdo",
      });
    },

    handleChange(file, fileList) {
      if (file.size > 5242880) {
        this.$refs.upload.clearFiles();
        Swal.fire({
          icon: "error",
          html: '<div class="col"><div class="swal2-title p-0 mb-2">¡El archivo excede el límite de carga permitido!</div><div class="swal2-title font-weight-normal p-0" style="font-size: 20px">Seleccione uno con menor peso</div></div>',
          showConfirmButton: true,
          confirmButtonText: "De acuerdo",
        });

        return "";
      } else {
        return file.raw;
      }
    },

    resetErrors() {
      // TODO: THIS
      this.errorTieneF1 = 0;
      this.errorF1 = "";
      this.errorTieneF2 = 0;
      this.errorF2 = "";
      this.errorTieneF3 = 0;
      this.errorF3 = "";
      this.errorTieneD1 = 0;
      this.errorD1 = "";
      this.errorTieneD2 = 0;
      this.errorD2 = "";
      this.errorTieneD3 = 0;
      this.errorD3 = "";
      this.errorTieneD4 = 0;
      this.errorD4 = "";
      this.errorTieneD5 = 0;
      this.errorD5 = "";
      this.errorTieneD6 = 0;
      this.errorD6 = "";
      this.errorTieneD7 = 0;
      this.errorD7 = "";
      this.errorTieneD8 = 0;
      this.errorD8 = "";
      this.errorTieneF4 = 0;
      this.errorF4 = "";
      this.errorTieneD9 = 0;
      this.errorD9 = "";
      this.errorTieneD10 = 0;
      this.errorD10 = "";
      this.errorTieneD11 = 0;
      this.errorD11 = "";
      this.errorTieneF5 = 0;
      this.errorF5 = "";
      this.errorTieneF6 = 0;
      this.errorF6 = "";
      this.errorTieneF7 = 0;
      this.errorF7 = "";
      this.errorTieneF8 = 0;
      this.errorF8 = "";
      this.errorTieneD12 = 0;
      this.errorD12 = "";
      this.errorTieneF9I = 0;
      this.errorF9I = "";
      this.errorTieneD13 = 0;
      this.errorD13 = "";
      this.errorTieneF9D = 0;
      this.errorF9D = "";
      this.errorTieneD14 = 0;
      this.errorD14 = "";
      this.errorTieneF9S = 0;
      this.errorF9S = "";
      this.errorTieneF10 = 0;
      this.errorF10 = "";
      this.errorTieneQ1 = 0;
      this.errorQ1 = "";
      this.errorTieneQ2 = 0;
      this.errorQ2 = "";
      this.errorTieneQ3 = 0;
      this.errorQ3 = "";
      this.errorTieneQ4 = 0;
      this.errorQ4 = "";
      this.errorTieneQ5 = 0;
      this.errorQ5 = "";
      this.errorTieneQ6 = 0;
      this.errorQ6 = "";
      this.errorTieneQ7 = 0;
      this.errorQ7 = "";
      this.errorTieneQ8 = 0;
      this.errorQ8 = "";
    },

    // método para reestablecer documentos y no se vuelvan a subir
    resetFiles() {
      this.documentos.F1 = "";
      this.documentos.F2 = "";
      this.documentos.F3 = "";
      this.documentos.D1 = "";
      this.documentos.D2 = "";
      this.documentos.D3 = "";
      this.documentos.D4 = "";
      this.documentos.D5 = "";
      this.documentos.D6 = "";
      this.documentos.D7 = "";
      this.documentos.D8 = "";
      this.documentos.F4 = "";
      this.documentos.D9 = "";
      this.documentos.D10 = "";
      this.documentos.D11 = "";
      this.documentos.F5 = "";
      this.documentos.F6 = "";
      this.documentos.F7 = "";
      this.documentos.F8 = "";
      this.documentos.D12 = "";
      this.documentos.F9I = "";
      this.documentos.D13 = "";
      this.documentos.F9D = "";
      this.documentos.D14 = "";
      this.documentos.F9S = "";
      this.documentos.F10 = "";
      this.documentos.Q1 = "";
      this.documentos.Q2 = "";
      this.documentos.Q3 = "";
      this.documentos.Q4 = "";
      this.documentos.Q5 = "";
      this.documentos.Q6 = "";
      this.documentos.Q7 = "";
      this.documentos.Q8 = "";
    },

    validarDocs() {
      this.error = 0;
      // DOCS GENERALES
      if (!this.tieneDocumento.F1) {
        this.errorTieneF1 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.F1 == 1 &&
          this.documentos.F1 == "" &&
          this.documentoDB.F1.name == ""
        ) {
          this.errorF1 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.F2) {
        this.errorTieneF2 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.F2 == 1 &&
          this.documentos.F2 == "" &&
          this.documentoDB.F2.name == ""
        ) {
          this.errorF2 = 1;
          this.error = 1;
        }
      }

      if (!this.tieneDocumento.D1) {
        this.errorTieneD1 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D1 == 1 &&
          this.documentos.D1 == "" &&
          this.documentoDB.D1.name == ""
        ) {
          this.errorD1 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.D2) {
        this.errorTieneD2 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D2 == 1 &&
          this.documentos.D2 == "" &&
          this.documentoDB.D2.name == ""
        ) {
          this.errorD2 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.D3) {
        this.errorTieneD3 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D3 == 1 &&
          this.documentos.D3 == "" &&
          this.documentoDB.D3.name == ""
        ) {
          this.errorD3 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.D4) {
        this.errorTieneD4 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D4 == 1 &&
          this.documentos.D4 == "" &&
          this.documentoDB.D4.name == ""
        ) {
          this.errorD4 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.D5) {
        this.errorTieneD5 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D5 == 1 &&
          this.documentos.D5 == "" &&
          this.documentoDB.D5.name == ""
        ) {
          this.errorD5 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.D6) {
        this.errorTieneD6 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D6 == 1 &&
          this.documentos.D6 == "" &&
          this.documentoDB.D6.name == ""
        ) {
          this.errorD6 = 1;
          this.error = 1;
        }
      }
      if (!this.tieneDocumento.D7) {
        this.errorTieneD7 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D7 == 1 &&
          this.documentos.D7 == "" &&
          this.documentoDB.D7.name == ""
        ) {
          this.errorD7 = 1;
          this.error = 1;
        }
      }

      if (!this.tieneDocumento.F4) {
        this.errorTieneF4 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.F4 == 1 &&
          this.documentos.F4 == "" &&
          this.documentoDB.F4.name == ""
        ) {
          this.errorF4 = 1;
          this.error = 1;
        }
      }

      if (!this.tieneDocumento.D12) {
        this.errorTieneD12 = 1;
        this.error = 1;
      } else {
        if (
          this.tieneDocumento.D12 == 1 &&
          this.documentos.D12 == "" &&
          this.documentoDB.D12.name == ""
        ) {
          this.errorD12 = 1;
          this.error = 1;
        }
      }



      if (this.reeleccionId >= 2) {
        if (!this.tieneDocumento.Q5) {
          this.errorTieneQ5 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.Q5 == 1 &&
            this.documentos.Q5 == "" &&
            this.documentoDB.Q5.name == ""
          ) {
            this.errorQ5 = 1;
            this.error = 1;
          }
        }

        if (!this.tieneDocumento.D9) {
          this.errorTieneD9 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.D9 == 1 &&
            this.documentos.D9 == "" &&
            this.documentoDB.D9.name == ""
          ) {
            this.errorD9 = 1;
            this.error = 1;
          }
        }

        if (!this.tieneDocumento.F8) {
          this.errorTieneF8 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.F8 == 1 &&
            this.documentos.F8 == "" &&
            this.documentoDB.F8.name == ""
          ) {
            this.errorF8 = 1;
            this.error = 1;
          }
        }
      }

      // REELECCIÓN
      if (this.idCandidatura == 2) {
        if (!this.tieneDocumento.D10) {
          this.errorTieneD10 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.D10 == 1 &&
            this.documentos.D10 == "" &&
            this.documentoDB.D10.name == ""
          ) {
            this.errorD10 = 1;
            this.error = 1;
          }
        }
        if (!this.tieneDocumento.D11) {
          this.errorTieneD11 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.D11 == 1 &&
            this.documentos.D11 == "" &&
            this.documentoDB.D11.name == ""
          ) {
            this.errorD11 = 1;
            this.error = 1;
          }
        }
        if (!this.tieneDocumento.F5) {
          this.errorTieneF5 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.F5 == 1 &&
            this.documentos.F5 == "" &&
            this.documentoDB.F5.name == ""
          ) {
            this.errorF5 = 1;
            this.error = 1;
          }
        }
      }

      // ACCIONES AFIRMATIVAS
      if (this.accionesAfir != 7 && this.accionesAfir != 8) {
        if (!this.tieneDocumento.F6) {
          this.errorTieneF6 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.F6 == 1 &&
            this.documentos.F6 == "" &&
            this.documentoDB.F6.name == ""
          ) {
            this.errorF6 = 1;
            this.error = 1;
          }
        }
        if (!this.tieneDocumento.F7) {
          this.errorTieneF7 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.F7 == 1 &&
            this.documentos.F7 == "" &&
            this.documentoDB.F7.name == ""
          ) {
            this.errorF7 = 1;
            this.error = 1;
          }
        }
      }


      // CANDIDATURAS INDEPENDIENTES
      if (this.idCandidatura == 4) {
        if (!this.tieneDocumento.Q2) {
          this.errorTieneQ2 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.Q2 == 1 &&
            this.documentos.Q2 == "" &&
            this.documentoDB.Q2.name == ""
          ) {
            this.errorQ2 = 1;
            this.error = 1;
          }
        }
        if (!this.tieneDocumento.Q3) {
          this.errorTieneQ3 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.Q3 == 1 &&
            this.documentos.Q3 == "" &&
            this.documentoDB.Q3.name == ""
          ) {
            this.errorQ3 = 1;
            this.error = 1;
          }
        }
        if (!this.tieneDocumento.Q4) {
          this.errorTieneQ4 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.Q4 == 1 &&
            this.documentos.Q4 == "" &&
            this.documentoDB.Q4.name == ""
          ) {
            this.errorQ4 = 1;
            this.error = 1;
          }
        }
      }

      // FOTOGRAFÍAS
      if (this.eleccion != 4) {
        if (!this.tieneDocumento.Q1) {
          this.errorTieneQ1 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.Q1 == 1 &&
            this.documentos.Q1 == "" &&
            this.documentoDB.Q1.name == ""
          ) {
            this.errorQ1 = 1;
            this.error = 1;
          }
        }
        if (!this.tieneDocumento.Q8) {
          this.errorTieneQ8 = 1;
          this.error = 1;
        } else {
          if (
            this.tieneDocumento.Q8 == 1 &&
            this.documentos.Q8 == "" &&
            this.documentoDB.Q8.name == ""
          ) {
            this.errorQ8 = 1;
            this.error = 1;
          }
        }
      }


      // if (!this.tieneDocumento.F3) {
      //   this.errorTieneF3 = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.F3 == 1 &&
      //     this.documentos.F3 == "" &&
      //     this.documentoDB.F3.name == ""
      //   ) {
      //     this.errorF3 = 1;
      //     this.error = 1;
      //   }
      // }

      // if (!this.tieneDocumento.D8) {
      //   this.errorTieneD8 = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.D8 == 1 &&
      //     this.documentos.D8 == "" &&
      //     this.documentoDB.D8.name == ""
      //   ) {
      //     this.errorD8 = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.F9I) {
      //   this.errorTieneF9I = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.F9I == 1 &&
      //     this.documentos.F9I == "" &&
      //     this.documentoDB.F9I.name == ""
      //   ) {
      //     this.errorF9I = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.D13) {
      //   this.errorTieneD13 = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.D13 == 1 &&
      //     this.documentos.D13 == "" &&
      //     this.documentoDB.D13.name == ""
      //   ) {
      //     this.errorD13 = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.F9D) {
      //   this.errorTieneF9D = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.F9D == 1 &&
      //     this.documentos.F9D == "" &&
      //     this.documentoDB.F9D.name == ""
      //   ) {
      //     this.errorF9D = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.D14) {
      //   this.errorTieneD14 = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.D14 == 1 &&
      //     this.documentos.D14 == "" &&
      //     this.documentoDB.D14.name == ""
      //   ) {
      //     this.errorD14 = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.F9S) {
      //   this.errorTieneF9S = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.F9S == 1 &&
      //     this.documentos.F9S == "" &&
      //     this.documentoDB.F9S.name == ""
      //   ) {
      //     this.errorF9S = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.F10) {
      //   this.errorTieneF10 = 1;
      //   this.error = 1;
      // } else {
      //   if (
      //     this.tieneDocumento.F10 == 1 &&
      //     this.documentos.F10 == "" &&
      //     this.documentoDB.F10.name == ""
      //   ) {
      //     this.errorF10 = 1;
      //     this.error = 1;
      //   }
      // }

      // if (!this.tieneDocumento.Q6) {
      //   this.errorTieneQ6 = 1;
      //   this.error = 1;
      // }
      // else {
      //   if (this.tieneDocumento.Q6 == 1 && this.documentos.Q6 == '' && this.documentoDB.Q6.name == '') {
      //     this.errorQ6 = 1;
      //     this.error = 1;
      //   }
      // }
      // if (!this.tieneDocumento.Q7) {
      //   this.errorTieneQ7 = 1;
      //   this.error = 1;
      // }
      // else {
      //   if (this.tieneDocumento.Q7 == 1 && this.documentos.Q7 == '' && this.documentoDB.Q7.name == '') {
      //     this.errorQ7 = 1;
      //     this.error = 1;
      //   }
      // }

      return this.error;
    },

    generarAcuseRegistro() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/reportes/registro/getAcuseRegistroCandidatoPDF';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        if (error.response.status == 401) {
          loading.close();
          sessionStorage.clear();
          location.reload();
        }
        loading.close();
      });
    },

    generarAcuseComunes() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseComunes';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuseAfirmativas() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseAfirmativas';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuseFotografias() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseFotografias';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuseReeleccionAyunta() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseReeleccionAyunta';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },
    generarAcuseReeleccionDip() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseReeleccionDip';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuseProtestaCargo() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseProtestaCargo';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuseNoMilitancia() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseNoMilitancia';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuseRenuncia() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuseRenuncia';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },

    generarAcuse5en1() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#00a19a',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let config = {
        responseType: 'blob',
        params: {
          'nIdCandidato': this.idcandidato,
        }
      };

      let url = '/formatos/registro/getAcuse5en1';
      axios.get(url, config).then(response => {
        let oMyBlob = new Blob([response.data], { type: 'application/pdf' });
        let urlpdf = URL.createObjectURL(oMyBlob);
        window.open(urlpdf);
        loading.close();
      }).catch(error => {
        loading.close();
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },


    async registrarDocumentos() {
      const loading = this.$vs.loading({
        type: "square",
        color: "#C2B280",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      try {
        this.resetErrors();

        this.validarDocs();

        if (this.error == 0) {
          let idF1 = 0;
          let idF2 = 0;
          let idF3 = 0;
          let idD1 = 0;
          let idD2 = 0;
          let idD3 = 0;
          let idD4 = 0;
          let idD5 = 0;
          let idD6 = 0;
          let idD7 = 0;
          let idD8 = 0;
          let idF4 = 0;
          let idD9 = 0;
          let idD10 = 0;
          let idD11 = 0;
          let idF5 = 0;
          let idF6 = 0;
          let idF7 = 0;
          let idF8 = 0;
          let idD12 = 0;
          let idF9I = 0;
          let idD13 = 0;
          let idF9D = 0;
          let idD14 = 0;
          let idF9S = 0;
          let idF10 = 0;
          let idQ1 = 0;
          let idQ2 = 0;
          let idQ3 = 0;
          let idQ4 = 0;
          let idQ5 = 0;
          let idQ6 = 0;
          let idQ7 = 0;
          let idQ8 = 0;

          if (this.tieneDocumento.F1 == 1) {
            idF1 = await this.setRegistrarArchivo(
              1,
              this.documentos.F1,
              "Doc_SolicitudRegistroPlanilla",
              ""
            );
            if (idF1 == -2) {
              throw new Error("Error al subir archivo F1");
            }
          }
          if (this.tieneDocumento.F2 == 1) {
            idF2 = await this.setRegistrarArchivo(
              2,
              this.documentos.F2,
              "Doc_Formato4en1",
              ""
            );
            if (idF2 == -2) {
              throw new Error("Error al subir archivo F2");
            }
          }
          if (this.tieneDocumento.F3 == 1) {
            idF3 = await this.setRegistrarArchivo(
              3,
              this.documentos.F3,
              "Doc_EscritoInclusionSobrenombre",
              ""
            );
            if (idF3 == -2) {
              throw new Error("Error al subir archivo F3");
            }
          }
          if (this.tieneDocumento.D1 == 1) {
            idD1 = await this.setRegistrarArchivo(
              4,
              this.documentos.D1,
              "Doc_CopiaSimpleActaNacimiento",
              ""
            );
            if (idD1 == -2) {
              throw new Error("Error al subir archivo D1");
            }
          }
          if (this.tieneDocumento.D2 == 1) {
            idD2 = await this.setRegistrarArchivo(
              5,
              this.documentos.D2,
              "Doc_CopiaSimpleINE_SIIAP",
              ""
            );
            if (idD2 == -2) {
              throw new Error("Error al subir archivo D2");
            }
          }
          if (this.tieneDocumento.D3 == 1) {
            idD3 = await this.setRegistrarArchivo(
              6,
              this.documentos.D3,
              "Doc_ConstanciaResidencia",
              ""
            );
            if (idD3 == -2) {
              throw new Error("Error al subir archivo D3");
            }
          }
          if (this.tieneDocumento.D4 == 1) {
            idD4 = await this.setRegistrarArchivo(
              7,
              this.documentos.D4,
              "Doc_DocumentoCiudadaniaPoblana",
              ""
            );
            if (idD4 == -2) {
              throw new Error("Error al subir archivo D4");
            }
          }
          if (this.tieneDocumento.D5 == 1) {
            idD5 = await this.setRegistrarArchivo(
              8,
              this.documentos.D5,
              "Doc_FAR-SNR",
              ""
            );
            if (idD5 == -2) {
              throw new Error("Error al subir archivo D5");
            }
          }
          if (this.tieneDocumento.D6 == 1) {
            idD6 = await this.setRegistrarArchivo(
              9,
              this.documentos.D6,
              "Doc_FAAR-SNR",
              ""
            );
            if (idD6 == -2) {
              throw new Error("Error al subir archivo D6");
            }
          }
          if (this.tieneDocumento.D7 == 1) {
            idD7 = await this.setRegistrarArchivo(
              10,
              this.documentos.D7,
              "Doc_InformeCapacidadEconomica",
              ""
            );
            if (idD7 == -2) {
              throw new Error("Error al subir archivo D7");
            }
          }
          // if (this.tieneDocumento.D8 == 1) {
          //   idD8 = await this.setRegistrarArchivo(
          //     11,
          //     this.documentos.D8,
          //     "Doc_ConstanciaAsistenciaCurso",
          //     ""
          //   );
          //   if (idD8 == -2) {
          //     throw new Error("Error al subir archivo D8");
          //   }
          // }
          if (this.tieneDocumento.F4 == 1) {
            idF4 = await this.setRegistrarArchivo(
              12,
              this.documentos.F4,
              "Doc_ConsentimientoParticiparRedCandidatas",
              ""
            );
            if (idF4 == -2) {
              throw new Error("Error al subir archivo F4");
            }
          }
          if (this.tieneDocumento.D9 == 1) {
            idD9 = await this.setRegistrarArchivo(
              13,
              this.documentos.D9,
              "Doc_DocumentoApruebaOrganosFacultadosPPPostularCandidaturasComunes",
              ""
            );
            if (idD9 == -2) {
              throw new Error("Error al subir archivo D9");
            }
          }
          if (this.tieneDocumento.D10 == 1) {
            idD10 = await this.setRegistrarArchivo(
              14,
              this.documentos.D10,
              "Doc_EmblemaColores",
              ""
            );
            if (idD10 == -2) {
              throw new Error("Error al subir archivo D10");
            }
          }
          if (this.tieneDocumento.D11 == 1) {
            idD11 = await this.setRegistrarArchivo(
              15,
              this.documentos.D11,
              "Doc_PlataformaElectoral",
              ""
            );
            if (idD11 == -2) {
              throw new Error("Error al subir archivo D11");
            }
          }
          if (this.tieneDocumento.F5 == 1) {
            idF5 = await this.setRegistrarArchivo(
              16,
              this.documentos.F5,
              "Doc_ReelecciónCartaCumplimientoArtículo208fCIPEEP",
              ""
            );
            if (idF5 == -2) {
              throw new Error("Error al subir archivo F5");
            }
          }
          if (this.tieneDocumento.F6 == 1) {
            idF6 = await this.setRegistrarArchivo(
              17,
              this.documentos.F6,
              "Doc_ManifestaciónLibreVoluntadReelegirseCargo",
              ""
            );
            if (idF6 == -2) {
              throw new Error("Error al subir archivo F6");
            }
          }
          if (this.tieneDocumento.F7 == 1) {
            idF7 = await this.setRegistrarArchivo(
              18,
              this.documentos.F7,
              "Doc_NoSuplencia",
              ""
            );
            if (idF7 == -2) {
              throw new Error("Error al subir archivo F7");
            }
          }
          if (this.tieneDocumento.F8 == 1) {
            idF8 = await this.setRegistrarArchivo(
              19,
              this.documentos.F8,
              "Doc_ManifiestoNoMilitancia",
              ""
            );
            if (idF8 == -2) {
              throw new Error("Error al subir archivo F8");
            }
          }
          if (this.tieneDocumento.D12 == 1) {
            idD12 = await this.setRegistrarArchivo(
              20,
              this.documentos.D12,
              "Doc_RenunciaAMilitanciaPartidoPoliticoPostuloPreviamente",
              ""
            );
            if (idD12 == -2) {
              throw new Error("Error al subir archivo D12");
            }
          }
          if (this.tieneDocumento.F9I == 1) {
            idF9I = await this.setRegistrarArchivo(
              21,
              this.documentos.F9I,
              "Doc_PostulaciónIndigenas",
              ""
            );
            if (idF9I == -2) {
              throw new Error("Error al subir archivo F9I");
            }
          }
          if (this.tieneDocumento.D13 == 1) {
            idD13 = await this.setRegistrarArchivo(
              22,
              this.documentos.D13,
              "Doc_VinculoComunidadIndigena",
              ""
            );
            if (idD13 == -2) {
              throw new Error("Error al subir archivo D13");
            }
          }
          if (this.tieneDocumento.F9D == 1) {
            idF9D = await this.setRegistrarArchivo(
              23,
              this.documentos.F9D,
              "Doc_PostulacionPersonasDiscapacidad",
              ""
            );
            if (idF9D == -2) {
              throw new Error("Error al subir archivo F9D");
            }
          }
          if (this.tieneDocumento.D14 == 1) {
            idD14 = await this.setRegistrarArchivo(
              24,
              this.documentos.D14,
              "Doc_CertificadoMedico_CredencialSistemaEstatalDIF",
              ""
            );
            if (idD14 == -2) {
              throw new Error("Error al subir archivo D14");
            }
          }
          if (this.tieneDocumento.F9S == 1) {
            idF9S = await this.setRegistrarArchivo(
              25,
              this.documentos.F9S,
              "Doc_PostulacionPersonasDiversidadSexual",
              ""
            );
            if (idF9S == -2) {
              throw new Error("Error al subir archivo F9S");
            }
          }
          if (this.tieneDocumento.F10 == 1) {
            idF10 = await this.setRegistrarArchivo(
              26,
              this.documentos.F10,
              "Doc_EscritoDesistimientoPlantilla",
              ""
            );
            if (idF10 == -2) {
              throw new Error("Error al subir archivo F10");
            }
          }
          if (this.tieneDocumento.Q1 == 1) {
            idQ1 = await this.setRegistrarArchivo(
              27,
              this.documentos.Q1,
              "Doc_ArchivoAdicional1",
              ""
            );
            if (idQ1 == -2) {
              throw new Error("Error al subir archivo Q1");
            }
          }
          if (this.tieneDocumento.Q2 == 1) {
            idQ2 = await this.setRegistrarArchivo(
              28,
              this.documentos.Q2,
              "Doc_ArchivoAdicional2",
              ""
            );
            if (idQ2 == -2) {
              throw new Error("Error al subir archivo Q2");
            }
          }
          if (this.tieneDocumento.Q3 == 1) {
            idQ3 = await this.setRegistrarArchivo(
              29,
              this.documentos.Q3,
              "Doc_ArchivoAdicional3",
              ""
            );
            if (idQ3 == -2) {
              throw new Error("Error al subir archivo Q3");
            }
          }
          if (this.tieneDocumento.Q4 == 1) {
            idQ4 = await this.setRegistrarArchivo(
              30,
              this.documentos.Q4,
              "Doc_ArchivoAdicional4",
              ""
            );
            if (idQ4 == -2) {
              throw new Error("Error al subir archivo Q4");
            }
          }
          if (this.tieneDocumento.Q5 == 1) {
            idQ5 = await this.setRegistrarArchivo(
              31,
              this.documentos.Q5,
              "Doc_ArchivoAdicional5",
              ""
            );
            if (idQ5 == -2) {
              throw new Error("Error al subir archivo Q5");
            }
          }
          // if (this.tieneDocumento.Q6 == 1) {
          // 	idQ6 = await this.setRegistrarArchivo(32, this.documentos.Q6, "Doc_ArchivoAdicional6", "");
          // 	if (idQ6 == -2) {
          // 		throw new Error("Error al subir archivo Q6")
          // 	}
          // }
          // if (this.tieneDocumento.Q7 == 1) {
          // 	idQ7 = await this.setRegistrarArchivo(33, this.documentos.Q7, "Doc_ArchivoAdicional7", "");
          // 	if (idQ7 == -2) {
          // 		throw new Error("Error al subir archivo Q7")
          // 	}
          // }
          if (this.eleccion != 4) {
            if (this.tieneDocumento.Q8 == 1) {
              idQ8 = await this.setRegistrarArchivo(
                34,
                this.documentos.Q8,
                "Doc_fotografia8",
                ""
              );
              if (idQ8 == -2) {
                throw new Error("Error al subir archivo Q8");
              }
            }
          }

          let url = "/administracion/usuario/RegistrarDatosDocumentacion";

          axios
            .post(url, {
              idcandidato: this.idcandidato,
              idDocF1: idF1,
              idDocF2: idF2,
              idDocF3: idF3,
              idDocD1: idD1,
              idDocD2: idD2,
              idDocD3: idD3,
              idDocD4: idD4,
              idDocD5: idD5,
              idDocD6: idD6,
              idDocD7: idD7,
              idDocD8: idD8,
              idDocF4: idF4,
              idDocD9: idD9,
              idDocD10: idD10,
              idDocD11: idD11,
              idDocF5: idF5,
              idDocF6: idF6,
              idDocF7: idF7,
              idDocF8: idF8,
              idDocD12: idD12,
              idDocF9I: idF9I,
              idDocD13: idD13,
              idDocF9D: idF9D,
              idDocD14: idD14,
              idDocF9S: idF9S,
              idDocF10: idF10,
              idDocQ1: idQ1,
              idDocQ2: idQ2,
              idDocQ3: idQ3,
              idDocQ4: idQ4,
              idDocQ5: idQ5,
              idDocQ6: idQ6,
              idDocQ7: idQ7,
              idDocQ8: idQ8,
            })
            .then((response) => {
              this.resetFiles();
              loading.close();
              Swal.fire({
                icon: "success",
                title: "Los datos se han registrado correctamente.",
                showConfirmButton: true,
                confirmButtonText: "De acuerdo",
              }).then((result) => {
                // this.$router.push({ name: 'usuario.expElect' });
                const loading = this.$vs.loading({
                  type: "square",
                  color: "#C2B280",
                  background: "#FFFFFF",
                  text: "Cargando...",
                });
                this.getDatosDocumentacion(loading);
              });
            })
            .catch((error) => {
              loading.close();
              let nombreMetodo = url.split('/');
              methods.catchHandler(error, nombreMetodo[3]);
            });
        } else {
          loading.close();
          Swal.fire({
            icon: "warning",
            title:
              'Algunos de los campos donde marcó "Sí" se encuentran vacíos. \n Seleccione un documento para continuar',
            showConfirmButton: true,
            confirmButtonText: "De acuerdo",
          });
        }
      } catch (error) {
        loading.close();
        this.catchHandler(error);
      }
    },

    async setRegistrarArchivo(ntipodoc, oDocumento, nombreArchivo, fileExt) {
      let idArchivo = 0;
      let seccionDoc = "registroCandidaturas";
      this.form.set("secciondoc", seccionDoc);
      this.form.set("ntipodoc", ntipodoc);
      this.form.set("archivo", oDocumento);
      this.form.set("filename", nombreArchivo);
      this.form.set("extension", fileExt);
      this.form.set("idcandidato", this.idcandidato);

      const config = { headers: { "Content-Type": "multipart/form-data" } };

      var url = "/archivos/subirArchivo";
      await axios
        .post(url, this.form, config)
        .then((response) => {
          idArchivo = response.data[0].idDoc;
        })
        .catch((error) => {
          idArchivo = -2;
        });

      return idArchivo;
    },

    async consultarFolio() {
      let url = "/administracion/usuario/consultarFolio";
      await axios
        .get(url, {
          params: {
            eleccion: this.eleccion,
          },
        })
        .then((response) => {
          this.formarFolio(response.data[0].folio, this.eleccion);
        }).catch(error => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    formarFolio(folio, elec) {
      let elecc = "";
      let par = "";
      for (var a = 0; a < this.arrayEleccion.length; a++) {
        if (elec == this.arrayEleccion[a].idEleccion) {
          elecc = this.arrayEleccion[a].Siglas;
        }
      }
      for (var i = 0; i < this.arrayPartidos.length; i++) {
        if (this.partidos == this.arrayPartidos[i].id) {
          par = this.arrayPartidos[i].siglas;
        }
      }
      this.folio = folio + "-" + elecc + "-" + par;
    },
    insertarFolio() {
      let url = "/administracion/usuario/insertarFolio";
      axios
        .post(url, {
          folio: this.folio,
          idCan: this.idCandidatura,
        })
        .then((response) => { })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },

    getDatosDocumentacion(loading) {
      this.limpiarDocumentos();
      let url = "/administracion/usuario/getDatosDocumentacion";

      axios
        .get(url, {
          params: {
            idcdto: this.idcandidato,
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
            // if (response.data[0].idD8 != null) {
            //   this.tieneDocumento.D8 = 1;
            //   this.documentos.D8 = {
            //     name: response.data[0].D8Name,
            //     url: response.data[0].D8Ruta,
            //   };
            // }
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
            // if (response.data[0].idQ6 != null) {
            //     this.tieneDocumento.Q6 = 1;
            //     this.documentos.Q6 = {
            //         name: response.data[0].Q6Name,
            //         url: response.data[0].Q6Ruta
            //     }
            // }
            // if (response.data[0].idQ7 != null) {
            //     this.tieneDocumento.Q7 = 1;
            //     this.documentos.Q7 = {
            //         name: response.data[0].Q7Name,
            //         url: response.data[0].Q7Ruta
            //     }
            // }
            if (response.data[0].idQ8 != null) {
              this.tieneDocumento.Q8 = 1;
              this.documentos.Q8 = {
                name: response.data[0].Q8Name,
                url: response.data[0].Q8Ruta,
              };
            }
          }
          loading.close();
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    consultarCandidatoID() {
      let nombre = "";
      const loading = this.$vs.loading({
        type: "square",
        color: "#C2B280",
        background: "#FFFFFF",
        text: "Cargando...",
      });
      let url = "/administracion/usuario/consultarCandidatoID";
      axios
        .get(url, {
          params: {
            idcandidato: this.id,
          },
        })
        .then((response) => {
          loading.close();
          if (response.data.length) {
            this.aspiranteboton = false;
            this.cargo = response.data[0].idpuesto;
            this.eleccion = response.data[0].idEleccion;
            this.puesto = response.data[0].tAyuntamiento;
            this.idCandidatura = response.data[0].idCandidatura;
            this.idCan
            this.candidatura = response.data[0].idTcandidatura;
            nombre =
              response.data[0].nombre +
              " " +
              response.data[0].app +
              " " +
              response.data[0].apm;
            this.nombresustituir = nombre;
            if (this.eleccion == 1) {
              this.reelecciondisable = true;
            } else if (this.eleccion == 2) {
              this.reelecciondisable = false;
            } else if (this.eleccion == 3) {
              this.reelecciondisable = false;
            } else if (this.eleccion == 4) {
              this.reelecciondisable = false;
            }
            // this.getDatosDocumentacion(loading)
          } else {
            loading.close();
            // this.candidato = false;
            //this.limpiarCampos()
            //this.aspiranteboton = false;
          }
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getTipoAccionesAfirmativas() {
      this.catTipoAcciones = [];
      let url = "/administracion/usuario/getTipoAccionesAfirmativas";
      axios
        .get(url, {
          params: {
            tipo: this.accionesAfir,
          },
        })
        .then((response) => {
          this.catTipoAcciones = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getReelecion() {
      let tRee = 0;
      if (this.eleccion == 2) {
        tRee = 4;
      } else if (this.eleccion == 4) {
        tRee = 3;
      } else {
        tRee = 2;
      }
      this.arrayReeleccion = [];
      let url = "/administracion/usuario/getReelecion";
      axios
        .get(url, {
          params: {
            tipo: tRee,
          },
        })
        .then((response) => {
          this.arrayReeleccion = response.data;
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    setSustitucionCandidato() {
      let idUsuarioRegistro = sessionStorage.getItem("idUsuario");
      let accionidUsuario = idUsuarioRegistro;
      let url = "/administracion/usuario/setSustitucionCandidato";
      axios
        .get(url, {
          params: {
            candidatoAnterior: this.id,
            candidatoNuevo: this.idcandidato,
          },
        })
        .then((response) => {
          this.getInsertarEstadoCandidato(idUsuarioRegistro, this.id, "Sustituido", "Sustitución");
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getInsertarEstadoCandidato(usuario, candidato, accion, estado) {
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
          this.getCambiarEstadoCandidato()
        }).catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    getCambiarEstadoCandidato() {
      let url = '/administracion/usuario/getCambiarEstadoCandidato'
      axios.get(url, {
        params: {
          id: this.id,
          estado: this.motivoSustitucion
        }
      }).then((response) => {
      }).catch((error) => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
    regresar() {
      window.history.back();
    },

    verificarTiempoApi() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#C2B280',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let url = '/administracion/usuario/verificarTiempoApi'
      let fechaActual = new Date();
      let fechaApi = new Date()
      let tiempoApi = '3300'
      let timeapi = sessionStorage.getItem('timeapi')
      if (timeapi => tiempoApi || timeapi == null) {
        axios.get(url).then(response => {
          fechaApi = new Date(`${response.data[0].tiempo}`);
          let resultado = fechaActual.getTime() - fechaApi.getTime()
          let segundos = Math.floor((resultado) / (1000));
          sessionStorage.setItem('timeapi', segundos)
          if (segundos >= tiempoApi) {
            loading.close()
            this.obtenerToken()
          } else {
            loading.close();
            this.jwttoken = response.data[0].api
            this.obtenerRegistroPorCveElectorPropietario()
          }
        }).catch((error) => {
          loading.close();
          console.log(error);
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
      }
    },
    validarINE() {
      this.error = 0;
      if (this.claveElector == '') {
        this.errorElector = 'Escriba su Clave de Elector';
        this.error = 1;
      } else if (this.claveElector.length < 18) {
        this.errorElector = 'Clave de Elector incorrecta';
        this.error = 1;
      }
      else if (!(/[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}/g.test(this.claveElector))) {
        this.errorElector = 'Ingrese una Clave de Elector Válida';
        this.error = 1;
      }
    },
    actualizarToken() {
      let url = '/administracion/usuario/actualizarToken'
      let fechaActual = new Date();
      let segundos = ''
      let resultado = ''
      axios.post(url, {
        'token': this.jwttoken,
        'fecha': fechaActual
      }).then(response => {
        resultado = fechaActual.getTime()
        segundos = Math.floor((resultado) / (1000));
        sessionStorage.setItem('timeapi', segundos)
        this.obtenerRegistroPorCveElectorPropietario()
      }).catch((error) => {
        loading.close();
        console.log(error);
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });

    },
    obtenerToken() {
      const url = 'https://wssnr-opl.ine.mx/ws_snr_opl/exposed/authenticate';
      axios.post(url, {
        claveInicial: '71t8=I2oV}Y4m',
        usuario: 'consulta_opl_pue_21',
      }).then((response) => {
        this.jwttoken = response.data.jwtToken;
        this.actualizarToken();
      }).catch((error) => {
        console.log(error);
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, 'obtenerTokenINE');
      });
    },
    obtenerRegistroPorCveElectorPropietario() {
      this.validarINE();
      const loading = this.$vs.loading({
        type: 'square',
        color: '#C2B280',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      if (this.errorElector.length == 0) {
        const jwtToken = this.jwttoken
        const url = 'https://wssnr-opl.ine.mx/ws_snr_opl/obtenerRegistroPorCveElector/propietario';
        const params = {
          "claveElector": this.claveElector,
          "idEntidad": 21,
          "idProcesoElectoral": 230,
          "idProcesoGeneral": 25
        }
        const config = {
          headers: {
            'Authorization': `Bearer ${jwtToken}`,
          }
        }
        axios.post(url, params, config).then(response => {
          loading.close();
          let datos = ''

          datos = '<br><b>Clave de Elector: </b>' + this.claveElector

          if (response.data[0].propietario.nombre != null) {
            datos = datos + '<br><b>Nombre(s): </b>' + response.data[0].propietario.nombre
          }
          if (response.data[0].propietario.primerApellido != null) {
            datos = datos + '<br><b>Primer Apellido: </b>' + response.data[0].propietario.primerApellido
          }
          if (response.data[0].propietario.segundoApellido != null) {
            datos = datos + '<br><b>Segundo Apellido: </b>' + response.data[0].propietario.segundoApellido
          }
          if (response.data[0].propietario.fechaNacimiento != null) {
            datos = datos + '<br><b>Fecha de Nacimiento: </b>' + response.data[0].propietario.fechaNacimiento
          }
          if (response.data[0].propietario.ocr != null) {
            datos = datos + '<br><b>OCR: </b>' + response.data[0].propietario.ocr
          }
          if (this.genero > 0) {
            datos = datos + '<br><b>Género: </b>' + this.catgenero[this.genero - 1].Tipo
          }

          this.lugar.forEach(lugarN => {
            if (this.lugarNacimiento == lugarN.idENTIDAD) {
              datos = datos + '<br><b> Lugar de Nacimiento : </b>' + lugarN.NOMBRE
            }
          });

          if (this.accionesAfir > 0) {
            this.catAcciones.forEach(catAccion => {
              if (this.accionesAfir == catAccion.idAccionesAfirmativas) {
                datos = datos + '<br><b> Acción Afirmativa : </b>' + catAccion.Nombre
              }
            });
          }
          if (this.tAccionAfirmativa > 0) {
            this.catTipoAcciones.forEach(tipoAfirmativa => {
              if (this.tAccionAfirmativa == tipoAfirmativa.id) {
                datos = datos + '<br><b> Tipo Acción Afirmativa : </b>' + tipoAfirmativa.descripcion
              }
            });
          }

          if (this.reeleccion > 0) {
            this.arrayReeleccion.forEach(reeleccionTipo => {
              if (this.reeleccion == reeleccionTipo.idReelecion) {
                datos = datos + '<br><b> Opta por Reelección : </b>' + reeleccionTipo.tipo
              }
            });
          }

          Swal.fire({
            icon: 'success',
            html: '<h3><b>Se encontraron los siguentes datos:</h3> </b><div style="text-align: left">' + datos + '</div> <b> ¿Desea registrar esta información?</b> ',
            confirmButtonColor: '#3085d6',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: "No",
            reverseButtons: true,
          }).then((result) => {
            if (result.value) {
              let genero = ''
              let fehcaN = ''
              let fecha_nac = ''
              fehcaN = response.data[0].propietario.fechaNacimiento
              fecha_nac = fehcaN
              const [dia, mes, ano] = fecha_nac.split(";");
              let cambiada = `${ano}-${mes}-${dia}`;
              if (response.data[0].propietario.sexo == 'H') {
                genero = 1
              } else if (response.data[0].propietario.sexo == 'M') {
                genero = 2
              } else {
                genero = 3
              }

              this.nombre = (response.data[0].propietario.nombre != null) ? response.data[0].propietario.nombre : '';
              this.apellidoP = (response.data[0].propietario.primerApellido != null) ? response.data[0].propietario.primerApellido : '';
              this.apelliodoM = (response.data[0].propietario.segundoApellido != null) ? response.data[0].propietario.segundoApellido : '';
              this.genero = (genero != null) ? genero : '';
              this.sobrenombre = (response.data[0].propietario.sobrenombre != null) ? response.data[0].propietario.sobrenombre : '';
              this.fechaNacimiento = (cambiada != null) ? cambiada : '';
              this.ocr = (response.data[0].propietario.ocr != null) ? response.data[0].propietario.ocr : '';
              this.getAge()
            }
          })
        }).catch((error) => {
          loading.close();
          if (error.response.status == 404) {
            this.obtenerRegistroPorCveElectorSuplente()
          } else {
            methods.catchHandler(error, 'registroPropietarioINE');
          }
        });
      } else {
        loading.close();
      }
    },
    obtenerRegistroPorCveElectorSuplente() {

      this.validarINE();
      const loading = this.$vs.loading({
        type: 'square',
        color: '#C2B280',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      if (this.errorElector.length == 0) {
        const jwtToken = this.jwttoken
        const url = 'https://wssnr-opl.ine.mx/ws_snr_opl/obtenerRegistroPorCveElector/suplente';
        const params = {
          "claveElector": this.claveElector,
          "idEntidad": 21,
          "idProcesoElectoral": 230,
          "idProcesoGeneral": 25
        }
        const config = {
          headers: {
            'Authorization': `Bearer ${jwtToken}`,
          }
        }
        axios.post(url, params, config).then(response => {
          let datos = ''
          loading.close();

          datos = '<br><b>Clave de Elector: </b>' + this.claveElector

          if (response.data[0].suplente.nombre != null) {
            datos = datos + '<br><b>Nombre(s): </b>' + response.data[0].suplente.nombre
          }
          if (response.data[0].suplente.primerApellido != null) {
            datos = datos + '<br><b>Primer Apellido: </b>' + response.data[0].suplente.primerApellido
          }
          if (response.data[0].suplente.segundoApellido != null) {
            datos = datos + '<br><b>Segundo Apellido: </b>' + response.data[0].suplente.segundoApellido
          }
          if (response.data[0].suplente.fechaNacimiento != null) {
            datos = datos + '<br><b>Fecha de Nacimiento: </b>' + response.data[0].suplente.fechaNacimiento
          }
          if (response.data[0].suplente.ocr != null) {
            datos = datos + '<br><b>OCR: </b>' + response.data[0].suplente.ocr
          }
          if (this.genero > 0) {
            datos = datos + '<br><b>Género: </b>' + this.catgenero[this.genero - 1].Tipo
          }

          this.lugar.forEach(lugarN => {
            if (this.lugarNacimiento == lugarN.idENTIDAD) {
              datos = datos + '<br><b> Lugar de Nacimiento : </b>' + lugarN.NOMBRE
            }
          });

          if (this.accionesAfir > 0) {
            this.catAcciones.forEach(catAccion => {
              if (this.accionesAfir == catAccion.idAccionesAfirmativas) {
                datos = datos + '<br><b> Acción Afirmativa : </b>' + catAccion.Nombre
              }
            });
          }
          if (this.tAccionAfirmativa > 0) {
            this.catTipoAcciones.forEach(tipoAfirmativa => {
              if (this.tAccionAfirmativa == tipoAfirmativa.id) {
                datos = datos + '<br><b> Tipo Acción Afirmativa : </b>' + tipoAfirmativa.descripcion
              }
            });
          }

          if (this.reeleccion > 0) {
            this.arrayReeleccion.forEach(reeleccionTipo => {
              if (this.reeleccion == reeleccionTipo.idReelecion) {
                datos = datos + '<br><b> Opta por Reelección : </b>' + reeleccionTipo.tipo
              }
            });
          }

          Swal.fire({
            icon: 'success',
            html: '<h3><b>Se encontraron los siguentes datos:</h3> </b><div style="text-align: left">' + datos + '</div> <b> ¿Desea registrar esta información?</b> ',
            confirmButtonColor: '#3085d6',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: "No",
            reverseButtons: true,
          }).then((result) => {
            if (result.value) {
              let genero = ''
              let fehcaN = ''
              let fecha_nac = ''
              fehcaN = response.data[0].suplente.fechaNacimiento
              fecha_nac = fehcaN
              const [dia, mes, ano] = fecha_nac.split(";");
              let cambiada = `${ano}-${mes}-${dia}`;
              if (response.data[0].suplente.sexo == 'H') {
                genero = 1
              } else if (response.data[0].suplente.sexo == 'M') {
                genero = 2
              } else {
                genero = 3
              }

              this.nombre = (response.data[0].suplente.nombre != null) ? response.data[0].suplente.nombre : '';
              this.apellidoP = (response.data[0].suplente.primerApellido != null) ? response.data[0].suplente.primerApellido : '';
              this.apelliodoM = (response.data[0].suplente.segundoApellido != null) ? response.data[0].suplente.segundoApellido : '';
              this.genero = (genero != null) ? genero : '';
              this.sobrenombre = (response.data[0].suplente.sobrenombre != null) ? response.data[0].suplente.sobrenombre : '';
              this.fechaNacimiento = (cambiada != null) ? cambiada : '';
              this.ocr = (response.data[0].suplente.ocr != null) ? response.data[0].suplente.ocr : '';
              this.getAge()
            }
          })

        }).catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, 'registroSuplenteINE');
        });
      }
    },
    getListarTipoSustituciones() {
      let url = '/administracion/usuario/getListarTipoSustituciones'
      axios.get(url).then(response => {
        this.catSustituciones = response.data
      }).catch(error => {
        console.log(error);
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      })
    },
    //populares
    populares() {
      const loading = this.$vs.loading({
        type: 'square',
        color: '#C2B280',
        background: '#FFFFFF',
        text: 'Cargando...'
      });
      let url = "https://popular.ieepuebla.org.mx/api/avances/getUserProgress"
      let proceso = 0
      axios.get(url, {
        params: {
          'clvElector': this.claveElector
        }
      }).then(response => {
        if (response.data.length > 0) {
          loading.close();
          proceso = response.data[0].count_progress
          if (proceso == 0) {
            this.curso = 3
          } else if (proceso == 5) {
            this.curso = 1
          } else if (proceso >= 0) {
            this.curso = 2
          }
        } else {
          loading.close();
          this.curso = 3
        }
      }).catch(error => {
        loading.close();
        this.curso = 3
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, 'popularesAvances');
      })
    },
  },
};
</script>