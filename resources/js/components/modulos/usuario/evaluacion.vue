<template>
    <div class="content-header">
        <div class="container-fliud">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Asignar Personal a Evaluar</h1>
                </div>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="card">
                <div class="card-header">
                    <div class="card-tools">
                        <router-link class="btn btn-flat btn-sm btn-nuevos" :to="'/usuario'" style=" color : white !important ;">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-arrow-left pr-2"></i> <span> Regresar </span>
                            </div>
                        </router-link>
                    </div>
                </div>
                <div class="card-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card card-info">
                                    <div class="card-header">
                                        <h3 class="card-title"> Listar personas que pueden evaluar {{ cNombreUsuario }}
                                        </h3>
                                    </div>
                                    <div class="card-body table-responsive">
                                        <template v-if="listarUsuariosEvaluar.length">
                                            <div class="scrollTable">
                                                <table class="table table-hover table-head-fixed text-nowrap projects">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Apellidos</th>
                                                            <th>Departamento</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="(item, index) in listarUsuariosEvaluar" :key="index">
                                                            <td>{{ item.firstname + ' ' + item.secondname }}</td>
                                                            <td v-text="item.lastname"></td>
                                                            <td v-text="item.departamento"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </template>
                                        <template v-else>
                                            <div class="callout callout-info">
                                                <h5>No se encuentraron resultados...</h5>
                                            </div>
                                        </template>
                                    </div>
                                    <div class="card-footer">
                                        <vs-button class="botonizq" flat warn
                                            @click.prevent="setRegistrarUsuariosEvaluar">Registrar</vs-button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-info">
                                    <div class="card-header">
                                        <h3 class="card-title"> Listado de personal </h3>
                                    </div>
                                    <div class="card-body table-responsive">
                                        <template v-if="filterContactos.length">
                                            <div class="input-group search-contact">
                                                <input type="search" class="form-control"
                                                    placeholder="Buscar Departamento" v-model="cBuscarContacto">
                                            </div>
                                            <div class="scrollTable">
                                                <table class="table table-hover table-head-fixed text-nowrap projects">
                                                    <thead>
                                                        <tr>
                                                            <th>Acción</th>
                                                            <th>Nombre</th>
                                                            <th>Apellidos</th>
                                                            <th>Departamento</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="(item, index) in filterContactos" :key="index">
                                                            <td>
                                                                <el-checkbox v-model="item.checked"></el-checkbox>
                                                            </td>
                                                            <td>{{ item.firstname + ' ' + item.secondname }}</td>
                                                            <td v-text="item.lastname"></td>
                                                            <td v-text="item.departamento"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </template>
                                        <template v-else>
                                            <div class="callout callout-info">
                                                <h5>No se encuentraron resultados...</h5>
                                            </div>
                                        </template>
                                    </div>
                                </div>
                            </div>
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
            fillPermiso: {
                nIdUsuario: this.$attrs.id,
            },
            cNombreUsuario: this.$attrs.name,
            listarUsuariosEvaluar: [],
            listUsuarios: [],
            listaUsuariosFilter: [],
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
            listRolPermisosByUsuario: [],
            listRolPermisosByUsuarioFilter: [],
            cBuscarContacto: ''
        }
    },
    mounted() {
        this.getListarUsuariosParaEvaluar();
        this.getListarEvaluadosByUsuario();
    },
    computed: {
        filterContactos() {
            return this.listaUsuariosFilter.filter(listaUsuariosFilter => {
                return (listaUsuariosFilter.departamento.toLowerCase().indexOf(this.cBuscarContacto.toLowerCase()) != -1);
            });
        }
    },
    methods: {
        abrirModal() {
            this.modalShow = !this.modalShow;
        },
        getListarEvaluadosByUsuario() {
            let ruta = '/administracion/usuario/getListarEvaluadosByUsuario';
            axios.get(ruta, {
                params: {
                    'nIdUsuario': this.fillPermiso.nIdUsuario
                }
            }).then(response => {
                this.listarUsuariosEvaluar = response.data;
            }).catch(error => {
                if (error.response.status == 401) {
                    this.fullscreenLoading = false;
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        getListarUsuariosParaEvaluar() {
            let ruta = '/administracion/usuario/getListarUsuariosParaEvaluar';
            axios.get(ruta, {
                params: {
                    'nIdUsuario': this.fillPermiso.nIdUsuario
                }
            }).then(response => {
                this.listUsuarios = response.data;
                this.filterUsuariosByRol();
            }).catch(error => {
                if (error.response.status == 401) {
                    this.fullscreenLoading = false;
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        setRegistrarUsuariosEvaluar() {
            if (this.validarRegistrarUsuariosEvaluar()) {
                this.modalShow = true;
                return;
            }
            this.fullscreenLoading = true;
            let url = '/administracion/usuario/setRegistrarUsuariosEvaluar';
            axios.post(url, {
                'nIdUsuario': this.fillPermiso.nIdUsuario,
                'listUsuariosFilter': this.listaUsuariosFilter,
            }).then(response => {
                this.getListarEvaluadosByUsuario();
                this.filterListarRolPermisosByUsuario();
            }).catch(error => {
                if (error.response.status == 401) {
                    this.fullscreenLoading = false;
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        filterUsuariosByRol() {
            let me = this;
            me.listUsuarios.map(function (x, y) {
                me.listaUsuariosFilter.push({
                    'id': x.id,
                    'firstname': x.firstname,
                    'secondname': x.secondname,
                    'lastname': x.lastname,
                    'departamento': x.departamento,
                    'checked': (x.checked == 1) ? true : false
                });
            });
        },
        validarRegistrarUsuariosEvaluar() {
            this.error = 0;
            this.mensajeError = [];

            let contador = 0;
            this.listaUsuariosFilter.map(function (x, y) {
                if (x.checked == true) {
                    contador++;
                }
            })
            if (contador == 0) {
                this.mensajeError.push("Debe seleccionar al menos un usuario");
            }

            if (this.mensajeError.length) {
                this.error = 1;
            }
            return this.error;
        },
        limpiarRegistroUsuario() {
            this.fillPermiso.cNombre = '';
            this.fillPermiso.cSlug = '';
        },
        marcarFila(index) {
            this.listaUsuariosFilter[index].checked = !this.listaUsuariosFilter[index].checked;
        },
        getListarRolPermisosByUsuario() {
            let ruta = '/administracion/usuario/getListarRolPermisosByUsuario';
            axios.get(ruta).then(response => {
                this.listRolPermisosByUsuario = response.data;
                this.filterListarRolPermisosByUsuario();
            }).catch(error => {
                if (error.response.status == 401) {
                    this.fullscreenLoading = false;
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        filterListarRolPermisosByUsuario() {
            let me = this;
            me.listRolPermisosByUsuarioFilter = [];
            me.listRolPermisosByUsuario.map(function (x, y) {
                me.listRolPermisosByUsuarioFilter.push(x.slug);
            });
            this.fullscreenLoading = false;
            Swal.fire({
                icon: 'success',
                title: 'Se otorgo los usuarios corectamente',
                showConfirmButton: false,
                timer: 1500
            });
        }
    }
}
</script>