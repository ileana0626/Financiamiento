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
                            <span>Usuarios</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card-info pb-4">
                    <div class="card-header d-flex align-items-center">
                        <h3 class="card-title font-weight-bold">Usuarios</h3>
                        <div class="col card-tools d-flex justify-content-end" >
                            <vs-button @click.prevent="showModalRegistrar = !showModalRegistrar"
                                style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                                <b>
                                    <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                                    Agregar
                                </b>
                            </vs-button>
                        </div>
                    </div>
                    <div class="card-body container-fluid white-card-body">
                        <div class="tableStyles">
                            <template v-if="listarUsuariosPaginated.length">
                                <vs-table>
                                    <template #header>
                                        <vs-input v-model="searchTable" border placeholder="Escribe la información a buscar"
                                            class="inputSearchPreguntas" />
                                    </template>
                                    <template #thead>
                                        <vs-tr class="dark-th">
                                            <vs-th>#</vs-th>
                                            <vs-th sort @click="listaUsuario = $vs.sortData($event, listaUsuario, 'fullname')">Nombre</vs-th>
                                            <vs-th sort @click="listaUsuario = $vs.sortData($event, listaUsuario, 'email')">Correo</vs-th>
                                            <vs-th sort @click="listaUsuario = $vs.sortData($event, listaUsuario, 'username')">Usuario</vs-th>
                                            <vs-th sort @click="listaUsuario = $vs.sortData($event, listaUsuario, 'nombreRol')">Rol</vs-th>
                                            <vs-th sort @click="listaUsuario = $vs.sortData($event, listaUsuario, 'state')">Estado</vs-th>
                                            <vs-th>Acciones</vs-th>
                                        </vs-tr>
                                    </template>
                                    <template #tbody>
                                        <vs-tr v-for="(item, index) in $vs.getPage($vs.getSearch(listaUsuario, searchTable), page, max)" :key="index" :data="item">
                                            <vs-td style="width: 2%; text-align:center;" ><div v-text="index + 1"></div></vs-td>
                                            <vs-td style=""><div v-text="item.fullname"></div></vs-td>
                                            <vs-td style=""><div v-text="item.email"></div></vs-td>
                                            <vs-td style=""><div v-text="item.username"></div></vs-td>
                                            <vs-td style=""><div v-text="item.nombreRol"></div></vs-td>
                                            <vs-td style="width: 7%">
                                                <template v-if="item.state == 'A'">
                                                    <span style="font-size: 12px !important;"
                                                        class="badge bg-success" v-text="item.state_alias"></span>
                                                </template>
                                                <template v-else>
                                                    <span style="font-size: 12px !important;" class="badge bg-danger"
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
                                                        <el-tooltip placement="top">
                                                            <router-link class="btn btn-flat btn-edit btn-sm p-2"
                                                                :to="{ name: 'usuario.editar', params: { id: item.id } }"
                                                                style="color : white !important ;">
                                                                <i class="fas fa-pencil-alt pr-1" />
                                                            </router-link>
                                                            <div slot="content">Editar usuario</div>
                                                        </el-tooltip>
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
                                                        <el-tooltip placement="top">
                                                            <button class="btn btn-flat btn-danger btn-sm p-2"
                                                                @click.prevent="accionCambiarEstado(1, item.id)"
                                                                style="color : white !important ;">
                                                                <i class="fas fa-solid fa-thumbs-down" />
                                                            </button>
                                                            <div slot="content">
                                                                Desactivar usuario
                                                            </div>
                                                        </el-tooltip>
                                                    </template>
                                                </template>
                                                <template v-else>
                                                    <template
                                                        v-if="listRolPermisosByUsuario.includes('usuario.activar')">
                                                        <el-tooltip placement="top">
                                                            <button class="btn btn-flat btn-success btn-sm p-2"
                                                                @click.prevent="accionCambiarEstado(2, item.id)"
                                                                style=" color: white !important ;">
                                                                <i class="fas fa-check" />
                                                            </button>
                                                            <div slot="content">
                                                                Activar usuario
                                                            </div>
                                                        </el-tooltip>
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
                                            :length="$vs.getLength($vs.getSearch(listaUsuario,searchTable), max)" />
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
        <vs-dialog blur v-model="showModalRegistrar" id="registrarUser" auto-width prevent-close>
            <template #header>
                <div class="col text-center">
                    <div>
                        <br>
                        <h4 class="not-margin">
                            <b>Registrar nuevo usuario</b>
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-form">
                <div class="row overflow-hidden">
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label">Nombre(s)</label>
                        <vs-input id="Nombres" type="text" color="#C2B280" icon-after v-model="datosUsuario.Nombre" @input="inputNombr('nombre')"
                            placeholder="Nombre(s)" autocomplete="off" :state="error.Nombre ? 'danger': ''">
                            <template #message-danger v-if="error.Nombre.length > 0">
                                {{ error.Nombre }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label">Primer Apellido</label>
                        <vs-input id="Apaterno" type="text" color="#C2B280" icon-after v-model="datosUsuario.Apaterno" @input="inputNombr('app')"
                            placeholder="Primer Apellido" autocomplete="off" :state="error.Apaterno ? 'danger': ''">
                            <template #message-danger v-if="error.Apaterno.length > 0">
                                {{ error.Apaterno }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label">Segundo Apellido</label>
                        <vs-input id="Amaterno" type="text" color="#C2B280" icon-after v-model="datosUsuario.Amaterno" @input="inputNombr('apm')"
                            placeholder="Segundo Apellido" autocomplete="off" :state="error.Amaterno ? 'danger' : ''">
                            <template #message-danger v-if="error.Amaterno.length > 0">
                                {{ error.Amaterno }}
                            </template>
                        </vs-input>
                    </div>  
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label">Correo electrónico</label>
                        <vs-input id="email" type="email" color="#C2B280" icon-after v-model="datosUsuario.email" :key="'em'+error.email.length"
                            placeholder="Correo electrónico" autocomplete="off" :state="error.email ? 'danger' : ''">
                            <template #message-danger v-if="error.email.length > 0">
                                {{ error.email }}
                            </template>
                        </vs-input>
                    </div> 
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label">Usuario</label>
                        <vs-input id="username" type="text" color="#C2B280" icon-after v-model="datosUsuario.username" @input="inputUsername()"
                            placeholder="Nombre de usuario" autocomplete="off" :state="error.username ? 'danger' : ''" :key="'user' +error.username.length">
                            <template #message-danger v-if="error.username.length > 0">
                                {{ error.username }}
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-12 col-lg-4 px-3 pb-3 d-none d-lg-flex">
                    </div> 
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label" :title="passLabel">
                            Contraseña
                        </label>
                        <vs-input id="contrasenaNueva" type="password" color="#C2B280" icon-after v-model="datosUsuario.pswd"
                            placeholder="Escriba la nueva contraseña" autocomplete="off" :key="'ps'+error.pswd.length"
                            :visiblePassword="visiblePSWD.nueva" 
                            :state="error.pswd ? 'danger' : ''"
                            @click-icon="visiblePSWD.nueva = !visiblePSWD.nueva">
                            <template #message-danger v-if="error.pswd.length > 0">
                                {{ error.pswd }}
                            </template>
                            <template #icon>
                                <span
                                v-if="!visiblePSWD.nueva"
                                class="material-symbols-rounded"
                                >
                                visibility
                                </span>
                                <span v-else class="material-symbols-rounded">
                                visibility_off
                                </span>
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-12 col-lg-4 px-3 pb-3">
                        <label class="col-form-label">Confirmar Contraseña</label>
                        <vs-input id="contrasenaConfirma" type="password" color="#C2B280" icon-after v-model="datosUsuario.pswdConfirmar"
                            placeholder="Confirme la nueva contraseña" autocomplete="off" :key="'psc'+error.pswd.length"
                            :visiblePassword="visiblePSWD.confirmar" 
                            :state="error.pswdConfirmar ? 'danger' : ''"
                            @click-icon="visiblePSWD.confirmar = !visiblePSWD.confirmar">
                            <template #message-danger v-if="error.pswd.length > 0">
                                {{ error.pswd }}
                            </template>
                            <template #icon>
                                <span
                                v-if="!visiblePSWD.confirmar"
                                class="material-symbols-rounded"
                                >
                                visibility
                                </span>
                                <span v-else class="material-symbols-rounded">
                                visibility_off
                                </span>
                            </template>
                        </vs-input>
                    </div>
                    <div class="col-12 col-lg-6 px-3 pb-3">
                        <label class="col-form-label">Rol</label>
                        <vs-select filter :state="error.rol.length > 0 ? 'danger': ''"
                            :placeholder="'Seleccione un rol para el usuario'"
                            v-model="datosUsuario.rol" v-if="cat_rol.length > 0" autocomplete="off">
                            <template #message-danger v-if="error.rol.length > 0">
                                {{ error.rol }}
                            </template>
                            <vs-option v-for="(item, index) in cat_rol" :key="index" :label="item.nombre"
                                :value="item.idRol">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>                        
                    </div>
                    <div class="col-12 col-lg-6 px-3 pb-3">
                        <label class="col-form-label">Departamento</label>
                        <vs-select filter :key="cat_DPTO.length" :state="error.dpto.length ? 'danger': ''"
                            :placeholder="'Seleccione un departamento para el usuario'"
                            v-model="datosUsuario.dpto" v-if="cat_DPTO.length > 0" autocomplete="off">
                            <template #message-danger v-if="error.dpto.length > 0">
                                {{ error.dpto }}
                            </template>
                            <vs-option v-for="(item, index) in cat_DPTO" :key="index" :label="item.nombre"
                                :value="item.idSeguimiento">
                                {{ item.nombre }}
                            </vs-option>
                        </vs-select>                        
                    </div>
                </div>
            </div>
            <template #footer>
                <div class="footer-dialog">
                    <div class="px-3 d-flex justify-content-center flex-column flex-md-row">
                        <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'limpiar'+darkMode" @click.prevent="limpiarFormRegistro()">
                            <div style="color: var(--btn-txt-color); font-weight: 700;">
                                <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                            </div>
                        </vs-button>      
                        <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode" @click.prevent="accionRegistrar()">
                            <div style="color: var(--btn-txt-color); font-weight: 700;">
                                <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Registrar usuario
                            </div>
                        </vs-button>                                
                    </div>
                </div>
            </template>
        </vs-dialog>     
    </div>
</template>

<script>
import methods from '../../../methods';
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            rolUsuario: sessionStorage.getItem('rolUsuario') ? Number(sessionStorage.getItem('rolUsuario')) : 0,
            searchTable: '',
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
            listRolPermisosByUsuario: JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario')),

            showModalRegistrar: false,

            datosUsuario: {
                Nombre: '',
                Apaterno: '',
                Amaterno: '',
                email: '',
                username: '',
                pswd: '',
                pswdConfirmar: '',
                rol: '',
                dpto: '',
            },
            procede: false,
            error: {
                Nombre: '',
                Apaterno: '',
                Amaterno: '',
                email: '',
                username: '',
                pswd: '',
                pswdConfirmar: '',
                rol: '',
                dpto: '',
            }, 
            visiblePSWD:{
                nueva: false,
                confirmar: false,
            },
        
            cat_rol:[],
            cat_DPTO:[],
            passLabel: `Caracteres especiales permitidos: @#$!%*?&-_.,'="`
        }
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
    },
    async mounted() {
        const load = methods.loading( this.$vs );
        await this.getListarAllUsers();
        await this.getRoles();
        await this.obtenerDatos();
        load.close();
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
        },
        validEmail() {
            return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.datosUsuario.email);
        },
        validPSWD() {
            return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%*?&\-_.,'="])[A-Za-z\d@#$!%*?&\-_.,'="]{8,}$/.test(this.datosUsuario.pswd);
        },
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
        async getListarAllUsers() {
            let url = '/administracion/usuario/getListarAllUsers';
            try {
                const response = await axios.get(url);
                if(response.status === 200){
                    this.inicializarPaginacion();
                    this.listaUsuario = response.data;
                }
            } catch (error) {
                const method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
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
        accionCambiarEstado(op, id){
            const refId = id;
            Swal.fire({
                title: '¿Está seguro de ' + ((op == 1) ? 'desactivar' : 'activar') + ' el usuario?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: ((op == 1) ? 'Si, desactivar' : 'Si, activar'),
                reverseButtons: true,
            }).then(async (result) => {
                if(result.isConfirmed){
                    console.log(refId);
                    await this.setCambiarEstadoById(op, refId);
                }
            })
        },
        async setCambiarEstadoById(op, id) {
            let url = '/administracion/usuario/setCambiarEstadoById';
            const load = methods.loading( this.$vs );
            try {
                const response = await axios.post(url,{
                    'user_id': id,
                    'estado': (op == 1) ? 'INACTIVO' : 'ACTIVO'
                });
                if(response.status === 200) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Se ' + ((op == 1) ? 'desactivo' : 'activo') + ' el usuario',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo',
                    }).then(async result => {
                        this.listaUsuario = [];
                        await this.getListarAllUsers();
                    });
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error,method[3], this.$router);
            } finally {
                load.close();
            }
        },
        WIP() {
          const wip = this.$vs.notification({
            square: true,
            color: 'dark',
            position: 'bottom-center',
            title: '<span class="text-white">Función en progreso</span>'
          });
        },
        // Funciones registrar usuario
        accionRegistrar() {
            this.limpiaErrorRegistro();
            this.validarRegistroUser();
            if(this.procede){
                Swal.fire({
                icon: 'warning',
                title: '¿Desea registrar al nuevo usuario?',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                // cancelButtonColor: 'transparent',
                cancelButtonText: "Cancelar",
                confirmButtonText: 'Registrar',
                reverseButtons: true,
                }).then(async (result) => {
                    if (result.isConfirmed) {
                        await this.setRegistrarUser();
                    }
                })                
            }
        },
        async setRegistrarUser() {
            const url = '/administracion/usuario/setRegistrarUser';
            const load = methods.loading( this.$vs );
            try {
                const response = await axios.post(url,{
                    'cNombre': this.datosUsuario.Nombre,
                    'cApaterno': this.datosUsuario.Apaterno,
                    'cAmaterno': this.datosUsuario.Amaterno,
                    'cEmail': this.datosUsuario.email,
                    'cUser': this.datosUsuario.username,
                    'pswd': this.datosUsuario.pswd,
                    'pswdConfirmar': this.datosUsuario.pswdConfirmar,
                    'nIdDPTO': this.datosUsuario.dpto,
                    'nIdRol': this.datosUsuario.rol,
                    'fRegistro': methods.getTimestamp(),                  
                }); 
                if(response.status === 200){
                    Swal.fire({
                        icon: 'success',
                        title: 'Usuario registrado con exito',
                        confirmButtonColor: '#3085d6',
                        // cancelButtonColor: 'transparent',
                        confirmButtonText: 'De acuerdo',
                        reverseButtons: true,
                    }).then(async (result) => {
                        const load = methods.loading( this.$vs );
                        this.listaUsuario = [];
                        await this.getListarAllUsers();
                        this.showModalRegistrar = false;
                        this.limpiarFormRegistro();
                        load.close();
                    })                     
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error,method[3], this.$router);
            } finally {
                load.close();
            }
        },
        inputNombr( cadena ){
            let regex = /[^a-zA-ZáíóéúüÁÉÍÓÚÜñÑ ]{0,50}$/;
            let temp = '';
            switch (cadena){
                case 'nombre':
                    temp = this.datosUsuario.Nombre;
                    if(temp.length > 50) temp = temp.substring(0,50);
                    this.datosUsuario.Nombre = temp.replace(regex,'');
                    break;
                case 'app':
                    temp = this.datosUsuario.Apaterno;
                    if(temp.length > 50) temp = temp.substring(0,50);
                    this.datosUsuario.Apaterno = temp.replace(regex,'');
                    break;
                case 'apm':
                    temp = this.datosUsuario.Amaterno;
                    if(temp.length > 50) temp = temp.substring(0,50);
                    this.datosUsuario.Amaterno = temp.replace(regex,'');
                    break;
            }
        }, 
        inputUsername(){
            let regex =  /[^a-zA-Z0-9\-_]/;
            let temp = this.datosUsuario.username;
            if(temp.length > 16) temp = temp.substring(0,16);
            this.datosUsuario.username = temp.replace(regex,'');
        }, 
        limpiarFormRegistro() {
            this.datosUsuario.Nombre = '';
            this.datosUsuario.Apaterno = '';
            this.datosUsuario.Amaterno = '';
            this.datosUsuario.username = '';
            this.datosUsuario.pswd = '';
            this.datosUsuario.pswdConfirmar = '';
            this.datosUsuario.email = '';
            this.datosUsuario.rol = '';
            this.datosUsuario.dpto = '';
            
            this.limpiaErrorRegistro();
        },
        validarRegistroUser() {
            this.procede = true;
            if(this.datosUsuario.Nombre === ''){
                this.procede = false;
                this.error.Nombre = 'El nombre es obligatorio';
            }
            if(this.datosUsuario.Apaterno === ''){
                this.procede = false;
                this.error.Apaterno = 'El primer apellido es obligatorio';
            }
            if(this.datosUsuario.email === ''){
                this.procede = false;
                this.error.email = 'El correo electrónico es obligatorio';
            } else if( !this.validEmail ){
                this.procede = false;
                this.error.email = 'El correo electrónico no tiene un formato valido';
            }
            if(this.datosUsuario.username === ''){
                this.procede = false;
                this.error.username = 'El nombre de usuario es obligatorio';
            } else if( this.datosUsuario.username.length < 8){
                this.procede = false;
                this.error.username = 'El usuario debe contener al menos 8 caracteres';
            }
            if(this.datosUsuario.pswd === ''){
                this.procede = false;
                this.error.pswd = 'La contraseña es obligatoria';
            } else if(!this.validPSWD){
                this.procede = false;
                this.error.pswd = 'La contraseña debe contener al menos 8 caracteres, una mayúscula, una minúscula, un número y un caracter especial';
            } else if(this.datosUsuario.pswd !== this.datosUsuario.pswdConfirmar) {
                this.procede = false;
                this.error.pswd = 'Las contraseñas no coinciden';
                this.error.pswdConfirmar = 'Las contraseñas no coinciden';
            }
            if( this.datosUsuario.rol === ''){
                this.procede = false;
                this.error.rol = 'El rol es obligatorio';
            }
            if( this.datosUsuario.dpto === ''){
                this.procede = false;
                this.error.dpto = 'El departamento es obligatorio';
            }
        },
        limpiaErrorRegistro() {
            this.error.Nombre = '';
            this.error.Apaterno = '';
            this.error.email = '';
            this.error.username = '';
            this.error.pswd = '';
            this.error.pswdConfirmar = '';
            this.error.rol = '';
            this.error.dpto = '';
        },
        async getRoles() {
            let url = '/administracion/usuario/getRoles';
            try {
                const response = await axios.get(url,{
                    params: {
                        'nIdRol': this.rolUsuario
                    }
                });
                if(response.status === 200){
                    this.cat_rol = response.data;
                }
            } catch (error) {
                const method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        async getDepartamentos() {
            let url = '/administracion/usuario/getDepartamentos';
            try {
                const response = await axios.get(url);
                if(response.status === 200){
                    this.cat_DPTO = response.data;
                }
            } catch (error) {
                const method = url.split('/');
                methods.catchHandler(error, method[3], this.$router);
            }
        },
        async obtenerDatos(tipo = 5) {
            let url = '/administracion/usuario/obtenerDatos'
            await axios.get(url, {
                params: {
                    'tipo': tipo,
                    'consulta': 1
                }
            }).then(response => {
                this.cat_DPTO = response.data;
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            });
        },
    }
}
</script>
<style scope>
@media screen and (max-width: 575px) {
    .card-body {
        padding: 0;
    }
}
</style>