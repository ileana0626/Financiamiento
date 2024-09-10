<template>
    <div class="col">
        <div class="float-sm-right mr-5">
            <ul class="breadcrumb">
                <li>
                    <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                </li>
                <li class="breadActive">
                    <span>
                        Listado de Solicitudes
                    </span>
                </li>
            </ul>
        </div>
        <br><br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Solicitudes</h3>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #header>
                            <vs-input v-model="search" border placeholder="Escribe un Nombre"
                                class="inputSearchPreguntas" />
                        </template>
                        <template #thead>
                            <vs-tr>
                                <vs-th sort
                                    @click="NewlistSolicitudes = $vs.sortData($event, NewlistSolicitudes, 'numeroConsecutivo')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Núm. Consecutivo / Núm. Solicitud
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
                                    Asunto
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Termino
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Fecha de Termino
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Dias de Termino
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Respuesta
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Seguimiento
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Área de Seguimiento
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Tipo
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
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(NewlistSolicitudes, search), page, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ tr.numeroConsecutivo }} / {{ tr.numeroSolicitud }}
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
                                    {{ tr.asunto }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.termino == 1">
                                        SI
                                    </template>
                                    <template v-else>
                                        No
                                    </template>
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.fechaTermino }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.diasTermino }}
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
                                    {{ tr.seguimiento }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.areaAsignada }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.tipo }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    <template v-if="tr.estatus == 'TRÁMITE'">
                                                <span style="font-size: 12px !important; color: white !important"
                                                    class="badge badge-success">TRÁMITE</span>
                                            </template>
                                            <template v-else>
                                                <!-- <span style="font-size: 12px !important; color: white !important"
                                                    class="badge badge-danger">Desactivada</span> -->
                                            </template>
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Ver" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            @click.prevent="mostrarPublicacion(tr.id)"
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                visibility
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="editarPublicacion(tr.id)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                    <el-tooltip class="item h-100" effect="dark" content="Activa"
                                        placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            @click.prevent="setCambiarEstadoPublicacion(1, tr.id)"
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                thumb_up
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
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
            </div>
        </div>
    </div>
</template>

<script>
let methods = require('../../../methods')
export default {
    data() {
        return {
            page: 1,
            max: 10,
            search: '',
            listSolocitudes: [],
            NewlistSolicitudes: [],
        }
    },
    created() {
        const loading = this.$vs.loading({
            type: 'square',
            color: '#00a19a',
            background: '#FFFFFF',
            text: 'Cargando...'
        });

        this.checkCrear(loading);
    },
    methods: {
        checkCrear(loading) {
            this.getSolocitudes(loading);
        },
        getSolocitudes(loading) {
            this.NewlistSolicitudes = [];
            let url = '/administracion/usuario/getSolocitudes';

            axios.get(url, {
                params: {
                    'tipo': 1
                }
            }).then((response) => {
                this.listSolocitudes = response.data;
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
            me.listSolocitudes.map(function (x, y) {
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
                    'fechaAsignacion': x.fechaAsignacion,
                    'estatus': x.estatus
                })
            })
        },
    }
}
</script>

<style></style>