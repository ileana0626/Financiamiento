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
                                <vs-th class="vsax-th">Tipo</vs-th>
                                <vs-th class="vsax-th">Capítulo</vs-th>
                                <vs-th class="vsax-th">Folio</vs-th>
                                <vs-th class="vsax-th">Fecha recibido</vs-th>
                                <vs-th class="vsax-th">Hora recibido</vs-th>
                                <vs-th class="vsax-th">Área solicita</vs-th>
                                <vs-th class="vsax-th">Área asignada</vs-th>
                                <vs-th class="vsax-th">Archivo</vs-th>
                                <vs-th class="vsax-th">Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(tr, index) in listSolicitudes" :key="index">
                                <vs-td>{{ tr.idSolicitud }}</vs-td>
                                <vs-td>{{ tr.solicitud }}</vs-td>
                                <vs-td>{{ tr.capitulo }}</vs-td>
                                <vs-td>{{ tr.numFolio }}</vs-td>
                                <vs-td>{{ tr.fechaRecibido }}</vs-td>
                                <vs-td>{{ tr.horaRecibido }}</vs-td>
                                <vs-td>{{ tr.areaSolicita }}</vs-td>
                                <vs-td>{{ tr.areaAsignar }}</vs-td>
                                <vs-td>
                                    boton
                                </vs-td>
                                <vs-td>Acciones</vs-td>
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
        }
    },
    async created() {
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
                }})
                if(response.status === 200){
                    this.listSolicitudes = response.data;
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
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