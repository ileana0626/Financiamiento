<template>
  <div class="listado-calculos">
    <div class="content-header">
        <div class="container-fluid mb-md-3 pl-4 pl-md-3 pt-0">
            <div class="float-sm-right mr-5">
                <!-- Breadcrumb (navegacion) -->
                <ul class="breadcrumb">
                    <li>
                        <router-link to="/"><span
                                class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                    </li>
                    <li class="breadActive">
                        <span>Listado de Calculos</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row col-md-11 col-10 mx-auto card-info">
        <div class="card-header d-flex justify-content-between align-items-center container-fluid">
            <h3 class="card-title font-weight-bold">Cálculos de Financiamiento Público para AOP</h3>
        </div>
        <div class="card-body container-fluid" style="background-color: var(--iee-white);">
            <div class="center">
                <vs-table striped>
                    <!-- <template #header>
                        <vs-input v-model="search" border placeholder="Escribe un Nombre"
                            class="inputSearchPreguntas" />
                    </template> -->
                    <template #thead>
                        <vs-tr>
                            <!-- 1 -->
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Año fiscal
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Fecha de Publicación de la UMA
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                UMA
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                65% de UMA
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                No. de personas en Padrón Electoral
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Monto total de Financiamiento Público para AOP
                            </vs-th>
                            <!-- 7 -->
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Partidos sin representación en el Congreso
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                2% de FPAOP para Partidos sin representación en el Congreso
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Total de FPAOP para Partidos con representación en el Congreso
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Monto total efectivo
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                30% Monto total efectivo
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Partidos con representación en el Congreso
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Núm de Partidos con representación en el Congreso
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                70% Monto total efectivo
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Comprobación del Monto total de Financiamiento Público para AOP
                            </vs-th>
                            <vs-th style="width: 30px; background-color: var(--iee-white);">
                                Descargar Excel
                            </vs-th>
                        </vs-tr>
                    </template>
                    <template #tbody>
                        <vs-tr :key="i"
                            v-for="(tr, i) in $vs.getPage($vs.getSearch(NewlistCalculos, search), page, max)" :data="tr"
                            style="max-height: 100px !important">
                            <!-- 1 -->
                            <vs-td class="tableRowHeight">
                                {{ tr.anioFiscal }}
                            </vs-td>                            
                            <vs-td class="tableRowHeight">
                                {{ tr.fecha_pub }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.uma) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.uma_65) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ tr.personas_padron }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.financiamiento_aop) }}
                            </vs-td>
                            <!-- 7 -->
                            <vs-td class="tableRowHeight">
                                {{ tr.pp_sin_repr_siglas }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.total_fp_sin_repr) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.total_fp_sin_repr) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.monto_total_efectivo) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.monto_30_por_ciento) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ tr.pp_con_repr_siglas }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ tr.num_pp_con_repr }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.monto_70_por_ciento) }}
                            </vs-td>
                            <vs-td class="tableRowHeight">
                                {{ formatCurrency(tr.comprobacion_monto) }}
                            </vs-td>
                            <vs-td class="tableRowHeight text-center">
                                <div style="width: 100%; display: flex; justify-content: center;">
                                    <!-- <a :href="`/calculos/${tr.id}/descargar-excel`" target="_blank">
                                        Descargar Excel
                                    </a> -->
                                    <vs-button icon color="success" size="small" @click="exportToExcel(tr.id)" title="Descargar Excel">
                                        <i class="fas fa-file-excel"></i>
                                    </vs-button>
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
                            :length="$vs.getLength($vs.getSearch(NewlistCalculos, search), max)"
                            style="background-color: var(--iee-white) !important;" />
                    </template>
                </vs-table>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
import methods, { loading } from '../../../methods';
export default {
    data() {
        return{
            darkMode: localStorage.getItem('theme') == 'dark',
            // Variables para listar
            //listCalculos: [],
            NewlistCalculos: [],
            // Variables para la paginacion
            search: '', // Para la busqueda
            page: 1, // Para la paginacion
            max: 10, // Para la paginacion
        }
    },
    created() {
        EventBus.$on('darkMode', (data) => { this.darkMode = data })
    },
    beforeDestroy() {
        // Limpiar el event listener
        EventBus.$off('darkMode');
    },
    mounted() {
        this.getCalculos();
    },
    methods: {
        /*
        * Formatea un número con separadores de miles y decimales
        */
        formatCurrency(value) {
            return '$' + parseFloat(value).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
        },
        /*
        * Obtiene los cálculos de financiamiento para listarlos
        */
        getCalculos() {
            const loader = loading(this.$vs);
            let url = '/administracion/solicitud/getCalculosFinanciamiento';
            this.NewlistCalculos = [];
            loader.text = 'Cargando datos...';
            axios.get(url).then((response) => {
                if (response.data?.success) {
                    this.NewlistCalculos = response.data.calculos || [];
                } else {
                    // success: false
                    const errorMessage = response.data?.message || 'Error en la respuesta del servidor';
                    throw new Error(errorMessage);
                }
            }).catch((error) => {
                console.error('Error al cargar cálculos:', error);
                this.$vs.notification({
                    title: 'Error',
                    text: 'Error al cargar los cálculos',
                    color: 'danger'
                });
                
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            })
            .finally(() => {
                loader.close();
            })
        },
        exportToExcel(id) {
            // Crear un nuevo loader
            // const loading = this.$vs.loading({
            //     type: 'points',
            //     color: '#7D0CFF',
            //     text: 'Generando archivo Excel...'
            // });
            const loader = loading(this.$vs);
            loader.text = 'Generando archivo Excel...';
            // Crear un enlace temporal para la descarga
            const link = document.createElement('a');
            link.style.display = 'none';
            document.body.appendChild(link);
            
            axios({
                url: `/administracion/solicitud/exportarCalculosFinanciamientoExcel/${id}`,
                method: 'GET',
                responseType: 'blob'
            }).then((response) => {
              // Crear URL para el blob
                const url = window.URL.createObjectURL(new Blob([response.data]));
                
                // Crear enlace temporal
                const link = document.createElement('a');
                link.href = url;
                
                // Establecer el nombre del archivo
                const filename = `calculos_financiamiento_${new Date().toISOString().split('T')[0]}.xlsx`;
                link.setAttribute('download', filename);
                
                // Añadir al documento, hacer clic y limpiar
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
                
                // Liberar memoria
                window.URL.revokeObjectURL(url);
                
                this.$vs.notification({
                    title: 'Éxito',
                    text: 'El archivo Excel se está descargando',
                    color: 'success'
                });
            }).catch((error) => {
                console.error('Error al exportar a Excel:', error);
                
                let errorMessage = 'Error al exportar a Excel';
                if (error.response?.data?.message) {
                    errorMessage = error.response.data.message;
                } else if (error.message) {
                    errorMessage = error.message;
                }
                
                this.$vs.notification({
                    title: 'Error',
                    text: errorMessage,
                    color: 'danger',
                    time: 10000
                });
            }).finally(() => {
                loader.close();
                document.body.removeChild(link);
            });
        }
    }
}
</script>
<style>
    .vs-table__th {
        text-align: center !important;
    }

</style>

