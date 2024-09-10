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
                        <a href="/permiso">Permiso</a>
                    </li>
                    <li class="breadActive">
                        <span>
                            Editar Permiso
                        </span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content mx-2">
            <div class="card-body">
                <div class="container-fluid">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title"> Formulario Editar Permiso </h3>
                            <div class="card-tools">
                                <router-link class="btn btn-flat btn-sm btn-nuevos" :to="'/permiso'"
                                    style=" color : white !important ;">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-arrow-left pr-2"></i> <span> Regresar </span>
                                    </div>
                                </router-link>
                            </div>
                        </div>
                        <div class="card-body">
                            <form role="form" class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Nombre</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Nombre del permiso"
                                                    v-model="fillEditarPermiso.cNombre" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Url Amigable</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Url Amigable"
                                                    v-model="fillEditarPermiso.cSlug" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="d-flex flex-wrap flex-sm-nowrap flex-row mb-5 btnResSize mx-auto">
                            <vs-button color="rgb(175, 137, 9)" class=" mr-1" warn block
                                @click.prevent="setEditarPermisos">
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
                        <!-- <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-4 offset-4">
                                        <vs-button class="botonizq" block flat warn @click.prevent="setEditarPermisos" >Editar</vs-button>
                                        <vs-button class="botonder" block flat dark @click.prevent="limpiarRegistroUsuario" >Limpiar</vs-button>
                                    </div>
                                </div>
                            </div> -->
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
            fillEditarPermiso: {
                nIdPermiso: this.$attrs.id,
                cNombre: '',
                cSlug: ''
            },
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
        this.getListarPermisos();
    },
    methods: {
        abrirModal() {
            this.modalShow = !this.modalShow;
        },
        getListarPermisos() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/permiso/getListarPermisos'
            axios.get(url, {
                params: {
                    'nidPermiso': this.fillEditarPermiso.nIdPermiso
                }
            }).then(response => {
                this.fillEditarPermiso.cNombre = response.data[0].name;
                this.fillEditarPermiso.cSlug = response.data[0].slug;
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
        setEditarPermisos() {
            if (this.validarEditarPermiso()) {
                this.modalShow = true;
                return;
            }
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/permiso/setEditarPermisos';
            axios.post(url, {
                'nIdPermiso': this.fillEditarPermiso.nIdPermiso,
                'cNombre': this.fillEditarPermiso.cNombre,
                'cSlug': this.fillEditarPermiso.cSlug,
            }).then(response => {
                setTimeout(() => {
                    loading.close();
                    Swal.fire({
                        icon: 'success',
                        title: 'Se actualizo el permiso correctamente',
                        showConfirmButton: false,
                        timer: 1500
                    });
                }, 0);
                this.$router.push('/permiso');
            }).catch(error => {
                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                        Swal.fire({
                            icon: 'error',
                            title: 'Ocurrio un error al actualizar el permiso',
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }, 0);
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        validarEditarPermiso() {
            this.error = 0;
            this.mensajeError = [];

            if (!this.fillEditarPermiso.cNombre) {
                this.mensajeError.push("El Nombre es un campo obligatorio");
            }
            if (!this.fillEditarPermiso.cSlug) {
                this.mensajeError.push("La Url es un campo obligatorio");
            }
            if (this.mensajeError.length) {
                this.error = 1;
            }
            return this.error;
        },
        limpiarRegistroUsuario() {
            this.fillEditarPermiso.cNombre = '';
            this.fillEditarPermiso.cSlug = '';
        }
    }
}
</script>