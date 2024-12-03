<template>
    <div class="container-fluid">
        <div class="row col-12 mx-0 card-info">
            <div class="container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <div class="container-fluid d-flex justify-content-center">
                        <div class="row d-flex px-3 py-4 w-100">
                            <div class="col-12 col-md-6 col-xl-3 px-3 py-2 w-auto">
                                <div class="d-flex justify-content-center align-items-center font-weight-bold" style="color: var(--iee-white-dark);">
                                    Mes:&nbsp;
                                    <el-select filterable v-model="selectMes" placeholder="Seleccione un mes" class="con-consultar" @change="customRango()">
                                        <el-option v-for="item in listMeses" :key="item.id" :label="item.mes"
                                            :value="item.id">
                                        </el-option>
                                    </el-select>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-xl-3 px-3 py-2 w-auto">
                                <div class="d-flex justify-content-center align-items-center font-weight-bold" style="color: var(--iee-white-dark);">
                                    Año:&nbsp;
                                    <el-select filterable v-model="selectAnio" placeholder="Seleccione un año" class="con-consultar" @change="customRango()">
                                        <el-option v-for="item in listaAnios" :key="item.id" :label="item.anio"
                                            :value="item.anio">
                                        </el-option>
                                    </el-select>
                                </div>
                            </div>
                            <div class="col-12 col-xl-6 px-3 py-2 w-auto d-flex row row-columns">
                                <vs-button color="#1a2e35" class="mx-auto mb-3" @click.prevent="getHistorial()">
                                    <i class="fas fa-search mr-2" style="font-size: 15px;"></i>
                                    <b style="font-size: 0.8125rem;">&nbsp;Consultar</b> 
                                </vs-button>
                                <vs-button color="#1a2e35" class="mx-auto mb-3" @click.prevent="reporteMensualPDF()">
                                    <i class="fas fa-file-pdf mr-3" style="font-size: 15px;"></i>
                                    <b style="font-size: 0.8125rem;">&nbsp;&nbsp;Reporte PDF</b> 
                                </vs-button>
                                <vs-button color="#1a2e35" class="mx-auto mb-3" @click.prevent="working()">
                                    <i class="fas fa-file-excel mr-3" style="font-size: 15px;"></i>
                                    <b style="font-size: 0.8125rem;">&nbsp;&nbsp;Reporte Excel</b> 
                                </vs-button>
                            </div>
                        </div>
                    </div>
                    <vs-table>
                        <template #header>
                            <vs-input v-model="search" border placeholder="Escribe un dato"
                                class="inputSearchPreguntas" />
                        </template>
                        <template #thead>
                            <vs-tr>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'idSolicitud')">id</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'solicitud')">Tipo</vs-th>
                                <vs-th class="vsax-th">Número</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'remitente')">Remitente</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'cargo')">Cargo</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'asunto')">Asunto</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaRecibido')">Fecha recibido</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'horaRecibido')">Hora recibido</vs-th>
                                <vs-th class="vsax-th">Termino</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaTermino')">Fecha termino</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaAsignada')">Área asignada</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaEmite')">Área emite</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaSolicita')">Área solicita</vs-th>
                                <vs-th class="vsax-th">Requiere respuesta</vs-th>
                                <vs-th class="vsax-th">Archivo recibido</vs-th>
                                <vs-th class="vsax-th">Archivo respuesta</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'idSolicitud')">Estatus</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in $vs.getPage($vs.getSearch(listSolicitudes, search), page, max)" :key="index" :data="tr">
                                <vs-td>{{ tr.idSolicitud }}</vs-td>
                                <vs-td>{{ tr.solicitud }}</vs-td>
                                <vs-td>
                                    <span v-if="tr.numFolio">{{ tr.numFolio}}</span>
                                    <span v-else-if="tr.numMemo">{{ tr.numMemo}}</span>
                                    <span v-else-if="tr.numOficio">{{ tr.numOficio}}</span>
                                    <span v-else>-</span>
                                </vs-td>
                                <vs-td>{{ tr.remitente ? tr.remitente : '-'}}</vs-td>
                                <vs-td>{{ tr.cargo ? tr.cargo : '-'}}</vs-td>
                                <vs-td>{{ tr.asunto ? tr.asunto : '-'}}</vs-td>
                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.termino ? tr.termino : '-' }}</vs-td>
                                <vs-td>
                                    {{ tr.fechaTermino ? tr.fechaTermino : '-' }}
                                </vs-td>
                                <vs-td>{{ tr.areaAsignar ? tr.areaAsignar : '-' }}</vs-td>
                                <vs-td>{{ tr.areaEmite ? tr.areaEmite : '-' }}</vs-td>
                                <vs-td>{{ tr.areaSolicita ? tr.areaSolicita : '-' }}</vs-td>
                                <vs-td>{{ reqRespuesta(tr.respuesta) }}</vs-td>
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
                                            <span>{{ tr.respuesta == 1 ? 'Pendiente' : 'N/A'}}</span>
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
                        <b>Cargar Contestación Oficio</b>
                    </h4>
                </div>
            </template>
            <div class="con-content overflow-hidden">
                <template v-if="Object.keys(datosContestacion).length > 0">
                    <div class="row overflow-hidden px-3">
                        <div class="col-12 px-3 pb-3 text-center">
                            <label class="col-form-label">Núm. {{ datosContestacion.numOficio }}</label>
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
            rolUsuario: Number(sessionStorage.getItem('rolUsuario')),
            idUsuario: Number(sessionStorage.getItem('idUsuario')),
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
            selectAnio: '',
            listaAnios: [],
            selectMes: '',
            listMeses: [],
            rangoIni: '',
            rangoFin: '',
            elMes: '',
        }
    },
    async created() {
        EventBus.$on('darkMode', (data)=>{this.darkMode = data});
        const load = methods.loading( this.$vs );
        await this.getAnios();
        await this.obtenerDatos(); //get meses
        this.customRango();
        load.close();
        await this.getHistorial();
    },
    mounted() {

    },
    computed: {
        reqRespuesta(){
            return (respuesta) =>{
                if(respuesta){
                    return respuesta == 1 ? 'Si' : 'No';
                } else return '-';
            }
        },
        mesActual(){
            let date = new Date();
            return date.getMonth() + 1;
        },
    },
    methods: {
        async getHistorial() {
            const url = '/administracion/solicitud/getHistorial';
            const load = methods.loading( this.$vs );
            try {
                this.listSolicitudes = [];
                const response = await axios.get(url, {params: {
                    'nUsuario': this.idUsuario,
                    'nRol': this.rolUsuario,
                    'nDPTO': this.dptoUsuario,
                    'fInicio': this.rangoIni,
                    'fFin': this.rangoFin,
                }});
                if(response.status === 200){
                    this.listSolicitudes = response.data;
                    load.close();
                }
            } catch (error) {
                load.close();
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        async getAnios() {
            const url = '/administracion/solicitud/getAnios';
            try {
                const response = await axios.get(url);
                if(response.status === 200){
                    this.listaAnios = response.data;
                    this.selectAnio = response.data[0].anio;
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        async obtenerDatos() {
            let url = '/administracion/usuario/obtenerDatos'
            await axios.get(url, {
                params: {
                    'tipo': 11, // cat meses
                    'consulta': 2
                }
            }).then(response => {
                this.listMeses = response.data;
                this.selectMes = this.mesActual;
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            });
        },
        async reporteMensualPDF() {
            const url = '/administracion/solicitud/reporteMensualPDF';
            const config = {
                responseType: 'blob',
                params:{
                    'nUsuario': this.idUsuario,
                    'nRol': this.rolUsuario,
                    'nDPTO': this.dptoUsuario,
                    'fInicio': this.rangoIni,
                    'fFin': this.rangoFin,
                    'anio': this.selectAnio,
                    'mesNombre': this.elMes,
                }
            };
            const load = methods.loading( this.$vs );
            try {
                const response = await axios.get(url,config);
                if(response.status === 200){
                    const MyBlob = new Blob([response.data], { type: 'application/pdf'});
                    let urlExcel = document.createElement('a');
                    urlExcel.href = URL.createObjectURL(MyBlob);
                    urlExcel.download = `solicitudes_${this.elMes}-${this.selectAnio}.pdf`;
                    urlExcel.click();
                    load.close();                 
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
                load.close();
            }
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
        customRango() {
            if(this.selectAnio == '' && this.selectMes == '') return;

            let mes = String(this.selectMes).padStart(2, '00');
            let tempInicio = `${this.selectAnio}-${mes}-01`;   
            this.rangoIni = tempInicio;

            let ff = new Date( Number(this.selectAnio), this.selectMes, 0);
            let tempFin = `${ff.getFullYear()}-${mes}-${ff.getDate()}`;
            this.rangoFin = tempFin;

            this.elMes = this.listMeses[this.selectMes - 1].mes;
        },
        working() {
          methods.WIP( this.$vs );  
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