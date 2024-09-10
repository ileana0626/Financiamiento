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
                        <a href="/rol">Rol</a>
                    </li>
                    <li class="breadActive">
                        <span>Editar Rol</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="card-body">
                <div class="card mx-2">
                    <div class="card-header">
                        <h3 class="card-title"> Formulario para editar un rol </h3>
                        <div class="card-tools">
                            <router-link class="btn btn-flat btn-sm btn-nuevos" :to="'/rol'"
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
                                <div class="col-md-5 mt-2 mt-sm-0">
                                    <div class="card card-info">
                                        <div class="card-header">
                                            <h3 class="card-title"> Información del rol </h3>
                                        </div>
                                        <div class="card-body">
                                            <form role="form" class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group col">
                                                            <label class="row col-form-label">Nombre</label>
                                                            <div class="row">
                                                                <vs-input type="text" :state="(error) ? 'danger' : ''"
                                                                    placeholder="Nombre del rol"
                                                                    v-model="fillEditarRol.cNombre"></vs-input>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group col">
                                                            <label class="row col-form-label">Url Amigable</label>
                                                            <div class="row">
                                                                <vs-input type="text" :state="(error) ? 'danger' : ''"
                                                                    placeholder="Url Amigable"
                                                                    v-model="fillEditarRol.cSlug"> </vs-input>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="card-footer">
                                            <div class="d-flex flex-wrap flex-lg-nowrap flex-row mb-4 w50 mx-auto">
                                                <vs-button color="rgb(175, 137, 9)" class="font-weight-bold mr-1" warn
                                                    block @click.prevent="setEditarRolPermisos">Editar</vs-button>
                                                <vs-button class="font-weight-bold" transparent dark block black
                                                    @click.prevent="limpiarRegistroUsuario">Limpiar</vs-button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="card card-info">
                                        <div class="card-header">
                                            <h3 class="card-title"> Listar Permisos </h3>
                                        </div>
                                        <div class="card-body table-responsive">
                                            <template v-if="listaPermisosFilter.length">
                                                <div class="scrollTable">
                                                    <table
                                                        class="table table-hover table-head-fixed text-nowrap projects">
                                                        <thead>
                                                            <tr>
                                                                <th>Acción</th>
                                                                <th>Nombre</th>
                                                                <th>Url Amigable</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr v-for="(item, index) in listaPermisosFilter"
                                                                :key="index" @click.prevent="marcarFila(index)">
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
            fillEditarRol: {
                nIdRol: this.$attrs.id,
                cNombre: '',
                cSlug: ''
            },
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
        this.getListarPermisosByRol();
        this.getListarRoles();
    },
    methods: {
        abrirModal() {
            this.modalShow = !this.modalShow;
        },
        getListarRoles() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });

            let url = '/administracion/rol/getListarRoles'
            axios.get(url, {
                params: {
                    'nIdRol': this.fillEditarRol.nIdRol
                }
            }).then(response => {
                this.fillEditarRol.cNombre = response.data[0].name;
                this.fillEditarRol.cSlug = response.data[0].slug;
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
        getListarPermisosByRol() {
            let ruta = '/administracion/rol/getListarPermisosByRol';
            axios.get(ruta, { params: { 'nIdRol': this.fillEditarRol.nIdRol } }).then(response => {
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
        setEditarRolPermisos() {
            if (this.validarRegistrarRolPermisos()) {
                this.modalShow = true;
                return;
            }
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });

            let url = '/administracion/rol/setEditarRolPermisos';
            axios.post(url, {
                'nIdRol': this.fillEditarRol.nIdRol,
                'cNombre': this.fillEditarRol.cNombre,
                'cSlug': this.fillEditarRol.cSlug,
                'listPermisosFilter': this.listaPermisosFilter
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
        validarRegistrarRolPermisos() {
            this.error = 0;
            this.mensajeError = [];

            if (!this.fillEditarRol.cNombre) {
                this.mensajeError.push("El Nombre es un campo obligatorio");
            }
            if (!this.fillEditarRol.cSlug) {
                this.mensajeError.push("La Url es un campo obligatorio");
            }
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
            this.fillEditarRol.cNombre = '';
            this.fillEditarRol.cSlug = '';
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
            }, 0);
            Swal.fire({
                icon: 'success',
                title: 'Se actualizo el rol correctamente',
                showConfirmButton: false,
                timer: 1500
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
        }
    }
}
</script>