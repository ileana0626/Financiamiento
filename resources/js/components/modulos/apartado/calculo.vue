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
                            <span>Apartado de calculo</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card-info pb-4">
                    <div class="card-header d-flex">
                        <h3 class="card-title font-weight-bold">Apartado de calculo</h3>
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
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                    <label class="col-form-label">Fecha de Publicación de la UMA</label>
                                    <el-date-picker type="date" placeholder="Fecha de Publicación (dd-mm-aaaa)" format="dd-MM-yyyy"
                                        value-format="yyyy-MM-dd" v-model="fechaRecibido">
                                    </el-date-picker>
                                    <div class="danger-message">
                                        <template v-if="errorFechaRecibido.length > 0">
                                            {{ errorFechaRecibido }}
                                        </template>
                                    </div>
                            </div>

                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-3 pb-3"> 
                                <label class="col-form-label" for="dailyValue">UMA (Unidad de Medida y Actualización) </label>
                                <vs-input
                                v-model="umaInput"
                                @blur="formatearUMA"
                                type="text"
                                placeholder="$0.00">
                                </vs-input>
                                <div class="danger-message">
                                        <template v-if="errorUMA.length > 0">
                                            {{ errorUMA }}
                                        </template>
                                </div>
                            </div>
                            <!-- calculo de uma de 65%-->
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">65% de UMA</label>
                                <vs-input
                                class="disabled-bold"
                                placeholder="65% UMA"
                                :value="calculo_65_UMA_formatoMoneda"
                                type="text"
                                disabled
                                >
                                </vs-input>
                            </div>
                        </div>
                        <div class="row px-4">
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">No. de personas en Padrón Electoral</label>
                                <vs-input
                                v-model="numeroPadron"
                                type="text"
                                :placeholder="(numeroPadron.length > 0) ? '' : 'Ingresa el número de personas'"
                                >
                                </vs-input>
                                <div class="danger-message">
                                        <template v-if="errorNumeroPadron.length > 0">
                                            {{ errorNumeroPadron }}
                                        </template>
                                </div>
                            </div>
                        <!-- calculo de uma de 65% por el numero de personas-->
                            <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">Monto total de Financiamiento Público para AOP</label>
                                <vs-input
                                class="disabled-bold"
                                placeholder="Monto total"
                                :value="financiamientoAOP"
                                type="text"
                                disabled
                                >
                                </vs-input>
                            </div>
                        </div>
                        <div class="row px-4">
                            <!-- seccion checkbox para los partidos politicos-->
                                <div class="col-12">
                                    <div class="col-sm-12 col-md-4 col-xl-4 px-0 pr-sm-5 pb-3">
                                        <label class="col-form-label">Partidos sin representación en el Congreso </label>
                                        <vs-select multiple filter
                                            :placeholder="(partidosPoliticos_sinRepr.length > 0) ? '' : 'Seleccione una o más opciones'"
                                            v-model="partidosPoliticos_sinRepr" v-if="cat_partido_sinRepresentacion.length > 0" autocomplete="off"
                                            :color="colors[0].color">
                                            <template #message-danger v-if="errorPartidosPoliticos_sinRepr.length > 0">
                                                {{ errorPartidosPoliticos_sinRepr }}
                                            </template>
                                            <vs-option v-for="(item, index) in cat_partido_sinRepresentacion" :key="index"
                                                :label="item.siglas" :value="item.id">
                                                {{ item.siglas }}
                                            </vs-option>
                                        </vs-select>
                                    </div>
                                </div>
                        </div>

                            <!-- 2% DEL FPAOP PARA cada partido politico seleccionado -->
                            <div class="row px-4">
                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                    <label class="col-form-label"> 2% del FPAOP para </label>
                                        <div v-for="partido in partidos_sinRepr_Seleccionados" :key="partido.id" class="pb-2">
                                            <div class="d-flex align-items-center">
                                                <span class="mr-2">{{ partido.siglas }}</span>
                                                <vs-input
                                                class="flex-grow-1 disabled-bold"
                                                placeholder="2% FPAOP"
                                                :value="calculoFPAOP"
                                                type="text"
                                                disabled
                                                />
                                            </div>
                                        </div>
                                </div>

                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label"> Total de FP para Partidos sin representación en el Congreso </label>
                                    <div class="d-flex align-items-center">
                                        <vs-input
                                        class="flex-grow-1 disabled-bold"
                                        placeholder="total de FP"
                                        :value="totalFP"
                                        type="text"
                                        disabled
                                        />
                                    </div>
                                </div>

                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">Monto total efectivo</label>
                                    <div class="d-flex align-items-center">
                                        <vs-input
                                        class="flex-grow-1 disabled-bold"
                                        placeholder="total de FP"
                                        :value="montoTotal"
                                        type="text"
                                        disabled
                                        />
                                    </div>
                                </div>
                                
                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                <label class="col-form-label">30% Monto total efectivo</label>
                                    <div class="d-flex align-items-center">
                                        <vs-input
                                        class="flex-grow-1 disabled-bold"
                                        placeholder="total de FP"
                                        :value="montoTotal30"
                                        type="text"
                                        disabled
                                        />
                                    </div>
                                </div>
                           </div>
                             <!-- seccion checkbox para los partidos politicos copn representacion-->
                                <div class="row px-4">
                                    <div class="col-sm-6 col-md-4 col-xl-4 px-0 pr-sm-5 pb-3">
                                        <label class="col-form-label">Partidos con representación en el Congreso </label>
                                        <vs-select multiple filter
                                            :placeholder="(partidosPoliticos_conRepr.length > 0) ? '' : 'Seleccione una o más opciones'"
                                            v-model="partidosPoliticos_conRepr" v-if="cat_partido_conRepresentacion.length > 0" autocomplete="off"
                                            :color="colors[0].color">
                                            <template #message-danger v-if="errorPartidosPoliticos_conRepr.length > 0">
                                                {{ errorPartidosPoliticos_conRepr }}
                                            </template>
                                            <vs-option v-for="(item, index) in cat_partido_conRepresentacion" :key="index"
                                                :label="item.siglas" :value="item.id">
                                                {{ item.siglas }}
                                            </vs-option>
                                        </vs-select>
                                    </div>
                                </div>

                                <div class="row px-4">
                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                    <label class="col-form-label"> No. de  PP con representación en el Congreso</label>
                                        <vs-input
                                        class="flex-grow-1 disabled-bold"
                                        type="text"
                                        disabled
                                        :placeholder="(partidosPoliticos_conRepr.length > 0) ? '' : 'Ningún PP seleccionado'"
                                        v-model="partidosPoliticos_conRepr.length"
                                        :color="colors[0].color"
                                        />
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                    <label class="col-form-label"> 70% Monto total efectivo</label>
                                        <div class="d-flex align-items-center">
                                        <vs-input
                                        class="flex-grow-1 disabled-bold"
                                        placeholder="Monto total efectivo"
                                        :value="montoTotal70"
                                        type="text"
                                        disabled
                                        />
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                                    <label class="col-form-label"> Comprobación del Monto total de Financiamiento Público para AOP</label>
                                        <div class="d-flex align-items-center">
                                        <vs-input
                                        class="flex-grow-1 disabled-bold"
                                        placeholder="Monto total efectivo"
                                        :value="comprobacionMonto"
                                        type="text"
                                        disabled
                                        />
                                    </div>
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

                                <!-- <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'limpiar'+darkMode" 
                                    @click.prevent="guardarSolicitud"
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-file-alt pr-2" style="font-size: 0.8125rem !important;"></i>Generar reporte
                                        </div>
                                    </vs-button>
                                </div> -->

                            </div>


                           <!--  <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row">
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'limpiar'+darkMode" @click.prevent="limpiarContrasena()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                    </div>
                                </vs-button>      
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode" @click.prevent="accionPass()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Reestablecer contraseña
                                    </div>
                                </vs-button>                                
                            </div>
 -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import methods from '../../../methods';
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            error: false,
            colors: [
                {
                    color: 'warn'
                }
            ],
            anio: '', // Año fiscal
            uma: null,   // valor de UMA en float
            //resu: '', //No se usa
            //conversion: '', //No se usa
            //total: '', //No se usa
            totalmonto: '', // Monto total efectivo
            totalMonto30: '',  // 30% Monto total efectivo 
            totalMonto70: '',   // 70% Monto total efectivo 
            //comprobacion: '', // No se usa
            umaInput: '',   // valor de UMA para el input
            
            fechaRecibido: '', // fecha de publicacion de la UMA
            numeroPadron: '', // número de personas en padrón electoral para el input
            seguimientoPartido: '', //No se usa
            partidosPoliticos_sinRepr: [], // lista de partidos políticos sin representación Seleccionados
            partidosPoliticos_conRepr: [], // lista de partidos políticos con representación Seleccionados
            // Catálogos
            catAnio: [], // lista de años fiscales
            cat_partido_sinRepresentacion: [], // lista de partidos políticos sin representación
            cat_partido_conRepresentacion: [], // lista de partidos políticos con representación
            // Mensajes de error y validación
            errorUMA: '', // Para el mensaje de error UMA y bandera por su 'length' > 0 -> Error
            errorPartidosPoliticos_sinRepr: '',
            errorPartidosPoliticos_conRepr: '',
            errorAnio: '', // Para el mensaje de error de año fiscal
            errorFechaRecibido: '', // Para el mensaje de error de fecha de publicación de la UMA
            errorNumeroPadron: '', // Para el mensaje de error de número de personas en padrón electoral

            // Variables de cache reactivas para evitar errores de javascript en la consola
            // por calculos inec
            /*_cachedFPAOP: null,
            _cachedFPAOPFormatted: '',
            _needsRecalculation: false,
            */
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now();
                },
            },
            pickerOptions2: {
                disabledDate(time) {
                    var date = new Date();
                    date.setDate(date.getDate() - 1);
                    return time.getTime() < date;
                },
            },
            timePicker: {
                selectableRange: '09:00:00 - 18:00:00'
            }
        }
    },

    created() {
        EventBus.$on('darkMode', (data) => { this.darkMode = data })
    },
    async mounted() {
        const load = methods.loading(this.$vs);
        /* await this.getTipoDic(); */
        await this.getAnio();
        await this.obtenerDatos(3);
        await this.obtenerDatos(5);
        await this.obtenerDatos(6);
        await this.obtenerDatos(9);
        await this.obtenerDatos(10);
        load.close();
    },
    methods: {
        /**
         * Obtiene los años fiscales
         * @returns {void}
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
         * Formatea el valor de UMA a moneda
         * @returns {void}
         */
        formatearUMA() {
            let valorNumerico = parseFloat(this.umaInput.toString().replace(/[^0-9.]/g, ''));

            if (isNaN(valorNumerico)) { // Si no es un número recetea valores
            this.errorUMA = 'Ingrese un valor válido para UMA';
            // this.errorUMA = true; // No es necesario por el mensaje
            this.uma = null;
            this.umaInput = '';
            } else {
            //this.errorUMA = false; // No es necesario
            this.errorUMA = '';
            this.uma = valorNumerico;

            this.umaInput = valorNumerico.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            }
        },
        /**
         * Obtiene los datos de la base de datos
         * @param {number} tipo - Tipo de datos a obtener
         * @returns {void}
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
                        this.cat_partido_sinRepresentacion = response.data
                        break;
                    case 10:
                        this.cat_partido_conRepresentacion = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },
        /**
         * Guarda el calculo
         * @returns {void}
         */
        guardarCalculo() {
            this.validarCampos();
            if (!this.error) {
                let fechaAccion = methods.getTimestamp();
                Swal.fire({
                    icon: 'warning',
                    title: '¿estas seguro de registrar este calculo?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Registrar calculo',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                }).then(async (result) => {
                    if (result.isConfirmed) {
                         const load = methods.loading(this.$vs);
                        // Registrar el archivo
                        const url = '/administracion/solicitud/setRegistrarCalculoFinanciamiento';
                        let idGenerado = 0;
                        const strHora = this.hoursFormat(this.hora);
                        try {
                            const response = await axios.post(url, {
                                //cambiar a los campos de las tres tablas que se tienen que guardar (checar con los declarados en data y en el template)
                                'nAnio': this.anio, // anio fiscal
                                'fPublicacion': this.fechaRecibido, // se manda con formato YYYY-MM-DD a la base de datos
                                //'fPublicacion': this.formatDate(this.fecha_publicacion, 'DataBase'),
                                'cUMA': this.uma, // valor de UMA
                                'cPersonas_padron': this.numeroPadron, // numero de personas en el padron
                                'cbPartidosPoliticosSinRepr': this.formateaPartidosSeleccionadosSinRepDB,
                                'cbPartidosPoliticosConRepr': this.formateaPartidosSeleccionadosConRepDB,
                                'pp_sin_repr_siglas': this.formateaPartidosSeleccionadosSinRepSiglasDB,
                                'pp_con_repr_siglas': this.formateaPartidosSeleccionadosConRepSiglasDB,
                                
                               //'nIdAuth': Auth.id(),
                                // 'fAccion': fechaAccion,
                            });
                            //console.log('Respuesta completa:', JSON.stringify(response.data, null, 2));
                            load.text = 'Registrando calculos...';
                            if (response.status === 200) {
                                //Exito al guardar datos
                                if (response.data && response.data[0]) {
                                    idGenerado = response.data[0].idInsertado;
                                    console.log('ID generado:', idGenerado);
                                    Swal.fire({ // Manda la alerta de Éxito
                                        icon: 'success',
                                        title: 'Registrado correctamente',
                                        showConfirmButton: true,
                                        confirmButtonText: 'De acuerdo',
                                    }).then(result => {
                                        this.limpiarCampos();
                                    });
                                } else {
                                    console.error('No se recibió el ID del servidor');
                                }
                                
                                 // Error del servidor
                            } else {
                                console.error('Error:', response.data.message);
                            }
                        } catch (error) {
                            // Bloque de código para verificar cual es el error de inserción
                            console.error('Error en la petición:', error.response?.data?.message || error.message);
                            if (error.response) {
                                // El servidor respondió con un código de error
                                if (error.response.status === 422) {
                                    // Errores de validación
                                    console.error('Errores de validación:', error.response.data.errors);
                                } else {
                                    // Otros errores del servidor
                                    console.error('Error del servidor:', error.response.data.message);
                                }
                            } else if (error.request) {
                                // La petición fue hecha pero no se recibió respuesta
                                console.error('No se recibió respuesta del servidor');
                            } else {
                                // Error al configurar la petición
                                console.error('Error al realizar la petición:', error.message);
                            }
                            // Fin del bloque

                            const method = url.split('/');
                            methods.catchHandler(error, method[3], this.$router);c
                            return idGenerado;
                        }   
                        /*    
                            if (response.status === 200) {
                                idSOLICITUD = response.data[0].p_new_id;
                                console.log('idCaptura ', idSOLICITUD);
                                return idSOLICITUD;
                            }
                        } catch (error) {
                            const method = url.split('/');
                            methods.catchHandler(error, method[3], this.$router);
                            return idSOLICITUD;
                        }*/

                        /*const idARCHIVO = await this.setSubirArchivoSolicitud(this.documentos.F1, '', this.tipoDoc, this.nOficio);
                        // Registrar la solicitud
                        load.text = 'Registrando solicitud...';
                        const idSOLICITUD = await this.setRegistrarOficio(idARCHIVO, fechaAccion); */
                        // Registrar las copias de conocimiento
                        /* if (this.copiasConocimiento.length === 0) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Registrado correctamente',
                                showConfirmButton: true,
                                confirmButtonText: 'De acuerdo',
                            }).then(result => {
                                this.limpiarCampos();
                            });
                        } else {
                            load.text = 'Registrando copias...';
                            const exitoCopias = await this.setRegistrarCopiaCon(idSOLICITUD, fechaAccion);
                            if (exitoCopias > 0) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Registrado correctamente',
                                    showConfirmButton: true,
                                    confirmButtonText: 'De acuerdo',
                                }).then(result => {
                                    this.limpiarCampos();
                                });
                            }
                        } */
                        load.close();
                    }
                });
            }
        },
        /**
         * Valida los campos del formulario
         * @returns {void}
         */
        validarCampos() {
            this.error = false;
            if (this.anio === '') {
                this.errorAnio = 'El año fiscal es obligatorio';
                this.error = true;
            }
            if (this.fechaRecibido === '' || !this.fechaRecibido) {
                this.errorFechaRecibido = 'Debe seleccionar una fecha';
                this.error = true;
            }
            if (this.umaInput === '') {
                this.errorUMA = 'Ingrese un valor para UMA';
                //this.error = true;
            }
            if (this.numeroPadron === '') {
                this.errorNumeroPadron = 'Ingrese el número de personas en Padrón Electoral';
                this.error = true;
            }
            if (!Array.isArray(this.partidosPoliticos_conRepr) || this.partidosPoliticos_conRepr.length === 0) {
                this.errorPartidosPoliticos_conRepr = 'Debe seleccionar al menos un Partido Político';
                this.error = true;
            }
        },
        /**
         * Limpia todos los mensajes de error
         * @returns {void}
         */
        limpiarErrores() {
            this.errorFechaRecibido = '';
            this.errorPartidosPoliticos_sinRepr = '';
            this.errorPartidosPoliticos_conRepr = '';
            this.errorAnio = '',
            this.errorFechaRecibido = '',
            this.errorNumeroPadron = ''
        },
        /**
         * Limpia todos los campos del formulario
         * @returns {void}
         */
        limpiarCampos() {
            this.fechaRecibido = '';
            this.anio = '';
            this.partidosPoliticos_sinRepr = [];
            this.partidosPoliticos_conRepr = [];
            this.anio= '',
            this.uma= '',
            this.umaInput= '',
            this.numeroPadron= ''
        },
        /**Recibe un objeto fecha y devuelve un string con las horas */
        hoursFormat(dateOBJ, tipo) {
            let time = new Date(dateOBJ);
            let str = time.getHours().toString().padStart(2, '00') + ':' + time.getMinutes().toString().padStart(2, '00') + ':' + time.getSeconds().toString().padStart(2, '00');
            return str;
        },
    },
    computed: {
        /**
         * Realiza los calculos 65% de UMA -> (UMA*65)/100
         * @returns {number}
         */
        calculoForm_65_UMA() { 
        return this.uma * 0.65;
        
    },
    /**
     * Formatea el valor 65% de UMA a moneda
     * calculoForm_65_UMA {number}
     * @returns {string}
     */
    calculo_65_UMA_formatoMoneda() {
        const res = this.calculoForm_65_UMA;
        if (isNaN(res)) return '$0.00';

        return res.toLocaleString('es-MX', {
        style: 'currency',
        currency: 'MXN',
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
        });
    },
    /**
     * Realiza los calculos monto total de Financiamiento Público para AOP 
     * -> (65% de UMA * personas)
     * @returns {number}
     */
    financiamientoAOPForm() { //funcion para hacer calculos
        const personas = parseInt(this.numeroPadron);

        return this.calculoForm_65_UMA  * personas;
    },

    /**
     * Formatea el monto total de Financiamiento Público para AOP a moneda
     * financiamientoAOPForm {number}
     * @returns {string}
     */
    financiamientoAOP() {
        const resultado = this.financiamientoAOPForm;

        //validacion y limpieza de datos
        if(isNaN(resultado)) return '$0.00';

        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
    /**
     * Realiza los calculos del 2% del monto total de Financiamiento Público para AOP 
     * por cada partido seleccionado sin representación
     * -> (monto total de Financiamiento Público para AOP * 0.02)
     * @returns {number}
     */
    calculoFPAOPForm() {
        /*if (!this._cachedFPAOP || this._needsRecalculation) {
            this._cachedFPAOP = this.financiamientoAOPForm * 0.02;
            this._needsRecalculation = false;
        }
        return this._cachedFPAOP;*/
        // Validar primero para evitar cálculos innecesarios
        
        return this.financiamientoAOPForm * 0.02;      
    },
    /**
     * Formatea el valor del 2% del monto total de Financiamiento Público para AOP a moneda
     * calculoFPAOPForm {number}
     * @returns {string}
     */
    calculoFPAOP() {
        const resultado = this.calculoFPAOPForm;
        //validacion y limpieza de datos
        if(isNaN(resultado)) return '$0.00';
        
        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
    /**
     * Suma  del "2% de FPAOP" de todos los partidos seleccionados sin representación 
     * lo mismo que multiplicar calculoFPAOPForm por la cantidad de partidos seleccionados
     * @returns {number}
     */
    totalFPForm() {

        return this.calculoFPAOPForm * this.partidos_sinRepr_Seleccionados.length; 
    },
    /**
     * Da formato totalFPForm a moneda
     * totalFPForm {number}
     * @returns {string}
     */
    totalFP() {
        const resultado = this.totalFPForm;

        //validacion y limpieza de datos
        if(isNaN(resultado)) return '$0.00';
        
        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
    /**
     * Monto total efectivo
     * Monto total de financiamiento púlico para AOP - el total de FP partidos sin representación en el congreso
     * @returns {number}
     */
    montoTotalForm() {
        return this.financiamientoAOPForm - this.totalFPForm; 
    },
    /**
     * Formatea el valor monto total efectivo a moneda
     * montoTotalForm {number}
     * @returns {string}
     */
    montoTotal() {
        const resultado = this.montoTotalForm;

        //validacion y limpieza de datos
        if(isNaN(resultado)) return '$0.00';
        
        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
    /**
     * 30% Monto total efectivo 
     * Monto total efectivo * 0.3
     * @returns {number}
     */
    montoTotal30Form() {

        return this.montoTotalForm * 0.3; 

    },
    /**
     * Formatea el 30% Monto total efectivo a moneda
     * montoTotal30Form {number}
     * @returns {string}
     */
    montoTotal30() {
        const resultado = this.montoTotal30Form;
        
        if(isNaN(resultado)) return '$0.00';
        
        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
     /**
     * 30% Monto total efectivo 
     * Monto total efectivo * 0.7
     * @returns {number}
     */
    montoTotal70Form() {
        return this.montoTotalForm * 0.7; 
        
    },
    /**
     * Formatea el 70% Monto total efectivo a moneda
     * montoTotal70Form {number}
     * @returns {string}
     */
    montoTotal70() {
        const resultado = this.montoTotal70Form;

        //validacion y limpieza de datos
        if(isNaN(resultado)) return '$0.00';
        
        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
    /**
     * Comprobación del monto total de financiamiento público para AOP
     * 30% Monto total efectivo + 70% Monto total efectivo + Total FP partidos sin representación en el congreso
     * @returns {number}
     */
    comprobacionMontoForm() {
        
        return this.montoTotal30Form + this.montoTotal70Form + this.totalFPForm; 
    
    },
    /**
     * Formatea el valor comprobacion monto a moneda
     * comprobacionMontoForm {number}
     * @returns {string}
     */
    comprobacionMonto() {

        const valorTotal = this.comprobacionMontoForm;

        //validacion y limpieza de datos
        if(isNaN(valorTotal)) return '$0.00';
        
        return valorTotal.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
        /**
         * Filtra los partidos seleccionados sin representación del catálogo
         * @returns {Array}
         */
        partidos_sinRepr_Seleccionados() {
            return this.cat_partido_sinRepresentacion.filter(partido => this.partidosPoliticos_sinRepr.includes(partido.id));
        },
        /**
         * Filtra los partidos seleccionados con representación del catálogo
         * @returns {Array}
         */
        partidos_conRepr_Seleccionados() {
            return this.cat_partido_conRepresentacion.filter(partido => this.partidosPoliticos_conRepr.includes(partido.id));
        },
        /*
        * Formatea los partidos seleccionados sin refresentacion para guardarlos en la base de datos por sus 'id'
        */
        formateaPartidosSeleccionadosSinRepDB() {
            return this.partidos_sinRepr_Seleccionados.map(partido => partido.id).join(',');
        },
        /*
        * Formatea los partidos seleccionados con representacion para guardarlos en la base de datos por sus 'id'
        */
        formateaPartidosSeleccionadosConRepDB() {
            return this.partidos_conRepr_Seleccionados.map(partido => partido.id).join(',');
        },
         /*
        * Formatea los partidos seleccionados sin refresentacion para guardarlos en la base de datos por sus 'id'
        */
        formateaPartidosSeleccionadosSinRepSiglasDB() {
            return this.partidos_sinRepr_Seleccionados.map(partido => partido.siglas).join(', ');
        },
        /*
        * Formatea los partidos seleccionados con representacion para guardarlos en la base de datos por sus 'id'
        */
        formateaPartidosSeleccionadosConRepSiglasDB() {
            return this.partidos_conRepr_Seleccionados.map(partido => partido.siglas).join(', ');
        },
   
    }
}

</script>

<style>
.vs-checkbox--checked .vs-checkbox__check {
  background-color: #1E90FF !important; /* azul visible */
  border-color: #1E90FF !important;
}

.vs-checkbox__label {
  color: #000 !important; /* asegura que el texto no se vea gris */
}

.vs-checkbox--checked .vs-checkbox__label {
  font-weight: bold;
}

.disabled-bold .vs-input {
  font-weight: bold;
  color: #000; /* Negro fuerte */
}

</style>