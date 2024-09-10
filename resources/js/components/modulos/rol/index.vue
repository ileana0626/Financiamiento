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
                    <li class="breadActive">
                        <span>Rol</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="card-body">
                <div class="container-fluid">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title"> Criterios de búsqueda </h3>
                            <div class="card-tools">
                                <template v-if="listRolPermisosByUsuario.includes('rol.crear')">
                                    <router-link class="btn btn-flat btn-sm btn-nuevos" :to="'/rol/crear'"
                                        style=" color : white !important ;">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-plus-square pr-2"></i> <span> Nuevo Rol </span>
                                        </div>
                                    </router-link>
                                </template>
                            </div>
                        </div>
                        <div class="card-body">
                            <form role="form" class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Nombre</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Nombre del rol"
                                                    v-model="fillBsqRol.cNombre" @keyup.enter="getListarRoles">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Url Amigable</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Url Amigable"
                                                    v-model="fillBsqRol.cSlug" @keyup.enter="getListarRoles"></vs-input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="d-flex flex-wrap flex-sm-nowrap flex-row mb-4 btnResSize mx-auto">
                            <vs-button color="rgb(175, 137, 9)" class="font-weight-bold mr-1" warn block
                                @click.prevent="getListarRoles">
                                Buscar
                            </vs-button>
                            <vs-button class="font-weight-bold" transparent dark block black
                                @click.prevent="limpiarRegistroUsuario">
                                Limpiar
                            </vs-button>
                        </div>
                        <div class="tableStyles">
                            <template v-if="listaRol.length">
                                <vs-table class="table table-borderless table-hover text-nowrap">
                                    <template #thead>
                                        <vs-tr>
                                            <vs-th>Nombre</vs-th>
                                            <vs-th>Url Amigable</vs-th>
                                            <vs-th>Acciones</vs-th>
                                        </vs-tr>
                                    </template>
                                    <template #tbody>
                                        <vs-tr v-for="(item, index) in listaRol" :key="index">
                                            <vs-td v-text="item.name"></vs-td>
                                            <vs-td v-text="item.slug"></vs-td>
                                            <vs-td>
                                                <template v-if="listRolPermisosByUsuario.includes('rol.ver')"><button
                                                        class="btn btn-flat btn-primary btn-sm"
                                                        @click.prevent="abrirModalByOption('rol', 'ver', item)"><i
                                                            class="fas fa-solid fa-eye pr-1"
                                                            style=" color : white !important ;"></i>
                                                        Ver</button></template>
                                                <template v-if="listRolPermisosByUsuario.includes('rol.editar')">
                                                    <router-link class="btn btn-flat btn-info btn-sm"
                                                        :to="{ name: 'rol.editar', params: { id: item.id } }"
                                                        style=" color : white !important ;"><i
                                                            class="fas fa-pencil-alt"></i> Editar</router-link>
                                                </template>
                                            </vs-td>
                                        </vs-tr>
                                    </template>
                                    <template #notFound>
                                        <div class="callout callout-info">
                                            <h5>No se encontraron resultados...</h5>
                                        </div>
                                    </template>
                                    <template #footer>
                                        <vs-pagination color="rgb(175, 137, 9)" v-model="page"
                                            :length="$vs.getLength(listaRol, max)" />
                                    </template>
                                </vs-table>
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
        <div class="modal fade" :class="{ show: modalShow }" :style="modalShow ? mostrarModal : ocultarModal">
            <div class="modal-dialog modal-dialog-centered" role="dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Examen de conocimientos en materia electoral</h5>
                        <button class="close" @click="abrirModal"></button>
                    </div>
                    <div class="modal-body">
                        <template v-if="modalOption == 1">
                            <div class="callout callout-danger" style="padding: 5px"
                                v-for="(item, index) in mensajeError" :key="index" v-text="item"></div>
                        </template>
                        <template v-if="modalOption == 2">
                            <div class="container-fluid">
                                <div class="card card-info">
                                    <div class="card-header">
                                        <h3 class="card-title"> Información del Rol </h3>
                                    </div>
                                    <div class="card-body">
                                        <form role="form" class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label class="col-md-12 col-form-label">Nombre</label>
                                                        <div class="col-md-12">
                                                            <span class="form-control"
                                                                v-text="fillVerRol.cNombre"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label class="col-md-12 col-form-label">Url Amigable</label>
                                                        <div class="col-md-12">
                                                            <span class="form-control" v-text="fillVerRol.cSlug"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card card-info">
                                        <div class="card-header">
                                            <h3 class="card-title">Listado de Permisos</h3>
                                        </div>
                                        <div class="card-body table-responsive">
                                            <template v-if="listPermisos.length">
                                                <div class="scrollTable">
                                                    <table
                                                        class="table table-hover table-head-fixed text-nowrap projects">
                                                        <thead>
                                                            <tr>
                                                                <th>Nombre</th>
                                                                <th>Url Amigable</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr v-for="(item, index) in listPermisos" :key="index">
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
                        </template>
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
            page: 1,
            max: 5,
            fillBsqRol: {
                cNombre: '',
                cSlug: ''
            },
            fillVerRol: {
                cNombre: '',
                cSlug: ''
            },
            fullscreenLoading: false,
            listaRol: [],
            listPermisos: [],
            pageNumber: 0,
            perPage: 5,
            modalShow: false,
            modalOption: 0,
            mostrarModal: {
                display: 'block',
                background: 'rgba( 0 , 0 , 0 , 0.38 )'
            },
            ocultarModal: {
                display: 'none'
            },
            error: 0,
            mensajeError: [],
            listRolPermisosByUsuario: JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'))

        }
    },
    computed: {
        pageCount() {
            let a = this.listaRol.length,
                b = this.perPage;
            return Math.ceil(a / b);
        },
        listarRolPaginated() {
            let inicio = this.pageNumber * this.perPage, fin = inicio + this.perPage;
            let list = this.listaRol.slice(inicio, fin);
            return list;
        },
        pageList() {
            let a = this.listaRol.length,
                b = this.perPage;
            let pageCount = Math.ceil(a / b);
            let count = 0,
                pageArray = [];
            while (count < pageCount) {
                pageArray.push(count);
                count++;
            }
            return pageArray;
        }
    },
    mounted() {
        this.getListarRoles();
    },
    methods: {
        abrirModal() {
            this.modalShow = !this.modalShow;
            this.limpiarModal();
        },
        limpiarModal() {
            this.fillVerRol.cNombre = '';
            this.fillVerRol.cSlug = '';
            this.listPermisos = [];
            this.modalOption = 0;
        },
        limpiarCriteriosBsq() {
            this.fillBsqRol.cNombre = '';
            this.fillBsqRol.cSlug = '';
        },
        limpiarBandejaUsuarios() {
            this.listaRol = [];
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
                    'cNombre': this.fillBsqRol.cNombre,
                    'cSlug': this.fillBsqRol.cSlug
                }
            }).then(response => {
                this.inicializarPaginacion();
                this.listaRol = response.data;
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
        nextPage() {
            this.pageNumber++;
        },
        prevPage() {
            this.pageNumber--;
        },
        selectPage(page) {
            this.pageNumber = page;
        },
        inicializarPaginacion() {
            this.pageNumber = 0;
        },
        getListarPermisosByRol(id, loading) {
            let ruta = '/administracion/rol/getListarPermisosByRol';

            axios.get(ruta, { params: { 'nIdRol': id } }).then(response => {
                this.listPermisos = response.data;
                this.modalShow = true;
                this.modalOption = 2;
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
        abrirModalByOption(modulo, accion, data) {
            switch (modulo) {
                case "rol":
                    {
                        switch (accion) {
                            case "ver":
                                {
                                    this.fillVerRol.cNombre = data.name;
                                    this.fillVerRol.cSlug = data.slug;
                                    this.getListarPermisosByRol(data.id);
                                }
                                break;

                            default:
                                break;
                        }
                    }
                    break;

                default:
                    break;
            }
        }
    }
}
</script>

<style>
.scrollTable {
    max-height: 350px !important;
    overflow: auto !important;
}
</style>