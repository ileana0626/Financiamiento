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
                        <span>
                            Permiso
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
                            <h3 class="card-title"> Criterios de búsqueda </h3>
                            <div class="card-tools">
                                <template v-if="listRolPermisosByUsuario.includes('permiso.crear')">
                                    <router-link class="btn btn-flat btn-sm btn-nuevos" :to="'/permiso/crear'"
                                        style=" color : white !important ;">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-plus-square pr-2"></i> <span> Nuevo Permiso </span>
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
                                                <vs-input type="text" placeholder="Nombre del permiso"
                                                    v-model="fillBsqPermiso.cNombre" @keyup.enter="getListarPermisos">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Url Amigable</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Url amigable"
                                                    v-model="fillBsqPermiso.cSlug" @keyup.enter="getListarPermisos">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="d-flex flex-wrap flex-sm-nowrap flex-row mb-5 btnResSize mx-auto">
                            <vs-button color="rgb(175, 137, 9)" class=" mr-1" warn block
                                @click.prevent="getListarPermisos" >
                                <b>
                                    Buscar
                                </b>
                            </vs-button>
                            <vs-button transparent dark block black @click.prevent="limpiarCriteriosBsq">
                                <b>
                                    Limpiar
                                </b>
                            </vs-button>
                        </div>
                        <div class="tableStyles">
                            <template v-if="listarPermisosPaginated.length">
                                <vs-table>
                                    <template #thead>
                                        <vs-tr>
                                            <vs-th>Nombre</vs-th>
                                            <vs-th>Url Amigable</vs-th>
                                            <vs-th>Acciones</vs-th>
                                        </vs-tr>
                                    </template>
                                    <template #tbody>
                                        <vs-tr v-for="(item, index) in $vs.getPage(listaPermisos, page, max)"
                                            :key="index" :data="item">
                                            <vs-td v-text="item.name"></vs-td>
                                            <vs-td v-text="item.slug"></vs-td>
                                            <vs-td>
                                                <template v-if="listRolPermisosByUsuario.includes('permiso.editar')">
                                                    <router-link class="btn btn-flat btn-info btn-sm"
                                                        :to="{ name: 'permiso.editar', params: { id: item.id } }"
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
                                            :length="$vs.getLength(listaPermisos, max)" />
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
    </div>
</template>

<script>
export default {
    data() {
        return {
            page: 1,
            max: 5,
            fillBsqPermiso: {
                cNombre: '',
                cSlug: ''
            },
            fullscreenLoading: false,
            listaPermisos: [],
            listPermisos: [],
            pageNumber: 0,
            perPage: 5,
            listRolPermisosByUsuario: JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'))
        }
    },
    computed: {
        pageCount() {
            let a = this.listaPermisos.length,
                b = this.perPage;
            return Math.ceil(a / b);
        },
        listarPermisosPaginated() {
            let inicio = this.pageNumber * this.perPage, fin = inicio + this.perPage;
            let list = this.listaPermisos.slice(inicio, fin);
            return list;
        },
        pageList() {
            let a = this.listaPermisos.length,
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
        this.getListarPermisos();
    },
    methods: {
        limpiarCriteriosBsq() {
            this.fillBsqPermiso.cNombre = '';
            this.fillBsqPermiso.cSlug = '';
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
                    'cNombre': this.fillBsqPermiso.cNombre,
                    'cSlug': this.fillBsqPermiso.cSlug
                }
            }).then(response => {
                this.inicializarPaginacion();
                this.listaPermisos = response.data;
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