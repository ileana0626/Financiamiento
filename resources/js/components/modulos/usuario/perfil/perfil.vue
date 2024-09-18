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
                            <span>Mi Perfil</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card cardRounded py-3 px-3 px-md-5" :class="!!darkMode ? 'shadow-lg-dark' : 'shadow-lg'" :key="'c1' + darkMode">
                    <div class="row pb-4 d-flex justify-content-center justify-content-lg-start mb-3">
                        <div class="col-12 col-lg-6 col-xl-4 row justify-content-center mb-lg-0 rounded-soft p-3 iee-white">
                            <div class="col-12 d-flex justify-content-center pb-2">
                                <div class="portrait-perfil bg-white">
                                    <img src="/img/user_default.svg" alt="Foto de perfil">
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-center pb-2">
                                <span class="nametag-perfil">{{ nombreCompleto }}</span>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                                <span class="badge bg-light" style="font-size: small;">{{ datosPersonales.rol }}</span>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 col-xl-4 ml-0 ml-md-3 d-flex justify-content-center row center">
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <el-tooltip placement="top-start" :visible-arrow="false">
                                    <div>
                                        <i class="far fa-envelope font-txt-theme"></i><span class="pl-3">{{ datosPersonales.email }}</span>
                                    </div>
                                    <div slot="content">
                                        Correo electrónico
                                    </div>
                                </el-tooltip>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <el-tooltip placement="top-start" :visible-arrow="false">
                                    <div>
                                        <i class="fas fa-mobile-alt font-txt-theme"></i><span class="pl-3">{{ datosPersonales.numCelular }}</span>
                                    </div>
                                    <div slot="content">
                                        Teléfono celular
                                    </div>
                                </el-tooltip>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <el-tooltip placement="top-start" :visible-arrow="false">
                                    <div>
                                        <i class="fas fa-calendar-day font-txt-theme"></i><span class="pl-3">{{ formatoFecha(datosPersonales.fechaNacimiento) }}</span>
                                    </div>
                                    <div slot="content">
                                        Fecha de nacimiento
                                    </div>
                                </el-tooltip>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <el-tooltip placement="top-start" :visible-arrow="false">
                                    <div>
                                        <i class="fas fa-birthday-cake font-txt-theme"></i><span class="pl-3">{{ calculaEdad(datosPersonales.fechaNacimiento) }}</span>
                                    </div>
                                    <div slot="content">
                                        Edad
                                    </div>
                                </el-tooltip>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                            </div>
                        </div>
                    </div>
                    <div class="edit-btn-perfil">
                        <vs-button block :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'edit'+darkMode" @click.prevent="editRedirect()">
                            <div style="color: var(--btn-txt-color); font-weight: 700;">
                                <i class="fas fa-user-edit pr-2" style="font-size: 0.8125rem !important;"></i>Editar
                            </div>
                        </vs-button>
                    </div>
                </div>
                <div class="row pt-4">
                    <div class="col-12 col-md-6 card-info">
                        <div class="card-header d-flex">
                            <h3 class="card-title font-weight-bold">Actualizar contraseña</h3>
                        </div>
                        <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                            <div class="row">
                                <div class="col-12 col-xl-10 px-3 pb-3">
                                    <label class="col-form-label">Contraseña actual</label>
                                    <vs-input id="contrasenaActual" type="password" color="#C2B280" icon-after v-model="passActual"
                                        placeholder="Escriba su contraseña actual" autocomplete="off">
                                    </vs-input>
                                </div>
                                <div class="col-12 col-xl-6 px-3 pb-3">
                                    <label class="col-form-label">Nueva contraseña</label>
                                    <vs-input id="contrasenaNueva" type="password" color="#C2B280" icon-after v-model="passNueva"
                                        placeholder="Escriba la nueva contraseña" autocomplete="off">
                                    </vs-input>
                                </div>
                                <div class="col-12 col-xl-6 px-3 pb-3">
                                    <label class="col-form-label">Confirmar contraseña</label>
                                    <vs-input id="contrasenaConfirma" type="password" color="#C2B280" icon-after v-model="passConfirmar"
                                        placeholder="Confirme la nueva contraseña" autocomplete="off">
                                    </vs-input>
                                </div>
                                <div class="col-12 px-3 d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'limpiar'+darkMode" @click.prevent="limpiarContrasena()">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                        </div>
                                    </vs-button>      
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar
                                        </div>
                                    </vs-button>                                
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>            
            </div>
        </div>
    </div>
</template>

<script>
import methods from '../../../../methods';
export default {
    props:['id'],
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',

            passActual: '',
            passNueva: '',
            passConfirmar: '',
            
            datosPersonales: {
                Nombre: '',
                Apaterno: '',
                Amaterno: '',
                email: 'No disponible',
                id_DP: null,
                fechaNacimiento: 'No disponible',
                numCelular: 'No disponible',
                edad: 'No disponible',
                rol: 'No disponible'
            },
        }
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
    },
    async mounted(){
        const load = methods.loading( this.$vs );
        await this.getDatosPersonalesById();
        load.close();
    },
    computed:{
        nombreCompleto(){
            return this.datosPersonales.Nombre + ' ' + this.datosPersonales.Apaterno + ' ' + this.datosPersonales.Amaterno;
        },
        formatoFecha() {
            return( strFecha ) => {
                if(strFecha){
                    let temp = strFecha;
                    const dFecha = new Date(temp + " 00:00:00-05:00");
                    return dFecha.toLocaleString('es-Es',{day:'2-digit', month:'long', year: 'numeric'});
                } else return 'No disponible';
            }
        },
        calculaEdad() {
            return( strFecha ) => {
                if(strFecha){
                    let temp = strFecha;
                    const dFecha = new Date(temp + " 00:00:00-05:00");
                    const hoy = new Date();
                    return `${hoy.getFullYear() - dFecha.getFullYear()} años`;
                } else return 'No disponible';
            }
        },
    },
    methods: {
        editRedirect(){
            this.$router.push(`/perfil/editar/${this.id}`);
        },
        limpiarContrasena(){
            this.passActual = '';
            this.passNueva = '';
            this.passConfirmar = '';
        },
        async getDatosPersonalesById() {
            const url = '/administracion/usuario/getDatosPersonalesById';

            try {
                const response = await axios.get(url, {
                    params: {
                        'nId': this.id
                    }
                });

                if(response.status === 200){
                    let datos = response.data[0];
                    this.datosPersonales.Nombre = datos.Nombre;
                    this.datosPersonales.Apaterno = datos.Apaterno;
                    this.datosPersonales.Amaterno = datos.Amaterno;
                    this.datosPersonales.email = (datos.email) ? datos.email : 'No disponible';
                    this.datosPersonales.id_DP = datos.id_DP;
                    this.datosPersonales.fechaNacimiento = datos.fechaNacimiento;
                    this.datosPersonales.numCelular = (datos.numCelular) ? datos.numCelular : 'No disponible';
                    this.datosPersonales.rol = datos.rol;
                }
            } catch (error) {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            }
        },
    }
}
</script>

<style scoped>

</style>