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
                                        partido.C_fpaop,
                                        // ajustesDiciembre['con-' + partido.id_calculo + '-' + partido.id_partido],
                                        //'con-' + partido.id_calculo + '-' + partido.id_partido,
                                         partido)"
                                        :key="'mes-' + partido.id_calculo + '-' + partido.id_partido + '-' + mesIndex" style="text-align: left;">
                                        <!-- Solo diciembre (índice 11) es editable -->
                                        <template v-if="mesIndex === 11">
                                            <div class="d-flex align-items-center">
                                                <input type="text" :value="partido.mintr_diciembre" class="form-control" 
                                                    :key="'txbD_Con-' + partido.id_calculo + '-' + partido.id_partido"
                                                    style="width: 100%;"
                                                    @input="onDecimalInput($event, partido.id_calculo, partido.id_partido)" />
                                                <div class="d-flex flex-column ms-1">
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('sumar', partido.id_calculo, partido.id_partido, monto)">▲</button>
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('restar', partido.id_calculo, partido.id_partido, monto)">▼</button>
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
                                        partidoS.monto_2_por_ciento,
                                        // ajustesDiciembre['sin-' + partido.id_calculo + '-' + partido.id_partido],
                                        //'sin-' + partidoS.id_calculo + '-' + partidoS.id_partido,
                                        partidoS)"
                                        :key="'mes-sin-' + partidoS.id_calculo + '-' + partidoS.id_partido + '-' + mesIndex"
                                        style="text-align: left;">
                                        <!-- Solo diciembre (índice 11) es editable -->
                                        <template v-if="mesIndex === 11">
                                            <div class="d-flex align-items-center">
                                                <input type="text" :value="partidoS.mintr_diciembre" class="form-control" 
                                                    :key="'txbD_Sin-' + partidoS.id_calculo + '-' + partidoS.id_partido"
                                                    style="width: 100%;"
                                                    @input="onDecimalInput($event, partidoS.id_calculo, partidoS.id_partido)" />
                                                <div class="d-flex flex-column ms-1">
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('sumar', partidoS.id_calculo, partidoS.id_partido, monto)">▲</button>
                                                    <button type="button" class="btn btn-sm p-0"
                                                        @click="ajustarDecimalManual('restar', partidoS.id_calculo, partidoS.id_partido, monto)">▼</button>
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
                                        @click.stop="descargar(distribucionId)" hover="true"
                                        style="padding: 0.20rem; font-size: 1rem;" :disabled="descargar_disabled">
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
            distribucionId: null, // Para saber si ya se ha guardado un registro
            cb_ppSeleccionados: [],
            opcionSelecionadaPorcentaje: '1', //  Valor por defecto Gubernatura
            search: '',
            page: 1,
            max: 10,
            // Dialog
            active: false,
            anio: '',
            monto30Input: '',
            monto30: '',
            monto70: '',
            monto70Input: '',
            colors: [
                {
                    color: 'warn'
                }
            ],

            catAnio: [],
            //calculo: {}, // Se usa para cargar el cálculo seleccionado
            //montosFijos: {},
            ajustesDiciembre: {}, // como un objeto para almacenar pares clave-valor
            //cat_tipo_distribucion: [],
            //distribucion: [],
            distribuciones: [],
            CalculosPorAnio: [], // Se usan para listar los calculos por año
            // Validaciones
            error: false,
            errorAnio: '',
            errorDistribucion: '',
            errorMonto30: '',
            errorMonto70: '',
            descargar_disabled: true, // true: disabled | false: enabled
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

        this.opcionSelecionadaPorcentaje = '1'; // '1': gubernatura | '2': intermedia
        //this.getCalculos();
        await this.getAnio();
        await this.obtenerDatos(11);

    },
    methods: {


        // DEPRECATED
        /*        truncateTo2Decimals(value) {
            if (!value) return '0.00';
            const num = parseFloat(value);
            // usa Math.floor para truncar y luego toFixed(2), es redundante
            return (Math.floor(num * 100) / 100).toFixed(2);
        },
        */

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

        // #region CONSULTAS A LA BASE DE DATOS 📚
        /** 
         * Obtiene las distribuciones por año
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
                    debug('🐛 📝 Distribuciones cargadas.', JSON.stringify(data));
                    this.CalculosPorAnio = data.calculos;
                    this.distribuciones = data.distribuciones;
                    this.Partidos_Con_Representacion = data.partidos_con_repr;
                    this.Partidos_Sin_Representacion = data.partidos_sin_repr;
                    debug('🐛 ✅ Datos cargados.');
                }
                else {
                    debug('🐛 ❌ Error al obtener datos.');
                }
            } catch (error) {
                debug("🐛 ❌ Error al obtener distribuciones:", error);
                
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            }
            finally {
                loader.close();
            }
        },

        // DEPRECATED
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
         * Guarda la edición del cálculo de Ministraciones
         */
        async guardarEdicion() {
            const loader = loading(this.$vs);
            loader.text = 'Guardando edición...';
            // Lógica para guardar edición (llamada axios)
            let url = '/administracion/solicitud/Distr_Get_Insert_Update_distribucion_dppp';
            let datos = {
                p_comando: 'UPDATE',
                p_id_calculo: this.selectedCalculo.id,
            }
            try {
                const response = await axios.post(url, datos); // ⇋ Se manda post aunque sea GET por el controlador
                debug('🐛 response.data:', response.data);
                this.$vs.notification({ color: 'success', text: 'Ministración actualizada' });
                //this.getCalculos(); // refrescar lista
            } catch (error) {
                debug("🐛 ❌ Error al guardar edición:", error);
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            }
            finally {
                loader.close();
            }
        },
        async guardarCambios(calculo) {

            //id del calculo seleccionado 
            const idCalculo = calculo.id_calculo;
            debug(' 🐛 Id del calculo: ' + idCalculo);
            const partidos = this.Partidos_Con_Representacion.filter(p => p.id_calculo === idCalculo);

            partidos.forEach(partido => {
                const totalFinanciamiento = partido.C_fpaop;
                const overrideDiciembre = this.ajustesDiciembre['con-' + partido.id_calculo + '-' + partido.id_partido] ?? null;

                //const montosMensuales = this.distribuirConEditableDiciembre(totalFinanciamiento, overrideDiciembre, 'con-' + partido.id_calculo + '-' + partido.id_partido, partido);

                debug(`\n📌 Partido: ${partido.siglas}`);

                montosMensuales.forEach((monto, index) => {
                    const nombreMes = [
                        'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
                    ][index];

                    if (index === 11) {
                        // Diciembre: mostrar todos los decimales
                        console.log(`  ${nombreMes}: ${monto}`);
                    } else {
                        // Mostrar monto completo, sin formatear
                        console.log(`  ${nombreMes}: ${monto}`);
                    }
                });
            });
            this.descargar_disabled = false; // Habilita descargar archivo
        },
        /**
         * Descarga el archivo Excel de la distribución
         * @param DistribucionId // debe de existir un preguardado antes
         */
        descargarMinistraciones(id) {
            const loader = loading(this.$vs);
            loader.text = 'Generando archivo Excel...';
            const apiUrl = `/administracion/solicitud/exportarFinanciamientoMinistracionesExcel/${id}`;
            let downloadUrl = null;
            let link = null;

            if (this.distribucionId ? null : this.distribucionId === null || this.distribucionId === 0) {
                throw new Error('❌ No se encontro el ID de la distribución');
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
                    debug('🐛 Error al descargar Excel:', error);

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

        // #region FORMATEOS 🛠
        onDecimalInput(event, idCalculo, idPartido) {
            // const key = `con-${idCalculo}-${idPartido}`;
            let valor = event.target.value;

            valor = valor.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');

            this.$set(this.ajustesDiciembre, key, parseFloat(valor));
        },
        onInputMoneda(event, partido, prefix) {
            const key = prefix + partido.id_calculo + '-' + partido.id_partido;
            const valorLimpio = limpiarNumeroInput(event.target.value);

            // Almacenar el valor limpio en el objeto ajustesDiciembre
            this.$set(this.ajustesDiciembre, key, parseFloat(valorLimpio));
            // Formatear el valor limpio a la caja de texto
            event.target.value = formatoMonedaLocal(valorLimpio);
        },
        /*
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
        getStepForMonto(monto) {
            if (!monto || isNaN(monto)) return '0.01';

            const parts = monto.toString().split('.');
            if (parts.length === 2) {
                const longitudDecimales = parts[1].length;
                return '0.' + '0'.repeat(Math.max(0, longitudDecimales - 1)) + '1';
            }
            return '1';
        },
        // #endregion FORMATEOS 🛠

        /*
        calcularMontoIgualitario30() {
            const monto = parseFloat(this.monto30); // parcea  el valor del input a decimal
            const totalPartidos = this.selectedCalculo.num_pp_con_repr || this.Partidos_Con_Representacion.length;
            return isNaN(monto) || totalPartidos === 0 ? 0 : monto / totalPartidos;
        },
        */
        /*
        * Formatea a moneda
        * @param {number} valor - El valor a formatear
        * @returns {string} - El valor formateado
        */
       /* DEPRECATED
        formatoMoneda(valor) {
            return new Intl.NumberFormat('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2
            }).format(valor);
        },
        */
        /*
        * Formatea a decimal
        * @param {number} valor - El valor a formatear
        * @returns {string} - El valor formateado
        */
       /* DEPRECATED
        formatearDecimal(valor) {
            if (!valor) return '0.00';
            const numero = parseFloat(valor.toString().replace(/[^0-9.]/g, ''));
            return isNaN(numero) ? '0.00' : numero.toFixed(2);
        },
        */

       // #region OPERACIONES DE LA VISTA 📊
       /**
         * Distribuye el monto total entre los 12 meses por partido de cada cálculo
         * Es una forma de obtener los montos distribuidos por un arreglo de partidos
         * @param {number} totalFinanciamientoPartido - TOTAL FINANCIAMIENTO A DISTRIBUIR por partido
         * @param {object} partido - Partido político con el monto de diciembre 
         * partido.mintr_diciembre -> para asegurarse de que se asigna la cantidad al partido
         * @returns {Array<number>} - Array con los montos distribuidos
         */
         distribuirConEditableDiciembre(totalFinanciamientoPartido, partido) {
            const montos = [];
            // Convertir a Decimal para mayor precisión
            const override = partido.mintr_diciembre !== undefined ? new Decimal(partido.mintr_diciembre) : null;

            // Usa dividedBy() en lugar del operador / para evitar problemas de precisión
            const mensual = new Decimal(totalFinanciamientoPartido).dividedBy(12);
            // Se agrega el valor mensual de forma individual a los 11 meses
            montos.push(...Array(11).fill(mensual));
            // Si no tiene nada partido.mintr_diciembre, distribuir igualmente entre los 12 meses
            if (!override || override.isNaN() || override === null || override.toNumber() === 0) {
                // Se agregan los 12 meses
                partido.mintr_diciembre = mensual.toNumber();
                montos.push(partido.mintr_diciembre);
                //debug('🐛 key: ', key, 'override: ', partido.mintr_diciembre, 'override tipo: ', typeof partido.mintr_diciembre);
            } else { // Si hay mintr_diciembre, se agrega el monto como viene en la base
                montos.push(partido.mintr_diciembre);
            }
            return montos; // 123.456 (tipo number)
        },
       /*
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
        */
        ajustarDecimalManual(operacion, idCalculo, idPartido, valorActual) {
            const key = `con-${idCalculo}-${idPartido}`; // MODIFICAR LA KEY 😵
            let actual = new Decimal(valorActual || 0);

            // Detectar número de decimales en el valor actual
            const decimales = valorActual.toString().split('.')[1]?.length || 0;
            const paso = new Decimal('1').dividedBy(new Decimal('10').pow(decimales || 3)); // default 0.001

            if (operacion === 'sumar') {
                actual = actual.plus(paso);
            } else {
                actual = actual.minus(paso);
                if (actual.isNegative()) actual = new Decimal(0); // sigue evitando negativos
            }

            this.$set(this.ajustesDiciembre, key, actual.toNumber());

            if (actual.greaterThan(total)) {
                this.$vs.notification({
                    title: 'Atención',
                    text: 'El monto de diciembre supera el total asignado al partido.',
                    color: 'warning'
                });
            }
        },
        obtenerTotalesMensuales(idCalculo) {
            try {
                const totales = Array(12).fill().map(() => new Decimal(0));

                const partidos = [...this.Partidos_Con_Representacion, ...this.Partidos_Sin_Representacion].filter(p => p.id_calculo === idCalculo);

                partidos.forEach(partido => {
                    const total = partido.C_fpaop || partido.monto_2_por_ciento;
                    const key = `con-${partido.id_calculo}-${partido.id_partido}`;
                    const override = this.ajustesDiciembre[key];

                    //const montos = this.distribuirConEditableDiciembre(total, override, key, partido);
                    montos.forEach((monto, i) => {
                        // Precisión total
                        totales[i] = totales[i].plus(new Decimal(monto));
                    });
                });

                // Convertir a números nativos para mostrar
                return totales.map(t => t.toNumber());
            } catch (error) {
                debug('🐛 Error al obtener totales mensuales:', error);
                return [];
            }
        },
        obtenerTotalGeneral(id_calculo) {
            const totales = this.obtenerTotalesMensuales(id_calculo);
            return totales.reduce((sum, val) => new Decimal(sum).plus(new Decimal(val)), new Decimal(0)).toNumber();
        }
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
            this.monto30 = '',
            this.monto30Input = '',
            this.monto70 = '',
            this.monto70Input = '',
            //this.distribucion = [];
            this.opcionSelecionadaPorcentaje = '1'; //  Valor por defecto factorCalculo()
            this.descargar_disabled = true; // Deshabilita el botón de descargar

            // Reiniciar valores de partidos a 0.0 si existen
            if (this.Partidos_Con_Representacion) {
                this.Partidos_Con_Representacion = this.Partidos_Con_Representacion.map(partido => ({
                    ...partido,
                    porcentaje_votacion: 0.00,
                    inputPorcentaje: '',
                    errorPorcentajeVotacion: '',
                    ajuste: 0.00,
                }));
            } else {
                this.Partidos_Con_Representacion = [];
            }
            if (this.Partidos_Sin_Representacion) {
                this.Partidos_Sin_Representacion = this.Partidos_Sin_Representacion.map(partido => ({
                    ...partido,
                    D_monto_2_por_ciento: 0.00,
                }));
            } else {
                this.Partidos_Sin_Representacion = [];
            }
            this.limpiarErrores();
        },
        /**
         * Limpia todos los mensajes de error
         * @returns {void}
         */
        limpiarErrores() {
            this.error = false;
            this.errorAnio = '';
            this.errorMonto30 = '',
                this.errorMonto70 = '',
                this.errorDistribucion = '';
            this.Partidos_Con_Representacion.forEach(partido => {
                partido.errorPorcentajeVotacion = '';
            });
        },
    },
    computed: {
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