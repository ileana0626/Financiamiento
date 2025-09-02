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
    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
      <label class="col-form-label">Selecciona un año fiscal:</label>
      <vs-select
        placeholder="Seleccione una opción"
        v-model="anio"
        v-if="catAnio.length > 0"
        filter
        :color="colors[0].color"
        autocomplete="off"
        @change="getDistribucionesPorAnio"
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
  </div>

  <div v-if="CalculosPorAnio.length > 0" class="mt-4">
    <div
      v-for="(calculo, index) in CalculosPorAnio"
      :key="'calculo-' + index"
      class="mb-5"
    >
        <div class="d-flex align-items-center gap-2">
            <span class="material-symbols-rounded">receipt_long</span>
            <h5 class="mb-0">
            ID Cálculo: {{ calculo.id_calculo }} - Año: {{ calculo.anio_ejercicio }}
            </h5>
        </div>

        <!-- Partidos con representación -->
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
            <vs-tr
                v-for="(partido, i) in Partidos_Con_Representacion.filter(p => p.id_calculo === calculo.id_calculo)"
                :key="'con-' + i"
            >
                <vs-td>
                <img
                    :src="'/img/logos/' + partido.logo"
                    :alt="partido.siglas"
                    class="img-fluid rounded"
                    style="max-width: 40px; max-height: 40px;"
                    onerror="this.onerror=null; this.src='/img/logos/NOT_FOUND_SMALL.webp'"
                />
                </vs-td>
                <vs-td style="text-align: left;">
                    {{  formatCurrency(partido.C_fpaop)  }}
                </vs-td>
                <vs-td 
                sv-for="(monto, mesIndex) in distribuirConEditableDiciembre(
                    partido.C_fpaop, 
                    ajustesDiciembre['con-' + partido.id_calculo + '-' + partido.id_partido]
                )" 
                :key="'me-con-' + i + '-' + mesIndex" 
                style="text-align: left;"
                >
                    <!-- Solo diciembre (índice 11) es editable -->
                    <template v-if="mesIndex === 11">
                        <input
                        type="number"
                        step="0.01"
                        :min="0"
                        :value="monto"
                        class="form-control"
                        style="width: 100%;"
                        @input="e => ajustesDiciembre['con-' + partido.id_calculo + '-' + partido.id_partido] = parseFloat(e.target.value)"
                        />
                    </template>
                    <!-- Los otros 11 meses -->
                    <template v-else>
                        {{ formatCurrency(monto) }}
                    </template>
                </vs-td>
            </vs-tr>
            </template>
        </vs-table>

        <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row mt-4">
            <div class="d-flex justify-content-center">
                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#1a2e35'" :key="'guardar'+darkMode" 
                @click.stop="guardarCambios" 
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
                @click.stop="descargar(distribucionId)" hover="true"
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
</div>
    </div>
  </div>
</template>
<script>

