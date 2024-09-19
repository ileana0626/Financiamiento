<template>
    <div class="col">
        <div class="float-sm-right mr-5">
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
                        <label class="col-form-label">Número Consecutivo</label>
                        <vs-input id="numeroConsecutivo" type="tel" color="#C2B280" icon-after
                            placeholder="Número Consecutivo" v-model="nConsecutivo" autocomplete="off">
                            <template #message-danger v-if="errorNConsecutivo.length > 0">
                                {{ errorNConsecutivo }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Número de Solicitud</label>
                        <vs-input id="numeroSolicitud" type="tel" color="#C2B280" icon-after
                            placeholder="Número de Solicitud" v-model="nSolicitud" autocomplete="off">
                            <template #message-danger v-if="errorNSolicitud.length > 0">
                                {{ errorNSolicitud }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Fecha de Recibido</label>
                        <el-date-picker type="date" placeholder="Fecha de Recibido" format="dd-MM-yyyy"
                            :picker-options="pickerOptions" value-format="yyyy-MM-dd" v-model="fechaRecibido">
                        </el-date-picker>
                        <div class="danger-message">
                            <template v-if="errorFechaRecibido.length > 0">
                                {{ errorFechaRecibido }}
                            </template>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Remitente</label>
                        <vs-select placeholder="Seleccione una opción" v-model="remitente"
                            v-if="catRemitente.length > 0" filter :color="colors[0].color" autocomplete="off"
                            @change="limpiarOtroRemitente">
                            <template #message-danger v-if="errorRemitente.length > 0">
                                {{ errorRemitente }}
                            </template>
                            <vs-option v-for="(item, index) in catRemitente" :key="index" :label="item.nombre"
                                :value="item.idRemitente">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <template v-if="remitente == 1">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Otro Remitente</label>
                            <vs-input color="#C2B280" icon-after placeholder="Otro Remitente" v-model="otroRemitente"
                                :state="(errorOtroRemitente.length > 0) ? 'danger' : ''" autocomplete="off">
                                <template #message-danger v-if="errorOtroRemitente.length > 0">
                                    {{ errorOtroRemitente }}
                                </template>
                            </vs-input>
                        </div>
                    </template>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Cargo</label>
                        <vs-select placeholder="Seleccione una opción" v-model="cargo" v-if="catCargos.length > 0"
                            filter :color="colors[0].color" autocomplete="off" @change="limpiarOtroCargo">
                            <template #message-danger v-if="errorCargo.length > 0">
                                {{ errorCargo }}
                            </template>
                            <vs-option v-for="(item, index) in catCargos" :key="index" :label="item.nombre"
                                :value="item.idCargo">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <template v-if="cargo == 1">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Otro Cargo</label>
                            <vs-input color="#C2B280" icon-after placeholder="Otro Cargo" v-model="otroCargo"
                                :state="(errorOtroCargo.length > 0) ? 'danger' : ''" autocomplete="off">
                                <template #message-danger v-if="errorOtroCargo.length > 0">
                                    {{ errorOtroCargo }}
                                </template>
                            </vs-input>
                        </div>
                    </template>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Asunto</label>
                        <vs-input id="asunto" color="#C2B280" icon-after placeholder="Asunto" v-model="asunto"
                            autocomplete="off">
                            <template #message-danger v-if="errorAsunto.length > 0">
                                {{ errorAsunto }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Tipo</label>
                        <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color" v-model="tipo"
                            v-if="cat_tipo.length > 0" autocomplete="off" @change="bloqueardatos">
                            <template #message-danger v-if="errorTipo.length > 0">
                                {{ errorTipo }}
                            </template>
                            <vs-option v-for="(item, index) in cat_tipo" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Termino</label>
                        <vs-select placeholder="Seleccione una opción" v-model="termino" v-if="catTermino.length > 0"
                            :color="colors[0].color" filter autocomplete="off" :disabled="bloqueo"
                            @change="limpiartermino">
                            <template #message-danger v-if="errorTermino.length > 0">
                                {{ errorTermino }}
                            </template>
                            <vs-option v-for="(item, index) in catTermino" :key="index" :label="item.nombre"
                                :value="item.idTermino" :disabled="bloqueo">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <template v-if="termino == 1">
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Fecha de Termino</label>
                            <el-date-picker type="date" placeholder="Fecha de Termino" :picker-options="pickerOptions2"
                                format="dd-MM-yyyy" value-format="yyyy-MM-dd" v-model="fechaTermino"
                                :disabled="bloqueo">
                            </el-date-picker>
                            <div class="danger-message">
                                <template v-if="errorFechaTermino.length > 0">
                                    {{ errorFechaTermino }}
                                </template>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                            <label class="col-form-label">Días de Termino</label>
                            <vs-select placeholder="Seleccione una opción" v-model="diaTermino" :color="colors[0].color"
                                filter v-if="cat_diasTermino.length > 0" autocomplete="off" :disabled="bloqueo">
                                <template #message-danger v-if="errorDiasTermino.length > 0">
                                    {{ errorDiasTermino }}
                                </template>
                                <vs-option v-for="(item, index) in cat_diasTermino" :key="index" :label="item.dias"
                                    :value="item.idDiasTermino" :disabled="bloqueo">
                                    {{ item.dias }}
                                </vs-option>
                            </vs-select>
                        </div>
                    </template>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Quién Contesta</label>
                        <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color"
                            v-model="areaAsignada" v-if="cat_departamentos.length > 0" autocomplete="off"
                            :disabled="bloqueo">
                            <template #message-danger v-if="errorAreaAsignada.length > 0">
                                {{ errorAreaAsignada }}
                            </template>
                            <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                :value="item.id" :disabled="bloqueo">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Requiere Respuesta</label>
                        <vs-select placeholder="Seleccione una opción" v-model="respuesta" v-if="selectSiNo.length > 0"
                            :color="colors[0].color" filter autocomplete="off" @change="limpiarRespuesta"
                            :disabled="bloqueo">
                            <template #message-danger v-if="errorRespuesta.length > 0">
                                {{ errorRespuesta }}
                            </template>
                            <vs-option v-for="(item, index) in selectSiNo" :key="index" :label="item.opcion"
                                :disabled="bloqueo" :value="item.idSelect">
                                {{ item.opcion }}
                            </vs-option>
                        </vs-select>
                    </div>

                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3" v-if="respuesta == 1">
                        <label class="col-form-label">Seguimiento</label>
                        <vs-select placeholder="Seleccione una opción" v-model="seguimiento"
                            v-if="cat_seguimiento.length > 0" :color="colors[0].color" filter autocomplete="off">
                            <template #message-danger v-if="errorSeguimiento.length > 0" :disabled="bloqueo">
                                {{ errorSeguimiento }}
                            </template>
                            <vs-option v-for="(item, index) in cat_seguimiento" :key="index" :label="item.nombre"
                                :value="item.idSeguimiento" :disabled="bloqueo">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Fecha de Asignación</label>
                        <el-date-picker type="date" placeholder="Fecha de Asignación" format="dd-MM-yyyy"
                            value-format="yyyy-MM-dd" v-model="fechaAsignacion" :picker-options="pickerOptions2"
                            :disabled="bloqueo">
                        </el-date-picker>
                        <div class="danger-message">
                            <template v-if="errorFechaAsignacion.length > 0">
                                {{ errorFechaAsignacion }}
                            </template>
                        </div>
                    </div>
                    <!-- <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Estatus</label>
                        <vs-select placeholder="Seleccione un estatus" v-model="estatus" v-if="cat_estutus.length > 0"
                            :color="colors[0].color" filter autocomplete="off">
                            <template #message-danger v-if="errorEstatus.length > 0">
                                {{ errorEstatus }}
                            </template>
                            <vs-option v-for="(item, index) in cat_estutus" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div> -->
                    <div class="col-sm-5 col-md-5 col-xl-5 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Archivo</label>
                        <div class="row px-0 pr-sm-5 pb-3">
                            <div class="col-md-6">
                                <h6 class="col">Seleccione el documento</h6>
                                <el-upload class="upload-demo col-md-7"
                                    action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF1"
                                    accept="application/pdf" :on-preview="handlePreview" :on-remove="handleRemoveF1"
                                    multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false" ref="upload">
                                    <el-button size="small" type="primary"
                                        style="background-color: #af8909; border-color: #af8909;"><strong
                                            style="color: white !important;">Clic
                                            para
                                            subir
                                            archivo</strong></el-button>
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
                    <div class="col-sm-7 col-md-7 col-xl-7 px-0 pr-sm-7 pb-3">

                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-5" v-if="tipo == 3">
                        <label class="col-form-label">Copias de Conocimiento</label>
                        <vs-select multiple filter
                            :placeholder="(copiasConocimiento.length > 0) ? '' : 'Seleccione una opción'"
                            v-model="copiasConocimiento" v-if="cat_departamentos.length > 0" autocomplete="off">
                            <template #message-danger v-if="errorCopiasConocimiento.length > 0">
                                {{ errorCopiasConocimiento }}
                            </template>
                            <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-12 col-md-12 col-xl-12 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Observaciones</label>
                        <br>
                        <el-input id="observaciones" color="#C2B280" placeholder="Escriba sus Observaciones"
                            type="textarea" :rows="2" v-model="observaciones" autocomplete="off" :disabled="bloqueo">
                        </el-input>
                        <div class="danger-message">
                            <template v-if="errorObservaciones.length > 0">
                                Seleccione un archivo para subir
                            </template>
                        </div>
                    </div>
                    <div class="row mx-12 mb-12 p-4">
                        <div class="col-sm-12 col-md-8 col-xl-6 px-0 pr-sm-5 pb-3">
                            <center>
                                <vs-button style="width: 19vw; " color="#a5904a" block
                                    @click.prevent="guardarSolicitud">
                                    <b style="font-size: medium !important;">
                                        Registrar
                                    </b>
                                </vs-button>
                                <!-- <vs-button style="width: 19vw; " color="#a5904a" block
                                    @click.prevent="guardarCopiasConocimiento">
                                    <b style="font-size: medium !important;">
                                        Registrar
                                    </b>
                                </vs-button> -->
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            colors: [
                {
                    color: 'warn'
                },

            ],
            copiasConocimiento: [],
            otroRemitente: '',
            otroCargo: '',
            nConsecutivo: '',
            nSolicitud: '',
            fechaRecibido: '',
            remitente: '',
            cargo: '',
            asunto: '',
            fechaTermino: '',
            respuesta: '',
            termino: '',
            diaTermino: '',
            seguimiento: '',
            areaAsignada: '',
            tipo: 3,
            fechaAsignacion: '',
            estatus: 1,
            observaciones: '',
            error: 0,
            errorOtroRemitente: '',
            errorOtroCargo: '',
            errorNConsecutivo: '',
            errorNSolicitud: '',
            errorFechaRecibido: '',
            errorRemitente: '',
            errorCargo: '',
            errorAsunto: '',
            errorFechaTermino: '',
            errorRespuesta: '',
            errorTermino: '',
            errorDiasTermino: '',
            errorSeguimiento: '',
            errorAreaAsignada: '',
            errorTipo: '',
            errorFechaAsignacion: '',
            errorEstatus: '',
            errorF1: '',
            errorObservaciones: '',
            errorCopiasConocimiento: '',
            catRemitente: [],
            catCargos: [],
            catTermino: [],
            cat_diasTermino: [],
            cat_seguimiento: [],
            cat_departamentos: [],
            cat_tipo: [],
            cat_estutus: [],
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
            form: new FormData,
            documentos: {
                F1: "",
            },
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
            mostrardatos: '',
            bloqueo: true
        }
    },
    mounted() {
        this.checkInputIntegrity()
        this.obtenerDatos(1)
        this.obtenerDatos(2)
        this.obtenerDatos(3)
        this.obtenerDatos(4)
        this.obtenerDatos(5)
        this.obtenerDatos(6)
        this.obtenerDatos(7)
        this.obtenerDatos(8)
    },
    methods: {
        bloqueardatos() {
            if (this.tipo == 3) {
                this.bloqueo = true
                this.termino = ''
                this.fechaTermino = ''
                this.diaTermino = ''
                this.areaAsignada = ''
                this.respuesta = ''
                this.seguimiento = ''
                this.fechaAsignacion = ''
                this.observaciones = ''
            } else {
                this.bloqueo = false
                this.copiasConocimiento = ''
            }
        },
        limpiartermino() {
            this.fechaTermino = ''
            this.diaTermino = ''
        },
        limpiarRespuesta() {
            this.seguimiento = ''
        },
        limpiarOtroRemitente() {
            this.otroRemitente = ''
        },
        limpiarOtroCargo() {
            this.otroCargo = ''
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
        checkInputIntegrity() {
            document.getElementById('numeroConsecutivo').addEventListener('keypress', event => {
                if (!`${event.target.value}${event.key}`.match(/^[0-9]{0,10}$/)) {
                    event.preventDefault();
                    event.stopPropagation();
                    return false;
                }
            });

            document.getElementById('numeroSolicitud').addEventListener('keypress', event => {
                if (!`${event.target.value}${event.key}`.match(/^[0-9]{0,10}$/)) {
                    event.preventDefault();
                    event.stopPropagation();
                    return false;
                }
            });
            document.getElementById('asunto').addEventListener('keypress', event => {
                if (!`${event.target.value}${event.key}`.match(/^[ a-zA-ZñÑáíóéúÁÉÍÓÚ0-9]{0,255}$/)) {
                    event.preventDefault();
                    event.stopPropagation();
                    return false;
                }
            });
            document.getElementById('observaciones').addEventListener('keypress', event => {
                if (!`${event.target.value}${event.key}`.match(/^[ a-zA-ZñÑáíóéúÁÉÍÓÚ0-9]{0,255}$/)) {
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
        async guardarSolicitud() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });

            this.validar()

            if (this.error == 1) {
                loading.close();
                Swal.fire({
                    icon: 'warning',
                    title: 'Algunos de los campos se encuentran vacíos. \n Verifique los datos e inténtelo de nuevo.',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });

            } else {
                let idF1 = 0
                if (this.documentos.F1.size > 0) {
                    idF1 = await this.setRegistrarArchivo(this.documentos.F1, "");
                }
                let url = '/administracion/usuario/guardarSolicitud'
                axios.post(url, {
                    'numeroConsecutivo': this.nConsecutivo,
                    'numeroSolicitud': this.nSolicitud,
                    'fechaRecibido': this.fechaRecibido,
                    'remitente': this.remitente,
                    'otroRemitente': this.otroRemitente,
                    'cargo': this.cargo,
                    'otroCargo': this.otroCargo,
                    'asunto': this.asunto,
                    'termino': this.termino,
                    'fechaTermino': this.fechaTermino,
                    'diasTermino': this.diaTermino,
                    'respuesta': this.respuesta,
                    'seguimiento': this.seguimiento,
                    'areaAsignada': this.areaAsignada,
                    'tipo': this.tipo,
                    'fechaAsignacion': this.fechaAsignacion,
                    'estatus': this.estatus,
                    'observaciones': this.observaciones,
                    'idArchivo': idF1
                }).then(response => {
                    if (this.tipo == 3) {
                        this.guardarCopiasConocimiento(response.data[0].id, loading)
                    } else {
                        loading.close();
                        Swal.fire({
                            icon: 'success',
                            title: 'Registrado correctamente',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo'
                        });
                    }
                }).catch(error => {
                    loading.close();
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);

                });
            }
        },
        async setRegistrarArchivo(oDocumento, fileExt) {
            let idArchivo = 0;
            this.form.set('archivo', oDocumento);
            this.form.set('filename', oDocumento.name);
            this.form.set('extension', fileExt);

            const config = { headers: { 'Content-Type': 'multipart/form-data' } };

            var url = '/archivos/subirArchivo';
            await axios.post(url, this.form, config).then(response => {
                idArchivo = response.data[0].idDOCUMENTO
            }).catch((error) => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });

            return idArchivo;
        },
        validar() {
            this.error = 0
            this.limpiarErrores()

            if (this.documentos.F1.length == 0) {
                this.error = 1
                this.errorF1 = 1
            }
            if (this.nConsecutivo.length == 0) {
                this.error = 1
                this.errorNConsecutivo = 'Coloque el Número Consecutivo'
            }
            if (this.nSolicitud.length == 0) {
                this.error = 1
                this.errorNSolicitud = 'Coloque el número de solicitud'
            }
            if (this.fechaRecibido.length == 0) {
                this.error = 1
                this.errorFechaRecibido = 'Coloque la fecha de recibido'
            }
            if (this.remitente.length == 0) {
                this.error = 1
                this.errorRemitente = 'Seleccione el remitente'
            }
            if (this.remitente == 1 && this.otroRemitente.length == 0) {
                this.error = 1
                this.errorOtroRemitente = 'Coloque el nombre del remitente'
            }
            if (this.cargo.length == 0) {
                this.error = 1
                this.errorCargo = 'Seleccione el cargo'
            }
            if (this.cargo == 1 && this.otroCargo.length == 0) {
                this.error = 1
                this.errorCargo = 'Coloque el cargo'
            }
            if (this.asunto.length == 0) {
                this.error = 1
                this.errorAsunto = 'Escriba el asunto'
            }
            if (this.tipo == 3) {
                if (this.copiasConocimiento.length == 0) {
                    this.error = 1
                    this.errorCopiasConocimiento = 'Seleccione aquien va la copia de conocimiento'
                }
            } else {
                if (this.termino.length == 0) {
                    this.error = 1
                    this.errorTermino = 'Seleccione el termino'
                }
                if (this.termino == 1) {
                    if (this.fechaTermino.length == 0) {
                        this.error = 1
                        this.errorFechaTermino = 'Seleccione la fecha termino'
                    }
                    if (this.diaTermino.length == 0) {
                        this.error = 1
                        this.errorDiasTermino = 'Seleccione el/los días de termino'
                    }
                }
                if (this.areaAsignada.length == 0) {
                    this.error = 1
                    this.errorAreaAsignada = 'Seleccione quién contesta'
                }
                if (this.respuesta.length == 0) {
                    this.error = 1
                    this.errorRespuesta = 'Seleccione una opción'
                }
                if (this.respuesta == 1) {
                    if (this.seguimiento.length == 0) {
                        this.error = 1
                        this.errorSeguimiento = 'Seleccione una opción'
                    }
                }
                if (this.fechaAsignacion.length == 0) {
                    this.error = 1
                    this.errorFechaAsignacion = 'Seleccione la fecha de asignación'
                }
                if (this.observaciones.length == 0) {
                    this.error = 1
                    this.errorObservaciones = 'Escriba la observación'
                }
            }
        },
        guardarCopiasConocimiento(id,loading) {
            let url = '/administracion/usuario/guardarCopiasConocimiento'
            axios.post(url, {
                'idSolicitud': id,
                'departamentos': this.copiasConocimiento,
                'estatus': 'N'
            }).then(response => {
                
                loading.close();
                Swal.fire({
                    icon: 'success',
                    title: 'Registrado correctamente',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            }).catch((error) => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        limpiarErrores() {
            this.errorF1 = ''
            this.errorNConsecutivo = ''
            this.errorNSolicitud = ''
            this.errorFechaRecibido = ''
            this.errorRemitente = ''
            this.errorOtroRemitente = ''
            this.errorCargo = ''
            this.errorCargo = ''
            this.errorAsunto = ''
            this.errorTermino = ''
            this.errorFechaTermino = ''
            this.errorDiasTermino = ''
            this.errorAreaAsignada = ''
            this.errorRespuesta = ''
            this.errorSeguimiento = ''
            this.errorFechaAsignacion = ''
            this.errorObservaciones = ''
            this.errorCopiasConocimiento = ''

        }
    }
};

</script>

<style></style>