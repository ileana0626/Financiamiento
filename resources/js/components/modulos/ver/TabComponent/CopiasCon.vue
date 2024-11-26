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
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'idCopia')">id</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'dptoCopia')" v-if="rolUsuario == 1 || rolUsuario == 5">Copia Para</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'solicitud')">Tipo</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaSolicita')">Área solicita</vs-th>
                                <vs-th class="vsax-th">Número</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'asunto')">Asunto</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaRecibido')">Fecha recibido</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'horaRecibido')">Hora recibido</vs-th>
                                <vs-th class="vsax-th">Termino</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'fechaTermino')">Fecha termino</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'areaAsignada')">Área asignada</vs-th>
                                <vs-th class="vsax-th">Archivo recibido</vs-th>
                                <vs-th class="vsax-th">Archivo respuesta</vs-th>
                                <vs-th class="vsax-th" sort @click="listSolicitudes = $vs.sortData($event, listSolicitudes, 'idSolicitud')">Estatus</vs-th>
                                <vs-th class="vsax-th">Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in $vs.getSearch(listSolicitudes, search)" :key="index"
                                :data="tr">
                                <vs-td>{{ tr.idCopia }}</vs-td>
                                <vs-td v-if="rolUsuario == 1 || rolUsuario == 5">{{ tr.dptoCopia }}</vs-td>
                                <vs-td>{{ tr.solicitud }}</vs-td>
                                <vs-td>{{ tr.areaSolicita ? tr.areaSolicita : '-' }}</vs-td>
                                <vs-td><span v-if="tr.numFolio != null">{{ tr.numFolio ? tr.numFolio : '-' }}</span>
                                    <span v-else-if="tr.numMemo != null" >{{ tr.numMemo ? tr.numMemo : '-' }}</span>
                                    <span v-else-if="tr.numOficio != null" >{{ tr.numOficio ? tr.numOficio : '-' }}</span>
                                </vs-td>
                                <vs-td>{{ tr.asunto ? tr.asunto : '-'}}</vs-td>

                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.termino ? tr.termino : '-' }}</vs-td>
                                <vs-td>
                                    {{ tr.fechaTermino ? tr.fechaTermino : '-' }}
                                </vs-td>
                                <vs-td>{{ tr.areaAsignar ? tr.areaAsignar : '-' }}</vs-td>
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
                                    <div class="d-flex justify-content-center" v-if="tr.estatus != 'ENTERADO' || tr.estatus != 'CONCLUIDO'">
                                        <el-tooltip class="item h-100" effect="dark" content="Enterado"
                                            placement="top">
                                            <vs-button icon size="large" style="background-color: var(--iee-blue) !important;" 
                                                @click.prevent="accionEnterado(tr.idCopia, tr.idSolicitud)" v-if="tr.enterado == 'N'">
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
        <vs-dialog scroll overflow-hidden not-padding v-model="showModalArchivo" auto-width id="modalArchivo"
            @close="closeModalArchivo()">
            <template #header>
                <h3 class="pt-3">Archivo de solicitud</h3>
            </template>
            <div class="con-content">
                <template v-if="Object.keys(datosArchivo).length > 0">
                    <div v-if="datosArchivo.rutaDoc">
                        <div v-if="datosArchivo.rutaDoc.includes('pdf')" class="center">
                            <object :data="og + datosArchivo.rutaDoc + stamp" :type="`application/pdf`" height="700"
                                width="600">
                                <div class="px-3">
                                    <p>No es posible mostrar el archivo de la solicitud.</p>
                                    <a class="" :href="og + datosArchivo.rutaDoc + stamp" target="_blank">Abrir en una
                                        nueva pestaña</a>
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
            dptoUsuario: Number(sessionStorage.getItem('idDepartamento')),
            rolUsuario: Number(sessionStorage.getItem('rolUsuario')),
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
        const load = methods.loading(this.$vs);
        await this.getCopiasCon();
        load.close();
    },
    mounted() {

    },
    computed: {

    },
    methods: {
        async getCopiasCon() {
            const url = '/administracion/solicitud/getCopiasCon';

            try {
                const response = await axios.get(url, {
                    params: {
                        'nDPTO': this.dptoUsuario,
                    }
                })
                if (response.status === 200) {
                    this.listSolicitudes = response.data;
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        toEdit(id) {
            this.$router.push({ name: 'editar.solicitud', params: { idSolicitud: id } })
        },
        verArchivo(datos) {
            this.datosArchivo = datos;
            this.showModalArchivo = true;
        },
        closeModalArchivo() {
            this.datosArchivo = {};
            this.showModalArchivo = false;
        },
        getLocalStamp() {
            return '?stamp=' + new Date().getTime();
        },
        //enterado 
        accionEnterado(copia, solicitud) {
            Swal.fire({
                icon: 'warning',
                title: '¿Marcar de enterado?',
                showConfirmButton: true,
                showCancelButton: true,
                confirmButtonText: 'Si, marcar',
                cancelButtonText: 'Cancelar',
                reverseButtons: true,
            }).then(async result => {
                if (result.isConfirmed) {
                    const load = methods.loading(this.$vs);
                    let estatus = await this.setEnteradoCopia(copia, solicitud);
                    if (estatus == 1) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Se actualizó el valor correctamente',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo',
                        }).then(async (result) => {
                            this.stamp = this.getLocalStamp();
                            await this.getCopiasCon();
                        });
                    }
                    load.close();
                }
            })
        },
        async setEnteradoCopia(copia, solicitud) {
            const url = '/administracion/solicitud/setEnteradoCopia';
            try {
                const response = await axios.post(url, {
                    'idCopia': copia,
                    'idSolicitud': solicitud,
                });
                if (response.status === 200) {
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