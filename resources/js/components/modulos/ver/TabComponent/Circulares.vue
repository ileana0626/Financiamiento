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
                                <vs-th class="vsax-th">id</vs-th>
                                <vs-th class="vsax-th">Fecha recibido</vs-th>
                                <vs-th class="vsax-th">Hora recibido</vs-th>
                                <vs-th class="vsax-th">Área emite</vs-th>
                                <vs-th class="vsax-th">Asunto</vs-th>
                                <vs-th class="vsax-th">Archivo</vs-th>
                                <vs-th class="vsax-th">Estatus</vs-th>
                                <vs-th class="vsax-th">Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in $vs.getSearch(listSolicitudes, search)" :key="index" :data="tr">
                                <vs-td>{{ tr.idSolicitud }}</vs-td>
                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.areaEmite }}</vs-td>
                                <vs-td>{{ tr.asunto }}</vs-td>
                                <vs-td>
                                    <div class="d-flex justify-content-center">
                                        <el-tooltip class="item" effect="dark" :content="'Ver archivo'" placement="top">
                                            <vs-button danger class="btn btn-flat btn-sm py-1"
                                                @click.prevent="verArchivo(tr)">
                                                <i class="fas fa-file-pdf"></i>
                                            </vs-button>
                                        </el-tooltip>
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
                                            style="background-color: var(--iee-black) !important; color: white !important">{{ tr.estatus }}</span>
                                    </template>
                                </vs-td>
                                <vs-td>
                                    <div class="d-flex justify-content-center" v-if="tr.estatus != 'ENTERADO'">
                                        <el-tooltip class="item h-100" effect="dark" content="Enterado"
                                            placement="top">
                                            <vs-button icon danger size="large" 
                                                @click.prevent="accionEnteradoo(tr.idSolicitud)">
                                                <span class="material-symbols-rounded"
                                                    style="color: white !important;">
                                                    thumb_up
                                                </span>
                                            </vs-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" :content="'Editar solicitud'" placement="top">
                                            <vs-button class="btn btn-flat btn-sm py-1"
                                                @click.prevent="toEdit(tr.idSolicitud)">
                                                <span class="material-symbols-rounded" style="color: var(--text-color);">edit</span>
                                            </vs-button>
                                        </el-tooltip>
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
            <h3 class="pt-3">Archivo de solicitud</h3>
            </template>
            <div class="con-content">
                <template v-if="Object.keys(datosArchivo).length > 0">
                    <div v-if="datosArchivo.rutaDoc">
                        <div v-if="datosArchivo.rutaDoc.includes('pdf')" class="center">
                            <object :data="og + datosArchivo.rutaDoc + stamp" :type="`application/pdf`" height="700" width="600">
                                <div class="px-3">
                                    <p>No es posible mostrar el archivo de la solicitud.</p>
                                    <a class="" :href="og + datosArchivo.rutaDoc + stamp" target="_blank">Abrir en una nueva pestaña</a>
                                </div>
                            </object> 
                        </div>
                    </div>
                </template>
                <template v-else>
                    <div class="px-3">
                        <p>No es posible mostrar el archivo de la solicitud.</p>
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
            og: window.location.origin + '/',
            stamp: this.getLocalStamp(),
            listaPermisos: [],
            page: 1,
            max: 10,
            search: '',
            listSolicitudes: [],

            showModalArchivo: false,
            datosArchivo: {},
        }
    },
    async created() {
        const load = methods.loading( this.$vs );
        await this.getAllByType(4);
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
        verArchivo(datos){
            this.datosArchivo = datos;
            this.showModalArchivo = true;
        },
        closeModalArchivo(){
            this.datosArchivo = {};
            this.showModalArchivo = false;
        },    
        getLocalStamp(){
            return '?stamp=' + new Date().getTime();
        },  
        //enterado 
        accionEnteradoo( solicitud ) {
            Swal.fire({
                icon: 'warning',
                title: '¿Cambiar estatus a ENTERADO?',
                showConfirmButton: true,
                showCancelButton: true,
                confirmButtonText: 'Si, cambiar estatus',
                cancelButtonText: 'Cancelar',
                reverseButtons: true,
            }).then(async result => {
                if(result.isConfirmed){
                    const load = methods.loading( this.$vs );
                    let estatus = await this.setUpdateEstatus(solicitud, 10, methods.getTimestamp());
                    if(estatus == 1){
                        Swal.fire({
                            icon: 'success',
                            title: 'Estatus actualizado correctamente',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo',
                        }).then( async (result) => {
                            this.stamp = this.getLocalStamp();
                            await this.getAllByType(4);
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