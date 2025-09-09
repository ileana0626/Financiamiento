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
                <div >
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
                            <vs-tr
                            v-for="(calculo, i) in CalculosPorAnio"
                            :key="`calculo-resumen-${i}`"
                            >
                            <vs-td>{{ calculo.id_calculo }}</vs-td>
                            <vs-td>{{ calculo.anio_ejercicio }}</vs-td>
                            <vs-td>{{ formatoFecha(calculo.fecha_publicacion) }}</vs-td>
                            <vs-td class="acciones-cell">
                            <vs-button
                                icon
                                color="danger"
                                size="small"
                                @click="abrirDialog(calculo)"
                            >
                                <i class="fas fa-pencil-alt"></i>
                            </vs-button>
                            </vs-td>
                            </vs-tr>
                        </template>

                        <!-- Estado vacío -->
                        <template #notFound>
                            <div class="noDataContainer">
                            <img
                                src="../modulos/ver/images/no_data.webp"
                                class="imgNoData"
                                alt="Sin resultados"
                            />
                            <span class="noDataTitle">¡Sin Datos!</span>
                            </div>
                        </template>
                        </vs-table>

                          <!-- formularios -->
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

                                        <!-- Partidos con representación -->
                                        <vs-th v-for="(partido, i) in Partidos_Con_Representacion"
                                                :key="'head-' + i"
                                                class="col-partido">
                                            <div class="partido-header">
                                            <img :src="'/img/logos/' + partido.logo"
                                                :alt="partido.siglas"
                                                class="logo-partido"
                                                onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'"/>
                                            <span class="siglas">{{ partido.siglas }}</span>
                                            </div>
                                        </vs-th>

                                        <!-- Partidos sin representación -->
                                        <vs-th v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                                :key="'headS-' + i"
                                                class="col-partido">
                                            <div class="partido-header">
                                            <img :src="'/img/logos/' + partidoS.logo"
                                                :alt="partidoS.siglas"
                                                class="logo-partido"
                                                onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'"/>
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
                                            :key="'row1-' + i"
                                            class="col-partido monto">
                                        {{ formatCurrency(partido.C_fpaop) }}
                                    </vs-td>
                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                            :key="'row1s-' + i"
                                            class="col-partido monto">
                                        {{ formatCurrency(partidoS.monto_2_por_ciento) }}
                                    </vs-td>
                                    </vs-tr>

                                    <!-- limite de financiamiento privado-->
                                     <vs-tr class="fila-flex">
                                    <vs-td class="col-desc">
                                        Límite de financiamiento privado
                                    </vs-td>
                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                            :key="'row1-' + i"
                                            class="col-partido monto">
                                        {{ limite(partido.C_fpaop) }}
                                    </vs-td>
                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                            :key="'row1s-' + i"
                                            class="col-partido monto">
                                        {{ limite(partidoS.monto_2_por_ciento) }}
                                    </vs-td>
                                    </vs-tr>

                                     <!-- Aportaciones en dinero y/o en especie de personas militantes-->
                                     <vs-tr class="fila-flex">
                                    <vs-td class="col-desc">
                                        Aportaciones en dinero y/o en especie de personas militantes
                                    </vs-td>
                                    <vs-td v-for="(partido, i) in Partidos_Con_Representacion"
                                            :key="'row1-' + i"
                                            class="col-partido monto">
                                        {{ aportaciones(partido.C_fpaop) }}
                                    </vs-td>
                                    <vs-td v-for="(partidoS, i) in Partidos_Sin_Representacion"
                                            :key="'row1s-' + i"
                                            class="col-partido monto">
                                        {{ aportaciones(partidoS.monto_2_por_ciento) }}
                                    </vs-td>
                                    </vs-tr>
                                </template>
                            </vs-table>
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row mt-4">
                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'limpiar'+darkMode" 
                                    @click.stop="limpiarCampos"
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                        </div>
                                    </vs-button>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#1a2e35'" :key="'guardar'+darkMode" 
                                    @click.stop="guardarDistribucion" 
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-save pr-2" style="font-size: 0.8125rem !important;"></i>
                                            Guardar
                                        </div>
                                    </vs-button>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <vs-tooltip>
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'descargar'+darkMode" 
                                    @click.stop="descargarDistribucion(distribucionId)" hover="true"
                                    style="padding: 0.20rem; font-size: 1rem;" :disabled="descargar_disabled">
                                        <div style="color: var(--btn-txt-color); font-weight: 700; display: flex; align-items: center;">
                                            <i class="fas fa-file-download pr-2" style="font-size: 0.8125rem !important;"></i>
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
import methods from '../../methods';
import { loading } from '../../methods';
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
            id: null,
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
            calculo: {},
            montosFijos: {},
            ajustesDiciembre: {},
            cat_tipo_distribucion: [],
            distribucion: [],
            distribuciones: [],
            CalculosPorAnio: [],
            // Validaciones
            error: false,
            errorAnio: '',
            errorDistribucion: '',
            errorMonto30: '',
            errorMonto70: '',
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
        await this.obtenerDatos(11);

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
        truncateTo2Decimals(value) {
            if (!value) return '0.00';
            const num = parseFloat(value);
            return (Math.floor(num * 100) / 100).toFixed(2);
        },
        onDecimalInput(event, idCalculo, idPartido) {
            const key = `con-${idCalculo}-${idPartido}`;
            let valor = event.target.value;

            valor = valor.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');

            this.$set(this.ajustesDiciembre, key, parseFloat(valor));
        },
        formatCurrency(value) {
            return '$' + parseFloat(value).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
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
        ajustarDecimalManual(operacion, idCalculo, idPartido, valorActual) {
            const key = `con-${idCalculo}-${idPartido}`;
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
         * Obtiene los calculos de financiamiento para listar
         */
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
        /**
         * Abre el dialogo para editar la distribución
         * @param {Object} calculo_tr - El calculo seleccionado
         */
        abrirDialog(calculo_tr) {
            const loader = loading(this.$vs);
            let url = '/administracion/solicitud/get_Partidos_Calculo_porId';
            this.selectedCalculo = calculo_tr; // Se trae el calculo seleccionado para usar los datos después
            this.datosCalculoSeleccionado = {};
            this.Partidos_Sin_Representacion = [];
            this.Partidos_Con_Representacion = [];
            this.distribucionId = null; // resetea cada que se abra el Dialog
            this.limpiarCampos(); // 🧹
            this.active = true; // activa el modal
            loader.text = 'Cargando datos...';
            //Obtener los datos principales del Cálculo Financiero
            axios.get(url, {
                params: {
                    'id': calculo_tr.id_calculo
                }
            }).then(response => {
                debug('🐛 Datos recibidos:', response.data);
                if (response.status === 200 && response.data?.success) {
                    //Obtenemos los datos de los partidos politicos
                    this.Partidos_Sin_Representacion = response.data.partidosSinRep;
                    console.log(this.Partidos_Con_Representacion);
                    this.Partidos_Con_Representacion = response.data.partidosConRep.map(p => ({
                        ...p,
                        ajuste: 0,
                        sumado: false,
                        restado: false,
                        // valor temporal para el input
                        inputPorcentaje: p.porcentaje_votacion != null ? parseFloat(p.porcentaje_votacion).toFixed(2) + ' %' : '',

                        // Variable temporarl en el Front
                        errorPorcentajeVotacion: '' // Variable temporarl en el Front
                    }));
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
        onChangeDistribucion(value) {
            this.distribucion = value;
            setTimeout(() => {
                document.activeElement.blur();
            }, 100);
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
        async getDistribucionesPorAnio(anio) {
            if (!anio) return;
            try {
                const { data } = await axios.get('/administracion/solicitud/getDistribucionesPorAnio', { params: { anio } });
                if (data.success) {
                    this.CalculosPorAnio = data.calculos;
                    this.distribuciones = data.distribuciones;
                    this.Partidos_Con_Representacion = data.partidos_con_repr;
                    this.Partidos_Sin_Representacion = data.partidos_sin_repr;
                }
            } catch (error) {
                console.error("Error al obtener distribuciones:", error);
            }
        },
        async guardarCambios(calculo) {

            //id del calculo seleccionado 
            const idCalculo = calculo.id_calculo;
            console.log('Id del calculo: ' + idCalculo);
            const partidos = this.Partidos_Con_Representacion.filter(p => p.id_calculo === idCalculo);

            partidos.forEach(partido => {
                const totalFinanciamiento = partido.C_fpaop;
                const overrideDiciembre = this.ajustesDiciembre['con-' + partido.id_calculo + '-' + partido.id_partido] ?? null;

                const montosMensuales = this.distribuirConEditableDiciembre(totalFinanciamiento, overrideDiciembre);

                console.log(`\n📌 Partido: ${partido.siglas}`);

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
        },
        limite (valor) {
            const resultado = valor * 0.50;
            const resultadoConvertido = this.formatCurrency(resultado);
            return resultadoConvertido;
        },
        aportaciones (valor) {
            const resultado = valor * 0.20;
            const resultadoConvertido = this.formatCurrency(resultado);
            return resultadoConvertido;
        },


        /* const loader = loading(this.$vs);
        loader.text = 'Guardando datos...';
        let url = '/administracion/solicitud/Distr_Get_Insert_Update_distribucion_dppp';

        let datos = {
            p_comando: "INSERT", // INSERT, UPDATE
            p_id_calculo: this.selectedCalculo.id,
            p_anio_ejercicio: this.anio, //valor manual
            p_tipo_distribucion: this.distribucion.join(','), // "1,2,3" - valor manual
            p_monto_30_por_ciento: this.monto30, //valor manual
            p_monto_70_por_ciento: this.monto70, //valor manual
            p_tipoPorcentaje: this.opcionSelecionadaPorcentaje, //valor manual
            p_subtotal_A_30_por_ciento: 0,
            p_subtotal_B_70_por_ciento: 0,
            p_subtotal_B_Ajuste_70_por_ciento: 0,
            p_subtotal_C_fpaop: this.subtotalC_ConRepresentacion,
            p_subtotal_D_fpatov: this.subtotalD_ConRepresentacion,
            p_subtotal_2_por_ciento_fpaop_ppsr: this.subtotalMonto2PorCiento,
            p_subtotal_D_2_por_ciento_ppsr: this.subtotalMonto2PorCientoD,
            p_subtotal_D_candidatura: this.candidatura,
        };
        this.AlmacenarCalculos_Partidos(); // Actualizamos los calculos de los partidos mostrados en la tabla
        console.log('Datos a guardar: ', datos, this.Partidos_Con_Representacion, this.Partidos_Sin_Representacion);
        try {
            // Actualizar distribución
            if (this.distribucionId) {
                const response = await axios.post(url, datos); // ⇋ UPDATE
                
                if (response.data && response.data.success) {
                    this.distribucionId = response.data.id; // || this.distribucionId;
                    debug('🐛 Update response.data.id:', response.data.id);
                } else {
                    const errorMsg = response.data?.message || 'Error al actualizar la distribución';
                    throw new Error(errorMsg);
                }
            } else { // Guardar distribución
                const response = await axios.post(url, datos); // ⇋ INSERT
                
                if (response.data && response.data.success) {
                    this.distribucionId = response.data.id;
                    debug('🐛 Insert response.data.id:', response.data.id);
                    
                } else {
                    const errorMsg = response.data?.message || 'Error al guardar la distribución';
                    throw new Error(errorMsg);
                }
            }
            url = '/administracion/solicitud/Update_Partidos_Con_Representacion';
            // Actualizamos la tabla de partidos políticos con representación
            // Crear un array de promesas
            //const promesas = this.Partidos_Con_Representacion.map(async partido => {
            for (const partido of this.Partidos_Con_Representacion) {
                try {
                const response = await axios.post(url, partido); // ⇋
                if (response.data && response.data.ids) {
                    //debug('🐛 response.data.ids:', response.data.ids);
                }
                } catch (error) {
                    this.$vs.notification({ 
                        color: 'danger', 
                        text: `Error al actualizar ${partido.siglas}` 
                    });
                    throw error;
                }
            }
            url = '/administracion/solicitud/Update_Partidos_Sin_Representacion';
            for (const partido of this.Partidos_Sin_Representacion) {
                try {
                const response = await axios.post(url, partido); // ⇋
                if (response.data && response.data.ids) {
                    //debug('🐛 response.data.ids:', response.data.ids);
                }
                } catch (error) {
                    this.$vs.notification({ 
                        color: 'danger', 
                        text: `Error al actualizar ${partido.siglas}` 
                    });
                    throw error;
                }
            }

            // Notificación de éxito
            Swal.fire({
            icon: 'success',
            title: '¡Éxito!',
            text: 'Datos guardados correctamente',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Aceptar'
            })
            // Habilita descargar archivo
            //this.distribucionId = this.selectedCalculo.id_calculo; // Parche para que funcione el descargar
            debug('🐛 this.distribucionId: ', this.distribucionId);
            this.descargar_disabled = false;
        } catch (error) {
            console.error('Error al guardar:', error);
            this.$vs.notification({title: 'Error', color: 'danger', text: 'Error al guardar' });

            let nombreMetodo = url.split('/');
            methods.catchHandler(error, nombreMetodo[3], this.$router);
        } finally {
            loader.close();
        } */
        /**
         * Descarga el archivo Excel de la distribución
         * @param DistribucionId // debe de existir un preguardado antes
         */
        
        ajustarDecimal(partido, operacion) {
            const ajusteUnitario = 0.01;

            // Asegurar que el campo ajuste exista y sea reactivo
            if (partido.ajuste === undefined) this.$set(partido, 'ajuste', 0);

            if (operacion === 'sumar') {
                if (this.totalAjusteDecimales < 0) {
                    partido.ajuste += ajusteUnitario;
                } else {
                    this.$vs.notification({
                        title: 'Aviso',
                        text: 'Primero debes restar a otro partido antes de sumar.',
                        color: 'warning'
                    });
                }
            } else if (operacion === 'restar') {
                partido.ajuste -= ajusteUnitario;
            }
        },
        /*
        * Formatea a moneda
        * @param {number} valor - El valor a formatear
        * @returns {string} - El valor formateado
        */
        formatoMoneda(valor) {
            return new Intl.NumberFormat('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2
            }).format(valor);
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
        /*
        * Formatea el porcentaje del partido
        * @param {Object} partido - El objeto del partido político
        * @returns {void}
        */
        onBlurPorcentaje(partido) {
            const valorCrudo = partido.inputPorcentaje;

            if (!valorCrudo) {
                partido.inputPorcentaje = ''; // input vacío, no mostrar nada
                partido.porcentaje_votacion = 0;
                return;
            }

            // Obtener número completo del input
            const valorNumerico = parseFloat(valorCrudo.toString().replace(/[^0-9.]/g, ''));

            // Guardar valor completo para los cálculos
            partido.porcentaje_votacion = isNaN(valorNumerico) ? 0 : valorNumerico;

            // Mostrar solo dos decimales en el input, pero sin perder precisión interna
            partido.inputPorcentaje = isNaN(valorNumerico) ? '' : valorNumerico.toFixed(2) + ' %';
        },
        /**
         * ✔ Validar campos
         * @returns {boolean}
         */
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
                this.distribucion = [];
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
        }
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
  width: 80px !important;   /* ID más compacto */
}

.tabla-ajustada ::v-deep(.vs-table__th:last-child),
.tabla-ajustada ::v-deep(.vs-table__td:last-child) {
  width: 120px !important;  /* Acciones un poco más fijas */
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
  line-height: 0 !important; /* evita espacio extra vertical */
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
  flex: 0 0 320px !important;   /* ajusta 320px al gusto */
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
.partido-header { display:flex; flex-direction:column; align-items:center; }
.logo-partido   { width:60px; height:60px; object-fit:contain; margin-bottom:5px; }
.monto          { text-align:right; padding-right:8px; } /* o center si prefieres */
.fila-header    { background:#f4f6f8; border-radius:12px; }

</style>