<template>
    <div class="container-fluid">
        <div class="row col-12 mx-0 card-info">
            <div class="container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #header>
                            <vs-input v-model="search" border placeholder="Escribe un numero"
                                class="inputSearchPreguntas" />
                        </template>
                        <template #thead>
                            <vs-tr>
                                <vs-th class="vsax-th">id</vs-th>
                                <vs-th class="vsax-th">Área solicita</vs-th>
                                <vs-th class="vsax-th">Núm. Memo</vs-th>
                                <vs-th class="vsax-th">Asunto</vs-th>
                                <vs-th class="vsax-th">Fecha recibido</vs-th>
                                <vs-th class="vsax-th">Hora recibido</vs-th>
                                <vs-th class="vsax-th">Termino</vs-th>
                                <vs-th class="vsax-th">Fecha termino</vs-th>
                                <vs-th class="vsax-th">Área asignada</vs-th>
                                <vs-th class="vsax-th">Requiere respuesta</vs-th>
                                <vs-th class="vsax-th">Archivo</vs-th>
                                <vs-th class="vsax-th">Contestación</vs-th>
                                <vs-th class="vsax-th">Estatus</vs-th>
                                <vs-th class="vsax-th">Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in listSolicitudes" :key="index">
                                <vs-td>{{ tr.idSolicitud }}</vs-td>
                                <vs-td>{{ tr.areaSolicita }}</vs-td>
                                <vs-td>{{ tr.numMemo }}</vs-td>
                                <vs-td>{{ tr.asunto }}</vs-td>
                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.termino }}</vs-td>
                                <vs-td>
                                    {{ tr.fechaTermino ? tr.fechaTermino : '-' }}
                                </vs-td>
                                <vs-td>{{ tr.areaAsignar }}</vs-td>
                                <vs-td>
                                    <span v-if="tr.respuesta == 1">Si</span>
                                    <span v-else>No</span>
                                </vs-td>
                                <vs-td>
                                    <div class="d-flex justify-content-center">
                                        <el-tooltip class="item" effect="dark" :content="'Ver archivo'" placement="top">
                                            <vs-button danger class="btn btn-flat btn-sm py-1"
                                                @click.prevent="verArchivo(tr, 1)">
                                                <i class="fas fa-file-pdf"></i>
                                            </vs-button>
                                        </el-tooltip>
                                    </div>
                                </vs-td>
                                <vs-td>
                                    <div class="d-flex justify-content-center">
                                        <template v-if="tr.rutaContestacion != null">
                                            <el-tooltip class="item h-100" effect="dark" placement="top">
                                                <div slot="content">Ver contestación</div>
                                                <vs-button icon color="rgb(58,197,55)" size="large"
                                                    @click.prevent="verArchivo(tr, 2)">
                                                    <i class="fas fa-file-pdf p-1"></i>
                                                </vs-button>   
                                            </el-tooltip>
                                        </template>
                                        <template v-else>
                                            <span>N/A</span>
                                        </template>
                                    </div>                                 
                                </vs-td> 
                                <vs-td class="">
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
                                    <template v-else>
                                        <span class="badge rounded-pill"
                                            style="background-color: var(--iee-black) !important; color: var(--iee-white)!important">{{ tr.estatus }}</span>
                                    </template>
                                </vs-td>                               
                                <vs-td>
                                    <div class="d-flex justify-content-center">
                                        <el-tooltip class="item h-100" effect="dark"
                                            content="Cargar contestación" placement="top" v-if="tr.rutaContestacion == null">
                                            <vs-button id="logoutBtn" icon danger size="large"
                                                @click.prevent="modalSubirContestacion(tr)">
                                                <span class="material-symbols-rounded"
                                                    style="color: white !important;">
                                                    upload_file
                                                </span>
                                            </vs-button>
                                        </el-tooltip> 
                                        <el-tooltip class="item" effect="dark" :content="'Editar solicitud'" placement="top">
                                            <vs-button class="btn btn-flat btn-sm py-1"
                                                @click.prevent="toEdit(tr.idSolicitud)">
                                                <span class="material-symbols-rounded" style="color: var(--text-color);">edit</span>
                                            </vs-button>
                                        </el-tooltip>
                                        <template>
                                            <el-tooltip class="item h-100" effect="dark" content="Recordatorio"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    @click.prevent="sendRecordatorio(tr.otroremitente, tr.remitente, tr.correo, tr.asunto, tr.fechaTermino)"
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        notifications
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                        </template> 
                                    </div>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound>
                            <div style="background-color: var(--iee-white) !important;">
                                Sin resultados...
                            </div>
                        </template>
                        <template #footer>
                            <vs-pagination v-model="page" color="dark"
                                :length="$vs.getLength($vs.getSearch(listSolicitudes, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>   
        <vs-dialog scroll overflow-hidden not-padding v-model="showModalArchivo" auto-width id="modalArchivo" @close="closeModalArchivo()">
            <template #header>
            <h3 class="pt-3">Archivo de {{ tipoModal == 1 ? 'solicitud' : 'contestación' }}</h3>
            </template>
            <div class="con-content">
                <template v-if="Object.keys(datosArchivo).length > 0">
                    <div v-if="tipoModal == 1 && datosArchivo.rutaDoc">
                        <div v-if="datosArchivo.rutaDoc.includes('pdf')" class="center" :key="tipoModal">
                            <object :data="og + datosArchivo.rutaDoc + stamp" :type="`application/pdf`" height="700" width="600">
                                <div class="px-3">
                                    <p>No es posible mostrar el archivo de la solicitud.</p>
                                    <a class="" :href="og + datosArchivo.rutaDoc + stamp" target="_blank">Abrir en una nueva pestaña</a>
                                </div>
                            </object> 
                        </div>
                    </div>
                    <div v-else-if="tipoModal == 2 && datosArchivo.rutaContestacion">
                        <div v-if="datosArchivo.rutaContestacion.includes('pdf')" class="center" :key="tipoModal">
                            <object :data="og + datosArchivo.rutaContestacion + stamp" :type="`application/pdf`" height="700" width="600">
                                <div class="px-3">
                                    <p>No es posible mostrar el archivo de la solicitud.</p>
                                    <a class="" :href="og + datosArchivo.rutaContestacion + stamp" target="_blank">Abrir en una nueva pestaña</a>
                                </div>
                            </object> 
                        </div>
                    </div>
                </template>
                <template v-else>
                    <div class="px-3">
                        <p>No es posible mostrar el archivo.</p>
                    </div>
                </template>
            </div>
            <template #footer>
                <div v-if="Object.keys(datosArchivo).length > 0" class="row">
                    <div class="col-12 text-center pb-3">
                        &nbsp;
                        <!-- <div class="badge bg-light text-wrap">
                            
                        </div> -->
                    </div>
                </div>
            </template>
        </vs-dialog>
        <vs-dialog scroll overflow-hidden prevent-close not-padding v-model="showModalSubirContestacion" auto-width id="modalArchivo" @close="closeModalArchivoContestacion()">
            <template #header>
                <div class="col text-center">
                    <br /><h4 class="not-margin">
                        <b>Cargar Contestación Memorándum</b>
                    </h4>
                </div>
            </template>
            <div class="con-content overflow-hidden">
                <template v-if="Object.keys(datosContestacion).length > 0">
                    <div class="row overflow-hidden px-3">
                        <div class="col-12 px-3 pb-3 text-center">
                            <label class="col-form-label">Núm. {{ datosContestacion.numMemo }}</label>
                        </div>
                        <div class="col-12 px-3 pb-3">
                            <label class="col-form-label">Cargar archivo</label>
                            <div class="d-flex justify-content-start justify-content-md-center overflow-auto">
                                <template v-if="archivoContestacion.length === 0">
                                    <el-upload class="upload-demo my-4" :class="archivoContestacion.length > 0 ? 'd-none' : 'd-block'" drag
                                    action="https://jsonplaceholder.typicode.com/posts/" :on-preview="handlePreview" :on-remove="handleRemoveF1"
                                    :on-change="handleF1" :on-exceed="handleExceed" :auto-upload="false" accept=".pdf"
                                    :limit="1" ref="upload">
                                    <i class="fa fa-cloud-upload-alt"
                                        style="font-size: 70px; margin-top: 30px; margin-bottom: 10px; color: var(--grey);"></i>
                                    <div class="el-upload__text">Suelta tu archivo aquí o <em>haz clic para seleccionar</em></div>
                                    <div slot="tip" class="el-upload__tip">
                                        Solo archivos de tipo PDF
                                        <transition name="error-slide">
                                            <div class="danger-message" v-if="errorFConte == 1">
                                                <template>
                                                    Seleccione un archivo para subir
                                                </template>
                                            </div>
                                        </transition>
                                    </div>
                                    </el-upload>
                                </template>
                                <template v-else>
                                    <div class="py-3">
                                        <div class="d-flex justify-content-between p-2 my-3 cardFile" :class="!!darkMode ? 'shadow-dark' : 'shadow'">
                                            <!-- Tipo -->
                                            <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex">
                                                <i class="fa fa-file-image m-2 mr-3" style="font-size: 32px; color: var(--iee-white-dark);"></i>
                                                <div class="d-flex flex-column filenameContainer">
                                                <span class="errorDesc">Nombre</span>
                                                <el-tooltip class="item" effect="dark" :content="archivoContestacion.name" placement="right">
                                                    <div>
                                                    <span class="fileNameClass errorDescDesc bold" style=""> {{ archivoContestacion.name }} </span>
                                                    </div>
                                                </el-tooltip>
                                                </div>
                                            </div>
                                            <el-tooltip class="item" effect="dark" content="Eliminar archivo" placement="right">
                                                <div class="cardFileRemoveIcon" @click="handleRemoveF1">
                                                <i class="far fa-trash-alt"></i>
                                                </div>
                                            </el-tooltip>
                                            </div>
                                        </div>
                                    </div>
                                </template>
                            </div>                              
                        </div>
                    </div>
                </template>
            </div>
            <template #footer>
                <div v-if="Object.keys(datosContestacion).length > 0" class="footer-dialog pb-3">
                    <div class="px-3 d-flex justify-content-center flex-column flex-md-row">     
                        <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode" @click.prevent="accionContestacion"
                            :disabled="archivoContestacion == ''">
                            <div style="color: var(--btn-txt-color); font-weight: 700;">
                                <i class="fas fa-file-upload pr-2" style="font-size: 0.8125rem !important;"></i>Cargar contestación
                            </div>
                        </vs-button>                                
                    </div>
                </div>
            </template>        
        </vs-dialog>
    </div>
