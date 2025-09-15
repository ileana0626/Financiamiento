<template>
    <div>
        <div class="content-header">
            <div class="container-fluid mb-md-3 pl-4 pl-md-3 pt-0">
                <div class="float-sm-right mr-5">
                    <!-- Breadcrumb (navegación) -->
                    <ul class="breadcrumb">
                        <li>
                            <router-link to="/">
                                <span class="material-symbols-rounded v-align-icon-bc">home</span>
                            </router-link>
                        </li>
                        <li class="breadActive">
                            <span>Financiamiento Privado</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Financiamiento Privado</h3>
            </div>

            <!-- tablas de partidos del calculo seleccionado-->
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="row p-4">
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Selecciona un año fiscal:</label>
                        <vs-select placeholder="Seleccione una opción" v-model="anio" v-if="catAnio.length > 0" filter
                            :color="colors[0].color" autocomplete="off" @change="getDistribucionesPorAnio">
                            <template #message-danger v-if="errorAnio.length > 0">
                                {{ errorAnio }}
                            </template>
                            <vs-option v-for="(item, index) in catAnio" :key="index" :label="item.anio"
                                :value="item.anio">
                                {{ item.anio }}
                            </vs-option>
                        </vs-select>
                    </div>
                </div>
                <div>
                    <vs-table class="tabla-ajustada sin-bordes">
                        <template #thead>
                            <vs-tr>
                                <vs-th>ID Cálculo</vs-th>
                                <vs-th>Año fiscal</vs-th>
                                <vs-th>Fecha de publicación</vs-th>
                                <vs-th>Acciones</vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr v-for="(calculo, i) in CalculosPorAnio" :key="`calculo-resumen-${i}`">
                                <vs-td>{{ calculo.id_calculo }}</vs-td>
                                <vs-td>{{ calculo.anio_ejercicio }}</vs-td>
                                <vs-td>{{ formatoFecha(calculo.fecha_publicacion) }}</vs-td>
                                <vs-td class="acciones-cell">
                                    <vs-button icon color="danger" size="small" @click="abrirDialog(calculo)">
                                        <i class="fas fa-pencil-alt"></i>
                                    </vs-button>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <!-- Estado vacío -->
                        <template #notFound>
                            <div class="noDataContainer">
                                <img src="../../modulos/ver/images/no_data.webp" class="imgNoData" alt="Sin resultados" />
                                <span class="noDataTitle">¡Sin Datos!</span>
                            </div>
                        </template>
                    </vs-table>

                    <!-- Dialog - Formularios -->
                    <template>
                        <div class="center">
                            <vs-dialog v-model="active" overflow-hidden width="90%">
                                <!-- HEADER -->
                                <template #header>
                                    <h4 class="not-margin">Financiamiento privado</h4>
                                </template>
                                <div>
                                    <div>
                                        <vs-table>
                                            <template #thead>
                                                <vs-tr class="fila-flex fila-header">
                                                    <vs-th class="col-desc"></vs-th>
                                                    <!-- Logo Partidos con representación -->
                                                    <vs-th v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'head-' + i" class="col-partido">
                                                        <div class="partido-header">
                                                            <img :src="'/img/logos/' + partido.logo"
                                                                :alt="partido.siglas" class="logo-partido"
                                                                onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'" />
                                                            <span class="siglas">{{ partido.siglas }}</span>
                                                        </div>
                                                    </vs-th>
                                                    <!-- Logo Partidos sin representación -->
                                                    <vs-th v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'headS-' + i" class="col-partido">
                                                        <div class="partido-header">
                                                            <img :src="'/img/logos/' + partidoS.logo"
                                                                :alt="partidoS.siglas" class="logo-partido"
                                                                onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'" />
                                                            <span class="siglas">{{ partidoS.siglas }}</span>
                                                        </div>
                                                    </vs-th>
                                                </vs-tr>
                                            </template>
                                            <template #tbody>
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Financiamiento público para actividades ordinarias permanentes
                                                    </vs-td>
                                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'row1-' + i" class="col-partido monto">
                                                        {{ formatCurrency(partido.C_fpaop) }}
                                                    </vs-td>
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'row1s-' + i" class="col-partido monto">
                                                        {{ formatCurrency(partidoS.monto_2_por_ciento) }}
                                                    </vs-td>
                                                </vs-tr>
                                                <!-- limite de financiamiento privado-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Límite de financiamiento privado
                                                    </vs-td>
                                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'row1-' + i" class="col-partido monto">
                                                        {{ formatCurrency(limiteFinanciamientoPrivado(partido, partido.C_fpaop)) }}
                                                        <!-- {{ limite(partido, partido.C_fpaop) }} -->
                                                    </vs-td>
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'row1s-' + i" class="col-partido monto">
                                                        {{ formatCurrency(limiteFinanciamientoPrivado(partidoS, partidoS.monto_2_por_ciento)) }}
                                                        <!-- {{ limite(partidoS, partidoS.monto_2_por_ciento) }} -->
                                                    </vs-td>
                                                </vs-tr>

                                                <!-- Aportaciones en dinero y/o en especie de personas militantes-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Aportaciones en dinero y/o en especie de personas militantes
                                                    </vs-td>
                                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'row1-' + i" class="col-partido monto">
                                                        {{ formatCurrency(aportacionesMilitantes(partido, partido.C_fpaop)) }}
                                                        <!-- {{ aportaciones(partido,partido.C_fpaop) }} -->
                                                    </vs-td>
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'row1s-' + i" class="col-partido monto">
                                                        {{ formatCurrency(aportacionesMilitantes(partidoS, partidoS.monto_2_por_ciento)) }}
                                                        <!-- {{ aportaciones(partidoS,partidoS.monto_2_por_ciento) }} -->
                                                    </vs-td>
                                                </vs-tr>
                                                <!-- Tope de gastos para la elección presidencial inmediata anterior-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Tope de gastos para la elección presidencial inmediata anterior
                                                    </vs-td>
                                                    <!-- <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'topeConRep-' + partido.id + '-' + i"
                                                        class="col-partido monto">
                                                        <vs-input :value="formatInput('topesConRep', i)"
                                                            @input="updateValue(this.selectedCalculo ,'topesConRep', i, $event)"
                                                            @focus="setFocus('topesConRep', i)" @blur="clearFocus"
                                                            placeholder="$0.00" />
                                                    </vs-td>
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'topeSinRep-' + partidoS.id + '-' + i"
                                                        class="col-partido monto">
                                                        <vs-input :value="formatInput('topesSinRep', i)"
                                                            @input="updateValue(this.selectedCalculo,'topesSinRep', i, $event)"
                                                            @focus="setFocus('topesSinRep', i)" @blur="clearFocus"
                                                            placeholder="$0.00" />
                                                    </vs-td> -->
                                                    <vs-td class="col-partido monto">
                                                        <vs-input :value="topePresidencialInput"
                                                            :key="'txb_tope_presidencial'"
                                                            @input="actualizarValorInput('topePresidencialInput', $event)"
                                                            @blur="formatearAlSalirBlur('topePresidencialInput','topePresidencial')"
                                                            placeholder="$0.00" />
                                                            <div class="danger-message">
                                                                <template v-if="errorTopePresidencial.length > 0">
                                                                    {{ errorTopePresidencial }}
                                                                </template>
                                                            </div>
                                                    </vs-td>
                                                </vs-tr>
                                                <!-- Aportaciones en dinero o en especie de personas simpatizantes-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Aportaciones en dinero o en especie de personas simpatizantes
                                                    </vs-td>

                                                    <!-- Partidos con representación -->
                                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'apCR-' + partido.id + '-' + i" class="col-partido monto">
                                                        {{formatCurrency(aportacionesSimpatizantesPresidencial(partido, topePresidencial))}}
                                                        <!-- {{ formatCurrency(aportacionSimpatizantes(partido, topesConRep[i])) }} -->
                                                    </vs-td>

                                                    <!-- Partidos sin representación -->
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'apSR-' + partidoS.id + '-' + i" class="col-partido monto">
                                                        {{formatCurrency(aportacionesSimpatizantesPresidencial(partidoS, topePresidencial))}}
                                                        <!-- {{ formatCurrency(aportacionSimpatizantes(partidoS, topesSinRep[i])) }} -->
                                                    </vs-td>
                                                </vs-tr>
                                                <!-- Tope de gastos para la elección inmediata anterior de Gubernatura del Estado-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Tope de gastos para la elección inmediata anterior de
                                                        Gubernatura del Estado
                                                    </vs-td>
                                                    <!-- <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'topeConRepGob-' + (partido.id || i)"
                                                        class="col-partido monto">
                                                        <vs-input :value="formatInput('topesConRepGobernatura', i)"
                                                            @input="updateValue(this.selectedCalculo, 'topesConRepGobernatura', i, $event)"
                                                            @focus="setFocus('topesConRepGobernatura', i)"
                                                            @blur="clearFocus" placeholder="$0.00" />
                                                    </vs-td>
                                                    <vs-td v-for="(partido, i) in Partidos_Sin_Representacion"
                                                        :key="'topeSinRepGob-' + (partido.id || i)"
                                                        class="col-partido monto">
                                                        <vs-input :value="formatInput('topesSinRepGobernatura', i)"
                                                            @input="updateValue(this.selectedCalculo,'topesSinRepGobernatura', i, $event)"
                                                            @focus="setFocus('topesSinRepGobernatura', i)"
                                                            @blur="clearFocus" placeholder="$0.00" />
                                                    </vs-td> -->
                                                    <vs-td class="col-partido monto">
                                                        <vs-input :value="topeGubernaturaInput"
                                                            :key="'txb_tope_gubernatura'"
                                                            @input="actualizarValorInput('topeGubernaturaInput', $event)"
                                                            @blur="formatearAlSalirBlur('topeGubernaturaInput','topeGubernatura')"
                                                            placeholder="$0.00" />
                                                            <div class="danger-message">
                                                                <template v-if="errorTopeGubernatura.length > 0">
                                                                    {{ errorTopeGubernatura }}
                                                                </template>
                                                            </div>
                                                    </vs-td>
                                                </vs-tr>
                                                <!-- Aportaciones en dinero que realice cada persona simpatizante-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Aportaciones en dinero que realice cada persona simpatizante
                                                    </vs-td>

                                                    <!-- Partidos con representación -->
                                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'apCR-' + (partido.id || i)" class="col-partido monto">
                                                        {{formatCurrency(aportacionesSimpatizantesPresidencial(partido, topeGubernatura))}}
                                                        <!-- {{ formatCurrency(aportacionDinero(partido, topesConRepGobernatura[i]))
                                                        }} -->
                                                    </vs-td>

                                                    <!-- Partidos sin representación -->
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'apSR-' + (partidoS.id || i)" class="col-partido monto">
                                                        {{formatCurrency(aportacionesSimpatizantesPresidencial(partidoS, topeGubernatura))}}
                                                        <!-- {{ formatCurrency(aportacionDinero(partidoS, topesSinRepGobernatura[i]))
                                                        }} -->
                                                    </vs-td>
                                                </vs-tr>
                                                <!-- Financiamiento por rendimientos financieros de los partidos políticos-->
                                                <vs-tr class="fila-flex">
                                                    <vs-td class="col-desc">
                                                        Financiamiento por rendimientos financieros de los partidos
                                                        políticos
                                                    </vs-td>

                                                    <!-- Partidos con representación -->
                                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                                        :key="'apCR-' + (partido.id || i)" class="col-partido monto">
                                                        {{formatCurrency(rendimientosFinanciamientoPrivado(partido, topeGubernatura))}}
                                                        <!-- {{ formatCurrency(aportacionDinero(partido, topesConRepGobernatura[i]))
                                                        }} -->
                                                    </vs-td>

                                                    <!-- Partidos sin representación -->
                                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                        :key="'apSR-' + (partidoS.id || i)" class="col-partido monto">
                                                        {{formatCurrency(rendimientosFinanciamientoPrivado(partidoS, topeGubernatura))}}
                                                        <!-- {{ formatCurrency(aportacionDinero(partidoS, topesSinRepGobernatura[i]))
                                                        }} -->
                                                    </vs-td>
                                                </vs-tr>
                                            </template>
                                        </vs-table>
                                        <div
                                            class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row mt-4">
                                            <div class="d-flex justify-content-center">
                                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'"
                                                    :key="'limpiar' + darkMode" @click.stop="limpiarCampos"
                                                    style="padding: 0.20rem; font-size: 1rem;">
                                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                                        <i class="fas fa-eraser pr-2"
                                                            style="font-size: 0.8125rem !important;"></i>Limpiar
                                                    </div>
                                                </vs-button>
                                            </div>
                                            <div class="d-flex justify-content-center">
                                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#1a2e35'"
                                                    :key="'guardar' + darkMode" @click.stop="guardarCambios(selectedCalculo.id_calculo)"
                                                    style="padding: 0.20rem; font-size: 1rem;">
                                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                                        <i class="fas fa-save pr-2"
                                                            style="font-size: 0.8125rem !important;"></i>
                                                        Guardar
                                                    </div>
                                                </vs-button>
                                            </div>
                                            <div class="d-flex justify-content-center">
                                                <vs-tooltip>
                                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'"
                                                        :key="'descargar' + darkMode"
                                                        @click.stop="descargarFinanciamientoPrivado(selectedCalculo.id_calculo)"
                                                        hover="true" style="padding: 0.20rem; font-size: 1rem;"
                                                        :disabled="descargar_disabled">
                                                        <div
                                                            style="color: var(--btn-txt-color); font-weight: 700; display: flex; align-items: center;">
                                                            <i class="fas fa-file-download pr-2"
                                                                style="font-size: 0.8125rem !important;"></i>
                                                            Descargar
                                                        </div>
                                                    </vs-button>
                                                    <template #tooltip>
                                                        <div v-if="descargar_disabled">
                                                            Debes guardar los cambios antes de descargar
                                                        </div>
                                                        <div v-else>
                                                            Descargar distribución
                                                        </div>
                                                    </template>
                                                </vs-tooltip>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </vs-dialog>
                        </div>
                    </template>
                </div>
            </div>
        </div>
    </div>
