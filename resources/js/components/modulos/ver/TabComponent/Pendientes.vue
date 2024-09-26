<template>
    <div class="col">
        <div class="row col-md-12 col-10 mx-auto card-info">
            <div class=" container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #header>
                            <vs-input v-model="search" border placeholder="Escribe un numero"
                                class="inputSearchPreguntas" />
                        </template>
                        <template #thead>
                            <vs-tr>
                                <vs-th sort
                                    @click="NewlistSolicitudes = $vs.sortData($event, NewlistSolicitudes, 'numeroConsecutivo')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Núm. Consecutivo
                                </vs-th>
                                <vs-th sort
                                    @click="NewlistSolicitudes = $vs.sortData($event, NewlistSolicitudes, 'numeroSolicitud')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Núm. Solicitud
                                </vs-th>
                                <vs-th sort
                                    @click="NewlistSolicitudes = $vs.sortData($event, NewlistSolicitudes, 'fechaRecibido')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Fecha de Recibido
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Fecha de Asignación
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Remitente
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Archivo
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Asunto
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);"
                                    v-if="listaPermisos.includes('solicitudes.terminos')">
                                    Termino
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);"
                                    v-if="listaPermisos.includes('solicitudes.terminos')">
                                    Fecha de Termino
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);"
                                    v-if="listaPermisos.includes('solicitudes.terminos')">
                                    Dias de Termino
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Respuesta
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Seguimiento
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Quien Contesta
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Tipo
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Contestación
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Estatus
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Acciones
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, i) in $vs.getPage($vs.getSearch(NewlistSolicitudes, search), page, max)"
                                :key="i" :class="colorStatus(tr.fechaTermino, tr.diasTermino, tr.estatus)">
                                <vs-td class="tableRowHeight">
                                    {{ tr.numeroConsecutivo }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.numeroSolicitud }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.fechaRecibido }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.fechaAsignacion }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.otroRemitente != null">
                                        {{ tr.otroremitente }} - {{ tr.otrocargo }}
                                    </template>
                                    <template v-else>
                                        {{ tr.remitente }} - {{ tr.cargo }}
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <center>
                                        <vs-button id="logoutBtn" icon danger size="large" v-if="tr.archivo != null"
                                            @click.prevent="abrirmodal(tr.archivo)">
                                            <i class="fas fa-file-pdf fa-3x"></i>
                                        </vs-button>
                                        <template v-else>
                                            N/A
                                        </template>
                                    </center>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.asunto }}
                                </vs-td>
                                <vs-td class="tableRowHeight" v-if="listaPermisos.includes('solicitudes.terminos')">
                                    <template v-if="tr.termino == 1">
                                        SI
                                    </template>
                                    <template v-else>
                                        No
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight" v-if="listaPermisos.includes('solicitudes.terminos')">
                                    <template v-if="tr.fechaTermino != null">
                                        {{ tr.fechaTermino }}
                                    </template>
                                    <template v-else>
                                        N/A
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight" v-if="listaPermisos.includes('solicitudes.terminos')">
                                    <template v-if="tr.diasTermino != null">
                                        {{ tr.diasTermino }}
                                    </template>
                                    <template v-else>
                                        N/A
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.respuesta == 1">
                                        SI
                                    </template>
                                    <template v-else>
                                        No
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.seguimiento != null">
                                        {{ tr.seguimiento }}
                                    </template>
                                    <template v-else>
                                        N/A
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.areaAsignada != null">
                                        {{ tr.areaAsignada }}
                                    </template>
                                    <template v-else>
                                        N/A
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.tipo != null">
                                        {{ tr.tipo }}
                                    </template>
                                    <template v-else>
                                        N/A
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <center>
                                        <vs-button v-if="tr.rutaContestacion != null" id="logoutBtn" icon
                                            color="rgb(58,197,55)" size="large"
                                            @click.prevent="abrirmodal(tr.rutaContestacion)">
                                            <i class="fas fa-file-pdf fa-3x"></i>
                                        </vs-button>
                                        <!-- <vs-button v-if="tr.rutaContestacion != null" id="logoutBtn" icon
                                            color="rgb(58,197,55)" size="large"
                                            @click.prevent="colorStatus(tr.fechaTermino)">
                                            <i class="fas fa-file-pdf fa-3x"></i>
                                        </vs-button> -->
                                        <template v-else>
                                            N/A
                                        </template>
                                    </center>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.estatus == 'TRÁMITE'">
                                        <span class="badge rounded-pill"
                                            style="background-color: var(--iee-blue) !important; color: var(--iee-white)!important">TRÁMITE</span>
                                    </template>
                                    <template v-else-if="tr.estatus == 'PENDIENTE'">
                                        <span class="badge rounded-pill"
                                            style="background-color: var(--iee-orange) !important; color: var(--iee-white)!important">PENDIENTE</span>
                                    </template>
                                    <template v-else-if="tr.estatus == 'AVANZADO'">
                                        <span class="badge rounded-pill"
                                            style="background-color: var(--iee-red) !important; color: var(--iee-white)!important">AVANZADO</span>
                                    </template>
                                    <template v-else-if="tr.estatus == 'CONCLUIDO'">
                                        <span class="badge rounded-pill"
                                            style="background-color: var(--iee-green2) !important; color: var(--iee-white)!important">CONCLUIDO</span>
                                    </template>
                                    <template v-else-if="tr.estatus == 'OTRO'">
                                        <span class="badge rounded-pill"
                                            style="background-color: var(--iee-black) !important; color: var(--iee-white)!important">OTRO</span>
                                    </template>
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <template v-if="idDepartamento == 0">
                                        <template v-if="tr.idTipo == 3">
                                            <template v-for="( de, i ) in tr.departamentosNoEnterados">
                                                <template
                                                    v-if="tr.NoEnterados == 0 && de == 0 && tr.estatus != 'CONCLUIDO'">
                                                    <template v-if="de == idDepartamento">
                                                        <el-tooltip class="item h-100" effect="dark"
                                                            content="Todos Enterados" placement="top">
                                                            <vs-button id="logoutBtn" icon color="rgb(58,197,55)"
                                                                size="large"
                                                                @click.prevent="todosEnteradoConcluido(tr.id)">
                                                                <span class="material-symbols-rounded"
                                                                    style="color: white !important;">
                                                                    thumb_up
                                                                </span>
                                                            </vs-button>
                                                        </el-tooltip>
                                                    </template>
                                                </template>
                                            </template>
                                        </template>
                                        <template v-else>
                                            <template v-if="listaPermisos.includes('solicitudes.archivo')">
                                                <el-tooltip class="item h-100" effect="dark"
                                                    content="Cargar contestación" placement="top"
                                                    v-if="tr.rutaContestacion == null">
                                                    <vs-button id="logoutBtn" icon danger size="large"
                                                        @click.prevent="modalSubirArchivo(tr.id)">
                                                        <span class="material-symbols-rounded"
                                                            style="color: white !important;">
                                                            upload_file
                                                        </span>
                                                    </vs-button>
                                                </el-tooltip>
                                            </template>
                                            <template v-if="tr.estatus != 'CONCLUIDO'">
                                                <template v-if="listaPermisos.includes('editar.solicitud')">
                                                    <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                        placement="top" style="background-color: var(--iee-white);">
                                                        <router-link class="btn btn-flat btn-sm "
                                                            :to="{ name: 'editar.solicitud', params: { id: tr.id, } }">
                                                            <span class="material-symbols-rounded"
                                                                style="color: var(--text-color);">
                                                                edit
                                                            </span>
                                                        </router-link>
                                                    </el-tooltip>
                                                </template>
                                                <template>
                                                    <el-tooltip class="item h-100" effect="dark" content="Recordatorio"
                                                        placement="top">
                                                        <vs-button class="btn btn-flat btn-sm " @click.prevent="sendEmailPass"
                                                            style="background-color: var(--iee-white);border-color: var(--iee-white);">
                                                            <span class="material-symbols-rounded"
                                                                style="color: var(--text-color);">
                                                                notifications
                                                            </span>
                                                        </vs-button>
                                                    </el-tooltip>
                                                </template>
                                            </template>
                                        </template>
                                    </template>
                                    <template v-else>
                                        <template v-if="tr.idTipo == 3">
                                            <template v-for="( de, i ) in tr.departamentosNoEnterados">
                                                <template v-if="de == idDepartamento">
                                                    <el-tooltip class="item h-100" effect="dark" content="Enterado"
                                                        placement="top">
                                                        <vs-button id="logoutBtn" icon danger size="large"
                                                            @click.prevent="CopiaEnterado(tr.id)">
                                                            <span class="material-symbols-rounded"
                                                                style="color: white !important;">
                                                                thumb_up
                                                            </span>
                                                        </vs-button>
                                                    </el-tooltip>
                                                </template>
                                            </template>
                                            <template v-for="( dee, i ) in tr.departamentosEnterados">
                                                <template v-if="dee == idDepartamento">
                                                    <br><br>
                                                    <span class="badge rounded-pill"
                                                        style="background-color: var(--iee-green2) !important; color: var(--iee-white)!important">ENTERADO</span>
                                                </template>
                                            </template>
                                        </template>
                                        <template v-else>
                                            <template v-if="listaPermisos.includes('solicitudes.archivo')">
                                                <el-tooltip class="item h-100" effect="dark"
                                                    content="Cargar contestación" placement="top"
                                                    v-if="tr.rutaContestacion == null">
                                                    <vs-button id="logoutBtn" icon danger size="large"
                                                        @click.prevent="modalSubirArchivo(tr.id)">
                                                        <span class="material-symbols-rounded"
                                                            style="color: white !important;">
                                                            upload_file
                                                        </span>
                                                    </vs-button>
                                                </el-tooltip>
                                            </template>
                                            <template v-if="listaPermisos.includes('editar.solicitud')">
                                                <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                    placement="top">
                                                    <router-link class="btn btn-flat btn-sm "
                                                        style="background-color: white;"
                                                        :to="{ name: 'editar.solicitud', params: { id: tr.id, } }">
                                                        <span class="material-symbols-rounded"
                                                            style="color: var(--text-color);">
                                                            edit
                                                        </span>
                                                    </router-link>
                                                </el-tooltip>
                                            </template>
                                        </template>
                                    </template>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="page" color="dark"
                                :length="$vs.getLength($vs.getSearch(NewlistSolicitudes, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
                <vs-dialog not-padding v-model="active">
                    <center>
                        <object :data="archivoRuta" type="application/pdf" width="900rem" height="900rem">
                            <iframe :src="archivoRuta" width="900rem" height="900rem" style="border: none;">
                                <a :href="archivoRuta">Descarga aqui...</a>
                            </iframe>
                        </object>
                    </center>
                </vs-dialog>
                <vs-dialog blur v-model="active2">
                    <template #header>
                        <h4 class="not-margin">
                            <b>Archivo de Contestación</b>
                        </h4>
                    </template>
                    <div class="con-form">
                        <div class="col-sm-12 col-md-12 col-xl-12 px-0 pr-sm-12 pb-3">
                            <label class="col-form-label">Archivo</label>
                            <div class="row px-0 pr-sm-5 pb-3">
                                <div class="col-md-12">
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
                    </div>
                    <template #footer>
                        <div class="footer-dialog">
                            <vs-button style="width: 19vw; " color="#a5904a" block
                                @click.prevent="archivoContestacion()">
                                Guardar Archivo
                            </vs-button>
                        </div>
                    </template>
                </vs-dialog>
                <vs-dialog v-model="modalRecordatorio">
                    <template #header>
                        <h4 class="not-margin">
                            Recordatorio
                        </h4>
                    </template>
                    <div class="con-form">
                        <label class="col-form-label">Hora</label>
                        <el-time-picker v-model="hora" arrow-control placeholder="Seleccione una hora">
                        </el-time-picker>
                        <br>
                        <label class="col-form-label">Fecha</label>
                        <el-date-picker type="date" placeholder="Fecha de Termino" :picker-options="pickerOptions2"
                            format="dd-MM-yyyy" value-format="yyyy-MM-dd" v-model="fecha">
                        </el-date-picker>
                    </div>
                </vs-dialog>
            </div>
        </div>
    </div>
