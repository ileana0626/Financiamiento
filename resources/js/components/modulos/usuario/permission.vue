<template>
    <div class="">
        <div class="content-header container-fluid mb-5">
            <div class="container-fluid">
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
                                Asignar Permisos
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="content container-fluid wFull">
            <div class="card mx-sm-5">
                <div class="card-header">
                    <h3 class="card-title"> Asignar permisos a un usuario </h3>
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
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 mt-2 mt-sm-0">
                                <div class="card card-info">
                                    <div class="card-header">
                                        <h3 class="card-title">Permisos actuales del rol {{ fillPermiso.cNombreRol }}
                                        </h3>
                                    </div>
                                    <div class="card-body table-responsive">
                                        <template v-if="listPermisoByRolAsignado.length">
                                            <div class="scrollTable">
                                                <table class="table table-hover table-head-fixed text-nowrap projects">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Url Amigable</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="(item, index) in listPermisoByRolAsignado"
                                                            :key="index">
                                                            <td v-text="item.name"></td>
                                                            <td v-text="item.slug"></td>
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
                                    <div class="card-footer d-flex justify-content-center">
                                        <vs-button color="rgb(175, 137, 9)" class="btnResSize font-weight-bold" warn
                                            @click.prevent="setRegistrarPermisosByUsuario"
                                            >
                                            Registrar
                                        </vs-button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-info">
                                    <div class="card-header">
                                        <h3 class="card-title"> Listar Permisos </h3>
                                    </div>
                                    <div class="card-body table-responsive">
                                        <template v-if="listaPermisosFilter.length">
                                            <div class="scrollTable">
                                                <table class="table table-hover table-head-fixed text-nowrap projects">
                                                    <thead>
                                                        <tr>
                                                            <th>Acción</th>
                                                            <th>Nombre</th>
                                                            <th>Url Amigable</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="(item, index) in listaPermisosFilter" :key="index"
                                                            @click.prevent="marcarFila(index)">
                                                            <td>
                                                                <el-checkbox v-model="item.checked"></el-checkbox>
                                                            </td>
                                                            <td v-text="item.name"></td>
                                                            <td v-text="item.slug"></td>
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
                cNombreRol: ''
            },
            listPermisoByRolAsignado: [],
            listPermisos: [],
            listaPermisosFilter: [],
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
            listRolPermisosByUsuarioFilter: []
        }
    },
    mounted() {
        this.getListarPermisosByUsuario();
        this.getListarPermisosByRolAsignado();
        this.getRolByUsuario();
    },
    methods: {
        abrirModal() {
            this.modalShow = !this.modalShow;
        },
        getListarPermisosByRolAsignado() {
            let ruta = '/administracion/usuario/getListarPermisosByRolAsignado';
            axios.get(ruta, {
                params: {
                    'nIdUsuario': this.fillPermiso.nIdUsuario
                }
            }).then(response => {
                this.listPermisoByRolAsignado = response.data;
                this.filterPermisosByRol();
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
                    'nIdUsuario': this.fillPermiso.nIdUsuario
                }
            }).then(response => {
                this.fillPermiso.cNombreRol = (response.data.length == 0) ? '' : response.data[0].name;
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
        getListarPermisosByUsuario() {
            let ruta = '/administracion/usuario/getListarPermisosByUsuario';
            axios.get(ruta, {
                params: {
                    'nIdUsuario': this.fillPermiso.nIdUsuario
                }
            }).then(response => {
                this.listPermisos = response.data;
                this.filterPermisosByRol();
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
        setRegistrarPermisosByUsuario() {
            if (this.validarRegistrarPermisosByUsuario()) {
                this.modalShow = true;
                return;
            }
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/setRegistrarPermisosByUsuario';
            axios.post(url, {
                'nIdUsuario': this.fillPermiso.nIdUsuario,
                'listPermisosFilter': this.listaPermisosFilter,
            }).then(response => {
                this.getListarRolPermisosByUsuario(loading);
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
        filterPermisosByRol() {
            let me = this;
            me.listPermisos.map(function (x, y) {
                me.listaPermisosFilter.push({
                    'id': x.id,
                    'name': x.name,
                    'slug': x.slug,
                    'checked': (x.checked == 1) ? true : false
                });
            });
        },
        validarRegistrarPermisosByUsuario() {
            this.error = 0;
            this.mensajeError = [];

            let contador = 0;
            this.listaPermisosFilter.map(function (x, y) {
                if (x.checked == true) {
                    contador++;
                }
            })
            if (contador == 0) {
                this.mensajeError.push("Debe seleccionar al menos un permiso");
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
            this.listaPermisosFilter[index].checked = !this.listaPermisosFilter[index].checked;
        },
        getListarRolPermisosByUsuario(loading) {
            let ruta = '/administracion/usuario/getListarRolPermisosByUsuario';
            axios.get(ruta).then(response => {
                this.listRolPermisosByUsuario = response.data;
                this.filterListarRolPermisosByUsuario(loading);
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
        filterListarRolPermisosByUsuario(loading) {
            let me = this;
            me.listRolPermisosByUsuarioFilter = [];
            me.listRolPermisosByUsuario.map(function (x, y) {
                me.listRolPermisosByUsuarioFilter.push(x.slug);
            });
            sessionStorage.setItem('lisRolPermisosByUsuario', JSON.stringify(me.listRolPermisosByUsuarioFilter));

            EventBus.$emit('notifyRolPermisosByUsuario', me.listRolPermisosByUsuarioFilter);

            setTimeout(() => {
                loading.close();
                Swal.fire({
                    icon: 'success',
                    title: 'Se otorgo los permisos al usuario correctamente',
                    showConfirmButton: false,
                    timer: 1500
                });
            }, 0);
        }
    }
}
</script>