<template>
    <div class="col">
        <div class="float-ms-right mr-5">
            <ul class="breadcrumb">
                <li>
                    <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                </li>
                <li class="breadActive">
                    <span>
                        Captura
                    </span>
                </li>
            </ul>
        </div>
        <div class="row col-md-11 col-10 mx-auto card card-info  px-0"
            style="border-radius: 1.25rem !important; margin-bottom: 2.7rem; box-shadow: var(--iee-shadow) !important;">
            <div class="card-header">
                <h3 class="col card-title font-weight-bold">Captura de Solicitudes</h3>
            </div>
            <div class=" p-4 container-fluid" style="background-color: var(--iee-white) !important;">
                <div class="row mx-12 mb-12 p-4">
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Tipo</label>
                        <vs-select placeholder="Seleccione una opción" v-model="tipoDoc" v-if="catTipoDoc.length > 0"
                            filter :color="colors[0].color" autocomplete="off">
                            <template #message-danger v-if="errorTipoDoc.length > 0">
                                {{ errorTipoDoc }}
                            </template>
                            <vs-option v-for="(item, index) in catTipoDoc" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <template v-if="tipoDoc == 1">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Capitulos</label>
                            <vs-select placeholder="Seleccione una opción" v-model="Capitulo" :key="'capitulo' + tipoDoc"
                                v-if="catCapitulo.length > 0" filter :color="colors[0].color" autocomplete="off">
                                <template #message-danger v-if="errorCapitulo.length > 0">
                                    {{ errorCapitulo }}
                                </template>
                                <vs-option v-for="(item, index) in catCapitulo" :key="index" :label="item.serie"
                                    :value="item.id">
                                    {{ item.serie }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Número de Folio</label>
                            <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after :key="'folio' + tipoDoc"
                                placeholder="Número de folio" v-model="nfolio" autocomplete="off">
                                <template #message-danger v-if="errorNFolio.length > 0">
                                    {{ errorNFolio }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Fecha de Recibido</label>
                            <el-date-picker type="date" placeholder="Fecha de Recibido" format="dd-MM-yyyy" :key="'fRecibido' + tipoDoc"
                                :picker-options="pickerOptions" value-format="yyyy-MM-dd" v-model="fechaRecibido">
                            </el-date-picker>
                            <div class="danger-message">
                                <template v-if="errorFechaRecibido.length > 0">
                                    {{ errorFechaRecibido }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Hora de Recibido</label>
                            <el-time-select v-model="hora" placeholder="Hora de Recibido" :key="'hRecibido' + tipoDoc">
                            </el-time-select>
                            <div class="danger-message">
                                <template v-if="errorHora.length > 0">
                                    {{ errorHora }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Area que Solicita</label>
                            <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" :key="'aSolicita' + tipoDoc"
                                v-model="areaSolicita" v-if="cat_departamentos.length > 0" autocomplete="off">
                                <template #message-danger v-if="errorAreaSolicita.length > 0">
                                    {{ errorAreaSolicita }}
                                </template>
                                <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                    :value="item.id">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Asignar Requisición</label>
                            <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" :key="'aAsignada' + tipoDoc"
                                v-model="areaAsignada" v-if="cat_departamentos.length > 0" autocomplete="off">
                                <template #message-danger v-if="errorAreaAsignada.length > 0">
                                    {{ errorAreaAsignada }}
                                </template>
                                <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                    :value="item.id">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                    </template>
                    <template v-else-if="tipoDoc == 2">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Area que Solicita</label>
                            <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" :key="'aSolicita' + tipoDoc"
                                v-model="areaSolicita" v-if="cat_departamentos.length > 0" autocomplete="off">
                                <template #message-danger v-if="errorAreaSolicita.length > 0">
                                    {{ errorAreaSolicita }}
                                </template>
                                <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                    :value="item.id">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Número de Memorándum</label>
                            <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after :key="'nMemo' + tipoDoc"
                                placeholder="Número de folio" v-model="nMemorandum" autocomplete="off">
                                <template #message-danger v-if="errorNMemorandum.length > 0">
                                    {{ errorNMemorandum }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Asunto</label>
                            <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after placeholder="Asunto" :key="'asunto' + tipoDoc"
                                v-model="asunto" autocomplete="off">
                                <template #message-danger v-if="errorAsunto.length > 0">
                                    {{ errorAsunto }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Número de Folio</label>
                            <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after :key="'nFolio' + tipoDoc"
                                placeholder="Número de folio" v-model="nfolio" autocomplete="off">
                                <template #message-danger v-if="errorNFolio.length > 0">
                                    {{ errorNFolio }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Fecha de Recibido</label>
                            <el-date-picker type="date" placeholder="Fecha de Recibido" format="dd-MM-yyyy" :key="'fRecibido' + tipoDoc"
                                :picker-options="pickerOptions" value-format="yyyy-MM-dd" v-model="fechaRecibido">
                            </el-date-picker>
                            <div class="danger-message">
                                <template v-if="errorFechaRecibido.length > 0">
                                    {{ errorFechaRecibido }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Hora de Recibido</label>
                            <el-time-select v-model="hora" placeholder="Hora de Recibido" :key="'hRecibido' + tipoDoc">
                            </el-time-select>
                            <div class="danger-message">
                                <template v-if="errorHora.length > 0">
                                    {{ errorHora }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Termino</label>
                            <vs-select placeholder="Seleccione una opción" v-model="termino" :key="'termino' + tipoDoc"
                                v-if="catTermino.length > 0" :color="colors[0].color" filter autocomplete="off">
                                <template #message-danger v-if="errorTermino.length > 0">
                                    {{ errorTermino }}
                                </template>
                                <vs-option v-for="(item, index) in catTermino" :key="index" :label="item.nombre"
                                    :value="item.idTermino">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <template v-if="termino == 1">
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">Fecha de Termino</label>
                                <el-date-picker type="date" placeholder="Fecha de Termino" :key="'fTermino' + tipoDoc"
                                    :picker-options="pickerOptions2" format="dd-MM-yyyy" value-format="yyyy-MM-dd"
                                    v-model="fechaTermino">
                                </el-date-picker>
                                <div class="danger-message">
                                    <template v-if="errorFechaTermino.length > 0">
                                        {{ errorFechaTermino }}
                                    </template>
                                </div>
                            </div>
                        </template>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Asignar</label>
                            <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" :key="'asignar' + tipoDoc"
                                v-model="areaAsignada" v-if="cat_departamentos.length > 0" autocomplete="off">
                                <template #message-danger v-if="errorAreaAsignada.length > 0">
                                    {{ errorAreaAsignada }}
                                </template>
                                <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                    :value="item.id">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Requiere Respuesta</label>
                            <vs-select placeholder="Seleccione una opción" v-model="respuesta" :key="'respuesta' + tipoDoc"
                                v-if="selectSiNo.length > 0" :color="colors[0].color" filter autocomplete="off">
                                <template #message-danger v-if="errorRespuesta.length > 0">
                                    {{ errorRespuesta }}
                                </template>
                                <vs-option v-for="(item, index) in selectSiNo" :key="index" :label="item.opcion"
                                    :value="item.idSelect">
                                    {{ item.opcion }}
                                </vs-option>
                            </vs-select>
                        </div>
                    </template>
                    <template v-else-if="tipoDoc == 3">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Número de Oficio </label>
                            <vs-input id="Remitente" color="#C2B280" icon-after placeholder="Número de Oficio" :key="'nOficio' + tipoDoc"
                                v-model="nOficio" autocomplete="off">
                                <template #message-danger v-if="errorNOficio.length > 0">
                                    {{ errorNOficio }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Remitente </label>
                            <vs-input id="Remitente" color="#C2B280" icon-after placeholder="Remitente" :key="'remitente' + tipoDoc"
                                v-model="remitente" autocomplete="off">
                                <template #message-danger v-if="errorRemitente.length > 0">
                                    {{ errorRemitente }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Cargo </label>
                            <vs-input id="Cargo" color="#C2B280" icon-after placeholder="Cargo" v-model="cargo" :key="'cargo' + tipoDoc"
                                autocomplete="off">
                                <template #message-danger v-if="errorCargo.length > 0">
                                    {{ errorCargo }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Asunto</label>
                            <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after placeholder="Asunto" :key="'asunto' + tipoDoc"
                                v-model="asunto" autocomplete="off">
                                <template #message-danger v-if="errorAsunto.length > 0">
                                    {{ errorAsunto }}
                                </template>
                            </vs-input>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Termino</label>
                            <vs-select placeholder="Seleccione una opción" v-model="termino" :key="'termino' + tipoDoc"
                                v-if="catTermino.length > 0" :color="colors[0].color" filter autocomplete="off">
                                <template #message-danger v-if="errorTermino.length > 0">
                                    {{ errorTermino }}
                                </template>
                                <vs-option v-for="(item, index) in catTermino" :key="index" :label="item.nombre"
                                    :value="item.idTermino">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <template v-if="termino == 1">
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">Fecha de Termino</label>
                                <el-date-picker type="date" placeholder="Fecha de Termino" :key="'fTermino' + tipoDoc"
                                    :picker-options="pickerOptions2" format="dd-MM-yyyy" value-format="yyyy-MM-dd"
                                    v-model="fechaTermino">
                                </el-date-picker>
                                <div class="danger-message">
                                    <template v-if="errorFechaTermino.length > 0">
                                        {{ errorFechaTermino }}
                                    </template>
                                </div>
                            </div>
                        </template>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Asignar</label>
                            <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" :key="'asignar' + tipoDoc"
                                v-model="areaAsignada" v-if="cat_departamentos.length > 0" autocomplete="off">
                                <template #message-danger v-if="errorAreaAsignada.length > 0">
                                    {{ errorAreaAsignada }}
                                </template>
                                <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                    :value="item.id">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Fecha de Recibido</label>
                            <el-date-picker type="date" placeholder="Fecha de Recibido" format="dd-MM-yyyy" :key="'fRecibido' + tipoDoc"
                                :picker-options="pickerOptions" value-format="yyyy-MM-dd" v-model="fechaRecibido">
                            </el-date-picker>
                            <div class="danger-message">
                                <template v-if="errorFechaRecibido.length > 0">
                                    {{ errorFechaRecibido }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Hora de Recibido</label>
                            <el-time-select v-model="hora" placeholder="Hora de Recibido" :key="'hRecibido' + tipoDoc">
                            </el-time-select>
                            <div class="danger-message">
                                <template v-if="errorHora.length > 0">
                                    {{ errorHora }}
                                </template>
                            </div>
                        </div>
                    </template>
                    <template v-else-if="tipoDoc == 4">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Fecha de Recibido</label>
                            <el-date-picker type="date" placeholder="Fecha de Recibido" format="dd-MM-yyyy" :key="'fRecibido' + tipoDoc"
                                :picker-options="pickerOptions" value-format="yyyy-MM-dd" v-model="fechaRecibido">
                            </el-date-picker>
                            <div class="danger-message">
                                <template v-if="errorFechaRecibido.length > 0">
                                    {{ errorFechaRecibido }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Hora de Recibido</label>
                            <el-time-select v-model="hora" placeholder="Hora de Recibido" :key="'hRecibido' + tipoDoc">
                            </el-time-select>
                            <div class="danger-message">
                                <template v-if="errorHora.length > 0">
                                    {{ errorHora }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Area que Solicita</label>
                            <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" :key="'aSolicita' + tipoDoc"
                                v-model="areaSolicita" v-if="cat_departamentos.length > 0" autocomplete="off">
                                <template #message-danger v-if="errorAreaSolicita.length > 0">
                                    {{ errorAreaSolicita }}
                                </template>
                                <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                    :value="item.id">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Asunto</label>
                            <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after placeholder="Asunto" :key="'asunto' + tipoDoc"
                                v-model="asunto" autocomplete="off">
                                <template #message-danger v-if="errorAsunto.length > 0">
                                    {{ errorAsunto }}
                                </template>
                            </vs-input>
                        </div>
                    </template>
                </div>
                <div class="row mx-12 mb-12 p-4">
                    <div class="col-sm-6 col-md-5 col-xl-5 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Cargar Archivo</label>
                        <div class="row px-0 pr-sm-5 pb-3">
                            <div class="col-md-6">
                                <el-upload class="upload-demo col-md-12"
                                    action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF1"
                                    accept="application/pdf" :on-preview="handlePreview" :on-remove="handleRemoveF1"
                                    multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false" ref="upload">
                                    <vs-button type="primary"
                                        style="background-color: #af8909; border-color: #af8909;"><strong
                                            style="color: white !important;">Clic
                                            para
                                            subir
                                            archivo</strong></vs-button>
                                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF
                                    </div>
                                </el-upload>
                                <div class="danger-message">
                                    <template v-if="errorF1 == 1">
                                        Seleccione un archivo para subir
                                    </template>
                                </div>
                            </div>
                        </div>
                    </div>
                    <template v-if="tipoDoc == 4">
                        <div class="col-sm-6 col-md-5 col-xl-5 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Seguimiento</label>
                            <vs-select multiple filter :key="'seguimiento' + tipoDoc"
                                :placeholder="(seguimiento.length > 0) ? '' : 'Seleccione una opción'"
                                v-model="seguimiento" v-if="cat_seguimiento.length > 0" :color="colors[0].color"
                                autocomplete="off">
                                <template #message-danger v-if="errorSeguimiento.length > 0">
                                    {{ errorSeguimiento }}
                                </template>
                                <vs-option v-for="(item, index) in cat_seguimiento" :key="index" :label="item.nombre"
                                    :value="item.idSeguimiento">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                    </template>
                    <template v-else>
                        <div class="col-sm-6 col-md-5 col-xl-5 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Seguimiento</label>
                            <vs-select placeholder="Seleccione una opción" v-model="seguimiento" :key="'seguimiento' + tipoDoc"
                                v-if="cat_seguimiento.length > 0" :color="colors[0].color" filter autocomplete="off">
                                <template #message-danger v-if="errorSeguimiento.length > 0">
                                    {{ errorSeguimiento }}
                                </template>
                                <vs-option v-for="(item, index) in cat_seguimiento" :key="index" :label="item.nombre"
                                    :value="item.idSeguimiento">
                                    {{ item.nombre }}
                                </vs-option>
                            </vs-select>
                        </div>
                    </template>
                    <div class="col-sm-10 col-md-10 col-xl-10 px-0 pr-sm-5 pb-5">
                        <label class="col-form-label">Copias de Conocimiento</label>
                        <vs-select multiple filter
                            :placeholder="(copiasConocimiento.length > 0) ? '' : 'Seleccione una opción'"
                            v-model="copiasConocimiento" v-if="cat_departamentos.length > 0" autocomplete="off"
                            :color="colors[0].color">
                            <template #message-danger v-if="errorCopiasConocimiento.length > 0">
                                {{ errorCopiasConocimiento }}
                            </template>
                            <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="row mx-12 mb-12 p-4">
                        <div class="col-sm-12 col-md-8 col-xl-6 px-0 pr-sm-5 pb-3">
                            <div class="d-flex justify-content-center">
                                <vs-button style="width: 19vw; " color="#a5904a" block
                                    @click.prevent="guardarSolicitud">
                                    <b style="font-size: medium !important;">
                                        Registrar
                                    </b>
                                </vs-button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import methods from '../../../methods';
export default {
    data() {
        return {
            error: false,

            colors: [
                {
                    color: 'warn'
                }
            ],
            areaSolicita: '',
            nOficio: '',
            asunto: '',
            cargo: '',
            remitente: '',
            nfolio: '',
            nMemorandum: '',
            tipoDoc: '',
            Capitulo: '',
            termino: '',
            catTermino: [],
            catCapitulo: [],
            catTipoDoc: [],
            cat_departamentos: [],
            respuesta: '',
            documentos: {
                F1: '',
            },
            selectSiNo: [
                {
                    idSelect: 1,
                    opcion: 'SÍ'
                },
                {
                    idSelect: 2,
                    opcion: 'NO'
                },
            ],
            errorRespuesta: '',
            errorCapitulo: '',
            errorAreaSolicita: '',
            errorNOficio: '',
            errorCargo: '',
            errorRemitente: '',
            errorTermino: '',
            errorAsunto: '',
            errorTipoDoc: '',
            areaAsignada: '',
            errorAreaAsignada: '',
            errorF1: '',
            errorNFolio: '',
            errorNMemorandum: '',
            fechaRecibido: '',
            fechaTermino: '',
            errorFechaRecibido: '',
            errorFechaTermino: '',
            hora: '',
            errorHora: '',
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now();
                },
            },
            pickerOptions2: {
                disabledDate(time) {
                    var date = new Date();
                    date.setDate(date.getDate() - 1);
                    return time.getTime() < date;
                },
            },
            seguimiento: '',
            cat_seguimiento: [],
            errorSeguimiento: '',
            copiasConocimiento: [],
            errorCopiasConocimiento: '',
            errorCopiasConocimiento: '',
        }

    },
    watch:{
        tipoDoc(newVal, oldVal){
            this.limpiarErrores();
            this.seguimiento = '';
        }
    },
    mounted() {
        // this.checkInputIntegrity()
        this.getTipoDic()
        this.getCapitulo()
        this.obtenerDatos(3)
        this.obtenerDatos(5)
        this.obtenerDatos(6)
    },
    methods: {
        checkInputIntegrity() {
            document.getElementById('numeroConsecutivo').addEventListener('keypress', event => {
                if (!`${event.target.value}${event.key}`.match(/^[0-9]{0,10}$/)) {
                    event.preventDefault();
                    event.stopPropagation();
                    return false;
                }
            });
        },
        handleF1(file, fileList) {
            this.documentos.F1 = this.handleChange(file, fileList);
        },
        handlePreview(file) {
        },
        handleRemoveF1(file, fileList) {
            this.documentos.F1 = ''
        },
        handleExceed(files, fileList) {
            Swal.fire({
                icon: 'error',
                title: 'Solo puede subir un documento para acreditar.',
                showConfirmButton: true,
                confirmButtonText: 'De acuerdo',
            });
        },
        handleChange(file, fileList) {
            // if (file.size > 5242880) {
            //     this.$refs.upload.clearFiles();
            //     Swal.fire({
            //         icon: 'error',
            //         html: '<div class="col"><div class="swal2-title p-0 mb-2">¡El archivo excede el límite de carga permitido!</div><div class="swal2-title font-weight-normal p-0" style="font-size: 20px">Seleccione uno con menor peso</div></div>',
            //         showConfirmButton: true,
            //         confirmButtonText: 'De acuerdo',
            //     });

            //     return '';

            // } else {
            return file.raw;
            // }
        },
        getTipoDic() {
            this.catTipoDoc = []
            let url = '/administracion/usuario/getTipoDic'
            axios.get(url).then(response => {
                this.catTipoDoc = response.data
            }).catch((err) => {
                console.log(err);
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        getCapitulo() {
            this.catCapitulo = []
            let url = '/administracion/usuario/getCapitulo'
            axios.get(url).then(response => {
                this.catCapitulo = response.data
            }).catch((err) => {
                console.log(err);
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            axios.get(url, {
                params: {
                    'tipo': tipo,
                    'consulta': 1
                }
            }).then(response => {
                switch (tipo) {
                    case 1:
                        this.catCargos = response.data
                        break;
                    case 2:
                        this.catRemitente = response.data
                        break;
                    case 3:
                        this.catTermino = response.data
                        break;
                    case 4:
                        this.cat_diasTermino = response.data
                        break;
                    case 5:
                        this.cat_seguimiento = response.data
                        break;
                    case 6:
                        this.cat_departamentos = response.data
                        break;
                    case 7:
                        this.cat_tipo = response.data
                        break;
                    case 8:
                        this.cat_estutus = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);

            });
        },

        async setSubirArchivoSolicitud(oDocumento, fileExt, tipo ,apendice) {
            let idArchivo = 0;
            this.form.set('archivo', oDocumento);
            this.form.set('filename', oDocumento.name);
            this.form.set('extension', fileExt);
            this.form.set('tipo', tipo);
            this.form.set('apendice', apendice);

            const config = { headers: { 'Content-Type': 'multipart/form-data' } };

            let url = '/archivos/subirArchivoSolicitud';
            await axios.post(url, this.form, config).then(response => {
                idArchivo = response.data[0].idDOCUMENTO
            }).catch((error) => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });

            return idArchivo;
        },        
        guardarSolicitud() {
            // const loading = methods.loading(this.$vs);
            if (this.tipoDoc == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'No se ha seleccionado el tipo de la solicitud.',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            } else {
                if (this.tipoDoc == 1) {
                    this.GuardarRequi()   
                }
                else if (this.tipoDoc == 2) {
                    this.GuardarMemo()    
                }
                else if (this.tipoDoc == 3) {
                    this.GuardarOficio()  
                }
                else if (this.tipoDoc == 4) {
                    this.GuardarCircular()    
                }
            }
        },
        GuardarRequi() {
            this.limpiarErrores();
            this.ValidarRequi();
            if(!this.error){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Registrar la solicitud de requisición?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Registrar solicitud',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                }).then( (result) => {
                    if(result.isConfirmed){
                        console.log('en progreso');
                        // Registrar el archivo
                        // Registrar la solicitud
                        // Registrar las copias de conocimiento
                    }
                })
            }
        },
        GuardarMemo() { 
            this.limpiarErrores();
            this.ValidarMemo();
            if(!this.error){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Registrar la solicitud de memorándum?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Registrar solicitud',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                }).then( (result) => {
                    if(result.isConfirmed){
                        console.log('en progreso');
                        // Registrar el archivo
                        // Registrar la solicitud
                        // Registrar las copias de conocimiento
                    }
                })
            }
        },
        GuardarOficio() {
            this.limpiarErrores();
            this.ValidarOficio();
            if(!this.error){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Registrar la solicitud de oficio?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Registrar solicitud',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                }).then( (result) => {
                    if(result.isConfirmed){
                        console.log('en progreso');
                        
                        // Registrar el archivo
                        // Registrar la solicitud
                        // Registrar las copias de conocimiento
                    }
                })
            }
        },
        GuardarCircular() { 
            console.log('circular');
            this.limpiarErrores();
            this.ValidarCircular();
            if(!this.error){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Registrar la solicitud de circular?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Registrar solicitud',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                }).then( (result) => {
                    if(result.isConfirmed){
                        console.log('en progreso');
                        // Registrar el archivo
                        // Registrar la solicitud
                        // Registrar las copias de conocimiento
                    }
                })
            }            
        },
        ValidarRequi(){
            this.error = false;
            if(this.Capitulo === ''){
                this.errorCapitulo = 'Los capitulos son obligatorios';
                this.errro = true;
            }
            if(this.nfolio === ''){
                this.errorNFolio = 'El folio es obligatorio';
                this.error = true;
            }
            if(this.fechaRecibido === ''){
                this.errorFechaRecibido = 'La fecha de recibido es obligatoria';
                this.error = false;
            }
            if(this.hora === ''){
                this.errorHora = 'La hora de recibido es obligatoria';
                this.error = true;
            }
            if(this.areaSolicita === ''){
                this.errorAreaSolicita = 'La área que solicita es obligatoria';
                this.error = true;
            }
            if(this.areaAsignada === ''){
                this.errorAreaAsignada = 'La asignación de requisición es obligatoria';
                this.error = true;
            }
            if(this.documentos.F1 === ''){
                this.errorF1 = 1;
                this.error = true;
            }
            if(this.seguimiento === ''){
                this.errorSeguimiento = 'Seleccione una opción de seguimiento';
                this.error = true;
            }
            if(this.copiasConocimiento.length === 0){
                this.errorCopiasConocimiento = 'Seleccione al menos una opción para copia de conocimiento';
                this.error = true;
            }
        },
        ValidarMemo(){
            this.error = false;
            if(this.areaSolicita === ''){
                this.errorAreaSolicita = 'La área que solicita es obligatoria';
                this.error = true;
            }
            if(this.nMemorandum === ''){
                this.errorNMemorandum = 'El número de memorandum es obligatorio';
                this.error = true;
            }
            if(this.asunto === ''){
                this.errorAsunto = 'El asunto es obligatorio';
                this.error = true;
            }
            if(this.nfolio === ''){
                this.errorNFolio = 'El folio es obligatorio';
                this.error = true;
            }
            if(this.fechaRecibido === ''){
                this.errorFechaRecibido = 'La fecha de recibido es obligatoria';
                this.error = false;
            }
            if(this.hora === ''){
                this.errorHora = 'La hora de recibido es obligatoria';
                this.error = true;
            }
            if(this.termino === ''){
                this.errorTermino = 'El termino es obligatorio';
                this.error = true;
            } else if( this.termino === 1 ){
                if(this.fechaTermino === ''){
                    this.errorFechaTermino = 'La fecha de termino es obligatoria';
                    this.error = true;
                }
            }
            if(this.areaAsignada === ''){
                this.errorAreaAsignada = 'La asignación de requisición es obligatoria';
                this.error = true;
            }
            if(this.respuesta === ''){
                this.errorRespuesta = 'Seleccione una opción para respuesta';
                this.error = true;
            }

            if(this.documentos.F1 === ''){
                this.errorF1 = 1;
                this.error = true;
            }
            if(this.seguimiento === ''){
                this.errorSeguimiento = 'Seleccione una opción de seguimiento';
                this.error = true;
            }
            if(this.copiasConocimiento.length === 0){
                this.errorCopiasConocimiento = 'Seleccione al menos una opción para copia de conocimiento';
                this.error = true;
            }
        },
        ValidarOficio(){
            this.error = false;
            if(this.nOficio === ''){
                this.errorNOficio = 'El número de oficio es obligatorio';
                this.error = true;
            }
            if(this.remitente === ''){
                this.errorRemitente = 'El remitente es obligatorio';
                this.errro = true;
            }
            if(this.cargo === ''){
                this.errorCargo = 'El cargo es obligatorio';
                this.error = true;
            }
            if(this.asunto === ''){
                this.errorAsunto = 'El asunto es obligatorio';
                this.error = true;
            }
            if(this.termino === ''){
                this.errorTermino = 'El termino es obligatorio';
                this.error = true;
            } else if( this.termino === 1 ){
                if(this.fechaTermino === ''){
                    this.errorFechaTermino = 'La fecha de termino es obligatoria';
                    this.error = true;
                }
            } 
            if(this.areaAsignada === ''){
                this.errorAreaAsignada = 'La asignación de requisición es obligatoria';
                this.error = true;
            }   
            if(this.fechaRecibido === ''){
                this.errorFechaRecibido = 'La fecha de recibido es obligatoria';
                this.error = false;
            }
            if(this.hora === ''){
                this.errorHora = 'La hora de recibido es obligatoria';
                this.error = true;
            }   

            if(this.documentos.F1 === ''){
                this.errorF1 = 1;
                this.error = true;
            }
            if(this.seguimiento === ''){
                this.errorSeguimiento = 'Seleccione una opción de seguimiento';
                this.error = true;
            }
            if(this.copiasConocimiento.length === 0){
                this.errorCopiasConocimiento = 'Seleccione al menos una opción para copia de conocimiento';
                this.error = true;
            }                 
        },
        ValidarCircular(){   
            if(this.fechaRecibido === ''){
                this.errorFechaRecibido = 'La fecha de recibido es obligatoria';
                this.error = false;
            }
            if(this.hora === ''){
                this.errorHora = 'La hora de recibido es obligatoria';
                this.error = true;
            }   
            if(this.areaSolicita === ''){
                this.errorAreaSolicita = 'El área que solicita es obligatoria';
                this.error = true;
            }
            if(this.asunto === ''){
                this.errorAsunto = 'El asunto es obligatorio';
                this.error = true;
            }

            if(this.documentos.F1 === ''){
                this.errorF1 = 1;
                this.error = true;
            }
            if(this.seguimiento === ''){
                this.errorSeguimiento = 'Seleccione al menos una opción de seguimiento';
                this.error = true;
            }
            if(this.copiasConocimiento.length === 0){
                this.errorCopiasConocimiento = 'Seleccione al menos una opción para copia de conocimiento';
                this.error = true;
            }            
        },

        /**Limpia todos los mensajes de error */
        limpiarErrores() {
            this.errorRespuesta = '';
            this.errorCapitulo = '';
            this.errorAreaSolicita = '';
            this.errorNOficio = '';
            this.errorCargo = '';
            this.errorRemitente = '';
            this.errorTermino = '';
            this.errorAsunto = '';
            this.errorTipoDoc = '';
            this.errorAreaAsignada = '';
            this.errorF1 = '';
            this.errorNMemorandum = '';
            this.errorNFolio = '';
            this.errorFechaRecibido = '';
            this.errorFechaTermino = '';    
            this.errorHora = ''; 
            this.errorSeguimiento = '';   
            this.errorCopiasConocimiento = '';
            this.errorCopiasConocimiento = '';    
        },
    },
}
</script>

<style></style>