//import { forEach } from 'lodash';
import methods from '../../../methods';
import { loading } from '../../../methods';
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
            ajustesDiciembre: {},
            cat_tipo_distribucion: [],
            distribucion: [],
            distribuciones: [],
            CalculosPorAnio : [],
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
        formatCurrency(value) {
        if (!value) return '$0.00';
        return Number(value).toLocaleString('es-MX', {
        style: 'currency',
        currency: 'MXN',
        minimumFractionDigits: 2
        });
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
                    'id': calculo_tr.id
                }
            }).then(response => {
                debug('🐛 Datos recibidos:', response.data);
                if (response.status === 200 && response.data?.success) {
                    //Obtenemos los datos de los partidos politicos
                    this.Partidos_Sin_Representacion = response.data.Partidos_Sin_Representacion;
                    this.Partidos_Con_Representacion = response.data.Partidos_Con_Representacion.map(p => ({
                        ...p,
                        ajuste: 0,
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
                this.cargarDistribucion();
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
         distribuirConEditableDiciembre(montoTotal, overrideDiciembre = null) {
    const mensual = parseFloat((montoTotal / 12));
    const meses = Array(11).fill(mensual);

    // Si el usuario ajustó diciembre, usar ese valor. Si no, usar el predeterminado.
    const diciembre = overrideDiciembre !== null 
      ? parseFloat(overrideDiciembre) 
      : mensual;

    meses.push(diciembre);
    return meses;
  },
        getFinanciamientoOrdinario(id_calculo) {
            const dist = this.distribuciones.find(d => d.id_calculo === id_calculo);
            console.log(this.distribuciones);
            return dist ? this.formatCurrency(dist.subtotal_C_fpaop) : '$0.00';
        },
        formatear30() {
            let valorNumerico = parseFloat(this.monto30Input.toString().replace(/[^0-9.]/g, ''));

            if (isNaN(valorNumerico)) { // Si no es un número recetea valores

            this.monto30 = null;
            this.monto30Input = '';
            } else {
            this.errorMonto30 = '';
            this.monto30 = valorNumerico;

            this.monto30Input = valorNumerico.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            }
        },
        formatear70() {
            let valorNumerico = parseFloat(this.monto70Input.toString().replace(/[^0-9.]/g, ''));

            if (isNaN(valorNumerico)) { 
            this.monto70 = null;
            this.monto70Input = '';
            } else {
            this.errorMonto70 = '';
            this.monto70 = valorNumerico;

            this.monto70Input = valorNumerico.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            }
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
        /**
         * Función para cargar las opciones de Distribución después de cargar los datos de Cálculo
         */
        async cargarDistribucion() { // ✅
            const loader = loading(this.$vs);
            loader.text = 'Cargando distribución...';
            let url = '/administracion/solicitud/Distr_Get_Insert_Update_distribucion_dppp';
            let datos = {
                p_comando: 'GET',
                p_id_calculo: this.selectedCalculo.id
            }
            try{
                const response = await axios.post(url, datos); // ⇋ Se manda post aunque sea GET por el controlador
                debug('🐛 response.data:', response.data); 
                // Verifica si hay una distribucion cargada, si no hay Distribución encontrada en la base de datos prosigue a cargar
                if( response.data && response.data.success && response.data.distribucion.length > 0){
                    this.DataDistribucion = response.data.distribucion[0]; // Solo con GET
                    this.distribucionId = this.DataDistribucion.id_calculo;
                    // Empieza a cargar los datos guardados
                    this.anio = this.DataDistribucion.anio_ejercicio; // asigna año
                    if (this.DataDistribucion?.tipo_distribucion) {
                        this.distribucion = this.DataDistribucion.tipo_distribucion
                            .split(',')
                            .map(Number)
                            .filter(item => !isNaN(item));
                    }
                    this.monto30Input = this.formatoMoneda(this.DataDistribucion.monto_30_por_ciento);
                    this.monto30 = this.DataDistribucion.monto_30_por_ciento;
                    this.monto70Input = this.formatoMoneda(this.DataDistribucion.monto_70_por_ciento);
                    this.monto70 = this.DataDistribucion.monto_70_por_ciento;
                    this.opcionSelecionadaPorcentaje = String(this.DataDistribucion['tipoPorcentaje']); // !Importante que parse a String
                    this.$nextTick(() => {
                        debug('🐛 Factor de porcentaje: ', this.factorCalculo, 'Opción seleccionada: ',this.opcionSelecionadaPorcentaje,'tipo:', typeof this.opcionSelecionadaPorcentaje);
                    });
                    if((this.distribucionId ?? null) !== null){
                        this.descargar_disabled = false;
                    }
                    debug('✅ Distribución cargada.');
                }else{
                    debug('❌ No se encontro distribución, ➜ 👍 continua normalmente...');
                    return;
                }
            }catch(error){
                console.error('Error al cargar distribución', error);
                this.$vs.notification({
                    title: 'Error',
                    text: 'Error al cargar la distribución',
                    color: 'danger'
                });
                
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            }
            finally{
                loader.close();
            }
        },
        async guardarDistribucion() { //✅

            const loader = loading(this.$vs);
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
            }
        },
        /**
         * Descarga el archivo Excel de la distribución
         * @param DistribucionId // debe de existir un preguardado antes
         */
        descargarDistribucion(id) {
            const loader = loading(this.$vs);
            loader.text = 'Generando archivo Excel...';
            const apiUrl = `/administracion/solicitud/exportarFinanciamientoDistribucionExcel/${id}`;
            let downloadUrl = null;
            let link = null;

            if(this.distribucionId? null : this.distribucionId === null || this.distribucionId === 0){
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
                const filename = `Anexo 2. Distribución.xlsx`;
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
        * (Monto Total Efectivo (70%)) POR (% de votación por cada partido político en elección inmediata anterior de diputaciones)
        * ENTRE (% de votación de TODOS los partidos políticos en elección inmediata anterior de diputaciones)
         */
        calcularMontoProporcionalB(porcentajePartido) {
            const porcentaje = parseFloat(porcentajePartido);
            const totalPorcentajes = this.sumaTotalPorcentajes;
            const monto = parseFloat(this.monto70); // parcea  el valor del input a decimal
            
            if (isNaN(porcentaje) || isNaN(monto) || totalPorcentajes === 0) return 0;
            return (monto * porcentaje) / totalPorcentajes;
        },
        calcularMontoBConAjuste(porcentajePartido, ajuste) {
            const base = this.calcularMontoProporcionalB(porcentajePartido);
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
            return this.calcularMontoC(partido) * this.factorCalculo;
        },
        calcularMontoD_ppsr(partido) {
            return partido.monto_2_por_ciento * this.factorCalculo;
        },
        /*
        * Almacena temporalmente en los Objetos de los partidos,
        * los cálculos aplicados a las columnas antes de Guardar
        */
        AlmacenarCalculos_Partidos() {
            this.Partidos_Con_Representacion.forEach(partido => {
                partido.A_30_por_ciento = this.calcularMontoIgualitario30();
                partido.B_70_por_ciento = this.calcularMontoProporcionalB(partido.porcentaje_votacion);
                partido.B_Ajuste_70_por_ciento = this.calcularMontoBConAjuste(partido.porcentaje_votacion, partido.ajuste);
                partido.C_fpaop = this.calcularMontoC(partido);
                partido.D_fpatov = this.calcularMontoD(partido);
            });
            this.Partidos_Sin_Representacion.forEach(partido => {
                partido.D_monto_2_por_ciento = this.calcularMontoD_ppsr(partido);
            });
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
            this.opcionSelecionadaPorcentaje= '1'; //  Valor por defecto factorCalculo()
            this.descargar_disabled = true; // Deshabilita el botón de descargar

            // Reiniciar valores de partidos a 0.0 si existen
            if(this.Partidos_Con_Representacion){
                this.Partidos_Con_Representacion = this.Partidos_Con_Representacion.map(partido => ({
                    ...partido,
                    porcentaje_votacion: 0.00,
                    inputPorcentaje: '',
                    errorPorcentajeVotacion: '',
                    ajuste: 0.00,
                }));
            }else {
                this.Partidos_Con_Representacion = [];
            }
            if(this.Partidos_Sin_Representacion){
                this.Partidos_Sin_Representacion = this.Partidos_Sin_Representacion.map(partido => ({
                    ...partido,
                    D_monto_2_por_ciento: 0.00,
                }));
            }else {
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
        * monto_2_por_ciento * factorCalculo
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
        * SUMA(monto_2_por_ciento * factorCalculo)
        */
        subtotalMonto2PorCientoD() {
            if (!this.Partidos_Sin_Representacion || this.Partidos_Sin_Representacion.length === 0) {
                return 0;
            }
            return this.Partidos_Sin_Representacion.reduce((total, partido) => {
                return total + (parseFloat(partido.monto_2_por_ciento * this.factorCalculo) || 0);
            }, 0);
        },
        factorCalculo() {
            //debug('🐛 En factorCalculo, opción:', this.opcionSelecionadaPorcentaje, 'tipo:', typeof this.opcionSelecionadaPorcentaje);
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