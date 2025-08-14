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
                        <h4 class="not-margin">Distribución del cálculo</h4>
                    </template>

                    <div class="px-4">
                        <!-- Año fiscal -->
                        <label class="col-form-label">Selecciona un año fiscal:</label>
                        <vs-select v-model="anio" placeholder="Seleccione una opción" v-if="catAnio.length > 0"
                                filter :color="colors[0].color" autocomplete="off">
                        <template #message-danger v-if="errorAnio.length > 0">{{ errorAnio }}</template>
                        <vs-option v-for="(item, index) in catAnio" :key="index" :label="item.anio" :value="item.anio">
                            {{ item.anio }}
                        </vs-option>
                        </vs-select>

                        <!-- Tipo de distribución -->
                        <label class="col-form-label mt-4">Tipo de distribución de Financiamiento:</label>
                        <vs-select
                            multiple
                            filter
                            :placeholder="(distribucion.length > 0) ? '' : 'Seleccione una o más opciones'"
                            v-model="distribucion"
                            v-if="cat_tipo_distribucion.length > 0"
                            :color="colors[0].color"
                            @change="onChangeDistribucion"
                            @click.native.stop
                            >
                            <template #message-danger v-if="errorDistribucion.length > 0">
                                {{ errorDistribucion }}
                            </template>

                            <vs-option
                                v-for="(item, index) in cat_tipo_distribucion"
                                :key="index"
                                :label="item.nombre"
                                :value="item.id_tipo"
                                @click.native.stop
                            >
                                {{ item.nombre }}
                            </vs-option>
                            </vs-select>

                        <!-- Formulario principal -->
                        <div v-if="distribucion.includes(1) || distribucion.includes(2)">
                            <div class="row mt-4">
                                <div class="col-12">
                                    <h5>Financiamiento público para actividades ordinarias permanentes</h5>
                                </div>
                                <!-- Montos globales -->
                                <div class="col-md-6">
                                    <label>Monto Total Efectivo (30%)</label>
                                    <vs-input v-model="monto30" type="text" placeholder="0.00" step="0.01" />
                                </div>
                                <div class="col-md-6">
                                    <label>Monto Total Efectivo (70%)</label>
                                    <vs-input v-model="monto70" type="text" placeholder="0.00" step="0.01" />
                                </div>
                            </div>
                            <div class="row mt-4">
                                 <!-- Tipo de operación para: Financiamiento público para actividades tendientes a la obtención del voto -->
                                 <div v-if="distribucion.includes(2)" class="col-md-6">
                                    <label class="col-form-label">Seleccione el tipo de operación:</label>
                                    <vs-select v-model="opcionSelecionadaPorcentaje" placeholder="Seleccione una opción"
                                        class="mb-4" style="max-width: 300px;">
                                        <vs-option value="1" label="A. 50% Gubernatura">A. 50% Gubernatura</vs-option>
                                        <vs-option value="2" label="B. 30% Intermedia">B. 30% Intermedia</vs-option>
                                    </vs-select>
                                </div>
                            </div>
                            <!-- Tabla de distribución -->
                            <vs-table class="tabla-ajustada mt-4">
                                <template #thead>
                                    <vs-tr>
                                        <vs-th :colspan="1">Siglas</vs-th>
                                        <vs-th :colspan="1">Emblema</vs-th>
                                        <vs-th :colspan="1">% de votación</vs-th>
                                        <vs-th :colspan="1">A. 30% igualitaria</vs-th>
                                        <vs-th :colspan="1">B. 70% conforme % votación</vs-th>
                                        <vs-th :colspan="1">Total de B. después del ajuste</vs-th>
                                        <vs-th :colspan="1" style="max-width: 200px; white-space: normal; word-break: break-word;">C. Financiamiento público para actividades ordinarias permanentes (C = A + B)</vs-th>
                                        <vs-th v-if="distribucion.includes(2)" :colspan="1">D. Obtención del voto ( D = C * {{ factorCalculo }})</vs-th>
                                    </vs-tr>
                                </template>

                                <template #tbody>
                                    <vs-tr v-for="(partido, i) in Partidos_Con_Representacion" :key="'partido_sin_repr-' + i" :data="partido" 
                                    :class="{ 'bg-warning-light': partido.ajuste !== 0 }">
                                        <!-- Siglas -->
                                        <vs-td>
                                            <div class="d-flex align-items-center">
                                                <span>{{ partido.siglas }}</span>
                                            </div>
                                        </vs-td>

                                        <!-- Logo -->
                                        <vs-td>
                                            <img :src="'/img/logos/' + partido.logo"
                                                :alt="partido.siglas"
                                                class="img-fluid rounded"
                                                style="max-width: 40px; max-height: 40px;"
                                                
                                                onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'">
                                        </vs-td>

                                        <!-- % de votación -->
                                        <vs-td>
                                            <vs-input v-model="partido.inputPorcentaje" @blur="formatearPorcentaje(partido)" type="text" placeholder="0.00 %" />
                                        </vs-td>

                                        <!-- A. Monto igualitario -->
                                        <vs-td>
                                            {{ formatoMoneda(calcularMontoIgualitario30()) }}
                                        </vs-td>

                                        <!-- B. Monto proporcional -->
                                        <vs-td>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <span>{{ formatoMoneda(calcularMontoProporcionalB(partido.porcentaje_votacion)) }}</span>

                                            <div class="d-flex gap-1">
                                                <vs-button icon small flat @click="ajustarDecimal(partido, 'restar')" color="danger" icon-pack="feather" icon-name="minus" />
                                                <vs-button icon small flat @click="ajustarDecimal(partido, 'sumar')" color="success" icon-pack="feather" icon-name="plus" />
                                            </div>
                                        </div>
                                        </vs-td>

                                        <!-- ajuste de b. 70% -->
                                        <vs-td>
                                        <span :class="{ 'text-success': partido.ajuste > 0, 'text-danger': partido.ajuste < 0 }">
                                            {{ formatoMoneda(calcularMontoBConAjuste(partido.porcentaje_votacion, partido.ajuste)) }}
                                        </span>
                                        </vs-td>

                                        <vs-td>
                                            <!-- calcularMontoIgualitario30() + calcularMontoBConAjuste(partido.porcentaje_votacion, partido.ajuste) -->
                                            {{ formatoMoneda(calcularMontoC(partido))}}
                                        </vs-td>

                                        <!-- D. Obtención del voto -->
                                        <vs-td v-if="distribucion.includes(2)">
                                            {{ formatoMoneda(calcularMontoC(partido) * factorCalculo)}}
                                        </vs-td>
                                    </vs-tr>
                                    <!-- Subtotal para partidos con representación -->
                                    <vs-tr class="font-weight-bold bg-light">
                                    <vs-td colspan="6" class="text-right">Subtotal partidos con representación:</vs-td>
                                    <vs-td>{{ formatoMoneda(subtotalC_ConRepresentacion) }}</vs-td>
                                    <vs-td v-if="distribucion.includes(2)">
                                        {{ formatoMoneda(subtotalD_ConRepresentacion) }}
                                    </vs-td>
                                    </vs-tr>
                                    <vs-tr v-for="(partido, i) in Partidos_Sin_Representacion" :key="'partido_con_repr-' + i" :data="partido">
                                        <!-- Siglas -->
                                        <vs-td>{{ partido.siglas }}</vs-td>
                                        <!-- Logo -->
                                        <vs-td>
                                            <img :src="'/img/logos/' + partido.logo"
                                                :alt="partido.siglas"
                                                class="img-fluid rounded"
                                                style="max-width: 100%; max-height: 100%; object-fit: contain;"
                                                onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'">
                                        </vs-td>
                                        <!-- Descripción -->
                                        <vs-td colspan="4">2% del monto de financiamiento público para actividades ordinarias permanentes del año 
                                            <span style="color: red !important; font-weight: bold !important">{{ selectedCalculo.anioFiscal }}</span>, para partidos políticos locales que habiendo conservado el registro, no cuentan con representación en el Congreso Local		
                                        </vs-td>
                                        <!-- C. monto 2% -->
                                        <vs-td>{{ formatoMoneda(partido.monto_2_por_ciento)}}</vs-td>
                                        <!-- ( D = C * 0.5) -->
                                        <vs-td v-if="distribucion.includes(2)">{{ formatoMoneda(partido.monto_2_por_ciento * factorCalculo) }}</vs-td>
                                    </vs-tr>
                                    <vs-tr>
                                        <vs-td :colspan="6">
                                            Subtotal
                                        </vs-td>
                                        <vs-td :colspan="1">
                                            {{formatoMoneda(subtotalMonto2PorCiento)}}
                                        </vs-td>
                                        <vs-td :colspan="1" v-if="distribucion.includes(2)">
                                            {{formatoMoneda(subtotalMonto2PorCientoD)}}
                                        </vs-td>
                                    </vs-tr>
                                    <vs-tr v-if="distribucion.includes(2)">
                                        <vs-td :colspan="1"></vs-td>
                                        <vs-td :colspan="2">
                                            Candidaturas independientes
                                        </vs-td>
                                        <vs-td :colspan="3">
                                            <span>2 % del financiamiento público para actividades tendientes a la obtención del voto.</span>
                                        </vs-td>
                                    </vs-tr>
                                    <!--totales-->
                                    <vs-tr >
                                        <vs-td :colspan="6">
                                            Totales
                                        </vs-td>
                                        <vs-td :colspan="1">
                                            {{formatoMoneda(totalPermanentes)}}
                                        </vs-td>
                                        <vs-td :colspan="1" v-if="distribucion.includes(2)">
                                            {{formatoMoneda(totalVotos)}}
                                        </vs-td>
                                    </vs-tr>
                                    <!-- Gran Total -->
                                        <vs-tr class="font-weight-bold bg-dark text-white">
                                            <vs-td colspan="8" v-if="!distribucion.includes(2)">Gran total:</vs-td>
                                            <vs-td colspan="7" v-else>Gran total:</vs-td>
                                            <vs-td>
                                                {{ formatoMoneda(granTotal) }}
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
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'guardar'+darkMode" 
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
                                    @click.stop="descargarDistribucion" hover="true"
                                    style="padding: 0.20rem; font-size: 1rem;" :disabled="flag_descargar">
                                        <div style="color: var(--btn-txt-color); font-weight: 700; display: flex; align-items: center;">
                                            <i class="fas fa-file-download pr-2" style="font-size: 0.8125rem !important;"></i>
                                            <span>Descargar</span>
                                        </div>
                                    </vs-button>
                                    <template #tooltip>
                                        <div v-if="flag_descargar">
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
</template>
<script>

