<template>
    <div class="col">
        <div class="float-sm-right mr-5">
            <ul class="breadcrumb">
                <li>
                    <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                </li>
                <li class="breadActive">
                    <span>
                        Recordatorios
                    </span>
                </li>
            </ul>
        </div>
        <div class="row col-md-11 col-10 mx-auto card card-info  px-0"
            style="border-radius: 1.25rem !important; margin-bottom: 2.7rem; box-shadow: var(--iee-shadow) !important;">
            <div class="card-header">
                <h3 class="col card-title font-weight-bold">Recordatorios</h3>
            </div>
            <div class=" p-4 container-fluid" style="background-color: var(--iee-white) !important;">
                <div class="row mx-12 mb-12 p-4">
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Correo Correspondencia</label>
                        <vs-input color="#C2B280" icon-after placeholder="Correo Correspondencia"
                            v-model="errorCorreoCorrespondencia"
                            :state="(errorCorreoCorrespondencia.length > 0) ? 'danger' : ''" autocomplete="off">
                            <template v-if="validEmail" #message-success>
                                Correo Valido
                            </template>
                            <template v-if="!validEmail" #message-danger>
                                Correo Invalido
                            </template>
                            <template v-else #message-danger v-if="errorCorreoCorrespondencia.length > 0">
                                {{ errorCorreoCorrespondencia }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Fecha</label>
                        <el-date-picker type="date" placeholder="Fecha" format="dd-MM-yyyy" value-format="yyyy-MM-dd"
                            v-model="fecha">
                        </el-date-picker>
                        <div class="danger-message">
                            <template v-if="errorFecha.length > 0">
                                {{ errorFecha }}
                            </template>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-3 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Hora</label>
                        <el-time-picker placeholder="Fecha" v-model="hora">
                        </el-time-picker>
                        <div class="danger-message">
                            <template v-if="errorHora.length > 0">
                                {{ errorHora }}
                            </template>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-xl-12 px-0 pr-sm-5 pb-3">
                        <label class="col-form-label">Mensaje</label>
                        <br>
                        <el-input id="observaciones" color="#C2B280" placeholder="Escriba su Mensaje"
                            type="textarea" :rows="2" v-model="mensaje" autocomplete="off">
                        </el-input>
                        <div class="danger-message">
                            <template v-if="errorMensaje.length > 0">
                                Seleccione un archivo para subir
                            </template>
                        </div>
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
                },
            ],
            correoCorrespondencia: '',
            fecha: '',
            hora: '',
            mensaje: '',
            errorCorreoCorrespondencia: '',
            errorFecha: '',
            errorHora: '',
            errorMensaje: ''
        }
    },
    computed: {
        validEmail() {
            return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.correoCorrespondencia)
        }
    },
    mounted() {

    },
    methods: {

    }
};

</script>

<style></style>