<template>
    <div class="content-header">
        <div class="container-fluid mb-5">
            <!-- Breadcrumb (navegacion) -->
            <div class="float-sm-right mr-5">
                <ul class="breadcrumb">
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
        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card-info">
                    <div class="card-header d-flex">
                        <h3 class="card-title font-weight-bold"> Registro de un nuevo usuario </h3>
            </div>
        </div>
        <div class="card-body container-fluid" style="background-color: var(--iee-white) !important;">
                            <form class="container-fluid" role="form">
                                <div class="row">
                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Nombre(s)</label>
                                            <div class="row">
                                                <vs-input :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Nombre(s)" v-model="fillCrearUsuario.cPrimerNombre">
                                                </vs-input>
                                                <div class="danger-message">
                                                    <template v-if="errorNombre.length > 0">
                                                        {{ errorNombre }}
                                                    </template>
                                                </div>
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
                                                <div class="danger-message">
                                                    <template v-if="errorApellidoP.length > 0">
                                                        {{ errorApellidoP }}
                                                    </template>
                                                </div>
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
                                                <div class="danger-message">
                                                    <template v-if="errorApellidoM.length > 0">
                                                        {{ errorApellidoM }}
                                                    </template>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-lg-4 ml-lg-auto">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Usuario</label>
                                            <div class="row">
                                                <vs-input danger :state="(error) ? 'danger' : ''" type="text"
                                                    placeholder="Usuario" v-model="fillCrearUsuario.cUsuario">
                                                    <template #message-danger>
                                                        El usuario debe tener máximo 10 caracteres.
                                                    </template>
                                                </vs-input>
                                                <div class="danger-message">
                                                    <template v-if="errorUsuario.length > 0">
                                                        {{ errorUsuario }}
                                                    </template>
                                                </div>
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
                                                <div class="danger-message">
                                                    <template v-if="errorCorreo.length > 0">
                                                        {{ errorCorreo }}
                                                    </template>
                                                </div>
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
                                                        La contraseña debe de tener máximo 8 caracteres, una mayúscula, un número y un caracter especial.
                                                    </template>
                                                </vs-input>
                                                <div class="danger-message">
                                                    <template v-if="errorContraseña.length > 0">
                                                        {{ errorContraseña }}
                                                    </template>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Rol </label>
                                            <vs-select filter
                                                :placeholder="(fillCrearUsuario.nIdRol.length > 0) ? '' : 'Seleccione una opción'"
                                                v-model="fillCrearUsuario.nIdRol" v-if="listaRoles.length > 0" autocomplete="off"
                                            >
                                            
                                                <vs-option 
                                                v-for="(item, index) in listaRoles" 
                                                :key="index" 
                                                :label="item.nombre" 
                                                :value="item.idRol">
                                                {{ item.nombre }}
                                                </vs-option>
                                            </vs-select>
                                            <div class="danger-message">
                                                    <template v-if="errorRol.length > 0">
                                                        {{ errorRol }}
                                                    </template>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Departamento </label>
                                            <vs-select filter
                                                :placeholder="(fillCrearUsuario.nIdDepartamento.length > 0) ? '' : 'Seleccione una opción'"
                                                v-model="fillCrearUsuario.nIdDepartamento" v-if="listarDepartamentos.length > 0" autocomplete="off"
                                            >
                                            
                                                <vs-option v-for="(item, index) in listarDepartamentos" :key="index"
                                                    :label="item.nombre" :value="item.id">
                                                    {{ item.nombre }}
                                                </vs-option>
                                            </vs-select>
                                            <div class="danger-message">
                                                    <template v-if="errorDepartamento.length > 0">
                                                        {{ errorDepartamento }}
                                                    </template>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 pr-lg-5">
                                        <div class="form-group col">
                                            <label class="row col-form-label">Fecha Alta</label>
                                            <div class="row">
                                                <el-date-picker 
                                                class="wFull" v-model="fillCrearUsuario.dFechaAlta"
                                                    type="date" format="dd-MM-yyyy"
                                                    placeholder="Seleccione una fecha" />
                                                    
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </form>

                            <div class=" d-flex flex-row mt-3 my-4 w-100 justify-content-center">

                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#1a2e35'" :key="'limpiar'+darkMode" 
                                    @click.prevent="limpiarRegistroUsuario"
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                        </div>
                                    </vs-button>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#a5904a'" :key="'guardar'+darkMode" 
                                    @click.prevent="setRegistrarUsuario" 
                                    style="padding: 0.20rem; font-size: 1rem;">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-save pr-2" style="font-size: 0.8125rem !important;"></i>
                                            Registrar
                                        </div>
                                    </vs-button>
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
            darkMode: localStorage.getItem('theme') == 'dark',
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
                nFolio: '',
                dFechaAlta: '',
            },
            rol : '',
            listaRoles: [],
            listarDepartamentos: [],

            form: new FormData,
            fullscreenLoading: false,
    
            //errores de campos de formulario
            errorNombre : '',
            errorApellidoP : '',
            errorApellidoM : '',
            errorUsuario : '',
            errorCorreo : '',
            errorContraseña : '',
            errorRol : '',
            errorFecha : '',
            errorDepartamento : '',

            error: false,
            mensajeError: [],
            id: 0
        }
    },
    async mounted() {
        await this.obtenerDatos(12);
        await this.obtenerDatos(13);
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
        async obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            await axios.get(url, {
                params: {
                    'tipo': tipo,
                    'consulta': 1
                }
            }).then(response => {
                switch (tipo) {
                    case 12:
                        this.listaRoles = response.data
                        break;
                    case 13:
                        this.listarDepartamentos = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },
        getFile(e) {
            this.fillCrearUsuario.oFotografia = e.target.files[0];
        },
        setRegistrarUsuario() {
            this.validarRegistroUsuario();

            // ⚠️ NO continuar si hay errores de validación
            if (this.error) {
                return;
            }

            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            }); 

            if (!this.fillCrearUsuario.oFotografia || this.fillCrearUsuario.oFotografia == undefined) {
                this.setGuardarUsuario(null, loading);
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
        setGuardarUsuario(nIdFile, loading) {
            var url = '/administracion/usuario/setRegistrarUser';

            let fechaRaw = this.fillCrearUsuario.dFechaAlta;
            let fechaCorta = this.formatearFechaParaBD(fechaRaw);

            axios.post(url, {
                'cNombre': this.fillCrearUsuario.cPrimerNombre,
                'cApaterno': this.fillCrearUsuario.cSegundoNombre,
                'cAmaterno': this.fillCrearUsuario.cApellido,
                'cEmail': this.fillCrearUsuario.cCorreo,
                'cUser': this.fillCrearUsuario.cUsuario,
                'pswd': this.fillCrearUsuario.cContrasena,
                'oFotografia': nIdFile,
                'nIdDPTO': this.fillCrearUsuario.nIdDepartamento,
                'nIdRol': this.fillCrearUsuario.nIdRol,
                'fRegistro': fechaCorta,
            })
            .then(response => {
                loading.close();  

                Swal.fire({
                    icon: 'success',
                    title: 'Usuario registrado',
                    text: 'El usuario se ha registrado correctamente.',
                    confirmButtonText: 'Aceptar'
                });
                
                this.limpiarRegistroUsuario();
                this.limpiarErrores();
            })
            .catch(error => {
                loading.close();

                if (error.response.status == 401) {
                    sessionStorage.clear();
                    this.$router.push({ name: 'login' });
                    location.reload();
                } else if (error.response.status == 500) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Ha ocurrido un error',
                        text: 'Verifica que los datos sean correctos e inténtalo de nuevo',
                        confirmButtonText: 'Aceptar'
                    });
                }
            });
        },
        formatearFechaParaBD(fecha) {
            if (!fecha) return null;
            
            const fechaNew = new Date(fecha);
            const ahora = new Date(); // para obtener la hora actual

            const pad = (n) => n.toString().padStart(2, '0');

            const year = fechaNew.getFullYear();
            const month = pad(fechaNew.getMonth() + 1);
            const day = pad(fechaNew.getDate());

            const hours = pad(ahora.getHours());
            const minutes = pad(ahora.getMinutes());
            const seconds = pad(ahora.getSeconds());

            return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
        },
        validarRegistroUsuario() {
            this.error = false;

            if (this.fillCrearUsuario.cPrimerNombre === '') {
                this.errorNombre = "El Nombre(s) es un campo obligatorio";
                this.error = true;
            }
            if (this.fillCrearUsuario.cSegundoNombre === '') {
                this.errorApellidoP = "El Apellido Paterno es un campo obligatorio";
                this.error = true;
            }
            if (this.fillCrearUsuario.cApellido === '') {
                this.errorApellidoM = "El Apellido Materno es un campo obligatorio";
                this.error = true;
            }
            if (this.fillCrearUsuario.cCorreo === '') {
                this.errorCorreo = "El correo electrónico es un campo obligatorio";
                this.error = true;
            }
            if (this.fillCrearUsuario.cUsuario === '') {
                this.errorUsuario = "El Usuario es un campo obligatorio";
                this.error = true;
            }
            if (this.fillCrearUsuario.cContrasena === '') {
                this.errorContraseña = "La Contraseña es un campo obligatorio";
                this.error = true;
            }
            if (!this.fillCrearUsuario.nIdRol) {
                this.errorRol = 'Debe seleccionar un rol para el usuario';
                this.error = true;
            }

            if (!this.fillCrearUsuario.nIdDepartamento) {
                this.errorDepartamento = 'Debe seleccionar un departamento para el usuario';
                this.error = true;
            }
        },
        limpiarErrores() {
            this.errorNombre  = '';
            this.errorApellidoP  = '';
            this.errorApellidoM  = '';
            this.errorUsuario  = '';
            this.errorCorreo  = '';
            this.errorContraseña  = '';
            this.errorRol  = '';
            this.errorFecha  = '';
            this.errorDepartamento  = '';
            this.error = false;
            this.mensajeError = [];
        },
        limpiarRegistroUsuario() {
            this.fillCrearUsuario.cPrimerNombre = '';
            this.fillCrearUsuario.cSegundoNombre = '';
            this.fillCrearUsuario.cApellido = '';
            this.fillCrearUsuario.cUsuario = '';
            this.fillCrearUsuario.cCorreo = '';
            this.fillCrearUsuario.cContrasena = '';
            this.fillCrearUsuario.oFotografia = '';
            this.fillCrearUsuario.nIdRol = '';
            this.fillCrearUsuario.nFolio = '';
            this.fillCrearUsuario.dFechaAlta = '';
            this.fillCrearUsuario.nIdDepartamento = '';

            this.limpiarErrores();
        }/* 
         */
    }
}
</script>

<style scoped>
.vs-loading__background {
    display: none !important;
}
</style> 