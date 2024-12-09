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
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'solicitud')">Tipo</vs-th>
                                <vs-th class="vsax-th">Número</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaSolicita')">Área solicita</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'asunto')">Asunto</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaRecibido')">Fecha recibido</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'horaRecibido')">Hora recibido</vs-th>
                                <vs-th class="vsax-th">Termino</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaTermino')">Fecha termino</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaAsignada')">Área asignada</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaEmite')">Área emite</vs-th>
                                <vs-th class="vsax-th">Requiere respuesta</vs-th>
                                <vs-th class="vsax-th">Archivo recibido</vs-th>
                                <vs-th class="vsax-th">Archivo respuesta</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'idSolicitud')">Estatus</vs-th>
                                <vs-th class="vsax-th">Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in $vs.getPage($vs.getSearch(listSolicitudes, search), page, max)" :key="index" :data="tr" :class="colorStatus(tr.fechaTermino, tr.estatus)">
                                <vs-td>{{ tr.idSolicitud }}</vs-td>
                                <vs-td>{{ tr.solicitud }}</vs-td>
                                <vs-td>
                                    <span v-if="tr.numFolio">{{ tr.numFolio}}</span>
                                    <span v-else-if="tr.numMemo">{{ tr.numMemo}}</span>
                                    <span v-else-if="tr.numOficio">{{ tr.numOficio}}</span>
                                    <span v-else>-</span>
                                </vs-td>
                                <vs-td>{{ tr.areaSolicita ? tr.areaSolicita : '-' }}</vs-td>
                                <vs-td>{{ tr.asunto ? tr.asunto : '-'}}</vs-td>
                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.termino ? tr.termino : '-' }}</vs-td>
                                <vs-td>
                                    {{ tr.fechaTermino ? tr.fechaTermino : '-' }}
                                </vs-td>
                                <vs-td>{{ tr.areaAsignar ? tr.areaAsignar : '-' }}</vs-td>
                                <vs-td>{{ tr.areaEmite ? tr.areaEmite : '-' }}</vs-td>
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
                                    <div class="d-flex justify-content-center" v-if="!(tr.estatus == 'CONCLUIDO' || tr.estatus == 'ENTERADO')">
                                        <el-tooltip class="item h-100" effect="dark" content="Recordatorio Email"
                                            placement="top">
                                            <vs-button class="btn btn-flat btn-sm " :disabled="tr.horasRecordatorio != null && tr.horasRecordatorio < 23"
                                                @click.prevent="sendRecordatorio('Prueba', 'Prueba-2', tr.correoNotificar, 'Revisar solicitud', tr.fechaTermino, tr.idSolicitud)" 
                                                style="background-color: var(--iee-white);border-color: var(--iee-white);" v-if="habilitarRecordatorio">
                                                <span class="material-symbols-rounded"
                                                    style="color: var(--text-color);">
                                                    forward_to_inbox
                                                </span>
                                            </vs-button>
                                        </el-tooltip>
                                        <el-tooltip class="item h-100" effect="dark" content="Recordatorio Sistema"
                                            placement="top">
                                            <vs-button class="btn btn-flat btn-sm " :disabled="tr.minSysNotify != null && tr.minSysNotify < 59"
                                                @click.prevent="sendNavNotify(tr.dptoAsignar, tr.idSolicitud, tr.solicitud)" 
                                                style="background-color: var(--iee-gold);border-color: var(--iee-white);" v-if="habilitarRecordatorio">
                                                <span class="material-symbols-rounded"
                                                    style="color: #111 !important">
                                                    notifications_active
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
    </div>
</template>