</template>
<script>

//import { forEach } from 'lodash';
import methods from '../../../methods';
import { loading } from '../../../methods';
import { limpiarNumeroInput, formatoMonedaMX as formatoMonedaLocal} from '../../../utils/formatters'; // 😉
import { isValidNumber } from '../../../utils/utils'; // 😉
/**
 * 🐛 Función para depuración development
 * @param {...any} args - Uno o más mensajes a mostrar en consola
 * @example
 * debug('Mensaje de prueba', {data: 123});
 */
const debug = (...args) => {
    if (process.env.NODE_ENV === 'development') {
        console.log(...args);
    }
};
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            // Variables para listar
            selectedCalculo: {},
            Partidos_Con_Representacion: [],
            Partidos_Sin_Representacion: [],
            listCalculos: [], // Lista de calculos
            cb_ppSeleccionados: [],
            opcionSelecionadaPorcentaje: '1', //  Valor por defecto Gubernatura
            search: '',
            page: 1,
            max: 10,
            // Dialog
            active: false,
            anio: '',
            id: null,
            /*topesConRep: [],
            topesSinRep: [],
            focused: { arr: null, index: null },
            topesConRepGobernatura: [],
            topesSinRepGobernatura: [],
            */
            // Valores Input
            topePresidencial: 0.0,
            topeGubernatura: 0.0,
            topePresidencialInput: '$0.00',  // Inicializar como string
            topeGubernaturaInput: '$0.00',  // Inicializar como string
            
            colors: [
                {
                    color: 'warn'
                }
            ],

            catAnio: [],
            calculo: {},
            montosFijos: {},
            cat_tipo_distribucion: [],
            CalculosPorAnio: [],
            // Validaciones
            error: false,
            errorAnio: '',
            errorTopePresidencial: '',
            errorTopeGubernatura: '',
            descargar_disabled: true, // true: disabled | false: enabled
        }
    },
    watch: {
        anio(newAnio) {
            if (newAnio) {
                this.getDistribucionesPorAnio(newAnio);
            }
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

        this.opcionSelecionadaPorcentaje = '1'; // '1': gubernatura | '2': intermedia
        this.getCalculos();
        await this.getAnio();
        //await this.obtenerDatos(11);
        //this.inicializarTopes();

    },
    methods: {
        // #region CATÁLOGOS 📜
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
        /*DEPRECATED
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
                        this.cat_tipo_distribucion = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },*/
        // #endregion CATÁLOGOS 📜
        
        // #region CONSULTAS A LA BASE DE DATOS 📚

        /**
         * Obtiene las distribuciones por año
         * @param {number} anio - El año fiscal
         */
        async getDistribucionesPorAnio(anio) {
            if (!anio) return;
            try {
                const { data } = await axios.get('/administracion/solicitud/getDistribucionesPorAnio', { params: { anio } });
                if (data.success) {
                    this.CalculosPorAnio = data.calculos;
                    //this.distribuciones = data.distribuciones;
                    //this.Partidos_Con_Representacion = data.partidos_con_repr;
                    //this.Partidos_Sin_Representacion = data.partidos_sin_repr;
                }
            } catch (error) {
                console.error("Error al obtener distribuciones:", error);
            }
        },
        /**
         * Obtiene los calculos de financiamiento para listar
         * Observación: se puede optimizar para sustituir el método <getDistribucionesPorAnio>
         */
        getCalculos() {
            const loader = loading(this.$vs);
            loader.text = 'Cargando datos...';
            let url = '/administracion/solicitud/getCalculosFinanciamiento';
            this.listCalculos = [];
            axios.get(url).then((response) => {
                if (response.data?.success) {
                    this.listCalculos = response.data.calculos || [];
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
        /**
         * Guarda los cambios del Financiamiento Privado
         * @param {number} id_calculo - El ID del cálculo
         */
        async guardarCambios(id_calculo){
            const loader = loading(this.$vs);
            loader.text = 'Guardando cambios...';
            let url = '/administracion/solicitud/FinPriv_Update_Calculo';
            //Preparamos los datos para guardar
            //let topes = this.obtenerTopes();
            debug(' 🐛 🌠 Id del cálculo a guardar: ' + id_calculo);
            try{
                // Preparamos los datos para guardar
                let datos = {
                    //p_comando: "UPDATE", // INSERT, UPDATE
                    p_id_calculo: id_calculo,
                    p_finpriv_tope_presidencial: this.topePresidencial,//this.selectedCalculo.finpriv_tope_presidencial,
                    p_finpriv_tope_gubernatura: this.topeGubernatura,//this.selectedCalculo.finpriv_tope_gubernatura,
                }
                const response = await axios.post(url, datos); // ⇋ UPDATE cálculo
                // ✔ Validamos que la respuesta sea exitosa
                if (!response || !response.data) {
                    throw new Error('La respuesta del servidor no es válida');
                }
                if (response.status !== 200) {
                    throw new Error(`Error en la petición: ${response.status} ${response.statusText}`);
                }
                if (!response.data.success) {
                    const errorMessage = response.data.message || 'Error desconocido al guardar la ministración';
                    throw new Error(errorMessage);
                }
                if(response.data.success){
                    debug(' 🐛 🌠 Id del response: ' + JSON.stringify(response.data.id));
                }
                else{
                    throw new Error(response.data.message);
                }

                // Actualizamos cada campo del partido político por separado
                let p_tipoPartido = 'CON';
                url = '/administracion/solicitud/FinPriv_Update_Partidos';
                for (let partido of this.Partidos_Con_Representacion) {
                    let responsePartidos = await axios.post(url, { // ⇋ UPDATE Partidos Con Representación
                        p_id_calculo: id_calculo,
                        p_id_partido: partido.id_partido,
                        p_tipo_partido: p_tipoPartido,
                        p_finpriv_limite_finPrivado: partido.finpriv_limite_finPrivado,
                        p_finpriv_aportaciones_militantes: partido.finpriv_aportaciones_militantes,
                        p_finpriv_aportaciones_simpPres: partido.finpriv_aportaciones_simpPres,
                        p_finpriv_aportaciones_simpGuber: partido.finpriv_aportaciones_simpGuber,
                        p_finpriv_rendimientos: partido.finpriv_rendimientos
                    });
                    // ✔ Validamos que la respuesta sea exitosa 
                    if (!responsePartidos || !responsePartidos.data) {
                        throw new Error('La respuesta del servidor no es válida');
                    }
                    if (responsePartidos.status !== 200) {
                        throw new Error(`Error en la petición: ${responsePartidos.status} ${responsePartidos.statusText}`);
                    }
                    if (!responsePartidos.data.success) {
                        const errorMessage = responsePartidos.data.message || 'Error desconocido al actualizar el partido - Con';
                        throw new Error(errorMessage);
                    }
                    debug(' 🐛 🌠 Id del responsePartidos Con: ' + JSON.stringify(responsePartidos.data.ids));
                }
                p_tipoPartido = 'SIN';
                url = '/administracion/solicitud/FinPriv_Update_Partidos';
                for (let partido of this.Partidos_Sin_Representacion) {
                    let responsePartidos = await axios.post(url, { // ⇋ UPDATE Partidos Con Representación
                        p_id_calculo: id_calculo,
                        p_id_partido: partido.id_partido,
                        p_tipo_partido: p_tipoPartido,
                        p_finpriv_limite_finPrivado: partido.finpriv_limite_finPrivado,
                        p_finpriv_aportaciones_militantes: partido.finpriv_aportaciones_militantes,
                        p_finpriv_aportaciones_simpPres: partido.finpriv_aportaciones_simpPres,
                        p_finpriv_aportaciones_simpGuber: partido.finpriv_aportaciones_simpGuber,
                        p_finpriv_rendimientos: partido.finpriv_rendimientos
                    });
                    // ✔ Validamos que la respuesta sea exitosa 
                    if (!responsePartidos || !responsePartidos.data) {
                        throw new Error('La respuesta del servidor no es válida');
                    }
                    if (responsePartidos.status !== 200) {
                        throw new Error(`Error en la petición: ${responsePartidos.status} ${responsePartidos.statusText}`);
                    }
                    if (!responsePartidos.data.success) {
                        const errorMessage = responsePartidos.data.message || 'Error desconocido al actualizar el partido - Sin';
                        throw new Error(errorMessage);
                    }
                    debug(' 🐛 🌠 Id del responsePartidos Sin: ' + JSON.stringify(responsePartidos.data.ids));
                }
                // Notificación de éxito
                Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: 'Datos guardados correctamente',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
                })
                this.$vs.notification({ color: 'success', text: 'Financiamiento privado guardado' + response.data.message});
                //this.descargar_disabled[id_calculo] = false; // Habilita descargar archivo
            }catch(error){
                debug('🐛 Error al guardar el financiamiento privado:', error);
                this.$vs.notification({title: 'Error', color: 'danger', text: 'Error al guardar el financiamiento privado' });

                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            } finally {
                loader.close();
            }

        },

        /**
         * Descarga el archivo Excel de la distribución
         * @param id_calculo // debe de existir un preguardado antes
         */
        descargarFinanciamientoPrivado(id_calculo) {
            const loader = loading(this.$vs);
            loader.text = 'Generando archivo Excel...';
            const apiUrl = `/administracion/solicitud/exportarFinanciamientoPrivadoExcel/${id_calculo}`;
            let downloadUrl = null;
            let link = null;

            if (this.id_calculo ? null : this.id_calculo === null || this.id_calculo === 0) {
                throw new Error('❌ No se encontro el ID de la financiamiento privado');
            }
            // ⇋
            axios.get(apiUrl, {
                responseType: 'blob',
                method: 'GET',
            })
                .then(response => {
                    downloadUrl = window.URL.createObjectURL(new Blob([response.data]));
                    link = document.createElement('a');
                    link.href = downloadUrl;
                    const filename = `Anexo 4. Financiamiento Privado.xlsx`;
                    link.setAttribute('download', filename);
                    document.body.appendChild(link);
                    link.click();
                    this.$vs.notification({
                        title: 'Éxito',
                        text: 'El archivo Excel se está descargando',
                        color: 'success'
                    });
                })
                .catch(error => {
                    debug('🔴 Error al descargar Excel:', error);

                    let errorMessage = 'Error al descargar Excel';
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
                })
                .finally(() => {
                    loader.close();
                    try {
                        if (link && link.parentNode) {
                            link.parentNode.removeChild(link); // Elimina el elemento hijo
                        }
                        if (downloadUrl && typeof downloadUrl === 'string') {
                            window.URL.revokeObjectURL(downloadUrl); // Liberar memoria
                        }
                    } catch (e) {
                        console.error('Error al limpiar recursos:', e);
                    }
                });
        },
        // #endregion CONSULTAS A LA BASE DE DATOS 📚
        
        // #region OPERACIONES DE LA VISTA 📊

        /**
         * Abre el dialogo
         * @param {Object} calculo_tr - El calculo seleccionado
         */
        abrirDialog(calculo_tr) {
            const loader = loading(this.$vs);
            let url = '/administracion/solicitud/get_Partidos_Calculo_porId';
            // debug('🐛 Calculo seleccionado:', calculo_tr);
            this.selectedCalculo = calculo_tr; // Se trae el calculo seleccionado para usar los datos después
            this.Partidos_Sin_Representacion = [];
            this.Partidos_Con_Representacion = [];
            this.limpiarCampos(); // 🧹
            this.active = true; // activa el modal
            loader.text = 'Cargando datos...';
            //Obtener los datos principales del Cálculo Financiero
            axios.get(url, { // ⇋ GET Partidos por Id
                params: {
                    'id': calculo_tr.id_calculo
                }
            }).then(response => {
                debug('🐛 Datos partidos recibidos:', response.data);
                if (response.status === 200 && response.data?.success) {
                    //Obtenemos los datos de los partidos politicos
                    this.Partidos_Sin_Representacion = response.data.partidosSinRep;
                    // debug('🐛 Partidos Sin Representacion:', this.Partidos_Sin_Representacion);
                    this.Partidos_Con_Representacion = response.data.partidosConRep;
                    // debug('🐛 Partidos Con Representacion:', this.Partidos_Con_Representacion);
                } else {
                    // success: false
                    const errorMessage = response.data?.message || 'Error en la respuesta del servidor';
                    throw new Error(errorMessage);
                }
                // Cargando datos de Distribución

            }).catch((error) => {
                console.error('Error al cargar detalles del cálculo', error);
                this.$vs.notification({
                    title: 'Error',
                    text: 'Error al cargar los detalles del cálculo',
                    color: 'danger'
                });

                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            })
                .finally(() => {
                    loader.close();
                })
        },
        /*
        calcularFinanciamientoPublicoTotalidad() {
            let finanPublicTotal = [this.Partidos_Con_Representacion,...this.Partidos_Sin_Representacion].
                reduce((total, partido) => {
                return total + partido.C_fpaop ?? partido.monto_2_por_ciento ?? 0}, 0);
            finanPublicTotal = finanPublicTotal / 2;
            return finanPublicTotal;
        },
        */

        /*
        * Calcula el limite de financiamiento privado por cada partido político
        * Financiamiento público para actividades ordinarias permanentes (de cada partido político) * 0.50
        * 
        * Cuando el límite anual del financiamiento privado sea superior al 50% del financiamiento público 
        * asignado en el año correspondiente a la totalidad de los partidos políticos, 
        * para asegurar que el financiamiento público prevalezca sobre el privado.
        */
        limiteFinanciamientoPrivado(partido, valor) {
            const resultado = valor * 0.50;
            partido.finpriv_limite_finPrivado = resultado;
            return resultado;
        },
        // Aportaciones en dinero y/o en especie de personas militantes
        aportacionesMilitantes(partido, valor) {
            const resultado = valor * 0.20;
            partido.finpriv_aportaciones_militantes = resultado;
            return resultado;
        },
        //Las aportaciones de personas simpatizantes, elección Presidencial
        aportacionesSimpatizantesPresidencial(partido, valorTope) {
            const resultado = valorTope * 0.005;
            partido.finpriv_aportaciones_simpPres = resultado;
            return resultado;
        },
        //Las aportaciones de personas simpatizantes, elección a la Gubernatura
        aportacionesSimpatizantesGubernatura(partido, valorTope) {
            const resultado = valorTope * 0.005;
            partido.finpriv_aportaciones_simpGuber = resultado;
            return resultado;
        },
        //Financiamiento por rendimientos financieros de los partidos políticos
        rendimientosFinanciamientoPrivado(partido, valorTope) {
            const resultado = valorTope * 0.005;
            partido.finpriv_rendimientos = resultado;
            return resultado;
        },
        /*
        limite(partido, valor) {
            const resultado = valor * 0.50;
            partido.finpriv_limite_finPrivado = resultado;
            const resultadoConvertido = this.formatCurrency(resultado);
            return resultadoConvertido;
        },
        aportaciones(partido, valor) {
            const resultado = valor * 0.20;
            partido.finpriv_aportaciones_militantes = resultado;
            const resultadoConvertido = this.formatCurrency(resultado);
            return resultadoConvertido;
        },
        aportacionSimpatizantes(partido, tope) {
            if (!tope) return 0;
            const resultado = tope * 0.005;
            partido.finpriv_aportaciones_simpPres = resultado;
            return resultado;
        },
        aportacionDinero(partido, tope) {
            if (!tope) return 0;
            const resultado = tope * 0.005;
            partido.finpriv_aportaciones_simpGuber = resultado;
            partido.finpriv_rendimientos = resultado; // Hay que checarlo porque es igual
            return resultado;
        },
        */
        /* DEPRECATED
        inicializarTopes() {
            this.topesConRep = new Array(this.Partidos_Con_Representacion.length).fill(null);
            this.topesConRepGobernatura = new Array(this.Partidos_Con_Representacion.length).fill(null);
            this.topesSinRep = new Array(this.Partidos_Sin_Representacion.length).fill(null);
            this.topesSinRepGobernatura = new Array(this.Partidos_Sin_Representacion.length).fill(null);
        },*/
        // #endregion OPERACIONES DE LA VISTA 📊

        // #region FORMATEOS 🔧🛠
        /**
         * Maneja el input de forma genérica para limpiarlo y formatearlo ✅
         * Actualizando el valor 
         * @param {Event} event - Evento del input
         * @param {String} propertyName - Nombre de la propiedad que contiene la variable a actualizar
         */
         updateValueTopes(propertyName, value) {
            try {
                // Obtener el valor crudo
                const rawValue = (value && value.target) ? value.target.value : value;
                
                // Limpiar y convertir a número
                const cleanValue = limpiarNumeroInput(String(rawValue));
                const valorNumerico = parseFloat(cleanValue) || 0;
                
                // Actualizar la propiedad reactiva
                this.$set(this, propertyName, valorNumerico);
                                
            } catch (error) {
                console.error('Error en updateValueTopes:', error);
                this.$set(this, propertyName, 0);
                return '0';
            }
        },

        /*
         * Actualiza el valor de la propiedad reactiva
         * @param {String} propertyNameStr - Nombre de la propiedad que contiene la variable a actualizar
         * @param {Event} value - Evento del input
         */
        actualizarValorInput(propertyNameStr, value) {
            // Maneja tanto eventos nativos como de Vuesax
            const rawValue = (value && value.target) ? value.target.value : value;
            this.$set(this, propertyNameStr, rawValue);
        },
        /*
        * Maneja el blur de un input para formatear el valor
        * Necesariamente requiere que el valor string para formatearse
        * @param {String} propertyNameStr - Nombre de la propiedad que contiene la variable a actualizar
        */
        formatearAlSalirBlur(propertyNameStr, propertyNameInt) {
            //const cleanValue = String(rawValue || '').replace(/[^0-9.]/g, '');
            debug("🦖 blur propertyNameStr: ", propertyNameStr, ':',this[propertyNameStr]);
            const cleanValue = limpiarNumeroInput(this[propertyNameStr]);
            debug("🦖 blur cleanValue: ", cleanValue);
            const valorNumerico = parseFloat(cleanValue) || 0;
            //debug("🦖 blur ValorNumerico: ", valorNumerico);
            this.$set(this, propertyNameInt, valorNumerico);
            this.$set(this, propertyNameStr, formatoMonedaLocal(valorNumerico));
        },
        /*
        updateValue(calculo, arr, index, val) {
            if (!this[arr]) this.$set(this, arr, []); // inicializa el array si no existe

            // Si viene de un input nativo (event) toma target.value, si es vs-input ya es el valor
            const rawValue = (val && val.target) ? val.target.value : val;

            const clean = String(rawValue || '').replace(/[^0-9.]/g, '');
            this.$set(this[arr], index, clean ? parseFloat(clean) : null);

            if(arr === 'topesConRepGobernatura' || arr === 'topesSinRepGobernatura') {
                this.selectedCalculo.finpriv_tope_gubernatura = parseFloat(clean);
            }
            else if(arr === 'topesConRep' || arr === 'topesSinRep') {
                this.selectedCalculo.finpriv_tope_presidencial = parseFloat(clean);
            }
        },*/
        /*
        setFocus(arrayName, index) {
            this.focused = { arr: arrayName, index };
        },
        clearFocus() {
            this.focused = { arr: null, index: null };
        },
        formatInput(arrayName, index) {
            const value = this[arrayName][index];

            if (this.focused.arr === arrayName && this.focused.index === index) {
                return value ?? ''; // mostrar crudo en focus
            }
            if (value == null || isNaN(value)) return '';
            return value.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2
            });
        },*/
        formatoFecha(fechaStr) {
            if (!fechaStr) return ''
            // Parsear fecha en formato YYYY-MM-DD
            const partes = fechaStr.split('-')
            if (partes.length !== 3) return fechaStr

            const anio = partes[0]
            const mes = parseInt(partes[1], 10) - 1 // Meses van de 0 a 11
            const dia = partes[2]

            const meses = ['ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC']
            const mesAbreviado = meses[mes] || ''

            return `${dia} ${mesAbreviado} ${anio}`
        },
        /**
         * Formatea un valor numérico a moneda - Función local
         * @param {number} value - Valor numérico a formatear
         * @returns {string} - Valor formateado como moneda
         */
        formatCurrency(value) {
            if (value === null || value === undefined || isNaN(value)) return '$0.00';
            //Con style: 'currency', ya no es necesario truncar manualmente
            //const num = Math.floor(parseFloat(value) * 100) / 100;
            const num = parseFloat(value);
            return num.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
        },
        /* Función para formatear el porcentaje (solo formatea)
        * @param {number} valor - El valor a formatear
        * @returns {string} - El valor formateado
        */
        formatearPorcentaje(valor) {
            if (!valor) return '0.00000 %';
            const numero = parseFloat(valor.toString().replace(/[^0-9.]/g, ''));
            return isNaN(numero) ? '0.00000 %' : numero.toFixed(5) + ' %';
        },
        /*
        * Formatea a decimal
        * @param {number} valor - El valor a formatear
        * @returns {string} - El valor formateado
        */
        formatearDecimal(valor) {
            if (!valor) return '0.00';
            const numero = parseFloat(valor.toString().replace(/[^0-9.]/g, ''));
            return isNaN(numero) ? '0.00' : numero.toFixed(2);
        },
        // #endregion FORMATEOS 🔧🛠

        // #region VALIDACIONES Y LIMPIEZA ✔🧹
        /**
         * ✔ Validar campos
         * @returns {boolean}
         */
        validarCampos() {
            this.limpiarErrores();
            if(this.topeGubernaturaInput === '') {
                this.errorTopeGubernatura = 'Ingrese un número positivo y mayor de 0';
                this.error = true;
            }
            if(this.topePresidencialInput === '') {
                this.errorTopePresidencial = 'Ingrese un número positivo y mayor de 0';
                this.error = true;
            }
            if (this.topePresidencial === '' || !isValidNumber(this.topePresidencial) || parseFloat(this.topePresidencial) <= 0) {
                this.errorTopePresidencial = 'Ingrese un número positivo y mayor de 0';
                this.error = true;
            }
            if (this.topeGubernatura === '' || !isValidNumber(this.topeGubernatura) || parseFloat(this.topeGubernatura) <= 0) {
                this.errorTopeGubernatura = 'Ingrese un número positivo y mayor de 0';
                this.error = true;
            }
            return this.error;
        },
        /**
         * 🧹 Limpia todos los campos del formulario
         * @returns {void}
         */
        limpiarCampos() {
            this.topePresidencial = 0,
            this.topeGubernatura = 0,
            this.errorTopePresidencial = '',
            this.errorTopeGubernatura = '',
            this.topesSinRep = '',
            this.topesConRep = [];
            this.descargar_disabled = false; // Deshabilita el botón de descargar
            this.limpiarErrores();
        },
        /**
         * Limpia todos los mensajes de error
         * @returns {void}
         */
        limpiarErrores() {
            this.error = false;
            this.errorAnio = '';
            this.errorTopePresidencial = '',
            this.errorTopeGubernatura = '',
        },
        // #endregion VALIDACIONES Y LIMPIEZA ✔🧹
    },
    computed: {
        totalAjusteDecimales() {
            return this.Partidos_Con_Representacion.reduce((sum, p) => sum + (p.ajuste || 0), 0);
        }
    }
}
</script>

<style>
/* Quita bordes de la tabla */
.sin-bordes ::v-deep(.vs-table__tr),
.sin-bordes ::v-deep(.vs-table__td),
.sin-bordes ::v-deep(.vs-table__th) {
    border: none !important;
    box-shadow: none !important;
}


.tabla-ajustada ::v-deep(.vs-table__th),
.tabla-ajustada ::v-deep(.vs-table__td) {
    text-align: center !important;
    vertical-align: middle !important;
}

/* Ajustar ancho de columnas específicas */
.tabla-ajustada ::v-deep(.vs-table__th:nth-child(1)),
.tabla-ajustada ::v-deep(.vs-table__td:nth-child(1)) {
    width: 80px !important;
    /* ID más compacto */
}

.tabla-ajustada ::v-deep(.vs-table__th:last-child),
.tabla-ajustada ::v-deep(.vs-table__td:last-child) {
    width: 120px !important;
    /* Acciones un poco más fijas */
    text-align: center !important;
}

.tabla-ajustada .vs-button[icon] {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    padding: 0 !important;
    border-radius: 50% !important;
    width: 36px !important;
    height: 36px !important;
}

/* Ícono dentro del botón */
.tabla-ajustada .vs-button[icon] i {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    font-size: 16px !important;
    line-height: 0 !important;
    /* evita espacio extra vertical */
    height: 100% !important;
}

/* Imagen y mensaje cuando no hay datos */
.noDataContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem;
}

.imgNoData {
    width: 180px;
    max-width: 40%;
}

.noDataTitle {
    margin-top: 1rem;
    font-weight: 500;
    color: #888;
}

.fila-flex {
    display: flex !important;
    align-items: center;
}

/* 1ª columna (texto): ancho fijo */
.fila-flex .col-desc,
.fila-flex .vs-table__th.col-desc,
.fila-flex .vs-table__td.col-desc {
    flex: 0 0 320px !important;
    /* ajusta 320px al gusto */
    max-width: 320px !important;
    white-space: normal;
    word-wrap: break-word;
}

/* columnas de partidos: ocupan el resto por igual */
.fila-flex .col-partido,
.fila-flex .vs-table__th.col-partido,
.fila-flex .vs-table__td.col-partido {
    flex: 1 1 0 !important;
    text-align: center;
}

/* estética opcional */
.partido-header {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.logo-partido {
    width: 60px;
    height: 60px;
    object-fit: contain;
    margin-bottom: 5px;
}

.monto {
    text-align: right;
    padding-right: 8px;
}

/* o center si prefieres */
.fila-header {
    background: #f4f6f8;
    border-radius: 12px;
}
</style>