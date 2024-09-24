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
                        <li>
                            <router-link :to="'/usuarios'"><span>
                                Usuarios
                            </span></router-link>
                        </li>
                        <li class="breadActive">
                            <span>Editar / {{ id }}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card-info pb-4">
                    <div class="card-header d-flex">
                        <h3 class="card-title font-weight-bold">Editar usuario</h3>
                    </div>
                    <div class="card-body container-fluid" style="background-color: var(--iee-white) !important;">
                        <h6 class="px-2 py-2 font-weight-bold">Fotografía</h6>
                        <div class="row">
                            <div class="col-12 col-xl-3 px-4 pb-3">
                                <div class="d-flex overflow-auto flex-column center">
                                    <div class="portrait-perfil bg-white" v-if="loadedFoto.rutaFP">
                                        <img draggable="false" :src="og + loadedFoto.rutaFP + stamp" alt="Foto de perfil" class="portrait-adjust" @error="errorIMG">
                                    </div>
                                    <div class="portrait-perfil bg-white" v-else>
                                        <img draggable="false" src="/img/LOGO_NUEVO.png" alt="Foto de perfil" class="portrait-adjust">
                                    </div>
                                    <span class="pt-3 text-center">
                                        {{ loadedFoto.tag }}
                                    </span>
                                </div>                                
                            </div>
                            <div class="col-12 col-xl-6 px-3 pb-3">
                                <div class="d-flex justify-content-center overflow-auto pb-4">
                                    <template v-if="fileFoto.length === 0">
                                        <el-upload class="upload-demo my-4" :class="fileFoto.length > 0 ? 'd-none' : 'd-block'" drag
                                        action="https://jsonplaceholder.typicode.com/posts/" :on-preview="handlePreview" :on-remove="handleRemove"
                                        :on-change="handleChange" :file-list="fileFoto" :on-exceed="handleExceed" :auto-upload="false" accept=".jpg,.jpeg,.png"
                                        :limit="1" ref="upload">
                                        <i class="fa fa-cloud-upload-alt"
                                            style="font-size: 70px; margin-top: 30px; margin-bottom: 10px; color: var(--grey);"></i>
                                        <div class="el-upload__text">Suelta tu archivo aquí o <em>haz clic para seleccionar</em></div>
                                        <div slot="tip" class="el-upload__tip">
                                            Solo imágenes tipo JPG, JPEG o PNG con un tamaño menor a 5MB
                                            <transition name="error-slide">
                                                <div class="danger-message" v-if="errorFoto.length > 0">
                                                    <template>
                                                        {{ errorFoto }}
                                                    </template>
                                                </div>
                                            </transition>
                                        </div>
                                        </el-upload>
                                    </template>
                                    <template v-else>
                                        <div>
                                            <div class="d-flex justify-content-between p-2 cardFile" :class="!!darkMode ? 'shadow-dark' : 'shadow'">
                                                <!-- Tipo -->
                                                <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex">
                                                    <i class="fa fa-file-image m-2 mr-3" style="font-size: 32px; color: var(--iee-white-dark);"></i>
                                                    <div class="d-flex flex-column filenameContainer">
                                                    <span class="errorDesc">Nombre</span>
                                                    <el-tooltip class="item" effect="dark" :content="fileFoto[0].name" placement="right">
                                                        <div>
                                                        <span class="fileNameClass errorDescDesc bold" style=""> {{ fileFoto[0].name }} </span>
                                                        </div>
                                                    </el-tooltip>
                                                    </div>
                                                </div>
                                                <el-tooltip class="item" effect="dark" content="Eliminar archivo" placement="right">
                                                    <div class="cardFileRemoveIcon" @click="eliminarArchivoSeleccionado">
                                                    <i class="far fa-trash-alt"></i>
                                                    </div>
                                                </el-tooltip>
                                                </div>
                                            </div>
                                        </div>
                                    </template>
                                </div>
                            </div>
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row">
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'accion1'+darkMode" @click.prevent="accionFoto()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar Fotografía
                                    </div>
                                </vs-button>                                
                            </div>
                        </div>
                        <el-divider></el-divider>      
                        <h6 class="px-2 py-2 font-weight-bold">Datos personales</h6>             
                        <div class="row">
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Nombre(s)</label>
                                <vs-input id="Nombres" type="text" color="#C2B280" icon-after v-model="datosPersonales.Nombre" @input="inputNombr('nombre')"
                                    placeholder="Nombre(s)" autocomplete="off" :state="error.Nombre ? 'danger': ''">
                                    <template #message-danger v-if="error.Nombre.length > 0">
                                        {{ error.Nombre }}
                                    </template>
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Primer Apellido</label>
                                <vs-input id="Apaterno" type="text" color="#C2B280" icon-after v-model="datosPersonales.Apaterno" @input="inputNombr('app')"
                                    placeholder="Primer Apellido" autocomplete="off" :state="error.Apaterno ? 'danger': ''">
                                    <template #message-danger v-if="error.Apaterno.length > 0">
                                        {{ error.Apaterno }}
                                    </template>
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Segundo Apellido</label>
                                <vs-input id="Amaterno" type="text" color="#C2B280" icon-after v-model="datosPersonales.Amaterno" @input="inputNombr('apm')"
                                    placeholder="Segundo Apellido" autocomplete="off" :state="error.Amaterno ? 'danger' : ''">
                                    <template #message-danger v-if="error.Amaterno.length > 0">
                                        {{ error.Amaterno }}
                                    </template>
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Correo electrónico</label>
                                <vs-input id="email" type="email" color="#C2B280" icon-after v-model="datosPersonales.email"
                                    placeholder="Correo electrónico" autocomplete="off" :state="error.email ? 'danger' : ''">
                                    <template #message-danger v-if="error.email.length > 0">
                                        {{ error.email }}
                                    </template>
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Fecha de nacimiento</label>
                                <div class="d-block">
                                    <el-date-picker v-model="datosPersonales.fechaNacimiento" type="date" placeholder="Seleccione su fecha de nacimiento"
                                        :picker-options="pickerOptions" :default-value="fechaValida" format="dd/MM/yyyy">
                                    </el-date-picker>
                                    <transition name="error-slide">
                                        <div class="danger-message" v-if="error.fechaNacimiento.length > 0">
                                            <template>
                                                {{ error.fechaNacimiento }}
                                            </template>
                                        </div>
                                    </transition>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Teléfono celular</label>
                                <vs-input id="celular" type="text" color="#C2B280" icon-after v-model="datosPersonales.numCelular" @input="inputNumCel()"
                                    placeholder="Teléfono celular" autocomplete="off" :state="error.numCelular ? 'danger' : ''">
                                    <template #message-danger v-if="error.numCelular.length > 0">
                                        {{ error.numCelular }}
                                    </template>
                                </vs-input>
                            </div>
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row pt-2">
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'accion2'+darkMode" @click.prevent="accionDatosPersonales()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar Datos Personales
                                    </div>
                                </vs-button>                                
                            </div>
                        </div>
                        <el-divider></el-divider>
                        <h6 class="px-2 py-2 font-weight-bold">Datos de usuario</h6>
                        <div class="row">
                            <div class="col-12 col-lg-6 col-xl-4 px-3 pb-3">
                                <label class="col-form-label">Rol</label>
                                <vs-select filter :state="errorDUsuario.rol.length > 0 ? 'danger': ''"
                                    :placeholder="'Seleccione un rol para el usuario'"
                                    v-model="datosUsuario.rol" v-if="cat_rol.length > 0" autocomplete="off">
                                    <template #message-danger v-if="errorDUsuario.rol.length > 0">
                                        {{ errorDUsuario.rol }}
                                    </template>
                                    <vs-option v-for="(item, index) in cat_rol" :key="index" :label="item.nombre"
                                        :value="item.idRol">
                                        {{ item.nombre }}
                                    </vs-option>
                                </vs-select>                        
                            </div>
                            <div class="col-12 col-lg-6 col-xl-4 px-3 pb-3">
                                <label class="col-form-label">Departamento</label>
                                <vs-select filter :key="cat_DPTO.length" :state="errorDUsuario.dpto.length ? 'danger': ''"
                                    :placeholder="'Seleccione un departamento para el usuario'"
                                    v-model="datosUsuario.dpto" v-if="cat_DPTO.length > 0" autocomplete="off">
                                    <template #message-danger v-if="errorDUsuario.dpto.length > 0">
                                        {{ errorDUsuario.dpto }}
                                    </template>
                                    <vs-option v-for="(item, index) in cat_DPTO" :key="index" :label="item.nombre"
                                        :value="item.id">
                                        {{ item.nombre }}
                                    </vs-option>
                                </vs-select>                        
                            </div>
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row">    
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode" @click.prevent="WIP()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar Datos Usuario
                                    </div>
                                </vs-button>                                
                            </div>
                        </div>
                        <el-divider></el-divider>
                        <h6 class="px-2 py-2 font-weight-bold">Reestablecer contraseña</h6>
                        <div class="row">
                            <div class="col-12 row">
                                <div class="col-12 col-lg-6 col-xl-4 px-3 pb-3">
                                    <label class="col-form-label">Nueva contraseña</label>
                                    <vs-input id="contrasenaNueva" type="password" color="#C2B280" icon-after v-model="passNueva"
                                        placeholder="Escriba la nueva contraseña" autocomplete="off" 
                                        :visiblePassword="visiblePSWD.nueva" 
                                        :state="errorPSWD.nueva ? 'danger' : ''"
                                        @click-icon="visiblePSWD.nueva = !visiblePSWD.nueva">
                                        <template #message-danger v-if="errorPSWD.nueva.length > 0">
                                            {{ errorPSWD.nueva }}
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
                                <div class="col-12 col-lg-6 col-xl-4 px-3 pb-3">
                                    <label class="col-form-label">Confirmar contraseña</label>
                                    <vs-input id="contrasenaConfirma" type="password" color="#C2B280" icon-after v-model="passConfirmar"
                                        placeholder="Confirme la nueva contraseña" autocomplete="off"
                                        :visiblePassword="visiblePSWD.confirmar" 
                                        :state="errorPSWD.confirmar ? 'danger' : ''"
                                        @click-icon="visiblePSWD.confirmar = !visiblePSWD.confirmar">
                                        <template #message-danger v-if="errorPSWD.confirmar.length > 0">
                                            {{ errorPSWD.confirmar }}
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
                            </div>
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row">
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'limpiar'+darkMode" @click.prevent="limpiarContrasena()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                    </div>
                                </vs-button>      
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode" @click.prevent="WIP()">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Reestablecer contraseña
                                    </div>
                                </vs-button>                                
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Swal from 'sweetalert2';
import methods from '../../../methods.js';
export default {
    props: ['id'],
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            
            fileFoto: [],
            loadedFoto: {
                id_FP: null,
                rutaFP: null,
                tag: 'No se ha cargado una imagen',
            },
            errorFoto: '',
            fotoProcede: false,

            og: window.location.origin + '/',
            stamp: this.getLocalStamp(),
            
            datosPersonales: {
                Nombre: '',
                Apaterno: '',
                Amaterno: '',
                email: '',
                id_DP: null,
                fechaNacimiento: '',
                numCelular: '',
            },
            procede: false,
            error: {
                Nombre: '',
                Apaterno: '',
                Amaterno: '',
                email: '',
                fechaNacimiento: '',
                numCelular: '',
            },
            
            fechaValida: new Date().setFullYear( new Date().getFullYear() - 18),
            pickerOptions: {
                disabledDate(time) {
                    var date = new Date();
                    date.setFullYear(date.getFullYear() - 18);
                    return time.getTime() > date;
                    },
                },
            
                
            passActual: '',
            passNueva: '',
            passConfirmar: '',
            passProcede: false,

            errorPSWD: {
                actual: '',
                nueva: '',
                confirmar: '',
            },
            visiblePSWD:{
                actual: false,
                nueva: false,
                confirmar: false,
            },
            // para datos usuario
            rolUsuario: sessionStorage.getItem('rolUsuario') ? Number(sessionStorage.getItem('rolUsuario')) : 0,
            cat_rol:[],
            cat_DPTO:[],
            datosUsuario: {
                rol: '',
                dpto: '',
                nombreRol: '',
                nombreDPTO: '',
            },
            errorDUsuario: {
                rol: '',
                dpto: '',
            },
        }
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
    },
    async mounted(){
        const load = methods.loading( this.$vs );
        await this.getDatosPersonalesById();
        await this.getRoles();
        await this.getDepartamentos();
        await this.getDatosRolById();
        load.close();
    },
    computed: {
        validEmail() {
            return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.datosPersonales.email);
        },
    },
    methods: {
        async getDatosPersonalesById() {
            const url = '/administracion/usuario/getDatosPersonalesById';
            try {
                const response = await axios.get(url, {
                    params: {
                        'nId': this.id
                    }
                });

                if(response.status === 200){
                    let datos = response.data[0];
                    this.datosPersonales.Nombre = datos.Nombre;
                    this.datosPersonales.Apaterno = datos.Apaterno;
                    this.datosPersonales.Amaterno = datos.Amaterno;
                    this.datosPersonales.email = datos.email;
                    this.datosPersonales.id_DP = datos.id_DP;
                    this.datosPersonales.fechaNacimiento = datos.fechaNacimiento ? new Date(datos.fechaNacimiento + 'T00:00:00-05:00') : '';
                    this.datosPersonales.numCelular = datos.numCelular;
                    
                    this.loadedFoto.id_FP = datos.id_FP;
                    this.loadedFoto.rutaFP = datos.rutaFP; 
                    this.loadedFoto.tag = datos.rutaFP ? 'Imagen cargada' : 'No se ha cargado una imagen';;
                }
            } catch (error) {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            }
        },
        // Metódos fotografía
        async setSubirFP() {
            const url = "/archivos/setSubirFP";

            let form = new FormData;
            form.set('nId',this.id);
            form.set('archivo', this.fileFoto[0]);
            form.set('fActualizado', methods.getTimestamp());

            const config = {headers: { 'Content-Type': 'multipart/form-data'}};
            const load = methods.loading( this.$vs );

            try {
                const response = await axios.post(url, form, config);
                if(response.status === 200){
                    let fDatos = response.data[0];  
                    
                    this.stamp = this.getLocalStamp();
                    this.loadedFoto.id_FP = fDatos.id_FP;
                    this.loadedFoto.rutaFP = fDatos.rutaFP; 
                    this.loadedFoto.tag = 'Imagen cargada'
                    Swal.fire({
                        icon: 'success',
                        title: 'Fotografía actualizada correctamente',
                        showConfirmButton: true,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'De acuerdo',
                    }).then(async (result) => {
                        // const load = methods.loading( this.$vs );                       
                        this.fileFoto = [];
                        // load.close();
                    })
                }
            } catch (error) {
                const method = url.split('/');
                methods.catchHandler(error, method[3])
            } finally {
                load.close();
            }
        }, 
        accionFoto() {
            this.limpiaErrorFoto();
            this.validarFoto();
            if(this.fotoProcede) {
                Swal.fire({
                    icon: 'warning',
                    title: '¿Desea actualizar su fotografía?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    reverseButtons: true,
                    confirmButtonText: 'Actualizar',
                    cancelButtonText: 'Cancelar',
                }).then(async (result) => {
                    if(result.isConfirmed){
                       await this.setSubirFP();
                    }
                });                 
            }
        },
        validarFoto(){
            this.fotoProcede = true;
            if(this.fileFoto.length === 0){
                this.errorFoto = 'No se ha cargado una fotografía';
                this.fotoProcede = false;
            }
        },
        limpiaErrorFoto(){
            this.errorFoto = '';
        },
        getLocalStamp(){
            return '?stamp=' + new Date().getTime();
        },
        errorIMG(e) {
          e.target.src = '/img/LOGO_NUEVO.png';
          this.loadedFoto.tag = 'No se pudo cargar la imagen';
        },       
        handlePreview(file) {
        },
        handleRemove(file, fileList) {
            this.fileFoto.splice(0, this.fileFoto.length)
        },
        handleExceed(files, fileList) {
            Swal.fire({
                icon: 'error',
                title: 'Solo puede subir una imagen.',
                showConfirmButton: true,
                confirmButtonText: 'De acuerdo',
            });
        },
        handleChange(file, fileList) {
            let arregloNombre;
            var lastIndex = file.name.lastIndexOf('.');
            // Add the string before the last .
            // Return updated string, this will update the file.name attribute value
            arregloNombre = file.name.substr(lastIndex + 1);
            arregloNombre = String(arregloNombre).toUpperCase();

            if ((arregloNombre == 'JPG') || (arregloNombre == 'JPEG') || (arregloNombre == 'PNG')) {
                if (file.size > 5120000) {
                    this.$refs.upload.clearFiles();
                    Swal.fire({
                        icon: 'error',
                        html: '<div class="col"><div class="swal2-title p-0 mb-2">¡El archivo excede el límite de carga permitido!</div><div class="swal2-title font-weight-normal p-0" style="font-size: 20px">Seleccione uno con menor peso</div></div>',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo',
                    });

                    this.fileFoto.splice(0, this.fileFoto.length);

                } else {
                    this.fileFoto.push(file.raw);
                }
            }
            else {
                this.fileFoto.splice(0, this.fileFoto.length);
                Swal.fire({
                    icon: 'error',
                    html: '<div class="col">'+
                            '<div class="swal2-title p-0 mb-2" style="font-size: 18px;">'+
                                '¡Formato de archivo no válido!'+
                            '</div>'+
                        '</div>',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo',
                    });
                }
        },
        eliminarArchivoSeleccionado() {
            Swal.fire({
                icon: 'warning',
                title: '¿Desea eliminar el archivo seleccionado?',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                // cancelButtonColor: 'transparent',
                cancelButtonText: "Cancelar",
                confirmButtonText: 'De acuerdo',
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    this.handleRemove();
                }
            })
        },
        // metodos datos personales
        inputNumCel() {
            let regex = /[^0-9]{1,10}/g;
            let temp = this.datosPersonales.numCelular;
            if(temp.length > 10) temp = temp.substring(0,10);
            this.datosPersonales.numCelular = temp.replace(regex, '');
        },
        inputNombr( cadena ){
            let regex = /[^a-zA-ZáíóéúÁÉÍÓÚñÑ ]{0,50}$/;
            let temp = '';
            switch (cadena){
                case 'nombre':
                    temp = this.datosPersonales.Nombre;
                    if(temp.length > 50) temp = temp.substring(0,50);
                    this.datosPersonales.Nombre = temp.replace(regex,'');
                    break;
                case 'app':
                    temp = this.datosPersonales.Apaterno;
                    if(temp.length > 50) temp = temp.substring(0,50);
                    this.datosPersonales.Apaterno = temp.replace(regex,'');
                    break;
                case 'apm':
                    temp = this.datosPersonales.Amaterno;
                    if(temp.length > 50) temp = temp.substring(0,50);
                    this.datosPersonales.Amaterno = temp.replace(regex,'');
                    break;
            }
        },
        async setDatosPersonalesFormById() {
            const url = '/administracion/usuario/setDatosPersonalesFormById';
            const load = methods.loading( this.$vs );
            try {
                let temp = this.datosPersonales.fechaNacimiento;
                let fNac = temp.getFullYear() + '-' + String((Number(temp.getMonth() + 1))).padStart(2,'0')+ '-' + temp.getDate(); 

                const response = await axios.post(url, {
                    'nIdRegistro': this.datosPersonales.id_DP ? this.datosPersonales.id_DP : 0,
                    'nIdUser': this.id,
                    'cNombre': this.datosPersonales.Nombre,
                    'cApaterno': this.datosPersonales.Apaterno,
                    'cAmaterno': this.datosPersonales.Amaterno,
                    'cEmail': this.datosPersonales.email,
                    'fNacimiento': fNac,
                    'cCelular': this.datosPersonales.numCelular,
                    'fAccion': methods.getTimestamp(),
                });
                if(response.status === 200){
                    this.datosPersonales.id_DP = response.data[0].id_DP;
                    Swal.fire({
                        icon: 'success',
                        title: 'Datos actualizados correctamente',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo',
                    });                    
                }
            } catch (error) {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            } finally {
                load.close();
            }
        },
        async accionDatosPersonales() {
            this.limpiaError();
            this.validarDatosPersonales();
            if(this.procede){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Desea actualizar sus datos personales?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    reverseButtons: true,
                    confirmButtonText: 'Actualizar',
                    cancelButtonText: 'Cancelar',
                }).then(async (result) => {
                    if(result.isConfirmed){
                        this.setDatosPersonalesFormById();
                    }
                }); 
            }
        },
        validarDatosPersonales() {
            this.procede = true;
            if(this.datosPersonales.Nombre === ''){
               this.error.Nombre = 'El nombre es obligatorio';
               this.procede = false;
            }
            if(this.datosPersonales.Apaterno === ''){
                this.error.Apaterno = 'El primer apellido es obligatorio';
                this.procede = false; 
            }
            // if(this.datosPersonales.Amaterno === ''){
            //     this.error.Amaterno = 'El segundo apellido es obligatorio';
            //     this.procede = false;
            // }
            if(this.datosPersonales.email === ''){
                this.error.email = 'El correo electrónico es obligatorio';
                this.procede = false;
            } else if (!this.validEmail){
                this.error.email = 'El correo electrónico no tiene un formato válido';
                this.procede = false;
            }
            if(!this.datosPersonales.fechaNacimiento){
                this.error.fechaNacimiento = 'La fecha de nacimiento es obligatoria';
                this.procede = false;
            }
            if(this.datosPersonales.numCelular === ''){
                this.error.numCelular = 'El télefono celular es obligatorio';
                this.procede = false;
            } else if(this.datosPersonales.numCelular.length < 10){
                this.error.numCelular = 'El télefono celular debe tener 10 dígitos'
                this.procede = false;
            }
        },
        limpiaError() {
            this.error.Nombre = '';
            this.error.Apaterno = '';
            this.error.Amaterno = '';
            this.error.email = '';
            this.error.fechaNacimiento = '';
            this.error.numCelular = '';
        },
        // metodos datos usuario
        async getDatosRolById() {
            const url = '/administracion/usuario/getDatosRolById';
            try {
                const response = await axios.get(url, {
                    params: {
                        'nId': this.id
                    }
                });
                if(response.status === 200){
                    const datos = response.data[0];
                    this.datosUsuario.dpto = Number(datos.idDPTO);
                    this.datosUsuario.rol = datos.idRol;
                    this.datosUsuario.nombreRol = datos.nombreRol;
                }
            } catch (error) {
                let method = url.split('/');
                methods.catchHandler(error,method[3]);
            }
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
                methods.catchHandler(error, method[3]);
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
                methods.catchHandler(error, method[3]);
            }
        },

        // metodos contraseña
        validarPass(){
            this.passProcede = true;
            if(this.passActual === ''){
                this.errorPSWD.actual = 'La contraseña actual no puede ir vacia';
                this.passProcede = false;
            }
            if(this.passNueva === ''){
                this.errorPSWD.nueva = 'La nueva contraseña no puede ir vacia';
                this.passProcede = false;
            }  else if(this.passNueva.length < 8){
                this.errorPSWD.nueva = 'La contraseña debe tener al menos 8 caracteres';
                this.passProcede = false;
            } else if(this.passNueva !== this.passConfirmar){
                this.errorPSWD.nueva = 'Las contraseñas no coinciden';
                this.errorPSWD.confirmar = 'Las contraseñas no coinciden';
                this.passProcede = false;
            }
            // if(this.passConfirmar === ''){
            //     this.errorPSWD.confirmar = 'La confirmación de contraseña no puede ir vacia';
            //     this.passProcede = false;
            // }
        },
        limpiarErrorPass() {
            this.errorPSWD.nueva = '';
            this.errorPSWD.actual = '';
            this.errorPSWD.confirmar = '';
        },
        limpiarContrasena(){
            this.passActual = '';
            this.passNueva = '';
            this.passConfirmar = '';
            this.limpiarErrorPass();
        },
        async accionPass() {
            this.limpiarErrorPass();
            this.validarPass();
            if(this.passProcede){
                Swal.fire({
                    icon: 'warning',
                    title: '¿Desea actualizar su contraseña?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    reverseButtons: true,
                    confirmButtonText: 'Actualizar',
                    cancelButtonText: 'Cancelar',
                }).then(async (result) => {
                    if(result.isConfirmed){
                       await this.setUpdatePass();
                    }
                });                  
            }

        },
        async setUpdatePass() {
            const url = '/administracion/usuario/setUpdatePass'
            const load = methods.loading( this.$vs );    
            try {
                const response = await axios.post(url,{
                    'nId': this.id,
                    'pass': this.passActual,
                    'newPass': this.passNueva,
                    'confirmPass': this.passConfirmar,
                });
                if(response.status === 200){
                    Swal.fire({
                        icon: 'success',
                        title: 'Contraseña actualizada correctamente',
                        showConfirmButton: true,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'De acuerdo',
                    }).then(async (result) => {                   
                        this.limpiarContrasena();
                    })
                }
            } catch (error) {
                const method = url.split('/');
                methods.catchHandler(error, method[3])
            } finally {
                load.close();
            }
        },
        // general
        WIP() {
            const noti = methods.WIP(this.$vs);
        },
    }
}
</script>

<style scoped>

</style>