<script>
let methods = require('../../../../methods')
export default {
    data() {
        return {
            rolUsuario: sessionStorage.getItem('rolUsuario') ? Number(sessionStorage.getItem('rolUsuario')) : 0,
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
        EventBus.$on('darkMode', (data)=>{this.darkMode = data});
        const load = methods.loading( this.$vs );
        await this.getSeguimiento();
        load.close();
    },
    mounted() {

    },
    computed: {
        colorStatus() {
            return (fechaTermino, estatus) => {
                let color = ''
                if (fechaTermino != null && estatus != 'CONCLUIDO') {
                    const moment = require('moment');
                    let currentDate = moment();
                    let formattedDate = currentDate.format('DD/MM/YYYY');
                    let validDate = moment(formattedDate, 'DD/MM/YYYY');
                    let validDate2 = moment(fechaTermino, 'DD/MM/YYYY');
                    let date1 = new Date(validDate)
                    let date2 = new Date(validDate2)
                    let differenceInMs = Math.abs(date1 - date2);
                    let differenceInDays = Math.floor(differenceInMs / (1000 * 3600 * 24));
                    
                    if(date1 >= date2){
                        color = 'css-conundial'
                    }else if (estatus == 'TRÁMITE') {
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
                    }
                    return color;
                }
            }
        },
        reqRespuesta(){
            return (respuesta) =>{
                if(respuesta){
                    return respuesta == 1 ? 'Si' : 'No';
                } else return '-';
            }
        },
        habilitarRecordatorio() {
            if(this.rolUsuario == 1 || this.rolUsuario == 5) return true;

            return (this.rolUsuario == 3 && this.dptoUsuario == 2);
        },
    },
    methods: {
        async getSeguimiento() {
            const url = '/administracion/solicitud/getSeguimiento';

            try {
                const response = await axios.get(url,{ params: {
                    'nDPTO': this.dptoUsuario,
                    'ahora': methods.getTimestamp(),
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
        sendRecordatorio(usuario, otroUsuario, correo, asunto, termino, solicitud) {
            // si termino es null, poner la fecha de mañana
            let tempHoy = new Date();
            tempHoy.setDate( tempHoy.getDate() + 1);
            let strHoy = tempHoy.toLocaleDateString('es-ES',{'day':'2-digit', 'month': '2-digit', 'year': 'numeric'});
            let terminoValido = termino ? termino : strHoy;

            usuario = 'Prueba';
            otroUsuario = 'Prueba-2';
            asunto = '(Prueba) Revisión de solicitud';
            if (correo.length > 0) {
                let nombre = (usuario != null) ? usuario : otroUsuario
                const loading = methods.loading(this.$vs);
                let url = '/send-mail'
                axios.get(url, {
                    params: {
                        'cUsername': nombre,
                        'cEmail': correo,
                        'asunto': asunto,
                        'termino': terminoValido
                    }
                }).then(async (response) => {
                    await this.setUpdateRecordatorio(solicitud);
                    this.listSolicitudes = [];
                    await this.getSeguimiento();
                    loading.close();
                    Swal.fire({
                        icon: "success",
                        title: "Correo Enviado",
                        text: 'El recordatorio por email se envió con éxito',
                        showConfirmButton: true,
                        confirmButtonText: "De acuerdo",
                    });
                }).catch(error => {
                    loading.close();
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);
                });
            } else {

            }
        }, 
        async setUpdateRecordatorio(idSolicitud) {
            const url = '/administracion/solicitud/setUpdateRecordatorio';

            try {
                const response = await axios.post(url, {
                    'idSolicitud': idSolicitud,
                    'ahora': methods.getTimestamp(),
                });
                if(response.status === 200){
                    return 1;
                }
                return 0;
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
                return 0;
            }
        },
        async sendNavNotify( dptoAsignar, idSolicitud, cTipo ) {
            const url = '/administracion/solicitud/sendNavNotify'
            let datos = {
                "DPTO": dptoAsignar,
                "idSolicitud": idSolicitud,
                'cTipo': cTipo
            }
            const load = methods.loading( this.$vs );
            try {
                const response = await axios.post(url,{
                    'textNotify': JSON.stringify(datos),
                    'nRol': 2,
                    'nDPTO': dptoAsignar,
                    'nSolicitud': idSolicitud,
                    'fAccion': methods.getTimestamp()
                });
                if(response.status === 200){
                    load.close();
                    Swal.fire({
                        icon: 'success',
                        title: 'El recordatorio se envió con éxito',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo'
                    }).then(async (result) => {
                        this.listSolicitudes = [];
                        await this.getSeguimiento();
                    })
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
                load.close();
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