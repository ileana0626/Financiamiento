<template>
    <div class="container-fluid">
        <div class="row col-12 mx-0 card-info">
            <div class="container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #header>
                            <vs-input v-model="search" border placeholder="Escribe un dato"
                                class="inputSearchPreguntas" />
                        </template>
                        <template #thead>
                            <vs-tr>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'idSolicitud')">id</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'capitulo')">Capítulo</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'numFolio')">Folio</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaRecibido')">Fecha recibido</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'horaRecibido')">Hora recibido</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaSolicita')">Área solicita</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaAsignar')">Área asignada</vs-th>
                                <vs-th class="vsax-th">Archivo Recibido</vs-th>
                                <vs-th class="vsax-th">Archivo Respuesta</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'estatus')">Estatus</vs-th>
                                <vs-th class="vsax-th">Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in $vs.getSearch(listSolicitudes, search)" :key="index" :data="tr">
                                <vs-td>{{ tr.idSolicitud }}</vs-td>
                                <vs-td>{{ tr.capitulo }}</vs-td>
                                <vs-td>{{ tr.numFolio }}</vs-td>
                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.areaSolicita }}</vs-td>
                                <vs-td>{{ tr.areaAsignar }}</vs-td>
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
                                            <span>{{ tr.respuesta == 1 ? 'Pendiente' : 'N/A' }}</span>
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
                                    <div class="d-flex justify-content-center" v-if="tr.estatus != 'CONCLUIDO'">
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
                                        <el-tooltip class="item h-100" effect="dark"
                                            content="Concluir" placement="top">
                                            <vs-button icon color="rgb(58,197,55)" size="large" v-if="tr.rutaContestacion"
                                                @click.prevent="accionConcluir(tr.idSolicitud)">
                                                <span class="material-symbols-rounded"
                                                    style="color: white !important;">
                                                    thumb_up
                                                </span>
                                            </vs-button>
                                        </el-tooltip>
                                    </div>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound>
                            <div style="background-color: var(--iee-white) !important; color: var(--iee-white-dark);">
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
                        <b>Cargar Contestación Requsición</b>
                    </h4>
                </div>
            </template>
            <div class="con-content overflow-hidden">
                <template v-if="Object.keys(datosContestacion).length > 0">
                    <div class="row overflow-hidden px-3">
                        <div class="col-12 px-3 pb-3 text-center">
                            <label class="col-form-label">Folio {{ datosContestacion.numFolio }}</label>
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
            dptoUsuario: Number(sessionStorage.getItem('idDepartamento')),
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
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
        const load = methods.loading( this.$vs );
        await this.getAllByType(1);
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
                    'nDPTO': this.dptoUsuario,
                    'nRol': this.$attrs.rol,
                    'nUser': this.$attrs.user,
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
                        let archivo = await this.subirArchivoContestacion(
                            this.datosContestacion.idSolicitud,
                            this.archivoContestacion,
                            '',
                            5
                        );
                        await this.setGuardaContestacion( archivo );
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
        async setGuardaContestacion( idARCHIVO ) {
            const url = '/administracion/solicitud/setGuardaContestacion';

            try {
                const response = await axios.post(url, {
                    'idSolicitud': this.datosContestacion.idSolicitud,
                    'idArchivo': idARCHIVO,
                    'fAccion': methods.getTimestamp(),
                });
                if(response.status === 200){
                    Swal.fire({
                        icon: 'success',
                        title: 'Contestación guardada correctamente',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo',
                    }).then( async (result) => {
                        this.archivoContestacion = '';
                        this.datosContestacion = '';
                        this.stamp = this.getLocalStamp();
                        await this.getAllByType(1);
                        this.showModalSubirContestacion = false;
                    });
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        // utilidades
        getLocalStamp(){
            return '?stamp=' + new Date().getTime();
        },    
        //concluir 
        accionConcluir( solicitud ) {
            Swal.fire({
                icon: 'warning',
                title: '¿Concluir solicitud?',
                showConfirmButton: true,
                showCancelButton: true,
                confirmButtonText: 'Si, concluir',
                cancelButtonText: 'Cancelar',
                reverseButtons: true,
            }).then(async result => {
                if(result.isConfirmed){
                    const load = methods.loading( this.$vs );
                    let estatus = await this.setUpdateEstatus(solicitud, 4, methods.getTimestamp());
                    if(estatus == 1){
                        Swal.fire({
                            icon: 'success',
                            title: 'Solicitud concluida correctamente',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo',
                        }).then( async (result) => {
                            this.stamp = this.getLocalStamp();
                            await this.getAllByType(1);
                        });                         
                    }
                    load.close();
                }
            })
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