</template>

<script>
let methods = require('../../../../methods')
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark', 
            og: window.location.origin + '/',
            stamp: this.getLocalStamp(),
            listaPermisos: [],
            page: 1,
            max: 10,
            search: '',
            listSolicitudes: [],

            showModalArchivo: false,
            datosArchivo: {},

            showModalSubirContestacion: false,
            datosContestacion: {},
            archivoContestacion: '',
            errorFConte: 0,

            tipoModal: 0,
        }
    },
    async created() {
        EventBus.$on('darkMode', (data)=>{this.darkMode = data});
        const load = methods.loading( this.$vs );
        await this.getAllByType(2);
        load.close();
    },
    mounted() {

    },
    computed: {

    },
    methods: {
        async getAllByType( tipo = 1) {
            const url = '/administracion/solicitud/getAllByType';

            try {
                const response = await axios.get(url,{ params: {
                    'nTipo': tipo,
                }})
                if(response.status === 200){
                    this.listSolicitudes = response.data;
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        toEdit( id ){
            this.$router.push({ name: 'editar.solicitud', params: { idSolicitud: id} })
        },
        verArchivo(datos, tipo){
            this.tipoModal = tipo;
            this.datosArchivo = datos;
            this.showModalArchivo = true;
        },
        closeModalArchivo(){
            this.datosArchivo = {};
            this.showModalArchivo = false;
            this.tipoModal = 0;
        },   
        getLocalStamp(){
            return '?stamp=' + new Date().getTime();
        }, 
        sendRecordatorio(usuario, otroUsuario, correo, asunto, termino) {
            usuario = 'Prueba';
            otroUsuario = 'Prueba-2';
            correo = 'ricardo.cordero@ieepuebla.org.mx';
            asunto = 'Prueba de email';
            termino = '08/11/2024';
            if (correo.length > 0) {
                let nombre = (usuario != null) ? usuario : otroUsuario
                const loading = methods.loading( this.$vs );
                let url = '/send-mail'
                axios.get(url, {
                    params: {
                        'cUsername': nombre,
                        'cEmail': correo,
                        'asunto': asunto,
                        'termino': termino
                    }
                }).then(response => {
                    loading.close();
                    Swal.fire({
                        icon: "success",
                        title: "Correo Enviado",
                        text: 'El recordatorio se envió con éxito, verifíque su bandeja del correo electrónico asociado a su cuenta',
                        showConfirmButton: true,
                        confirmButtonText: "De acuerdo",
                    });
                }).catch(error => {
                    loading.close();
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);
                });
            }else{

            }
        },  
        // contestación
        modalSubirContestacion(datos) {
            this.datosContestacion = datos;
            this.showModalSubirContestacion = true;
        },  
        closeModalArchivoContestacion() {
            this.showModalSubirContestacion = false;
            this.datosContestacion = {};
            this.archivoContestacion = '';
        }, 

        handleF1(file, fileList) {
            this.archivoContestacion = this.handleChange(file, fileList);
        },
        handlePreview(file) {
        },
        handleRemoveF1(file, fileList) {
            this.archivoContestacion = ''
        },
        handleExceed(files, fileList) {
            Swal.fire({
                icon: 'error',
                title: 'Solo puede subir un documento.',
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
        async accionContestacion(){
            if(this.archivoContestacion !== ''){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Cargar archivo de contestación?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Cargar contestación',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                }).then( async (result) => {
                    if( result.isConfirmed ){
                        const load = methods.loading( this.$vs );
                        let tStamp = methods.getTimestamp();
                        let archivo = await this.subirArchivoContestacion(
                            this.datosContestacion.idSolicitud,
                            this.archivoContestacion,
                            '',
                            5
                        );
                        await this.setGuardaContestacion( archivo, tStamp );
                        let estatus = await this.setUpdateEstatus( this.datosContestacion.idSolicitud, 4, tStamp);
                        setTimeout(() => {
                            if( estatus == 1){
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Contestación guardada correctamente',
                                    showConfirmButton: true,
                                    confirmButtonText: 'De acuerdo',
                                }).then( async (result) => {
                                    this.archivoContestacion = '';
                                    this.datosContestacion = '';
                                    this.stamp = this.getLocalStamp();
                                    await this.getAllByType(2);
                                    this.showModalSubirContestacion = false;
                                });                            
                            }                            
                        }, 300);
                        load.close();
                    }
                });                
            }
        },
        async subirArchivoContestacion(solicitud, oDocumento, fileExt, tipo) {
            let idArchivo = 0;
            let filename = oDocumento.name.split('.');
            let form = new FormData();
            form.set('idSolicitud', solicitud);
            form.set('archivo', oDocumento);
            form.set('filename', filename[0]);
            form.set('extension', fileExt);
            form.set('tipo', tipo);

            const config = { headers: { 'Content-Type': 'multipart/form-data' } };

            let url = '/archivos/subirArchivoContestacion';
            await axios.post(url, form, config).then(response => {
                idArchivo = response.data[0].idDOCUMENTO
            }).catch((error) => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[2], this.$router);
            });

            return idArchivo;
        }, 
        async setGuardaContestacion( idARCHIVO, tStamp ) {
            const url = '/administracion/solicitud/setGuardaContestacion';
            let value = 0;
            try {
                const response = await axios.post(url, {
                    'idSolicitud': this.datosContestacion.idSolicitud,
                    'idArchivo': idARCHIVO,
                    'fAccion': tStamp
                });
                if(response.status === 200){
                    value = 1;
                }
                return value;
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
                return value;
            }
        },  
        async setUpdateEstatus( solicitud, idEstatus = 1, tStamp) {
            const url = '/administracion/solicitud/setUpdateEstatus';
            try {
                const response = await axios.post(url,{
                    'idSolicitud': solicitud,
                    'idEstatus': idEstatus,
                    'fAccion': tStamp
                });
                if( response.status === 200){
                    return 1;
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
                return 0;
            }
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