import { forEach } from 'lodash';
import methods from '../../../methods';
import { loading } from '../../../methods';
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            // Variables para listar
            selectedCalculo: {}, 
            Partidos_Sin_Representacion: [],
            Partidos_Con_Representacion: [], 
            NewlistCalculos: [], 
            cb_ppSeleccionados: [],
            opcionSelecionadaPorcentaje: '1', //  Valor por defecto Gubernatura
            search: '',
            page: 1, 
            max: 10,
            active: false, 

            input1: '',
            input2: '',
            checkbox1: false,
            anio: '',
            monto30: '',
            monto70: '',
            suma: '',
            colors: [
                {
                    color: 'warn'
                }
            ],
            // Catálogos
            catAnio: [],
            cat_tipo_distribucion: [],
            distribucion: [],
            // Validaciones
            error: false,
            errorAnio: '',
            errorDistribucion: '',
            errorMonto30: '',
            errorMonto70: '',
            errorPartidosPoliticos_conRepr: '',
            flag_descargar: true, // true: disabled | false: enabled
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
        formatCurrency(value) {
            return '$' + parseFloat(value).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
        },
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
        abrirDialog(calculo_tr) {
            const loader = loading(this.$vs);

            //let url = '/administracion/solicitud/Distribucion_get_Partidos_Con_Representacion';
            let url = '/administracion/solicitud/get_Partidos_Calculo_porId';
            this.selectedCalculo = calculo_tr; // Se trae el calculo seleccionado para usar los datos después
            this.datosCalculoSeleccionado = {};
            this.Partidos_Sin_Representacion = {};
            this.Partidos_Con_Representacion = {};
            this.monto30 = '',
            this.monto70 = '',
            //this.limpiarCampos();
            //console.log(calculo_tr.id);
            this.active = true; // activa el modal
            loader.text = 'Cargando datos...';
            //Obtener los datos principales del Cálculo Financiero
            axios.get(url, {
                params: {
                    'id': calculo_tr.id
                }
            }).then(response => {
                //console.log('Respuesta completa del servidor:', response);
                //console.log('Datos recibidos:', response.data);
                if (response.status === 200 && response.data?.success) {
                    //Obtenemos los datos de los partidos politicos
                    this.Partidos_Sin_Representacion = response.data.partidosSinRep;
                    this.Partidos_Con_Representacion = response.data.partidosConRep.map(p => ({
                        ...p,
                        ajuste: 0,
                        // valor temporal para el input
                        inputPorcentaje: this.formatearPorcentaje(p)
                    }));
                    //console.log('Partidos_Con_Representacion: ', this.Partidos_Con_Representacion);
                } else {
                    // success: false
                    const errorMessage = response.data?.message || 'Error en la respuesta del servidor';
                    throw new Error(errorMessage);
                }
                // Cargando datos de Distribución
                //this.distribucion = JSON.parse(datos.p_tipo_distribucion);
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
        },
        async guardarDistribucion() { //⚠️
            const loader = loading(this.$vs);
            loader.text = 'Guardando distribución...';
            const urlDistribucion = '/administracion/solicitud/Distr_Get_Insert_Update_distribucion_dppp';
            const urlPartidos = '/administracion/solicitud/Update_Partidos_Con_Representacion';
            
            const datos = {
                p_comando: 'INSERT', // INSERT, UPDATE
                p_id_dist: this.selectedCalculo.id_dist,
                id_calculo: this.selectedCalculo.id,
                p_anio_ejercicio: this.anio, //valor manual
                p_tipo_distribucion: JSON.stringify(this.distribucion), //valor manual
                p_monto_30_por_ciento: this.monto30, //valor manual
                p_monto_70_por_ciento: this.monto70, //valor manual
                p_tipoPorcentaje: this.opcionSelecionadaPorcentaje, //valor manual
                p_suma_A_30_por_ciento: this.monto30,
                p_suma_B_70_por_ciento: this.monto70,
                p_suma_B_Ajuste_70_por_ciento: this.monto70,
                p_suma_C_fpaop: this.subtotalC_ConRepresentacion,
                p_suma_D_fpatov: this.subtotalD_ConRepresentacion,
                //p_suma_D_2PorCiento: this.subtotalMonto2PorCientoD, -- 2% de pp_sin_repr
                //p_suma_D_candidatura: this.candidatura, -- candidatura Ind.(2%)
            };
            console.log('Datos a guardar: ', datos, this.Partidos_Con_Representacion);
            try {
                /*
                // Actualizar distribución
                if (this.distribucionId) {
                    const response = await axios.put(`${urlDistribucion}/${this.distribucionId}`, datos);
                    this.$vs.notification({ color: 'success', text: 'Distribución actualizada' });
                    if (response.data && response.data.id) {
                        this.distribucionId = response.data.id;
                        console.log('Distribución actualizada con ID: ' + this.distribucionId);
                    }
                } else { // Guardar distribución
                    const response = await axios.post(urlDistribucion, datos);
                    this.$vs.notification({ color: 'success', text: 'Distribución guardada' });
                    // Si es un nuevo registro, actualizamos el ID
                    if (response.data && response.data.id) {
                        this.distribucionId = response.data.id;
                        console.log('Distribución guardada con ID: ' + response.data.id);
                    }
                }
                // Actualizamos la tabla de partidos políticos
                // Crear un array de promesas
                const promesas = this.Partidos_Con_Representacion.map(async partido => {
                    try {
                    const response = await axios.put(urlPartidos, partido);
                    if (response.data && response.data.ids) {
                        console.log('Partido político actualizado: ' + response.data.ids);
                    }
                    } catch (error) {
                        console.error('Error al actualizar partido: ' + partido.siglas, error);
                        this.$vs.notification({ 
                            color: 'danger', 
                            text: `Error al actualizar ${partido.siglas}` 
                        });
                        throw error;
                    }
                });
                // Esperar a que todas las peticiones terminen
                await Promise.all(promesas);
                
                // Notificación de éxito
                this.$vs.notification({ 
                    color: 'success', 
                    text: 'Datos guardados correctamente' 
                });
                */           
            } catch (error) {
                console.error('Error al guardar:', error);
                this.$vs.notification({title: 'Error', color: 'danger', text: 'Error al guardar' });

                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            } finally {
                loader.close();
            }
        },
        calcularMontoIgualitario30() {
            const monto = parseFloat(this.monto30); // parcea  el valor del input a decimal
            const totalPartidos = this.selectedCalculo.num_pp_con_repr || this.Partidos_Con_Representacion.length;
            return isNaN(monto) || totalPartidos === 0 ? 0 : monto / totalPartidos;
        },

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
        * Ajustar decimal para 70%
        */
        ajustarDecimal_70porCiento(partido, operacion) {
            if (this.cb_ppSeleccionados.length !== 2) {
                this.$vs.notification({
                    title: 'Aviso',
                    text: 'Debes seleccionar exactamente 2 partidos para ajustar',
                    color: 'warning'
                });
                return;
            }

            if (!this.cb_ppSeleccionados.includes(partido.id_partido)) {
                this.$vs.notification({
                    title: 'Aviso',
                    text: 'Solo puedes ajustar partidos seleccionados',
                    color: 'warning'
                });
                return;
            }

            const ajusteUnitario = 0.01;
            if (partido.ajuste === undefined) this.$set(partido, 'ajuste', 0);

            if (operacion === 'sumar') {
                partido.ajuste += ajusteUnitario;
                // Aplicar el ajuste inverso al otro partido seleccionado
                const otroPartido = this.Partidos_Con_Representacion.find(p => 
                    p.id_partido !== partido.id_partido && 
                    this.cb_ppSeleccionados.includes(p.id_partido)
                );
                if (otroPartido) {
                    if (otroPartido.ajuste === undefined) this.$set(otroPartido, 'ajuste', 0);
                    otroPartido.ajuste -= ajusteUnitario;
                }
            }
        },
        /*
        * (Monto Total Efectivo (70%)) POR (% de votación por cada partido político en elección inmediata anterior de diputaciones)
        * ENTRE (% de votación de TODOS los partidos políticos en elección inmediata anterior de diputaciones)
         */
        calcularMontoProporcionalB(porcentajePartido) {
            const porcentaje = parseFloat(porcentajePartido);
            const totalPorcentajes = this.sumaTotalPorcentajes;
            const monto = parseFloat(this.monto70); // parcea  el valor del input a decimal
            
            if (isNaN(porcentaje) || isNaN(monto) || totalPorcentajes === 0) return 0;
            //console.log('B. Monto proporcional:', {porcentaje, totalPorcentajes, monto});
            return (monto * porcentaje) / totalPorcentajes;
        },
        calcularMontoBConAjuste(porcentajePartido, ajuste) {
            const base = this.calcularMontoProporcionalB(porcentajePartido);
            //console.log('B. Monto con ajuste:', {base, ajuste});
            return base + (ajuste || 0);
        },
        calcularMontoC(partido) {
            const montoA = parseFloat(this.calcularMontoIgualitario30());
            const montoB = parseFloat(this.calcularMontoBConAjuste(partido.porcentaje_votacion, partido.ajuste));
            
            // Verificar si los valores son números válidos
            if (isNaN(montoA) || isNaN(montoB)) {
                console.error('C. Valores inválidos:', { 
                    montoA, 
                    montoB,
                    porcentaje: partido.porcentaje_votacion,
                    ajuste: partido.ajuste
                });
                return 0; // O algún valor por defecto
            }
            
            return montoA + montoB;
        },
        calcularMontoD(partido) {
            return this.formatoMoneda(
                this.calcularMontoC(partido) * this.factorCalculo
            );
        },
        /*
        * Formatea a moneda
        */
        formatoMoneda(valor) {
            return new Intl.NumberFormat('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2
            }).format(valor);
        },

        /*
        * Formatea el porcentaje del partido
        */
        formatearPorcentaje(partido) {
            if (!partido.inputPorcentaje) {
                partido.inputPorcentaje = '0.00000 %';
                partido.porcentaje_votacion = 0.00000;
                return;
            }
            
            const valorNumerico = parseFloat(partido.inputPorcentaje.toString().replace(/[^0-9.]/g, ''));
            
            if (!isNaN(valorNumerico)) {
                //const valorFinal = Math.min(Math.max(valorNumerico, 0), 100);
                partido.porcentaje_votacion = valorNumerico.toFixed(5);
                partido.inputPorcentaje = partido.porcentaje_votacion + ' %';
                
            } else { // Si no es un número recetea valores
                partido.porcentaje_votacion = 0.00000;
                partido.inputPorcentaje = '0.00000 %';
            }
        },
        /**
         * Valida si un valor es un número decimal válido
         * @param {string|number} value - Valor a validar
         * @param {number} [maxDecimals=5] - Número máximo de decimales permitidos
         * @returns {boolean} - true si es válido, false si no
         */
        validarDecimal(value, maxDecimals = 5) {
            if (value === '' || value === null || value === undefined) {
                return false;
            }
            
            // Expresión regular para validar números decimales
            const regex = new RegExp(`^\\d+(\\.\\d{1,${maxDecimals}})?$`);
            return regex.test(String(value).replace(',', '.'));
        },
        /**
         * Validar campos
         * @returns {boolean}
         */
        validarCampos() {
            this.limpiarErrores();
            if (this.anio === '') {
                this.errorAnio = 'El campo año es obligatorio';
                this.error = true;
            }
            if (this.monto30 === '' || !this.validarDecimal(this.monto30, 2)) {
                this.errorMonto30 = 'Ingrese un monto 30% válido (ej: 123.45)';
                this.error = true;
            }
    
            if (this.monto70 === '' || !this.validarDecimal(this.monto70, 2)) {
                this.errorMonto70 = 'Ingrese un monto 70% válido (ej: 123.45)';
                this.error = true;
            }
            if (this.distribucion === '') {
                this.errorDistribucion = 'El campo distribución es obligatorio';
                this.error = true;
            }
            for (let i = 0; i < this.Partidos_Con_Representacion.length; i++) {
                const partido = this.Partidos_Con_Representacion[i];
                if (partido.porcentaje_votacion === '' || !this.validarDecimal(partido.porcentaje_votacion, 5)) {
                    this.errorPorcentajeVotacion = 'Ingrese un porcentaje válido (ej: 123.45678)';
                    this.error = true;
                }
            }
            return this.error;
        },
        /**
         * Limpia todos los campos del formulario
         * @returns {void}
         */
         limpiarCampos() {
            this.anio = '',
            this.monto30 = '',
            this.monto70 = '',
            this.distribucion = [];
            // Reiniciar valores de partidos a 0.0
            this.Partidos_Con_Representacion = this.Partidos_Con_Representacion.map(partido => ({
                ...partido,
                porcentaje_votacion: 0.00,
                inputPorcentaje: '',
                ajuste: 0.00,
            }));
            this.opcionSelecionadaPorcentaje= '1'; //  Valor por defecto
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
        },
    },
    computed:{
        /*
        * Retorna la Sumatoria de los porcentajes de votación de los partidos con representación en el Congreso
        */
        sumaTotalPorcentajes() {
            return this.Partidos_Con_Representacion.reduce((total, partido) => {
                // Convierte a número y evita NaN si el input está vacío
                const valor = parseFloat(partido.porcentaje_votacion);
                return total + (isNaN(valor) ? 0 : valor);
            }, 0);//.toFixed(2);
        },
        totalAjusteDecimales() {
            return this.Partidos_Con_Representacion.reduce((sum, p) => sum + (p.ajuste || 0), 0);
        },
        /*
        * Retorna el subtotal de la sumatoria de 2% del monto de financiamiento público para actividades ordinarias
        * Partidos sin representación en el Congreso
        */
        subtotalMonto2PorCiento() {
            if (!this.Partidos_Sin_Representacion || this.Partidos_Sin_Representacion.length === 0) {
                return 0;
            }
            return this.Partidos_Sin_Representacion.reduce((total, partido) => {
                return total + (parseFloat(partido.monto_2_por_ciento) || 0);
            }, 0);
        },
        /*
        * Retorna el subtotal de la sumatoria de Financiamiento público para actividades tendientes a la obtención del voto
        * Partidos sin representación en el Congreso
        */
        subtotalMonto2PorCientoD() {
            if (!this.Partidos_Sin_Representacion || this.Partidos_Sin_Representacion.length === 0) {
                return 0;
            }
            return this.Partidos_Sin_Representacion.reduce((total, partido) => {
                return total + (parseFloat(partido.monto_2_por_ciento * 0.5) || 0);
            }, 0);
        },
        factorCalculo() {
            if (this.opcionSelecionadaPorcentaje === '1') {
                return 0.5;  // 50% Gubernatura
            } else if (this.opcionSelecionadaPorcentaje === '2') {
                return 0.3;  // 30% Intermedia
            }
            return 0;  // Valor por defecto
        },
         // Subtotal C para partidos con representación (C = A + B)
        subtotalC_ConRepresentacion() {
            return this.Partidos_Con_Representacion.reduce((total, partido) => {
            return total + this.calcularMontoC(partido);
            }, 0);
        },

        // Subtotal D para partidos con representación (D = C * factor)
        subtotalD_ConRepresentacion() {
            return this.Partidos_Con_Representacion.reduce((total, partido) => {
            return total + (this.calcularMontoC(partido) * this.factorCalculo);
            }, 0);
        },

        // Subtotal C para partidos sin representación (ya lo tienes)
        subtotalC_SinRepresentacion() {
            return this.subtotalMonto2PorCiento;
        },

        // Subtotal D para partidos sin representación (ya lo tienes)
        subtotalD_SinRepresentacion() {
            return this.subtotalMonto2PorCientoD;
        }, 
        candidatura(){
            const subtotal1 = this.subtotalD_ConRepresentacion;
            const subtotal2 = this.subtotalMonto2PorCientoD;
            const resultado = (subtotal1 + subtotal2) * 0.02
            return resultado;
        },
        totalPermanentes(){
            const subtotal1 = this.subtotalC_ConRepresentacion;
            const subtotal2 = this.subtotalMonto2PorCiento;
            const resultado = subtotal1 + subtotal2
            return resultado;
        },
        totalVotos(){
            const subtotal1 = this.subtotalD_ConRepresentacion;
            const subtotal2 = this.subtotalMonto2PorCientoD;
            const resultado = subtotal1 + subtotal2
            return resultado;
        },
        granTotal() {
            if (this.distribucion.includes(2)) {
            return this.totalPermanentes + this.totalVotos;
            }
            return this.totalPermanentes;
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