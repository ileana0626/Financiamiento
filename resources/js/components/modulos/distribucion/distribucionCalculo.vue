<template>
    <div class="">
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
                            <span>Distribución cálculo</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Cálculos Registrados</h3>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div>
                    <vs-table class="tabla-ajustada">
                        <!-- <template #header>
                        <vs-input v-model="search" border placeholder="Escribe un Nombre"
                            class="inputSearchPreguntas" />
                    </template> -->
                        <template #thead>
                            <vs-tr>
                                <!-- 1 -->
                                <vs-th style="background-color: var(--iee-white);">
                                    Año fiscal
                                </vs-th>
                                <vs-th style="background-color: var(--iee-white);">
                                    Fecha de Publicación de la UMA
                                </vs-th>
                                <vs-th style="background-color: var(--iee-white);">
                                    UMA
                                </vs-th>
                                <vs-th style="background-color: var(--iee-white);">
                                    Partidos sin representación en el Congreso
                                </vs-th>
                                <vs-th style="background-color: var(--iee-white);">
                                    Partidos con representación en el Congreso
                                </vs-th>
                                <vs-th style="background-color: var(--iee-white);">
                                    Calcular
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(NewlistCalculos, search), page, max)"
                                :data="tr" style="max-height: 100px !important">
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
                                    {{ tr.pp_sin_repr_siglas }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.pp_con_repr_siglas }}
                                </vs-td>
                                <vs-td class="tableRowHeight text-center">
                                    <div style="width: 100%; display: flex; justify-content: center;">
                                        <!-- <a :href="`/calculos/${tr.id}/descargar-excel`" target="_blank">
                                        Descargar Excel
                                    </a> -->
                                        <vs-button icon color="danger" size="small" @click="abrirDialog(tr)"
                                            title="Distribuir">
                                            <i class="fas fa-pencil-alt"></i>
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

        <!-- formularios -->
        <template>
            <div class="center">
                <vs-dialog v-model="active" overflow-hidden width="90%">
                <!-- HEADER -->
                <template #header>
                    <h4 class="not-margin">
                    Distribución del cálculo
                    </h4>
                </template>

                <div>
                    <div>
                    <label class="col-form-label">Selecciona un año fiscal: </label>
                    <vs-select
                        placeholder="Seleccione una opción"
                        v-model="anio"
                        v-if="catAnio.length > 0"
                        filter
                        :color="colors[0].color"
                        autocomplete="off"
                    >
                        <template #message-danger v-if="errorAnio.length > 0">
                        {{ errorAnio }}
                        </template>
                        <vs-option
                        v-for="(item, index) in catAnio"
                        :key="index"
                        :label="item.anio"
                        :value="item.anio"
                        >
                        {{ item.anio }}
                        </vs-option>
                    </vs-select>
                    </div>

                    <div>
                    <label class="col-form-label">Tipo de distribución de Financiamiento</label>
                    <vs-select
                        multiple
                        filter
                        :placeholder="(distribucion.length > 0) ? '' : 'Seleccione una o más opciones'"
                        v-model="distribucion"
                        v-if="tipo_distribucion.length > 0"
                        autocomplete="off"
                        :color="colors[0].color"
                    >
                        <template #message-danger v-if="errorDistribucion.length > 0">
                        {{ errorDistribucion }}
                        </template>
                        <vs-option
                        v-for="(item, index) in tipo_distribucion"
                        :key="index"
                        :label="item.nombre"
                        :value="item.id_tipo"
                        >
                        {{ item.nombre }}
                        </vs-option>
                    </vs-select>
                    </div>
                </div>
                </vs-dialog>
            </div>
            </template>

        <!-- <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
          
                <div class="card-info pb-4">
                    <div class="card-header d-flex">
                        <h3 class="card-title font-weight-bold">Distribución cálculo</h3>
                    </div>
                    <div class="card-body container-fluid" style="background-color: var(--iee-white) !important;">
                        <div class="row p-4">
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">Selecciona un año fiscal: </label>
                               <vs-select
                                    placeholder="Seleccione una opción"
                                    v-model="anio"
                                    v-if="catAnio.length > 0"
                                    filter
                                    :color="colors[0].color"
                                    autocomplete="off"
                                    >
                                    <template #message-danger v-if="errorAnio.length > 0">
                                        {{ errorAnio }}
                                    </template>

                                    <vs-option
                                        v-for="(item, index) in catAnio"
                                        :key="index"
                                        :label="item.anio"
                                        :value="item.anio"
                                    >
                                        {{ item.anio }}
                                    </vs-option>
                                    </vs-select>
                            </div>

                                    <div class="col-sm-6 col-md-4 col-xl-4 px-0 pr-sm-5 pb-3">
                                        <label class="col-form-label">Tipo de distribución de Financiamiento </label>
                                        <vs-select multiple filter
                                            :placeholder="(distribucion.length > 0) ? '' : 'Seleccione una o más opciones'"
                                            v-model="distribucion" v-if="tipo_distribucion.length > 0" autocomplete="off"
                                            :color="colors[0].color">
                                            <template #message-danger v-if="errorDistribucion.length > 0">
                                                {{ errorDistribucion }}
                                            </template>
                                            <vs-option v-for="(item, index) in tipo_distribucion" :key="index"
                                                :label="item.nombre" :value="item.id_tipo">
                                                {{ item.nombre }}
                                            </vs-option>
                                        </vs-select>
                                    </div>

                                  
                                     <div v-if="distribucion.includes(1)" class="row px-4">
                                        <h5>Financiamiento público para actividades ordinarias permanentes</h5>
                                           <vs-table class="tabla-ajustada">
                                            <template #thead>
                                                <vs-tr>
                                                    <vs-th style="background-color: var(--iee-white);">
                                                        Emblema Partido Político
                                                    </vs-th>
                                                    <vs-th style="background-color: var(--iee-white);">
                                                        % de votación de partido político en elección inmediata anterior de diputaciones
                                                    </vs-th>
                                                    <vs-th style="background-color: var(--iee-white);">
                                                        A. 30% en forma igualitaria
                                                    </vs-th>
                                                    <vs-th style="background-color: var(--iee-white);">
                                                        B. 70% conforme al % de votación
                                                    </vs-th>
                                                    <vs-th style="background-color: var(--iee-white);">
                                                        Total de B. después del ajuste
                                                    </vs-th>
                                                    <vs-th style="background-color: var(--iee-white);">
                                                        C. Financiamiento público para actividades ordinarias permanentes (A+B)
                                                    </vs-th>
                                                </vs-tr>
                                            </template>
                                        </vs-table>
                                     </div>
                                    
                                    
                                     
                                     <div v-if="distribucion.includes(2)" class="row px-4">
                                        <h5>Financiamiento público para actividades tendientes a la obtención del voto</h5>
                                           <v-table>

                                           </v-table> 
                                     </div>
                        </div>
                            
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row">
                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'limpiar'+darkMode" 
                                    @click.prevent="guardarCalculo" 
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-save pr-2" style="font-size: 0.8125rem !important;"></i>
                                            Guardar
                                        </div>
                                    </vs-button>
                                </div>
                           
                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'limpiar'+darkMode" 
                                    @click.prevent="limpiarCampos"
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                        </div>
                                    </vs-button>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'limpiar'+darkMode" 
                                    @click.prevent="guardarSolicitud"
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-file-alt pr-2" style="font-size: 0.8125rem !important;"></i>Generar reporte
                                        </div>
                                    </vs-button>
                                </div>
                            </div>


                    </div>
                </div>
            </div>
        </div> -->
    </div>