</template>

<script>
let methods = require('../../../../methods')
export default {
    data() {
        return {
            listaPermisos: [],
            page: 1,
            max: 10,
            search: '',
            listSolicitudes: [],
            NewlistSolicitudes: [],
            active: false,
            active2: false,
            archivoRuta: '',
            idSolicitud: '',
            form: new FormData,
            documentos: {
                F1: "",
            },
            errorF1: 0,
            idDepartamento: '',
            modalRecordatorio: false,
            hora: new Date(2016, 9, 10, 18, 40),
            fecha: '',
            pickerOptions2: {
                disabledDate(time) {
                    var date = new Date();
                    date.setDate(date.getDate() - 1);
                    return time.getTime() < date;
                },
            },
        }
    },
    created() {
        this.idDepartamento = JSON.parse(sessionStorage.getItem('idDepartamento'))
        this.listaPermisos = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'))
        const loading = this.$vs.loading({
            type: 'square',
            color: '#00a19a',
            background: '#FFFFFF',
            text: 'Cargando...'
        });

        this.checkCrear(loading);
    },
    mounted() {

    },
    computed: {
        colorStatus() {
            return (fechaTermino, diasTermino, estatus) => {
                let color = ''
                if (fechaTermino != null) {
                    const moment = require('moment');
                    let currentDate = moment();
                    let formattedDate = currentDate.format('DD/MM/YYYY');
                    let validDate = moment(formattedDate, 'DD/MM/YYYY');
                    let validDate2 = moment(fechaTermino, 'DD/MM/YYYY');
                    let date1 = new Date(validDate)
                    let date2 = new Date(validDate2)
                    let differenceInMs = Math.abs(date1 - date2);
                    let differenceInDays = Math.floor(differenceInMs / (1000 * 3600 * 24));
                    let date3 = new Date(date1).getTime()
                    let date4 = new Date(date2).getTime()
                    let falta = date3 - date4


                    if (estatus != 'CONCLUIDO') {
                        if (falta < 0) {
                            color = ''
                        } else {
                            if (diasTermino != null) {
                                if (differenceInDays <= diasTermino) {
                                    switch (differenceInDays) {
                                        case 0:
                                            color = 'css-conundia'
                                            break;
                                        case 1:
                                            color = 'css-conundia'
                                            break;
                                        case 2:
                                            color = 'css-condosdias'
                                            break;
                                        case 3:
                                            color = 'css-condosdias'
                                            break;
                                        default:

                                    }
                                } else if (differenceInDays >= diasTermino) {
                                    color = 'css-conundial'
                                }
                            }
                        }
                        return color
                    }

                }
            }

        },
    },
    methods: {
        checkCrear(loading) {
            this.getSolicitudes(loading);
        },
        getSolicitudes(loading) {
            this.NewlistSolicitudes = [];
            let url = '/administracion/usuario/getSolicitudes';

            axios.get(url, {
                params: {
                    'tipo': this.idDepartamento
                }
            }).then((response) => {
                this.listSolicitudes = response.data;
                this.filterSolicitudes();
                loading.close();
            }).catch((error) => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        filterSolicitudes() {
            let me = this;
            let conteo = 0;
            me.listSolicitudes.map(function (x, y) {
                me.NewlistSolicitudes.push({
                    'continua': conteo += 1,
                    'id': x.id,
                    'numeroConsecutivo': x.numeroConsecutivo,
                    'numeroSolicitud': x.numeroSolicitud,
                    'fechaRecibido': x.fechaRecibido,
                    'remitente': x.remitente,
                    'cargo': x.cargo,
                    'otroremitente': x.otroRemitente,
                    'otrocargo': x.otroCargo,
                    'asunto': x.asunto,
                    'termino': x.termino,
                    'fechaTermino': x.fechaTermino,
                    'diasTermino': x.diasTermino,
                    'respuesta': x.respuesta,
                    'seguimiento': x.seguimiento,
                    'areaAsignada': x.areaAsignada,
                    'tipo': x.tipo,
                    'idTipo': x.idtipo,
                    'fechaAsignacion': x.fechaAsignacion,
                    'estatus': x.estatus,
                    'archivo': x.RUTA,
                    'rutaContestacion': x.rutaContestacion,
                    'departamentosNoEnterados': x.departamentosNoEnterados.split(','),
                    'departamentosEnterados': x.departamentosEnterados.split(','),
                    'Enterados': JSON.parse(x.Enterados),
                    'NoEnterados': JSON.parse(x.NoEnterados)
                })
            })


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
        abrirmodal(archivo) {
            this.archivoRuta = ''
            this.active = !this.active
            this.archivoRuta = archivo
        },
        modalSubirArchivo(idsol) {
            this.idSolicitud = ''
            this.active2 = !this.active2
            this.idSolicitud = idsol
        },
        async archivoContestacion() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let idF1 = 0
            let url = '/administracion/usuario/archivoContestacion'
            if (this.documentos.F1.size > 0) {
                idF1 = await this.setRegistrarArchivo(this.documentos.F1, "");
            }
            axios.post(url, {
                'archivoid': idF1,
                'idsolicitud': this.idSolicitud
            }).then(response => {
                this.active2 = !this.active2
                this.getSolicitudes(loading);
                Swal.fire({
                    icon: 'success',
                    title: 'Archivo cargado de forma correcta',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            }).catch((error) => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
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
        CopiaEnterado(id) {
            let url = '/administracion/usuario/CopiaEnterado'
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });

            axios.post(url, {
                'solicitud': id,
                'departamento': this.idDepartamento
            }).then((response) => {
                loading.close();
                this.getSolicitudes(loading);
                Swal.fire({
                    icon: 'success',
                    title: 'Se a registrado el enterado correctamente',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            }).catch((error) => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        todosEnteradoConcluido(id) {
            let url = '/administracion/usuario/todosEnteradoConcluido'
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });

            axios.post(url, {
                'estatus': 4,
                'solicitud': id
            }).then((response) => {
                loading.close();
                this.getSolicitudes(loading);
                Swal.fire({
                    icon: 'success',
                    title: 'Se a concluido correctamnete ',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            }).catch((error) => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        sendEmailPass() {
            let url = '/send-mail'
            axios.get(url, {
                params: {
                    'cUsername': 'Miguel',
                    'cEmail': 'migueldjssn98@gmail.com',
                }
            }).then(response => {

                Swal.fire({
                    icon: "success",
                    title: "Correo Mandado",
                    text: 'El recordatprio se mandado con exito, verifíque su bandeja del correo electrónico asociado a su cuenta',
                    showConfirmButton: true,
                    confirmButtonText: "De acuerdo",
                });
            }).catch(error => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },

    }
}
</script>

<style scoped>
.vs-table__tr,
tr.vs-table__tr>>>td {
    border-radius: 0% !important;
}

.css-condosdias {
    background-color: #ffd060 !important;
}

.css-condosdias:hover td {
    background-color: #FFC300 !important;
}

.css-conundia:hover td {
    background-color: #f07a28 !important;
}

.css-conundia {
    background-color: #f08d49 !important;
}


.css-conundial:hover td {
    background-color: #f03c18 !important;
}

.css-conundial {
    background-color: #f0785dcb !important;
}
</style>