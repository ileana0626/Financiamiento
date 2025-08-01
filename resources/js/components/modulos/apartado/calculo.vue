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
                                :value="calculo"
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
                                            :placeholder="(partidosPoliticos.length > 0) ? '' : 'Seleccione una o más opciones'"
                                            v-model="partidosPoliticos" v-if="cat_partido.length > 0" autocomplete="off"
                                            :color="colors[0].color">
                                            <template #message-danger v-if="errorPartidosPoliticos.length > 0">
                                                {{ errorPartidosPoliticos }}
                                            </template>
                                            <vs-option v-for="(item, index) in cat_partido" :key="index"
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
                                        <div v-for="partido in partidosSeleccionados" :key="partido.id" class="pb-2">
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
                                            :placeholder="(partidosPoliticosWith.length > 0) ? '' : 'Seleccione una o más opciones'"
                                            v-model="partidosPoliticosWith" v-if="cat_partido_conRepresentacion.length > 0" autocomplete="off"
                                            :color="colors[0].color">
                                            <template #message-danger v-if="errorPartidosPoliticosWith.length > 0">
                                                {{ errorPartidosPoliticosWith }}
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
                                        :placeholder="(partidosPoliticosWith.length > 0) ? '' : 'Ningún PP seleccionado'"
                                        v-model="partidosPoliticosWith.length"
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
            anio: '',
            uma: '',
            resu: '',
            conversion: '',
            total: '',
            totalmonto: '',
            totalMonto30: '',
            totalMonto70: '',
            comprobacion: '',
            umaInput: '',
            errorUMA: false,
            fechaRecibido: '',
            numeroPadron: '',
            seguimientoPartido: '',
            partidosPoliticos: [],
            partidosPoliticosWith: [],
            catAnio: [],
            cat_partido: [],
            cat_partido_conRepresentacion: [],
            errorPartidosPoliticos: '',
            errorPartidosPoliticosWith: '',
            errorAnio: '',
            errorFechaRecibido: '',
            errorNumeroPadron: '',

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
        formatearUMA() {
            let valorNumerico = parseFloat(this.umaInput.toString().replace(/[^0-9.]/g, ''));

            if (isNaN(valorNumerico)) {
            this.errorUMA = 'Ingrese un valor válido para UMA';
            this.errorUMA = true;
            this.uma = null;
            this.umaInput = '';
            } else {
            this.errorUMA = false;
            this.uma = valorNumerico;

            this.umaInput = valorNumerico.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN',
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            }
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
        //guardar el calculo
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
                        const url = '/administracion/solicitud/setRegistrarCalculo';
                        let idSOLICITUD = 0;
                        const strHora = this.hoursFormat(this.hora);
                        try {
                            const response = await axios.post(url, {
                                //cambiar a los campos de las tres tablas que se tienen que guardar (checar con los declarados en data y en el template)
                                'nTipo': this.tipoDoc,
                                'nAreaSolicita': this.areaSolicita,
                                'nMemo': this.nMemorandum,
                                'cAsunto': this.asunto,
                                'fRecibido': this.fechaRecibido,
                                'hRecibido': strHora,
                                'nTermino': this.termino,
                                'fTermino': this.fechaTermino,
                                'nAsignacion': this.areaAsignada,
                                'nRespuesta': this.respuesta,
                                'nIdArchivo': idARCHIVO,
                                'jsonSeguimiento': jsonSEG,
                                'fAccion': fechaAccion,
                            });
                            if (response.status === 200) {
                                idSOLICITUD = response.data[0].idSOLICITUD;
                                return idSOLICITUD;
                            }
                        } catch (error) {
                            const method = url.split('/');
                            methods.catchHandler(error, method[3], this.$router);
                            return idSOLICITUD;
                        }

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
                this.error = true;
            }
            if (this.numeroPadron === '') {
                this.errorNumeroPadron = 'Ingrese el número de personas en Padrón Electoral';
                this.error = true;
            }
            if (!Array.isArray(this.partidosPoliticosWith) || this.partidosPoliticosWith.length === 0) {
                this.errorPartidosPoliticosWith = 'Debe seleccionar al menos un Partido Político';
                this.error = true;
            }
        },
        /**Limpia todos los mensajes de error */
        limpiarErrores() {
            this.errorFechaRecibido = '';
            this.errorPartidosPoliticos = '';
            this.errorPartidosPoliticosWith = '';
            this.errorPartidosPoliticos = '',
            this.errorPartidosPoliticosWith = '',
            this.errorAnio = '',
            this.errorFechaRecibido = '',
            this.errorNumeroPadron = ''
        },
        limpiarCampos() {
            this.fechaRecibido = '';
            this.anio = '';
            this.partidosPoliticos = [];
            this.partidosPoliticosWith = [];
            this.anio= '',
            this.uma= '',
            this.umaInput= '',
            this.numeroPadron= ''
        },
        /**Recibe un objeto fecha y devuelve un string con las horas */
        hoursFormat(dateOBJ) {
            let time = new Date(dateOBJ);
            let str = time.getHours().toString().padStart(2, '00') + ':' + time.getMinutes().toString().padStart(2, '00') + ':' + time.getSeconds().toString().padStart(2, '00');
            return str;
        },
    },
    computed: {
        calculoForm() { //funcion que realiza los calculos
        return this.uma * 0.65;
        
    },
    calculo() {
        const res = this.calculoForm;
        if (isNaN(res)) return '$0.00';

        return res.toLocaleString('es-MX', {
        style: 'currency',
        currency: 'MXN',
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
        });
    },
    financiamientoAOPForm() { //funcion para hacer calculos
        const personas = parseInt(this.numeroPadron);

        return this.calculoForm * personas;
    },

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
    partidosSeleccionados() {
        return this.cat_partido.filter(partido => this.partidosPoliticos.includes(partido.id));
    },
    calculoFPAOPForm() {
        
        return this.financiamientoAOPForm * 0.02;      
    },
    calculoFPAOP() {
        const resultado = this.calculoFPAOPForm;
        
        return resultado.toLocaleString('es-MX', {
            style: 'currency',
            currency: 'MXN',
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    },
    totalFPForm() {

        return this.calculoFPAOPForm * this.partidosSeleccionados.length; 
    },
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
    montoTotalForm() {
        return this.financiamientoAOPForm - this.totalFPForm; 
    },
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
    montoTotal30Form() {

        return this.montoTotalForm * 0.3; 

    },
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
    montoTotal70Form() {
        return this.montoTotalForm * 0.7; 
        
    },
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
    comprobacionMontoForm() {
        
        return this.montoTotal30Form + this.montoTotal70Form + this.totalFPForm; 
    
    },
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
    partidosSeleccionadosWith() {
        return this.cat_partido_conRepresentacion.filter(partido => this.partidosPoliticosWith.includes(partido.id));
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