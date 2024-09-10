<template>
    <div class="content-header">
        <div class="container-fluid mb-5">
            <!-- Breadcrumb (navegacion) -->
            <div class="float-sm-right mr-5">
                <ul class="breadcrumb">
                    <!-- <li>
                        <a href="/">Inicio</a>
                    </li> -->
                    <li>
                        <a href="/usuario">Administración</a>
                    </li>
                    <li>
                        <a href="/usuario">Usuario</a>
                    </li>
                    <li class="breadActive">
                        <span>
                            Crear Usuario
                        </span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="card-body">
                <div class="container-fluid">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title"> Registro de un nuevo usuario </h3>
                            <div class="card-tools">
                                <router-link class="btn btn-flat btn-sm btn-nuevos" :to="'/usuario'"
                                    style=" color : white !important ;">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-arrow-left pr-2"></i> <span> Regresar </span>
                                    </div>
                                </router-link>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="container-fluid" role="form">
                                <div class="row">
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Nombre(s)</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Nombre(s)" v-model="fillCrearUsuario.cPrimerNombre">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Apellido Paterno</label>
                                            <div class="row">
                                                <vs-input danger :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Apellido Paterno"
                                                    v-model="fillCrearUsuario.cSegundoNombre">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Apellido Materno</label>
                                            <div class="row">
                                                <vs-input danger :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Apellido Materno" v-model="fillCrearUsuario.cApellido">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Usuario</label>
                                            <div class="row">
                                                <vs-input danger :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Usuario" v-model="fillCrearUsuario.cUsuario">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Correo Electrónico</label>
                                            <div class="row">
                                                <vs-input danger :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Correo Electrónico" v-model="fillCrearUsuario.cCorreo">
                                                    <template v-if="!validEmail && fillCrearUsuario.cCorreo !== ''"
                                                        #message-danger>
                                                        Correo electrónico inválido
                                                    </template>
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Contraseña</label>
                                            <div class="row">
                                                <vs-input danger :state="(error) ? 'danger' : ''" type="password"
                                                    placeholder="Ingresar una contraseña"
                                                    v-model="fillCrearUsuario.cContrasena" show-password>
                                                    <template #message-danger>
                                                        La contraseña debe de tener al menos 8 caracteres
                                                    </template>
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Rol</label>
                                            <div class="row">
                                                <el-select v-model="fillCrearUsuario.nIdRol"
                                                    placeholder="Seleccione un Rol">
                                                    <el-option v-for="item in listaRoles" :key="item.id"
                                                        :label="item.name" :value="item.id">{{ item.name }}</el-option>
                                                </el-select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Departamento</label>
                                            <div class="row">
                                                <el-select v-model="fillCrearUsuario.nIdDepartamento"
                                                    placeholder="Seleccione un Departamento">
                                                    <el-option v-for="item in listarDepartamentos"
                                                        :key="item.id_departamento" :label="item.departamento"
                                                        :value="item.id_departamento">{{ item.departamento }}
                                                    </el-option>
                                                </el-select>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Cargo</label>
                                            <div class="row">
                                                <el-select v-model="fillCrearUsuario.nIdCargo"
                                                    placeholder="Seleccione un Cargo">
                                                    <el-option v-for="item in listarCargo" :key="item.id_cargo"
                                                        :label="item.cargo" :value="item.id_cargo">{{ item.cargo }}
                                                    </el-option>
                                                </el-select>
                                            </div>
                                        </div>
                                    </div> -->
                                    <!-- <div class="col-md-6 pl-lg-4 ml-lg-auto"> -->
                                    <!-- <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Fotografia</label>
                                            <div class="row">
                                                <vs-input type="file" @change="getFile"> </vs-input>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Folio</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Ingresar el folio"
                                                    v-model="fillCrearUsuario.nFolio" show-password />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Fecha Alta</label>
                                            <div class="row">
                                                <el-date-picker class="wFull" v-model="fillCrearUsuario.dFechaAlta"
                                                    type="date" format="dd-MM-yyyy"
                                                    placeholder="Seleccione una fecha" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Tipo de Plaza</label>
                                            <div class="row">
                                                <el-select v-model="fillCrearUsuario.cPlaza"
                                                    placeholder="Seleccione una Plaza">
                                                    <el-option v-for="item in listarPlaza" :key="item.id"
                                                        :label="item.plaza" :value="item.id">{{ item.plaza }}
                                                    </el-option>
                                                </el-select>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </form>
                        </div>
                        <div class="d-flex flex-wrap flex-sm-nowrap flex-row mb-4 btnResSize mx-auto">
                            <vs-button color="rgb(175, 137, 9)" class=" mr-1" warn block
                                @click.prevent="setRegistrarUsuario">
                                <b>
                                    Registrar
                                </b>
                            </vs-button>
                            <vs-button transparent dark block black @click.prevent="limpiarRegistroUsuario">
                                <b>
                                    Limpiar
                                </b>
                            </vs-button>
                            <!-- <vs-button class="botonder" block flat dark @click.prevent="generarContrasenas" >contraseña</vs-button> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" :class="{ show: modalShow }" :style="modalShow ? mostrarModal : ocultarModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Examen de conocimientos en materia electoral</h5>
                        <button class="close" @click="abrirModal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="callout callout-danger" style="padding: 5px" v-for="(item, index) in mensajeError"
                            :key="index" v-text="item"></div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" @click="abrirModal">Cerrar</button>
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
            fillCrearUsuario: {
                nIdRol: '',
                cPrimerNombre: '',
                cSegundoNombre: '',
                cApellido: '',
                cUsuario: '',
                cCorreo: '',
                cContrasena: '',
                oFotografia: '',
                nIdDepartamento: '',
                // nIdCargo: '',
                nFolio: '',
                dFechaAlta: '',
                // cPlaza: '',
            },
            listaRoles: [],
            listarDepartamentos: [],
            // listarCargo: [],
            // listarPlaza: [],
            form: new FormData,
            fullscreenLoading: false,
            modalShow: false,
            mostrarModal: {
                display: 'block',
                background: 'rgba( 0 , 0 , 0 , 0.38 )'
            },
            ocultarModal: {
                display: 'none'
            },
            error: 0,
            mensajeError: [],
            id: 0
        }
    },
    mounted() {
        this.getListarRoles();
        this.getListarDepartamentos();
        // this.getListarCargos();
        // this.getListarPlazas();
    },
    computed: {
        validEmail() {
            return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.fillCrearUsuario.cCorreo)
        },
        validPassw(){
            if(this.fillCrearUsuario.cContrasena.length <= 8){
                return true;
            }
            else{
                return false;
            }
        }
    },
    methods: {
        abrirModal() {
            this.modalShow = !this.modalShow;
        },
        getFile(e) {
            this.fillCrearUsuario.oFotografia = e.target.files[0];
        },
        getListarRoles() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/rol/getListarRoles';
            axios.get(url).then(response => {
                this.listaRoles = response.data;
                setTimeout(() => {
                    loading.close();
                }, 0);
            }).catch(error => {

                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        getListarDepartamentos() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/departamento/getListarDepartamentos';
            axios.get(url).then(response => {
                this.listarDepartamentos = response.data;
                setTimeout(() => {
                    loading.close();
                }, 0);
            }).catch(error => {

                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        setRegistrarUsuario() {
            if (this.validarRegistroUsuario()) {
                this.modalShow = true;
                return;
            }
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            if (!this.fillCrearUsuario.oFotografia || this.fillCrearUsuario.oFotografia == undefined) {
                this.setGuardarUsuario(0, loading);
            } else {
                this.setRegistrarArchivo(loading);
            }
        },
        setRegistrarArchivo(loading) {
            this.form.append('file', this.fillCrearUsuario.oFotografia);
            const config = { headers: { 'Content-Type': 'multipart/form-data' } };
            var url = '/archivos/setRegistrarArchivos';
            axios.post(url, this.form, config).then(response => {
                var nIdFile = response.data[0].nIdFile;
                this.setGuardarUsuario(nIdFile, loading);
            });
        },
        getListarCargos() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/getListarCargos';
            axios.get(url).then(response => {
                this.listarCargo = response.data;
                setTimeout(() => {
                    loading.close();
                }, 0);
            }).catch(error => {

                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        getListarPlazas() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/getListarPlazas';
            axios.get(url).then(response => {
                this.listarPlaza = response.data;
                setTimeout(() => {
                    loading.close();
                }, 0);
            }).catch(error => {

                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        setGuardarUsuario(nIdFile, loading) {
            var url = '/administracion/usuario/setRegistrarUsuario';
            let fechaRaw = this.fillCrearUsuario.dFechaAlta;
            let fechaCorta = fechaRaw.toLocaleDateString("fr-CA");
            // let fechaMySQL =  fechaCorta.replaceAll('/', '-');
            axios.post(url, {
                'cPrimerNombre': this.fillCrearUsuario.cPrimerNombre,
                'cSegundoNombre': this.fillCrearUsuario.cSegundoNombre,
                'cApellido': this.fillCrearUsuario.cApellido,
                'cUsuario': this.fillCrearUsuario.cUsuario,
                'cCorreo': this.fillCrearUsuario.cCorreo,
                'cContrasena': this.fillCrearUsuario.cContrasena,
                'oFotografia': nIdFile,
                'nIdDepartamento': this.fillCrearUsuario.nIdDepartamento,
                // 'nIdCargo': this.fillCrearUsuario.nIdCargo,
                'nFolio': this.fillCrearUsuario.nFolio,
                'dFechaAlta': fechaCorta,
                // 'nIdPlaza': this.fillCrearUsuario.cPlaza

            }).then(response => {
                this.setEditarRolByUsuario(response.data, loading);
            }).catch(error => {

                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
                if (error.response.status == 500) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    Swal.fire({
                        icon: 'error',
                        title: 'Ha ocurrido un error, verifica que los datos sean correctos e inténtalo de nuevo',
                        showConfirmButton: true
                    });
                }
            });
        },
        validarRegistroUsuario() {
            this.error = 0;
            this.mensajeError = [];

            if (!this.fillCrearUsuario.cPrimerNombre) {
                this.mensajeError.push("El Nombre(s) es un campo obligatorio");
            }
            if (!this.fillCrearUsuario.cApellido) {
                this.mensajeError.push("El Apellido Paterno es un campo obligatorio");
            }
            if (!this.fillCrearUsuario.cUsuario) {
                this.mensajeError.push("El Usuario es un campo obligatorio");
            }
            if (!this.fillCrearUsuario.cContrasena) {
                this.mensajeError.push("La Contraseña es un campo obligatorio");
            }
            if (!this.fillCrearUsuario.nIdRol) {
                this.mensajeError.push("El Rol es un campo obligatorio");
            }
            if (!this.fillCrearUsuario.nIdDepartamento) {
                this.mensajeError.push("El Departamento es un campo obligatorio");
            }
            // if (!this.fillCrearUsuario.cPlaza) {
            //     this.mensajeError.push("La Plaza es un campo obligatorio");
            // }
            if (this.mensajeError.length) {
                this.error = 1;
            }
            return this.error;
        },
        setEditarRolByUsuario(nIdUsuario, loading) {
            var url = '/administracion/usuario/setEditarRolByUsuario';
            axios.post(url, {
                'nIdUsuario': nIdUsuario,
                'nIdRol': this.fillCrearUsuario.nIdRol,

            }).then(response => {

                setTimeout(() => {
                    loading.close();
                }, 0);
                this.$router.push('/usuario');
            }).catch(error => {

                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        limpiarRegistroUsuario() {
            this.fillCrearUsuario.cPrimerNombre = '';
            this.fillCrearUsuario.cSegundoNombre = '';
            this.fillCrearUsuario.cApellido = '';
            this.fillCrearUsuario.cUsuario = '';
            this.fillCrearUsuario.cCorreo = '';
            this.fillCrearUsuario.cContrasena = '';
            this.fillCrearUsuario.oFotografia = '';
            this.fillCrearUsuario.nIdDepartamento = '';
            // this.fillCrearUsuario.nIdCargo = '';
            this.fillCrearUsuario.nFolio = '';
            this.fillCrearUsuario.dFechaAlta = '';
            // this.fillCrearUsuario.cPlaza = '';
        }
    }
}
</script>

<style>
/* .vs-input-parent--state-danger .vs-input{
    background: rgba(242, 19, 93, .2) !important;
    background-color: rgba(242, 19, 93, .2) !important;
    color: rgba(10, 19, 93,1);
    border-radius: 14px !important;
} */
</style>