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
                            Editar Usuario
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
                            <h3 class="card-title"> Formulario para editar un usuario </h3>
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
                            <form role="form" class="container-fluid">
                                <div class="row ">
                                    <div class="col-md-6 pr-lg-5 mt-2 mt-sm-0">
                                        <div class="form-group col">
                                            <label class="row ">Primer Nombre</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Primer Nombre"
                                                    v-model="fillEditarUsuario.cPrimerNombre">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row ">Segundo Nombre</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Segundo Nombre"
                                                    v-model="fillEditarUsuario.cSegundoNombre">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row">Apellido</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Apellidos" v-model="fillEditarUsuario.cApellido">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row">Usuario</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Usuario" v-model="fillEditarUsuario.cUsuario">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row">Correo Electronico</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="email"
                                                    placeholder="Correo Electronico"
                                                    v-model="fillEditarUsuario.cCorreo"></vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row">Contraseña</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''"
                                                    placeholder="Ingresar una contraseña"
                                                    v-model="fillEditarUsuario.cContrasena" show-password
                                                    type="password"></vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row">Rol</label>
                                            <div class="row">
                                                <el-select v-model="fillEditarUsuario.nIdRol"
                                                    placeholder="Seleccione un Rol" clearable>
                                                    <el-option v-for="item in listaRoles" :key="item.id"
                                                        :label="item.name" :value="item.id"></el-option>
                                                </el-select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row">Departamento</label>
                                            <div class="row">
                                                <el-select v-model="fillEditarUsuario.nIdDepartamento"
                                                    placeholder="Seleccione un Departamento" clearable>
                                                    <el-option v-for="item in listarDepartamentos"
                                                        :key="item.id_departamento" :label="item.departamento"
                                                        :value="item.id_departamento">{{ item.departamento }}
                                                    </el-option>
                                                </el-select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row">Folio</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Ingresar el folio" v-model="fillEditarUsuario.nFolio"
                                                    show-password> </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row">Fecha Alta</label>
                                            <div class="row">
                                                <el-date-picker class="wFull" v-model="fillEditarUsuario.dFechaAlta"
                                                    type="date" format="dd-MM-yyyy"
                                                    placeholder="Seleccione una fecha" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="d-flex flex-wrap flex-sm-nowrap flex-row mb-4 btnResSize mx-auto">
                            <vs-button color="rgb(175, 137, 9)" class="mr-1" warn block
                                @click.prevent="setEditarUsuario">
                                <b>
                                    Editar
                                </b>
                            </vs-button>
                            <vs-button transparent dark block black @click.prevent="limpiarRegistroUsuario">
                                <b>
                                    Limpiar
                                </b>
                            </vs-button>
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
            fillEditarUsuario: {
                nIdUsuario: this.$attrs.id,
                nIdRol: '',
                cPrimerNombre: '',
                cSegundoNombre: '',
                cApellido: '',
                cUsuario: '',
                cCorreo: '',
                cContrasena: '',
                oFotografia: '',
                nIdFotografia: 0,
                nIdDepartamento: '',
                nIdCargo: '',
                nFolio: '',
                dFechaAlta: ''

            },
            listaRoles: [],
            listarDepartamentos: [],
            listarCargo: [],
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
            mensajeError: []
        }
    },
    mounted() {
        this.getUsuarioById();
        this.getListarRoles();
        // this.getListarDepartamentos();
        // this.getListarCargos();
    },
    methods: {
        getUsuarioById() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/getListarUsuarios'
            axios.get(url, {
                params: {
                    'nIdUsuario': this.fillEditarUsuario.nIdUsuario,
                }
            }).then(response => {
                this.fillEditarUsuario.cPrimerNombre = response.data[0].firstname;
                this.fillEditarUsuario.cSegundoNombre = response.data[0].secondname;
                this.fillEditarUsuario.cApellido = response.data[0].lastname;
                this.fillEditarUsuario.cUsuario = response.data[0].username;
                this.fillEditarUsuario.cCorreo = response.data[0].email;
                this.fillEditarUsuario.nIdFotografia = response.data[0].image_id;
                this.fillEditarUsuario.nIdDepartamento = response.data[0].departamento;
                this.fillEditarUsuario.nIdCargo = response.data[0].cargo;
                this.fillEditarUsuario.nFolio = response.data[0].folio;
                this.fillEditarUsuario.dFechaAlta = response.data[0].fecha_alta;
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
        getListarRoles() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/rol/getListarRoles'
            axios.get(url).then(response => {
                this.listaRoles = response.data;
                setTimeout(() => {
                    loading.close();
                }, 0);
                this.getRolByUsuario();
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
        getRolByUsuario() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/getRolByUsuario'
            axios.get(url, {
                params: {
                    'nIdUsuario': this.fillEditarUsuario.nIdUsuario
                }
            }).then(response => {
                this.fillEditarUsuario.nIdRol = (response.data.length == 0) ? '' : response.data[0].nIdRol;
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
        setEditarRolByUsuario(loading) {
            var url = '/administracion/usuario/setEditarRolByUsuario';
            axios.post(url, {
                'nIdUsuario': this.fillEditarUsuario.nIdUsuario,
                'nIdRol': this.fillEditarUsuario.nIdRol,

            }).then(response => {
                setTimeout(() => {
                    loading.close();
                    Swal.fire({
                        icon: 'success',
                        title: 'Se actualizo el usuario correctamente',
                        showConfirmButton: false,
                        timer: 1500
                    });
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
        abrirModal() {
            this.modalShow = !this.modalShow;
        },
        getFile(e) {
            this.fillEditarUsuario.oFotografia = e.target.files[0];
        },
        setEditarUsuario() {
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
            if (!this.fillEditarUsuario.oFotografia || this.fillEditarUsuario.oFotografia == undefined) {
                this.setGuardarUsuario(this.fillEditarUsuario.nIdFotografia, loading);
            } else {
                this.setRegistrarArchivo(loading);
            }
        },
        setRegistrarArchivo(loading) {
            this.form.append('file', this.fillEditarUsuario.oFotografia);
            const config = { headers: { 'Content-Type': 'multipart/form-data' } };
            var url = '/archivos/setRegistrarArchivos';
            axios.post(url, this.form, config).then(response => {
                var nIdFile = response.data[0].nIdFile;
                this.setGuardarUsuario(nIdFile, loading);
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
            var url = '/administracion/usuario/setEditarUsuario';
            axios.post(url, {
                'nIdUsuario': this.fillEditarUsuario.nIdUsuario,
                'cPrimerNombre': this.fillEditarUsuario.cPrimerNombre,
                'cSegundoNombre': this.fillEditarUsuario.cSegundoNombre,
                'cApellido': this.fillEditarUsuario.cApellido,
                'cUsuario': this.fillEditarUsuario.cUsuario,
                'cCorreo': this.fillEditarUsuario.cCorreo,
                'cContrasena': this.fillEditarUsuario.cContrasena,
                'oFotografia': nIdFile,
                'nIdDepartamento': this.fillEditarUsuario.nIdDepartamento,
                'nIdCargo': this.fillEditarUsuario.nIdCargo,
                'nFolio': this.fillEditarUsuario.nFolio,
                'dFechaAlta': this.fillEditarUsuario.dFechaAlta,
            }).then(response => {
                this.setEditarRolByUsuario(loading);
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
        validarRegistroUsuario() {
            this.error = 0;
            this.mensajeError = [];

            if (!this.fillEditarUsuario.cPrimerNombre) {
                this.mensajeError.push("El Nombre(s) es un campo obligatorio");
            }
            if (!this.fillEditarUsuario.cApellido) {
                this.mensajeError.push("El Apellido Paterno es un campo obligatorio");
            }
            if (!this.fillEditarUsuario.cUsuario) {
                this.mensajeError.push("El Usuario es un campo obligatorio");
            }
            if (!this.fillEditarUsuario.nIdRol) {
                this.mensajeError.push("El Rol es un campo obligatorio");
            }
            if (!this.fillEditarUsuario.nIdDepartamento) {
                this.mensajeError.push("El Departamento es un campo obligatorio");
            }
            if (this.mensajeError.length) {
                this.error = 1;
            }
            return this.error;
        },
        limpiarRegistroUsuario() {
            this.fillEditarUsuario.cPrimerNombre = '';
            this.fillEditarUsuario.cSegundoNombre = '';
            this.fillEditarUsuario.cApellido = '';
            this.fillEditarUsuario.cUsuario = '';
            this.fillEditarUsuario.cCorreo = '';
            this.fillEditarUsuario.cContrasena = '';
            this.fillEditarUsuario.oFotografia = '';
            this.fillEditarUsuario.nIdDepartamento = '';
            this.fillEditarUsuario.nIdCargo = '';
            this.fillEditarUsuario.nFolio = '';
            this.fillEditarUsuario.dFechaAlta = '';
            this.fillEditarUsuario.cPlaz = '';
        }
    }
}
</script>