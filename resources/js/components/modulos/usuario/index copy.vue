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
                        <span>Usuario</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="card-body">
                <div class="container-fluid">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title"> Búsqueda de usuarios </h3>
                            <div class="card-tools">
                                <template v-if="listRolPermisosByUsuario.includes('usuario.crear')">
                                    <router-link class="btn btn-flat btn-sm btn-nuevos" :to="{ name: 'usuario.crear' }"
                                        style=" color : white !important ;">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-user-plus pr-2"></i> <span> Nuevo Usuario </span>
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
                                                <vs-input type="text" placeholder="Nombre"
                                                    v-model="fillBsqUsuario.cNombre" @keyup.enter="getListarUsuarios">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Usuario</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Usuario"
                                                    v-model="fillBsqUsuario.cUsuario" @keyup.enter="getListarUsuarios">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Correo Electronico</label>
                                            <div class="row">
                                                <vs-input type="text" placeholder="Correo Electrónico"
                                                    v-model="fillBsqUsuario.cCorreo" @keyup.enter="getListarUsuarios">
                                                </vs-input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Estado</label>
                                            <div class="row">
                                                <vs-select v-model="fillBsqUsuario.cEstado"
                                                    placeholder="Seleccione un estado">
                                                    <vs-option v-for="item in listaEstados" :key="item.value"
                                                        :label="item.label" :value="item.value"> {{ item.label }}
                                                    </vs-option>
                                                </vs-select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="d-flex flex-wrap flex-sm-nowrap flex-row mb-4 btnResSize mx-auto">
                            <vs-button color="rgb(175, 137, 9)" class=" mr-1" warn block
                                @click.prevent="getListarUsuarios">
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
                            <template v-if="listarUsuariosPaginated.length">
                                <vs-table>
                                    <template #thead>
                                        <vs-tr>
                                            <vs-th>#</vs-th>
                                            <vs-th>Nombre</vs-th>
                                            <vs-th>Correo</vs-th>
                                            <vs-th>Usuario</vs-th>
                                            <vs-th>Estado</vs-th>
                                            <vs-th>Acciones</vs-th>
                                        </vs-tr>
                                    </template>
                                    <template #tbody>
                                        <vs-tr v-for="(item, index) in $vs.getPage(listaUsuario, page, max)"
                                            :key="index">
                                            <vs-td style="width: 2%; text-align:center;" v-text="index + 1" />
                                            <vs-td style="" v-text="item.fullname" />
                                            <vs-td style="" v-text="item.email" />
                                            <vs-td style="" v-text="item.username" />
                                            <vs-td style="width: 7%">
                                                <template v-if="item.state == 'A'">
                                                    <span style="font-size: 12px !important;"
                                                        class="badge badge-success" v-text="item.state_alias"></span>
                                                </template>
                                                <template v-else>
                                                    <span style="font-size: 12px !important;" class="badge badge-danger"
                                                        v-text="item.state_alias"></span>
                                                </template>
                                            </vs-td>
                                            <vs-td style="width: 25%">
                                                <template v-if="listRolPermisosByUsuario.includes('usuario.ver')">
                                                    <router-link class="btn btn-flat btn-primary btn-sm"
                                                        :to="{ name: 'usuario.ver', params: { id: item.id } }"
                                                        style=" color : white !important ;">
                                                        <i class="fas fa-solid fa-eye pr-1" /> Ver
                                                    </router-link>
                                                </template>
                                                <template v-if="item.state == 'A'">
                                                    <template
                                                        v-if="listRolPermisosByUsuario.includes('usuario.editar')">
                                                        <router-link class="btn btn-flat btn-info btn-sm"
                                                            :to="{ name: 'usuario.editar', params: { id: item.id } }"
                                                            style=" color : white !important ;">
                                                            <i class="fas fa-pencil-alt pr-1" /> Editar
                                                        </router-link>
                                                    </template>
                                                    <template
                                                        v-if="listRolPermisosByUsuario.includes('usuario.permiso')">
                                                        <router-link class="btn btn-flat btn-success btn-sm"
                                                            :to="{ name: 'usuario.permiso', params: { id: item.id } }"
                                                            style=" color : white !important ;">
                                                            <i class="fas fa-key pr-1"></i> Permisos
                                                        </router-link>
                                                    </template>
                                                    <template
                                                        v-if="listRolPermisosByUsuario.includes('usuario.desactivar')">
                                                        <button class="btn btn-flat btn-danger btn-sm"
                                                            @click.prevent="setCambiarEstadoUsuario(1, item.id)"
                                                            style=" color : white !important ;">
                                                            <i class="fas fa-solid fa-thumbs-down pr-1" />
                                                            Desactivar
                                                        </button>
                                                    </template>
                                                </template>
                                                <template v-else>
                                                    <template
                                                        v-if="listRolPermisosByUsuario.includes('usuario.activar')"><button
                                                            class="btn btn-flat btn-success btn-sm"
                                                            @click.prevent="setCambiarEstadoUsuario(2, item.id)"
                                                            style=" color : white !important ;">
                                                            <i class="fas fa-check pr-1" />Activar
                                                        </button>
                                                    </template>
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
                                            :length="$vs.getLength(listaUsuario, max)" />
                                    </template>
                                </vs-table>
                            </template>
                            <template v-else>
                                <div class="callout callout-info">
                                    <h5>No se encontraron resultados...</h5>
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
            max: 10,
            fillBsqUsuario: {
                cNombre: '',
                cUsuario: '',
                cCorreo: '',
                cEstado: ''
            },
            fullscreenLoading: false,
            listaUsuario: [],
            listaEstados: [
                { value: 'A', label: 'Activo' },
                { value: 'I', label: 'Inactivo' }
            ],
            pageNumber: 0,
            perPage: 10,
            contrasena: [
                '12345'
            ],
            listRolPermisosByUsuario: JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'))


        }
    },
    mounted() {
        this.getListarUsuarios();
    },
    computed: {
        pageCount() {
            let a = this.listaUsuario.length,
                b = this.perPage;
            return Math.ceil(a / b);
        },
        listarUsuariosPaginated() {
            let inicio = this.pageNumber * this.perPage, fin = inicio + this.perPage;
            let list = this.listaUsuario.slice(inicio, fin);
            return list;
        },
        pageList() {
            let a = this.listaUsuario.length,
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
    methods: {
        generarContrasenas() {
            let url = '/administracion/usuario/generarContrasenas';
            axios.get(url, {
                params: {
                    'contra': this.contrasena
                }
            }).then(response => {
            }).catch(error => {
                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 1000)
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                }
            });
        },
        limpiarCriteriosBsq() {
            this.fillBsqUsuario.cNombre = '';
            this.fillBsqUsuario.cUsuario = '';
            this.fillBsqUsuario.cCorreo = '';
            this.fillBsqUsuario.cEstado = '';
        },
        limpiarBandejaUsuarios() {
            this.listaUsuario = [];
        },
        getListarUsuarios() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/getListarUsuarios';
            axios.get(url, {
                params: {
                    'cNombre': this.fillBsqUsuario.cNombre,
                    'cUsuario': this.fillBsqUsuario.cUsuario,
                    'cCorreo': this.fillBsqUsuario.cCorreo,
                    'cEstado': this.fillBsqUsuario.cEstado
                }
            }).then(response => {
                this.inicializarPaginacion();
                this.listaUsuario = response.data;
                setTimeout(() => {
                    loading.close();
                }, 0)
            }).catch(error => {
                if (error.response.status == 401) {
                    setTimeout(() => {
                        loading.close();
                    }, 0)
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
        setCambiarEstadoUsuario(op, id) {
            Swal.fire({
                title: '¿Está seguro de ' + ((op == 1) ? 'desactivar' : 'activar') + ' el usuario?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: ((op == 1) ? 'Si, desactivar' : 'Si, activar')
            }).then((result) => {
                if (result.value) {
                    const loading = this.$vs.loading({
                        type: 'square',
                        color: '#00a19a',
                        background: '#FFFFFF',
                        text: 'Cargando...'
                    });
                    let url = '/administracion/usuario/setCambiarEstadoUsuario';
                    axios.post(url, {
                        'nIdUsuario': id,
                        'cEstado': (op == 1) ? 'I' : 'A'
                    }).then(response => {
                        setTimeout(() => {
                            loading.close();
                            Swal.fire({
                                icon: 'success',
                                title: 'Se ' + ((op == 1) ? 'desactivo' : 'activo') + ' el usuario',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }, 0);
                        this.getListarUsuarios();
                    }).catch(error => {
                        if (error.response.status == 401) {
                            setTimeout(() => {
                                loading.close();
                            }, 0)
                            sessionStorage.clear();
                            this.$router.push({ name: 'login' });
                            location.reload();
                        }
                    });
                }
            });
        }
    }
}
</script>
<style>
/* .card-body {
    background-color: #fff !important;
} */

@media screen and (max-width: 575px) {
    .card-body {
        padding: 0;
    }
}
</style>