</template>

<script>
import methods from '../../../methods';
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            // Variables para listar
            //listCalculos: [],
            NewlistCalculos: [],
            // Variables para la paginacion
            search: '', // Para la busqueda
            page: 1, // Para la paginacion
            max: 10, // Para la paginacion
            active: false,
            input1: '',
            input2: '',
            checkbox1: false,
            anio: '',
            catAnio: [],
            errorAnio: '',
            colors: [
                {
                    color: 'warn'
                }
            ],
            distribucion: [],
            tipo_distribucion: [],
            errorDistribucion: '',
        }
    },
    created() {
        EventBus.$on('darkMode', (data) => { this.darkMode = data })
    },
    beforeDestroy() {
        // Limpiar el event listener
        EventBus.$off('darkMode');
    },
    async mounted() {
        //Está declarado en la importación de 'methods' - personalizada
        const loading = this.$vs.loading();
        this.getCalculos(loading);
        await this.getAnio();
        await this.obtenerDatos(11);
        load.close();
    },
    methods: {
        async getAnio() {
            this.catAnio = []
            let url = '/administracion/usuario/getAnioFiscal'

            await axios.get(url).then(response => {
                this.catAnio = response.data
            }).catch((error) => {
                console.log(error)
                let nombreMetodo = url.split('/')
                methods.catchHandler(error, nombreMetodo[3], this.$router)
            })
        },
        formatCurrency(value) {
            return '$' + parseFloat(value).toFixed(4).replace(/\d(?=(\d{3})+\.)/g, '$&,');
        },
        getCalculos(loading) {
            this.loading = true;
            let url = '/administracion/solicitud/getCalculosFinanciamiento';
            this.NewlistCalculos = [];
            loading.text = 'Cargando datos...';
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
                    loading.close();
                })
        },
        abrirDialog(calculo) {
            this.selectedCalculo = calculo;
            this.active = true;
        },
        async obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            await axios.get(url, {
                params: {
                    'tipo': tipo,
                    'consulta': 1
                }
            }).then(response => {
                switch (tipo) {
                    case 1:
                        this.catCargos = response.data
                        break;
                    case 2:
                        this.catRemitente = response.data
                        break;
                    case 3:
                        this.catTermino = response.data
                        break;
                    case 4:
                        this.cat_diasTermino = response.data
                        break;
                    case 5:
                        this.cat_seguimiento = response.data
                        break;
                    case 6:
                        this.cat_departamentos = response.data
                        break;
                    case 7:
                        this.cat_tipo = response.data
                        break;
                    case 8:
                        this.cat_estutus = response.data
                        break;
                    case 9:
                        this.cat_partido = response.data
                        break;
                    case 11:
                        this.tipo_distribucion = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },
        guardarEdicion() {
            // Lógica para guardar edición (llamada axios)
            axios.put(`/api/calculos/${this.selectedCalculo.id}`, this.selectedCalculo)
                .then(() => {
                    this.$vs.notification({ color: 'success', text: 'Cálculo actualizado' });
                    this.dialog = false;
                    this.getCalculos(); // refrescar lista
                }).catch(() => {
                    this.$vs.notification({ color: 'danger', text: 'Error al guardar' });
                });
        }
    }
}

</script>

<style>
.tabla-ajustada {
    width: 100% !important;
    margin-left: 0 !important;
    padding-left: 0 !important;
}

.vs-table__content {
    justify-content: flex-start !important;
}

.vs-table__th {
    text-align: center !important;
    font-size: 12px;
    padding: 10px;
}

.vs-checkbox--checked .vs-checkbox__check {
    background-color: #1E90FF !important;
    /* azul visible */
    border-color: #1E90FF !important;
}

.vs-checkbox__label {
    color: #000 !important;
    /* asegura que el texto no se vea gris */
}

.vs-checkbox--checked .vs-checkbox__label {
    font-weight: bold;
}

.disabled-bold .vs-input {
    font-weight: bold;
    color: #000;
    /* Negro fuerte */
}

.dialog-table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}

.dialog-table th,
.dialog-table td {
    border: 1px solid #ddd;
    padding: 8px;
}

.dialog-table th {
    background-color: var(--iee-white);
    font-weight: bold;
}

.custom-dialog {
  width: 90vw; /* o un valor fijo como 800px */
  max-width: 1000px;
  padding: 20px;
}
</style>