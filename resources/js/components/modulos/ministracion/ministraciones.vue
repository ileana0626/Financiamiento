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
                            <span>Ministraciones</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Ministraciones</h3>
            </div>

            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="row p-4">
                    <!-- Año fiscal -->
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

                <!-- Listado de calculos, se muestran si hay calculos para el año seleccionado -->
                <div v-if="CalculosPorAnio.length > 0" class="mt-4">
                    <div v-for="(calculo, index) in CalculosPorAnio" :key="'calculo-' + index" class="mb-5">
                        <div class="d-flex align-items-center gap-2">
                            <span class="material-symbols-rounded">receipt_long</span>
                            <h5 class="mb-0">
                                ID Cálculo: {{ calculo.id_calculo }} - Año: {{ calculo.anio_ejercicio }}
                            </h5>
                        </div>

                        <!-- Partidos Políticos -->
                        <vs-table class="tabla-ajustada mt-3">
                            <template #thead>
                                <vs-tr>
                                    <vs-th style="text-align: left;">Emblema</vs-th>
                                    <vs-th style="text-align: left;">Total Financiamiento</vs-th>
                                    <vs-th style="text-align: left;">Enero</vs-th>
                                    <vs-th style="text-align: left;">Febrero</vs-th>
                                    <vs-th style="text-align: left;">Marzo</vs-th>
                                    <vs-th style="text-align: left;">Abril</vs-th>
                                    <vs-th style="text-align: left;">Mayo</vs-th>
                                    <vs-th style="text-align: left;">Junio</vs-th>
                                    <vs-th style="text-align: left;">Julio</vs-th>
                                    <vs-th style="text-align: left;">Agosto</vs-th>
                                    <vs-th style="text-align: left;">Septiembre</vs-th>
                                    <vs-th style="text-align: left;">Octubre</vs-th>
                                    <vs-th style="text-align: left;">Noviembre</vs-th>
                                    <vs-th style="text-align: left; width: 10%;">Diciembre</vs-th>
                                </vs-tr>
                            </template>
                            <template #tbody>
                                <!-- Filtra a los Partidos Con Representación por el <<id_calculo>> -->
                                <vs-tr
                                    v-for="(partido, i) in Partidos_Con_Representacion.filter(p => p.id_calculo === calculo.id_calculo)"
                                    :key="'con-' + partido.id_calculo + '-' + partido.id_partido">
                                    <vs-td>
                                        <img :src="'/img/logos/' + partido.logo" :alt="partido.siglas"
                                            class="img-fluid rounded" style="max-width: 40px; max-height: 40px;"
                                            onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'" />
                                    </vs-td>
                                    <!-- Monto Financiamiento público para actividades ordinarias permanentes -->
                                    <vs-td style="text-align: left;">
                                        {{ formatCurrency(partido.C_fpaop) }}
                                    </vs-td>
                                    <!-- Genera los campos por los meses por cada partido-->
                                    <vs-td v-for="(monto, mesIndex) in distribuirConEditableDiciembre(
                                        partido.C_fpaop, partido, 'con-' + partido.id_calculo + '-' + partido.id_partido)"
                                        :key="'mes-' + partido.id_calculo + '-' + partido.id_partido + '-' + mesIndex" style="text-align: left;">
                                        <!-- Solo diciembre (índice 11) es editable -->
                                        <template v-if="mesIndex === 11">
                                            <div class="d-flex align-items-center">
                                                <!-- <span :class="{ 'text-success': partido.ajusteDiciembre > 0, 'text-danger': partido.ajusteDiciembre < 0 }"></span>
                                                {{partido.mintr_diciembre}} -->
                                                <input type="text" :value="partido.mintr_diciembre" class="form-control" 
                                                    :key="'txbD_Con-' + partido.id_calculo + '-' + partido.id_partido"
                                                    :class="{ 'text-success': partido.ajusteDiciembre > 0, 'text-danger': partido.ajusteDiciembre < 0 }"
                                                    style="width: 100%;"
                                                    @input="onInputMoneda($event, partido, 'con')" />
                                                <div class="d-flex flex-column ms-1" style="margin-left: 5px;">
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('sumar', partido, 'con')">▲</button>
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('restar', partido, 'con')">▼</button>
                                                </div>
                                            </div>
                                        </template>
                                        <!-- Los otros 11 meses -->
                                        <template v-else>
                                            {{ formatCurrency(monto) }}
                                        </template>
                                    </vs-td>
                                </vs-tr>
                                <hr width="100%" /> <!-- Separador entre los partidos con representación y sin representación -->
                                <!-- Filtra a los Partidos Sin Representación por el <<id_calculo>> -->
                                <vs-tr
                                    v-for="(partidoS, i) in Partidos_Sin_Representacion.filter(p => p.id_calculo === calculo.id_calculo)"
                                    :key="'sin-' + partidoS.id_calculo + '-' + partidoS.id_partido">
                                    <!-- Logo -->
                                    <vs-td>
                                        <img :src="'/img/logos/' + partidoS.logo" :alt="partidoS.siglas"
                                            class="img-fluid rounded" style="max-width: 40px; max-height: 40px;"
                                            onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'" />
                                    </vs-td>
                                    <!-- Monto Financiamiento público para actividades ordinarias permanentes -->
                                    <vs-td style="text-align: left;">
                                        {{ formatCurrency(partidoS.monto_2_por_ciento) }}
                                    </vs-td>
                                    <!-- Genera los campos por los meses por cada partido sin representación -->
                                    <vs-td v-for="(monto, mesIndex) in distribuirConEditableDiciembre(
                                        partidoS.monto_2_por_ciento, partidoS, 'sin-' + partidoS.id_calculo + '-' + partidoS.id_partido)"
                                        :key="'mes-sin-' + partidoS.id_calculo + '-' + partidoS.id_partido + '-' + mesIndex"
                                        style="text-align: left;">
                                        <!-- Solo diciembre (índice 11) es editable -->
                                        <template v-if="mesIndex === 11">
                                            <div class="d-flex align-items-center">
                                                <!-- <span :class="{ 'text-success': partido.ajusteDiciembre > 0, 'text-danger': partido.ajusteDiciembre < 0 }"></span>
                                                {{partidoS.mintr_diciembre}} -->
                                                <input type="text" :value="partidoS.mintr_diciembre" class="form-control" 
                                                    :key="'txbD_Sin-' + partidoS.id_calculo + '-' + partidoS.id_partido"
                                                    :class="{ 'text-success': partidoS.ajusteDiciembre > 0, 'text-danger': partidoS.ajusteDiciembre < 0 }"
                                                    style="width: 100%;"
                                                    @input=" onInputMoneda(event, partidoS, 'sin')"/>
                                                <div class="d-flex flex-column ms-1" style="margin-left: 5px;">
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('sumar', partidoS, 'sin')">▲</button>
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('restar', partidoS, 'sin')">▼</button>
                                                </div>
                                            </div>
                                        </template>
                                        <!-- Los otros 11 meses -->
                                        <template v-else>
                                            {{ formatCurrency(monto) }}
                                        </template>
                                    </vs-td>
                                </vs-tr>

                                <!-- totales -->
                                <vs-tr :key="'fila-total-mensual'">
                                    <vs-td style="font-weight: bold;">Totales</vs-td>
                                    <vs-td></vs-td> <!-- Columna vacía debajo de "Total Financiamiento" -->

                                    <vs-td v-for="(monto, i) in obtenerTotalesMensuales(calculo.id_calculo)"
                                        :key="'total-mes-' + i" style="text-align: left; font-weight: bold;">
                                        <!-- {{ i === 11 ? monto : '$' + truncateTo2Decimals(monto) }} -->
                                        {{ formatCurrency(monto) }}
                                    </vs-td>
                                </vs-tr>

                                <!-- Fila de Total General -->
                                <vs-tr :key="'fila-total-general'">
                                    <vs-td style="font-weight: bold;">Total General</vs-td>
                                    <vs-td></vs-td>
                                    <vs-td colspan="12" style="text-align: left; font-weight: bold;">
                                        {{ formatCurrency(obtenerTotalGeneral(calculo.id_calculo)) }}
                                    </vs-td>
                                </vs-tr>
                            </template>
                        </vs-table>

                        <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row mt-4">
                            <div class="d-flex justify-content-center">
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#1a2e35'" :key="'guardar-' + calculo.id_calculo + '_' + calculo.anio_ejercicio"
                                    @click.stop="guardarCambios(calculo.id_calculo)" style="padding: 0.20rem; font-size: 1rem;">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-save pr-2" style="font-size: 0.8125rem !important;"></i>
                                        Guardar
                                    </div>
                                </vs-button>
                            </div>
                            <div class="d-flex justify-content-center">
                                <vs-tooltip>
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'descargar-' + calculo.id_calculo + '_' + calculo.anio_ejercicio"
                                        @click.stop="descargarMinistraciones(calculo.id_calculo)" hover="true"
                                        style="padding: 0.20rem; font-size: 1rem;" :disabled="descargar_disabled[calculo.id_calculo]">
                                        <div
                                            style="color: var(--btn-txt-color); font-weight: 700; display: flex; align-items: center;">
                                            <i class="fas fa-file-download pr-2"
                                                style="font-size: 0.8125rem !important;"></i>
                                            Descargar
                                        </div>
                                    </vs-button>
                                    <template #tooltip>
                                        <div v-if="descargar_disabled[calculo.id_calculo]">
                                            Debes guardar los cambios antes de descargar
                                        </div>
                                        <div v-else>
                                            Descargar distribución
                                        </div>
                                    </template>
                                </vs-tooltip>
                            </div>
                        </div>
                    </div> <!-- Fin del div-for-tabla -->
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
import { Decimal } from 'decimal.js';
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
            NewlistCalculos: [],
            //ministracionId: {}, // Para saber si ya se ha guardado un registro
            search: '',
            page: 1,
            max: 10,
            // Dialog
            active: false,
            anio: '',
            colors: [
                {
                    color: 'warn'
                }
            ],

            catAnio: [],
            //calculo: {}, // Se usa para cargar el cálculo seleccionado
            //montosFijos: {},
            //ajustesDiciembre: {}, // como un objeto para almacenar pares clave-valor para partidos con y sin representación -- DEPRECATED
            //cat_tipo_distribucion: [],
            //distribucion: [],
            distribuciones: [],
            CalculosPorAnio: [], // Se usan para listar los calculos por año
            // Validaciones
            error: false,
            errorAnio: '',
            descargar_disabled: {}, // true: disabled | false: enabled
        }
    },
    // watch: {
    //     anio(newAnio) {
    //         if (newAnio) {
    //             this.getDistribucionesPorAnio(newAnio);
    //         }
    //     }
    // },
    created() {
        EventBus.$on('darkMode', (data) => { this.darkMode = data })
    },
    beforeDestroy() {
        // Limpiar el event listener
        EventBus.$off('darkMode');
    },
    async mounted() {
        //this.getCalculos();
        await this.getAnio();
        await this.obtenerDatos(11);
    },
    methods: {
        /**
         * Trunca un número a 2 decimales
         * @param {number} value - Valor numérico a truncar
         * @returns {string} - Valor truncado a 2 decimales
         */
        truncateTo2Decimals(value) {
            if (!value && value !== 0) return '0.00';
            const num = Number(value); // (falla si hay caracteres no numéricos)
            return (Math.trunc(num * 100) / 100).toFixed(2);
        },

        /* DEPRECATED
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
        */
        // #endregion Formateos

        /** DEPRECATED
         * Obtiene los calculos de financiamiento para listar
         */
        /*
        getCalculos() {
            const loader = loading(this.$vs);
            loader.text = 'Cargando datos...';
            let url = '/administracion/solicitud/getCalculosFinanciamiento';
            this.NewlistCalculos = [];
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
        */
        //DEPRECATED
        // onChangeDistribucion(value) {
        //     this.distribucion = value;
        //     setTimeout(() => {
        //         document.activeElement.blur();
        //     }, 100);
        // },

        // #region CATÁLOGOS 📜
        /**
         * Obtiene el año fiscal
         */
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
        /**
         * Obtiene los datos de los catálogos 📜
         */
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
        },
        // #endregion CATÁLOGOS 📜

       
        /** 
         * Obtiene las distribuciones por año ✅
         * Los partidos politicos estan mezclados en un solo array independientemente del año
         * @param {number} anio - El año para obtener las distribuciones
         */
        async getDistribucionesPorAnio(anio) {
            if (!anio) return;
            const loader = loading(this.$vs);
            loader.text = 'Cargando distribuciones...';
            let url = '/administracion/solicitud/getDistribucionesPorAnio';
            try {
                const { data } = await axios.get(url, { params: { anio } });
                if (data.success) {
                    //debug('🐛 📝 Distribuciones cargadas.', JSON.stringify(data));
                    this.CalculosPorAnio = data.calculos;
                    this.distribuciones = data.distribuciones;
                    // this.ministraciones = data.ministraciones;
                    this.Partidos_Con_Representacion = data.partidos_con_repr;
                    this.Partidos_Sin_Representacion = data.partidos_sin_repr;

                    // Inicializar ajusteDiciembre, esta variable indica si se resto o se sumo
                    // Usar $set para que Vue detecte los cambios y sean reactivos
                    this.Partidos_Con_Representacion.map(partido =>
                        this.$set(partido, 'ajusteDiciembre', 0.0),
                        //this.$set(partido, 'mintr_diciembre', 0.0)
                    );
                    this.Partidos_Sin_Representacion.map(partido =>
                        this.$set(partido, 'ajusteDiciembre', 0.0),
                        //this.$set(partido, 'mintr_diciembre', 0.0)
                    );

                    debug('🐛 ✅ Datos cargados.');
                }
                else {
                    debug('🐛 ❌ Error al obtener datos.');
                }

                //Cargar ministraciones para el botón de descarga
                // this.CalculosPorAnio.forEach(calculo => {
                //     this.cargarMinistracion(calculo.id_calculo);
                // });

                //Cargar ministraciones para el botón de descarga
                await Promise.all(
                    this.CalculosPorAnio.map(calculo => 
                        this.cargarMinistracion(calculo.id_calculo)
                    )
                );
                //debug('🐛 📥 Descargas:', JSON.stringify(this.descargar_disabled));
            } catch (error) {
                debug("🐛 ❌ Error al obtener distribuciones:", error);
                
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            }
            finally {
                loader.close();
            }
        },

        // 🚨 DEPRECATED
        // Esta mal la referencia ya que se van a repetir los IDs
        /*
        actualizarAjusteDiciembre(idCalculo, idPartido, valor) {
            const key = `con-${idCalculo}-${idPartido}`;
            const partido = this.Partidos_Con_Representacion.find(p => p.id_calculo === idCalculo && p.id_partido === idPartido)
                || this.Partidos_Sin_Representacion.find(p => p.id_calculo === idCalculo && p.id_partido === idPartido);
            const total = partido ? (partido.C_fpaop || partido.monto_2_por_ciento) : 0;

            let parsedValue = parseFloat(valor);
            if (isNaN(parsedValue) || parsedValue < 0) parsedValue = 0;
            if (parsedValue > total) parsedValue = total;

            this.$set(this.ajustesDiciembre, key, parsedValue);
        },
        */
        /**
         * Solo verifica si existe una ministración para el cálculo y mostrar el botón de descarga ✅
         * @param {number} id_calculo - El ID del cálculo
         */
        async cargarMinistracion(id_calculo){
            let url = '/administracion/solicitud/Mintr_Get_Insert_Update_ministraciones_dppp';
            const DataMinistracion = [];
            try{
                const response = await axios.post(url, {p_comando: 'GET', p_id_calculo: id_calculo}); // ⇋ Se manda post aunque sea GET por el controlador
                if(response.data && response.data.success && response.data.ministracion.length > 0){
                    // Si se quieren rescatar los totales hay que convertirlo a objeto {} y declararlo en data{...}
                    this.DataMinistracion = response.data.ministracion[0]; // Solo con GET
                    this.ministracionId = this.DataMinistracion.id_calculo; // Id del calculo seleccionado es de la base de datos
                    //this.descargar_disabled[id_calculo] = false; // Habilita descargar archivo
                    this.$set(this.descargar_disabled, id_calculo, false); // Habilita descargar archivo
                }
                else{
                    this.$set(this.descargar_disabled, id_calculo, true); // Deshabilita descargar archivo
                }
                // debug('🐛 📥 Descargas:', JSON.stringify(this.descargar_disabled));
            }
            catch (error) {
                debug("🐛 ❌ Error al cargar datos de la ministración:", error);
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            }
        },
        /**
         * Guarda los cambios de la ministración ✅
         * @param {number} id_calculo - El ID del cálculo
         */
        async guardarCambios(id_calculo) {
            const loader = loading(this.$vs);
            loader.text = 'Guardando cambios...';
            let url = '/administracion/solicitud/Mintr_Get_Insert_Update_ministraciones_dppp';
            //id del calculo seleccionado 
            const idCalculo = id_calculo;
            debug(' 🐛 ✨ Id del calculo: ' + idCalculo);
            // Obtener los partidos con representación y sin representación de un cálculo
            const partidosConRepr = this.Partidos_Con_Representacion.filter(p => p.id_calculo === idCalculo);
            const partidosSinRepr = this.Partidos_Sin_Representacion.filter(p => p.id_calculo === idCalculo);

            //Preparamos los datos para guardar
            let totalesMensuales = this.obtenerTotalesMensuales(idCalculo);
            let granTotal = this.obtenerTotalGeneral(idCalculo);
            debug(' 🐛 TotalesMensuales: ' + JSON.stringify(totalesMensuales));
            debug(' 🐛 GranTotal: ' + granTotal);
            try{
                //Actualizamos los totales
                let datos = {
                    p_comando: "INSERT", // INSERT, UPDATE
                    p_id_calculo: idCalculo,
                    p_totales_mensuales_enero: totalesMensuales[0],
                    p_totales_mensuales_febrero: totalesMensuales[1],
                    p_totales_mensuales_marzo: totalesMensuales[2],
                    p_totales_mensuales_abril: totalesMensuales[3],
                    p_totales_mensuales_mayo: totalesMensuales[4],
                    p_totales_mensuales_junio: totalesMensuales[5],
                    p_totales_mensuales_julio: totalesMensuales[6],
                    p_totales_mensuales_agosto: totalesMensuales[7],
                    p_totales_mensuales_septiembre: totalesMensuales[8],
                    p_totales_mensuales_octubre: totalesMensuales[9],
                    p_totales_mensuales_noviembre: totalesMensuales[10],
                    p_totales_mensuales_diciembre: totalesMensuales[11],
                    p_gran_total: granTotal,
                }
                const responseTotales = await axios.post(url, datos); // ⇋ UPDATE Totales
                // ✔ Validamos que la respuesta sea exitosa
                if (!responseTotales || !responseTotales.data) {
                    throw new Error('La respuesta del servidor no es válida');
                }
                if (responseTotales.status !== 200) {
                    throw new Error(`Error en la petición: ${responseTotales.status} ${responseTotales.statusText}`);
                }
                if (!responseTotales.data.success) {
                    const errorMessage = responseTotales.data.message || 'Error desconocido al guardar la ministración';
                    throw new Error(errorMessage);
                }
                if(responseTotales.data.success){
                    debug(' 🐛 🌠 Id del responseTotales: ' + JSON.stringify(responseTotales.data.id));
                }
                else{
                    throw new Error(responseTotales.data.message);
                }
                
                // Actualizamos cada campo del partido político por separado
                let p_tipoPartido = 'CON';
                url = '/administracion/solicitud/Mintr_Update_Partidos';
                for (let partido of partidosConRepr) {
                    let responsePartidos = await axios.post(url, { // ⇋ UPDATE Partidos Con Representación
                        p_id_calculo: idCalculo,
                        p_id_partido: partido.id_partido,
                        p_tipo_partido: p_tipoPartido,
                        p_mintr_diciembre: partido.mintr_diciembre,
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
                    debug(' 🐛 📌 Id del partido: ' + partido.id_partido, 'Mintr Diciembre: ' + partido.mintr_diciembre);
                }
                p_tipoPartido = 'SIN';
                for (let partido of partidosSinRepr) {
                    let responsePartidos = await axios.post(url, { // ⇋ UPDATE Partidos Sin Representación
                        p_id_calculo: idCalculo,
                        p_id_partido: partido.id_partido,
                        p_tipo_partido: p_tipoPartido,
                        p_mintr_diciembre: partido.mintr_diciembre,
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
                    debug(' 🐛 📌 Id del partido: ' + partido.id_partido, 'Mintr Diciembre: ' + partido.mintr_diciembre);
                }
                // Notificación de éxito
                Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: 'Datos guardados correctamente',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
                })
                this.$vs.notification({ color: 'success', text: 'Ministración guardada' + responseTotales.data.message});
                this.descargar_disabled[idCalculo] = false; // Habilita descargar archivo
            }catch(error){
                debug('🐛 Error al guardar la ministración:', error);
                this.$vs.notification({title: 'Error', color: 'danger', text: 'Error al guardar la ministración' });

                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            } finally {
                loader.close();
            }
            /*
            totalesMensuales.forEach((monto, index) => {
            const nombreMes = [
                'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
            ][index];

            if (index === 11) {
                // Diciembre: mostrar todos los decimales
                debug(`  ${nombreMes}: ${monto}`);
            } else {
                // Mostrar monto completo, sin formatear
                debug(`  ${nombreMes}: ${monto}`);
            }
            */
            /*
            partidosConRepr.forEach(partido => {
                const totalFinanciamiento = partido.C_fpaop;
                const overrideDiciembre = this.ajustesDiciembre['con-' + partido.id_calculo + '-' + partido.id_partido] ?? null;

                //const montosMensuales = this.distribuirConEditableDiciembre(totalFinanciamiento, overrideDiciembre, 'con-' + partido.id_calculo + '-' + partido.id_partido, partido);

                debug(`\n📌 Partido: ${partido.siglas}`);

                totalesMensuales.forEach((monto, index) => {
                    const nombreMes = [
                        'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
                    ][index];

                    if (index === 11) {
                        // Diciembre: mostrar todos los decimales
                        debug(`  ${nombreMes}: ${monto}`);
                    } else {
                        // Mostrar monto completo, sin formatear
                        debug(`  ${nombreMes}: ${monto}`);
                    }
                });
            });
            */
        },
        /**
         * Descarga el archivo Excel de la distribución
         * @param id_calculo // debe de existir un preguardado antes
         */
        descargarMinistraciones(id_calculo) {
            const loader = loading(this.$vs);
            loader.text = 'Generando archivo Excel...';
            const apiUrl = `/administracion/solicitud/exportarFinanciamientoMinistracionesExcel/${id_calculo}`;
            let downloadUrl = null;
            let link = null;

            if (this.id_calculo ? null : this.id_calculo === null || this.id_calculo === 0) {
                throw new Error('❌ No se encontro el ID de la ministración');
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
                const filename = `Anexo 3. Ministraciones.xlsx`;
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

        // #region FORMATEOS 🔧🛠

        // DEPRECATED
        // onDecimalInput(event, idCalculo, idPartido) {
        //     // const key = `con-${idCalculo}-${idPartido}`;
        //     let valor = event.target.value;

        //     valor = valor.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');

        //     this.$set(this.ajustesDiciembre, key, parseFloat(valor));
        // },

        /*
        * Formatea un valor numérico a moneda - Función local 💰
        * @param {Event} event - Evento del input
        * @param {object} partido - Partido político con el monto de diciembre
        * @param {string} prefix - Prefijo para la key {con | sin}
        */
        onInputMoneda(event, partido, prefix) {
            //Generamos la key con los datos del partido
            const key = prefix + '-' + partido.id_calculo + '-' + partido.id_partido;
            // Limpia el valor del input | quita los caracteres no numéricos
            const valorLimpio = parseFloat(limpiarNumeroInput(event.target.value));

            // Almacena el valor limpio en el objeto ajustesDiciembre
            //this.$set(this.ajustesDiciembre, key, valorLimpio); // DEPRECATED
            partido.mintr_diciembre = valorLimpio; // Almacena el valor limpio en el objeto partido

            // Formatear el valor limpio y mostrarlo en la caja de texto
            //event.target.value = formatoMonedaLocal(valorLimpio); // Por si se quiere formatear
            event.target.value = valorLimpio;
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

        // NO SE OCUPA - DEPRECATED
        /*
        getStepForMonto(monto) {
            if (!monto || isNaN(monto)) return '0.01';

            const parts = monto.toString().split('.');
            if (parts.length === 2) {
                const longitudDecimales = parts[1].length;
                return '0.' + '0'.repeat(Math.max(0, longitudDecimales - 1)) + '1';
            }
            return '1';
        },
        */

        // #endregion FORMATEOS 🛠

       // #region OPERACIONES DE LA VISTA 📊
       /**
         * Distribuye el monto total entre los 12 meses por partido de cada cálculo
         * Es una forma de obtener los montos distribuidos por un arreglo de partidos
         * @param {number} totalFinanciamientoPartido - TOTAL FINANCIAMIENTO A DISTRIBUIR por partido
         * @param {object} partido - Partido político con el monto de diciembre 
         * partido.mintr_diciembre -> para asegurarse de que se asigna la cantidad al partido
         * @param {string} key - Key para la distribución si es {con | sin} -- DEPRECATED
         * @returns {Array<number>} - Array con los montos distribuidos
         */
         distribuirConEditableDiciembre(totalFinanciamientoPartido, partido, key) {
            //const key = `${prefix}-${partido.id_calculo}-${partido.id_partido}`;
            const mensual = new Decimal(totalFinanciamientoPartido).dividedBy(12); // objeto Decimal

            // Validar y convertir el valor de diciembre
            const valorDiciembre = parseFloat(partido.mintr_diciembre);
            const esValido = !isNaN(valorDiciembre) && valorDiciembre !== 0;
            const montoDiciembre = esValido ? valorDiciembre : mensual.toNumber();
            
            // Actualizar estado del valor de diciembre temporal
            partido.mintr_diciembre = montoDiciembre;
            //debug('🐛 partido.mintr_diciembre: ', partido.mintr_diciembre, 'tipo: ', typeof partido.mintr_diciembre);
            //this.$set(this.ajustesDiciembre, key, montoDiciembre); -- DEPRECATED

            // Retornar array con 11 meses iguales + diciembre
            return [...Array(11).fill(mensual), montoDiciembre].map(v => v.toNumber ? v.toNumber() : v); // 123.456 Decimal->toNumber()
        },

       /* SOLO DE REFERENCIA - DEPRECATED
        * Ajustar decimal el monto de diciembre
        */
       ajustarDecimal(partido, operacion) {
            const ajusteUnitario = 0.01;

            // Asegurar que el campo ajuste exista y sea reactivo
            if (partido.ajuste === undefined) this.$set(partido, 'ajuste', 0);
            if (partido.restado === undefined) this.$set(partido, 'restado', false);
            if (partido.sumado === undefined) this.$set(partido, 'sumado', false);

            if (operacion === 'sumar') {
            if (this.totalAjusteDecimales < 0) {
                partido.ajuste += ajusteUnitario;
                partido.sumado = true;
            } else {
                this.$vs.notification({
                title: 'Aviso',
                text: 'Primero debes restar a otro partido antes de sumar.',
                color: 'danger'
                });
            }
            } else if (operacion === 'restar') {
            partido.ajuste -= ajusteUnitario;
            partido.restado = true;
            }
        },
        /*
        * Ajustar decimal manualmente -> diciembre
        * @param {string} operacion - Operación a realizar ('sumar' | 'restar')
        * @param {object} partido - Partido político con el monto de diciembre y el id_calculo id_partido
        * @param {string} prefix - Prefijo para la key {con | sin}
        */
        ajustarDecimalManual(operacion, partido, prefix) {
            const ajusteUnitario = 0.01;
            //const key = prefix + '-' + partido.id_calculo + '-' + partido.id_partido;
            //debug('🐛 partido.mintr_diciembre: ', partido.mintr_diciembre, 'tipo: ', typeof partido.mintr_diciembre);
            let actual = new Decimal(parseFloat(partido.mintr_diciembre));
            // Asegurar que el campo ajuste exista y sea reactivo
            //if (partido.ajusteDiciembre === undefined) this.$set(partido, 'ajusteDiciembre', 0.0);

            // Detectar número de decimales en el valor actual 
            // Toma la parte decimal (después del punto) y obtiene la longitud de los decimales
            //const decimales = partido.mintr_diciembre.toString().split('.')[1]?.length || 0;
            
            // Divide 1 entre 10 elevado al número de decimales detectados
            // Por ejemplo, si el valor actual tiene 2 decimales, el paso será 0.01
            // decimales = 2 → 10^2 = 100
            // Si el valor actual tiene 0 decimales, el paso será 0.001
            //const paso = new Decimal('1').dividedBy(new Decimal('10').pow(decimales || 3)); // default 0.001

            if (operacion === 'sumar') {
                // Si totalAjusteDecimalesCalculo es negativo se puede sumar a otro partido
                if (this.totalAjusteDecimalesCalculo(partido.id_calculo) < 0){
                    actual = actual.plus(ajusteUnitario);
                    partido.ajusteDiciembre += ajusteUnitario;
                    partido.mintr_diciembre = actual.toNumber(); // actualiza el valor del monto de diciembre
                }else{
                    this.$vs.notification({
                        title: 'Atención',
                        text: 'Primero debes restar a otro partido antes de sumar.',
                        color: 'warning'
                    });
                }
            } else if (operacion === 'restar') { //Permite restar siempre para tener que sumarle a otro partido
                actual = actual.minus(ajusteUnitario);
                partido.ajusteDiciembre -= ajusteUnitario;
                partido.mintr_diciembre = actual.toNumber(); // actualiza el valor del monto de diciembre
            }
        },
        /**
         * Obtiene el total de ajustes de decimales para un cálculo específico
         * @param {number} idCalculo - ID del cálculo
         * @returns {number} - Total de ajustes de decimales
         */
         totalAjusteDecimalesCalculo(idCalculo){
            let suma = 0;
            // Obtiene los partidos con representación y sin representación para el cálculo específico
            const partidos = [...this.Partidos_Con_Representacion, ...this.Partidos_Sin_Representacion].filter(
                p => p.id_calculo === idCalculo);
            // Obtiene el total de ajustes de decimales para el cálculo específico
            partidos.forEach(p => {
                suma += p.ajusteDiciembre;
            });
            return suma;
        },
        /**
         * ➕ Obtiene los totales mensuales para un cálculo específico
         * @param {number} idCalculo - ID del cálculo
         * @returns {Array<number>} - Array con los totales mensuales
         */
        obtenerTotalesMensuales(idCalculo) {
            try {
                const totales = Array(12).fill().map(() => new Decimal(0));

                // Se mezclan partidos con y sin representación, y se filtran por cálculo
                const partidos = [...this.Partidos_Con_Representacion, ...this.Partidos_Sin_Representacion].filter(p => p.id_calculo === idCalculo);

                partidos.forEach(partido => {
                    const hasFpaop = partido.C_fpaop !== undefined;
                    const key = `${hasFpaop ? 'con' : 'sin'}-${partido.id_calculo}-${partido.id_partido}`;
                    // Se tiene que diferenciar para mandar el financiamiento público de cada partido si es 'con' o 'sin'
                    const total = hasFpaop ? partido.C_fpaop : partido.monto_2_por_ciento;
                    //const total = partido.C_fpaop || partido.monto_2_por_ciento; // Otra forma

                    //const override = this.ajustesDiciembre[key]; // No se ocupa

                    const montos = this.distribuirConEditableDiciembre(total, partido, key);
                    montos.forEach((monto, i) => {
                        // Precisión total
                        totales[i] = totales[i].plus(new Decimal(monto));
                    });
                });

                // Convertir a números del objeto Decimal para mostrar
                return totales.map(t => t.toNumber());
            } catch (error) {
                debug('🐛 ❌ Error al obtener totales mensuales:', error);
                return [];
            }
        },
        /**
         * ➕ Obtiene el total general para un cálculo específico
         * @param {number} id_calculo - ID del cálculo
         * @returns {number} - Total general
         */
        obtenerTotalGeneral(id_calculo) {
            const totales = this.obtenerTotalesMensuales(id_calculo);
            return totales.reduce((sum, val) => new Decimal(sum).plus(new Decimal(val)), new Decimal(0)).toNumber();
        },
        // #endregion OPERACIONES DE LA VISTA 📊

        /**
         * ✔ Validar campos
         * @returns {boolean}
         */
        /*
        validarCampos() {
            this.limpiarErrores();
            if (this.anio === '') {
                this.errorAnio = 'El campo año es obligatorio';
                this.error = true;
            }
            if (this.monto30Input === '') {
                this.errorMonto30 = 'Ingrese un monto 30% válido';
                this.error = true;
            }

            if (this.monto70Input === '') {
                this.errorMonto70 = 'Ingrese un monto 70% válido';
                this.error = true;
            }
            if (this.distribucion === '') {
                this.errorDistribucion = 'El campo distribución es obligatorio';
                this.error = true;
            }
            // Validar que llenen todos los campos
            this.Partidos_Con_Representacion.forEach(partido => {

                if (partido.inputPorcentaje === '') {
                    partido.errorPorcentajeVotacion = 'Ingrese un porcentaje válido';
                    this.error = true;
                }
            });
            return this.error;
        },
        */
       
        /**
         * 🧹 Limpia todos los campos del formulario
         * @returns {void}
         */
        limpiarCampos() {
            this.anio = '',
            this.limpiarErrores();
        },
        /**
         * Limpia todos los mensajes de error
         * @returns {void}
         */
        limpiarErrores() {
            this.error = false;
            this.errorAnio = '';
        },
    },
    computed: {
        // Solo referencia - DEPRECATED
        totalAjusteDecimales() {
            return this.Partidos_Con_Representacion.reduce((sum, p) => sum + (p.ajuste || 0), 0);
        }
    }
}
</script>

<style>
.tabla-ajustada {
    width: 100% !important;
    margin-left: 0 !important;
    padding-left: 0 !important;
    table-layout: fixed !important;
    border-collapse: collapse;
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
    width: 90vw;
    /* o un valor fijo como 800px */
    max-width: 1000px;
    padding: 20px;
}

/* Seleccion de filas Ajuste de decimales*/
.vs-table--tbody-table tr.vs-table--tr-selected {
    background-color: rgba(var(--vs-primary), 0.1);
}


/* Estilo para el borde del checkbox cuando NO está marcado */
.vs-checkbox .vs-checkbox__check {
    border: 2px solid #000 !important;
    background: transparent !important;
}

/* Estilo para el checkbox cuando ESTÁ marcado */
.vs-checkbox--checked .vs-checkbox__check {
    background-color: #1E90FF !important;
    border-color: #1E90FF !important;
}

/* Asegurar que el borde sea visible en el hover */
.vs-checkbox:hover .vs-checkbox__check {
    border-color: #1E90FF !important;
}
</style>