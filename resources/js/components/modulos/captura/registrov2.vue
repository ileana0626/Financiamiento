<template>
    <div class="col">
        <div class="float-ms-right mr-5">
            <ul class="breadcrumb">
                <li>
                    <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                </li>
                <li class="breadActive">
                    <span>
                        Captura
                    </span>
                </li>
            </ul>
        </div>
        <div class="row col-md-11 col-10 mx-auto card card-info  px-0"
            style="border-radius: 1.25rem !important; margin-bottom: 2.7rem; box-shadow: var(--iee-shadow) !important;">
            <div class="card-header">
                <h3 class="col card-title font-weight-bold">Captura de Solicitudes</h3>
            </div>
            <div class=" p-4 container-fluid" style="background-color: var(--iee-white) !important;">
                <div class="row mx-12 mb-12 p-4">
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Tipo</label>
                        <vs-select placeholder="Seleccione una opción" v-model="tipoDoc" v-if="catTipoDoc.length > 0"
                            filter :color="colors[0].color" autocomplete="off">
                            <template #message-danger v-if="errorTipoDoc.length > 0">
                                {{ errorTipoDoc }}
                            </template>
                            <vs-option v-for="(item, index) in catTipoDoc" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Capitulos</label>
                        <vs-select placeholder="Seleccione una opción" v-model="tipoDoc" v-if="catCapitulo.length > 0"
                            filter :color="colors[0].color" autocomplete="off">
                            <template #message-danger v-if="errorTipoDoc.length > 0">
                                {{ errorTipoDoc }}
                            </template>
                            <vs-option v-for="(item, index) in catCapitulo" :key="index" :label="item.serie"
                                :value="item.id">
                                {{ item.serie }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Quién Solicita</label>
                        <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color"
                            v-model="areaAsignada" v-if="cat_departamentos.length > 0" autocomplete="off">
                            <template #message-danger v-if="errorAreaAsignada.length > 0">
                                {{ errorAreaAsignada }}
                            </template>
                            <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>

                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Fecha de Recibido</label>
                        <el-date-picker type="date" placeholder="Fecha de Recibido" format="dd-MM-yyyy"
                            :picker-options="pickerOptions" value-format="yyyy-MM-dd" v-model="fechaRecibido">
                        </el-date-picker>
                        <div class="danger-message">
                            <template v-if="errorFechaRecibido.length > 0">
                                {{ errorFechaRecibido }}
                            </template>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Hora de Recibido</label>
                        <el-time-select v-model="hora" placeholder="Hora de Recibido">
                        </el-time-select>
                        <div class="danger-message">
                            <template v-if="errorHora.length > 0">
                                {{ errorHora }}
                            </template>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Quien Contesta</label>
                        <vs-select filter placeholder="Seleccione una opción" :color="colors[0].color"
                            v-model="areaAsignada" v-if="cat_departamentos.length > 0" autocomplete="off">
                            <template #message-danger v-if="errorAreaAsignada.length > 0">
                                {{ errorAreaAsignada }}
                            </template>
                            <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-6 col-md-5 col-xl-5 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Archivo</label>
                        <div class="row px-0 pr-sm-5 pb-3">
                            <div class="col-md-6">
                                <h6 class="col">Seleccione el documento</h6>
                                <el-upload class="upload-demo col-md-12"
                                    action="https://jsonplaceholder.typicode.com/posts/" :on-change="handleF1"
                                    accept="application/pdf" :on-preview="handlePreview" :on-remove="handleRemoveF1"
                                    multiple :limit="1" :on-exceed="handleExceed" :auto-upload="false" ref="upload">
                                    <vs-button type="primary"
                                        style="background-color: #af8909; border-color: #af8909;"><strong
                                            style="color: white !important;">Clic
                                            para
                                            subir
                                            archivo</strong></vs-button>
                                    <div slot="tip" class="el-upload__tip">Solo archivos de tipo PDF
                                    </div>
                                </el-upload>
                                <div class="danger-message">
                                    <template v-if="errorF1 == 1">
                                        Seleccione un archivo para subir
                                    </template>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mx-12 mb-12 p-4">
                    <div class="col-sm-4 col-md-2 col-xl-2 px-0 pr-sm-5 pb-5">
                        <label class="col-form-label">Seguimiento</label>
                        <vs-select placeholder="Seleccione una opción" v-model="seguimiento"
                            v-if="cat_seguimiento.length > 0" :color="colors[0].color" filter autocomplete="off">
                            <template #message-danger v-if="errorSeguimiento.length > 0">
                                {{ errorSeguimiento }}
                            </template>
                            <vs-option v-for="(item, index) in cat_seguimiento" :key="index" :label="item.nombre"
                                :value="item.idSeguimiento">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                    <div class="col-sm-8 col-md-6 col-xl-4 px-0 pr-sm-5 pb-5">
                        <label class="col-form-label">Copias de Conocimiento</label>
                        <vs-select multiple filter
                            :placeholder="(copiasConocimiento.length > 0) ? '' : 'Seleccione una opción'"
                            v-model="copiasConocimiento" v-if="cat_departamentos.length > 0" autocomplete="off"
                            :color="colors[0].color">
                            <template #message-danger v-if="errorCopiasConocimiento.length > 0">
                                {{ errorCopiasConocimiento }}
                            </template>
                            <vs-option v-for="(item, index) in cat_departamentos" :key="index" :label="item.nombre"
                                :value="item.id">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            colors: [
                {
                    color: 'warn'
                }
            ],
            tipoDoc: '',
            Capitulo: '',
            catCapitulo: [
                {
                    id: 1,
                    serie: 2000
                },
                {
                    id: 1,
                    serie: 3000
                },
                {
                    id: 1,
                    serie: 5000
                }
            ],
            catTipoDoc: [],
            cat_departamentos: [],
            errorTipoDoc: '',
            areaAsignada: '',
            errorAreaAsignada: '',
            errorF1: '',
            fechaRecibido: '',
            errorFechaRecibido: '',
            hora: '',
            errorHora: '',
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
            seguimiento: '',
            cat_seguimiento: [],
            errorSeguimiento: '',
            copiasConocimiento: '',
            errorCopiasConocimiento: '',
            errorCopiasConocimiento: '',
        }

    },
    mounted() {
        this.getTipoDic()
        this.obtenerDatos(5)
        this.obtenerDatos(6)
    },
    methods: {
        handleF1(file, fileList) {
            this.documentos.F1 = this.handleChange(file, fileList);
        },
        handlePreview(file) {
        },
        handleRemoveF1(file, fileList) {
            this.documentos.F1 = ''
        },
        handleExceed(files, fileList) {
            Swal.fire({
                icon: 'error',
                title: 'Solo puede subir un documento para acreditar.',
                showConfirmButton: true,
                confirmButtonText: 'De acuerdo',
            });
        },
        handleChange(file, fileList) {
            // if (file.size > 5242880) {
            //     this.$refs.upload.clearFiles();
            //     Swal.fire({
            //         icon: 'error',
            //         html: '<div class="col"><div class="swal2-title p-0 mb-2">¡El archivo excede el límite de carga permitido!</div><div class="swal2-title font-weight-normal p-0" style="font-size: 20px">Seleccione uno con menor peso</div></div>',
            //         showConfirmButton: true,
            //         confirmButtonText: 'De acuerdo',
            //     });

            //     return '';

            // } else {
            return file.raw;
            // }
        },
        getTipoDic() {
            let url = '/administracion/usuario/getTipoDic'
            axios.get(url).then(response => {
                this.catTipoDoc = response.data
            }).catch((err) => {
                console.log(err);
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            axios.get(url, {
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
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);

            });
        },
    },
}
</script>

<style></style>