<template>
    <nav class="main-header navbar navbar-expand navbar-white navbar-light"
        style="background-color: var(--iee-white); border-bottom: 1px solid var(--iee-white);">
        <ul class="navul mr-auto navbar-nav">
            <li class="nav-item">
                <p class="navText" @click.prevent="notify_count++">
                    <b>Sistema de la Dirección Administrativa</b>
                </p>

                <p class="navText" @click.prevent="notify_count = 0">
                    <small>
                        <b>Instituto Electoral del Estado</b>
                    </small>
                </p>
            </li>
        </ul>

        <div class="navul navbar-nav">
            <div class="row pr-sm-4 p-2">
                <el-popover placement="bottom" trigger="click">
                    <div slot="reference">
                        <el-tooltip placement="bottom">
                            <div class="nav-notify" :data-count="notify_count" :class="notify_count > 0 ? 'show-count' : ''">
                                <span style="cursor: pointer;" class="material-symbols-rounded" ref="box_notify">
                                    notifications
                                </span>
                            </div>
                            <div slot="content"> Notificaciones</div>
                        </el-tooltip>
                    </div>
                    <div class="d-flex container-fluid flex-column align-items-center">
                        <ul class="list-group" v-if="notify_count > 0">
                            <li class="list-group-item bs-li" v-if="memo_count > 0">
                                <span class="font-weight-bold">{{ memo_count }}</span> {{ memo_count == 1 ? 'recordatorio' : 'recordatorios' }} de memorándum
                            </li>
                            <li class="list-group-item" v-if="oficio_count > 0">
                                <span class="font-weight-bold">{{ oficio_count }}</span> {{ oficio_count == 1 ? 'recordatorio' : 'recordatorios' }} de oficio
                            </li>
                            <li class="list-group-item" v-if="circular_count > 0">
                                <span class="font-weight-bold">{{ circular_count }}</span> {{ circular_count == 1 ? 'recordatorio' : 'recordatorios' }} de circular
                            </li>
                            <li class="list-group-item" v-if="requi_count > 0">
                                <span class="font-weight-bold">{{ requi_count }}</span> {{ requi_count == 1 ? 'recordatorio' : 'recordatorios' }} de requisición
                            </li>
                        </ul>
                        <div v-else class="d-flex py-2 px-3 text-center">
                            <span>No se han recibido recordatorios</span>
                        </div>
                    </div>
                </el-popover>
                &nbsp;&nbsp;&nbsp;
                <el-tooltip placement="bottom">
                    <span style="cursor: pointer;" @click="ruta" class="material-symbols-rounded">
                        help
                    </span>
                    <div slot="content"> Ayuda</div>
                </el-tooltip>
            </div>
        </div>
        <div class="d-flex align-items-center" style="gap: 10px;">
            <el-popover placement="bottom" trigger="hover">
                <div class="row d-flex justify-content-center ml-0 ml-md-2 nav-avatar" slot="reference">
                    <div class="col-12 col-md-4 d-flex justify-content-center justify-content-md-end">
                        <div>
                            <vs-avatar style="cursor: pointer;" circle v-if="loadedFoto.rutaFP" badge badge-color="#a5904a">
                                <img :src="og + loadedFoto.rutaFP" alt="Foto de perfil" @error="errorIMG">
                            </vs-avatar>
                            <vs-avatar style="cursor: pointer;" circle badge badge-color="#a5904a" v-else>
                                <img src="/img/LOGO_NUEVO.png" alt="Foto de perfil">
                            </vs-avatar>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 py-2 d-flex justify-content-center justify-content-md-start align-self-center">
                        <small class="text-bold">{{ datosPersonales.Nombre }}</small>
                    </div>
                </div>  
                <div class="d-flex container-fluid flex-column align-items-center w-pop" @click.prevent="perfil">
                    <div class="d-flex pt-3 pb-1">
                        <vs-avatar circle v-if="loadedFoto.rutaFP" size="60">
                            <img :src="og + loadedFoto.rutaFP" alt="Foto de perfil" @error="errorIMG">
                        </vs-avatar>
                        <vs-avatar circle v-else size="60">
                            <img src="/img/LOGO_NUEVO.png" alt="Foto de perfil">
                        </vs-avatar>                     
                    </div>
                    <span class="font-weight-bold infoName">{{ nombreCompleto }}</span>
                    <span class="infoRol pb-4">{{ rol }}</span>
                </div> 
                <div class="logoutBar">
                    <div class="d-flex justify-content-start" @click.prevent="logout">
                        <span class="material-symbols-rounded redPill"
                            style="font-size: 20px !important; ">
                            logout
                        </span>
                        <span class="d-flex align-items-center font-weight-bold">
                            Cerrar Sesión
                        </span>
                    </div>
                </div>
            </el-popover>         
        </div>
    </nav>
</template>
<script>
import Swal from 'sweetalert2';
import methods from '../../methods.js'
export default {
    props: ['showMenuBtn', 'listPermisos',],
    data() {
        return {
            datosPersonales: {
                Nombre: sessionStorage.getItem('navName') ? sessionStorage.getItem('navName') : '',
                idRol: sessionStorage.getItem('rolUsuario') ? Number(sessionStorage.getItem('rolUsuario')) : '',
                idDPTO: sessionStorage.getItem('idDepartamento') ? Number(sessionStorage.getItem('idDepartamento')) : '',
            },
            fullscreenLoading: false,
            og: window.location.origin + '/',
            stamp: this.getLocalStamp(),
            mostrarSalir: true,
            listaPermisos: [],
            userLogged: JSON.parse(sessionStorage.getItem('authUser')),
            darkmode: (localStorage.getItem('theme') == 'light') ? 'light' : 'dark',
            showSwitchTheme: true,
            currentTimeDB: '',
            loadedFoto: {
                rutaFP: sessionStorage.getItem('loadedFoto') ? sessionStorage.getItem('loadedFoto') : null,
            },
            id: sessionStorage.getItem('idUsuario') ? JSON.parse(sessionStorage.getItem('idUsuario')) : 0,
            showDropDown: false,

            notify_count: sessionStorage.getItem('notify_count') ? Number(sessionStorage.getItem('notify_count')) : 0,
            memo_count: sessionStorage.getItem('memo_count') ? Number(sessionStorage.getItem('memo_count')) : 0,
            oficio_count: sessionStorage.getItem('oficio_count') ? Number(sessionStorage.getItem('oficio_count')) : 0,
            circular_count: sessionStorage.getItem('circular_count') ? Number(sessionStorage.getItem('circular_count')) : 0,
            requi_count: sessionStorage.getItem('requi_count') ? Number(sessionStorage.getItem('requi_count')) : 0,
        }
    },

    computed: {
        // updateTime() {
        //     setInterval(() => {
        //         this.getCurrentTime()
        //     }, 60000)
        //     return this.currentTimeDB;
        // }
        nombreCompleto(){
            let NC = `${this.userLogged.Nombre} ${this.userLogged.Apaterno} ${this.userLogged.Amaterno}`;
            return NC.trim();
        },
        rol(){
            return sessionStorage.getItem('nombreRol') ? sessionStorage.getItem('nombreRol') : 'Rol' 
        }
    },
    watch:{
        notify_count(newVal, oldVal){
            if(newVal > oldVal){
                this.$refs.box_notify.classList.remove('help-anim2');
                setTimeout(() => {
                    this.$refs.box_notify.classList.add('help-anim2');
                }, 50);
            } else{
                this.$refs.box_notify.classList.remove('help-anim2');
            }
        }
    },
    created(){
    },
    mounted() {
        this.listenNotify();
        this.checkPermisos();
        this.getCurrentTime();
        if (localStorage.getItem('theme') == 'light') {
            document.documentElement.setAttribute('data-theme', 'light');
            this.darkmode = false;
        } else {
            // localStorage.setItem('theme', 'dark');
            document.documentElement.setAttribute('data-theme', 'dark');
            this.darkmode = true;
        }
        EventBus.$on('infoNav', (data) => {
            this.id = data;
            this.getDatosPersonalesById();
        })
    },
    methods: {
        checkPermisos() {
            this.listaPermisos = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
            if (this.listaPermisos == null) {
                sessionStorage.clear();
                setTimeout(() => {
                    this.logout();
                }, 200);
            }
            else {
                try {
                    for (const key of this.listaPermisos) {
                        if (key == 'preguntas.evaluacion') {
                            this.mostrarSalir = false;
                        }
                    }
                } catch (error) {
                }
            }
        },

        // switchTheme() {
        // if (localStorage.getItem('theme') == 'light') {
        // localStorage.setItem('theme', 'dark');
        // document.documentElement.setAttribute('data-theme', 'dark');
        // } else {
        // localStorage.setItem('theme', 'light');
        // document.documentElement.setAttribute('data-theme', 'light');
        // this.darkmode = !this.darkmode;
        // }
        // this.darkmode = !this.darkmode;
        // console.log(localStorage.getItem('theme'));
        // console.log(this.darkmode);
        // EventBus.$emit('darkMode', this.darkmode);
        // },

        getCurrentTime() {
            let url = '/administracion/usuario/getCurrentTime';
            axios.get(url).then(response => {
                this.currentTimeDB = response.data[0].currentTime;
            });

        },

        logout() {
            Swal.fire({
                // heightAuto: false,
                customClass: 'swal-height',
                html:
                    '<div class="modalLogout" style="overflow-x:hidden"> <div class="txtLogout"><span >Si hace clic en continuar, su sesión se cerrará y deberá ingresar al sistema nuevamente. <br> ¿Desea continuar? </span></div>  <img class="imgLogout" src="/img/logout.webp"/> </div>',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                // cancelButtonColor: 'transparent',
                cancelButtonText: "Cancelar",
                confirmButtonText: 'Continuar',
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    this.fullscreenLoading = true;
                    let url = '/authenticate/logout'
                    axios.post(url).then(response => {
                        if (response.data.code == 204) {
                            this.fullscreenLoading = false;
                            sessionStorage.clear();
                            this.$router.push({ name: 'login' });
                            location.reload();

                        }
                    }).catch((error) => {
                        if (error.response.status == 401) {
                            this.fullscreenLoading = false;
                            sessionStorage.clear();
                            this.$router.push({ name: 'login' });
                            location.reload();
                        }
                    });
                }
            });
        },
        async getDatosPersonalesById() {
            const url = '/administracion/usuario/getDatosPersonalesById';
            try {
                const response = await axios.get(url, {
                    params: {
                        'nId': this.id
                    }
                });

                if (response.status === 200) {
                    let datos = response.data[0];
                    let nameSplit = datos.Nombre.split(' ');
                    this.datosPersonales.Nombre = nameSplit[0];
                    let fotoActual = datos.rutaFP + this.getLocalStamp();
                    this.loadedFoto.rutaFP = fotoActual;
                    sessionStorage.setItem('loadedFoto', fotoActual);
                    sessionStorage.setItem('navName', this.datosPersonales.Nombre);
                }
            } catch (error) {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            }
        },
        errorIMG(e) {
          e.target.src = this.og + 'img/LOGO_NUEVO.png' + this.getLocalStamp();
        },
        getLocalStamp() {
            return '?stamp=' + new Date().getTime();
        },
        ruta() {
            this.$router.push({ name: "faq.index" });
        },
        perfil(){
            this.showDropDown = false;
            window.location.href = '/perfil/' + this.id
        },
        // evento notificacion
        listenNotify() {
            /**Se actualizan variables de contadores para el modal popover y se muestra un modal de sweetalert */
            Echo.private(`navNotify.user.${this.datosPersonales.idRol}.${this.datosPersonales.idDPTO}`)
            .listen('NavNotify', (data) => {
                let info = JSON.parse(data.info);
                let showRedirigir = this.$route.path != '/indexSolicitudes';
                this.notify_count++;
                sessionStorage.setItem('notify_count', this.notify_count);
                switch (info.cTipo){
                    case 'MEMORÁNDUM':
                        this.memo_count++;
                        sessionStorage.setItem('memo_count', this.memo_count);
                        break;
                    case 'OFICIO':
                        this.oficio_count++;
                        sessionStorage.setItem('oficio_count', this.oficio_count);
                        break;
                    case 'CIRCULAR':
                        this.circular_count++;
                        sessionStorage.setItem('circular_count', this.circular_count);
                        break;
                    case 'REQUISICIÓN':
                        this.requi_count++;
                        sessionStorage.setItem('requi_count', this.requi_count);
                        break;
                }
                Swal.fire({
                    icon: 'info',
                    title: `Recordatorio de ${info.cTipo} recibido`,
                    showConfirmButton: showRedirigir,
                    confirmButtonText: 'Ir a solicitudes',
                    showCancelButton: true,
                    cancelButtonText: 'De acuerdo',
                    reverseButtons: true,
                }).then( result => {
                    if(result.isConfirmed){
                        // redirigir a solicitudes
                        this.$router.push('/indexSolicitudes');
                    }
                })
            });          
        },
    }
}
</script>
<style>
.username-navbar {
    cursor: pointer;
    white-space: nowrap;
}

@media screen and (max-width: 768px) {
    .username-navbar {
        white-space: normal;
    }
}

@media screen and (max-width: 650px) {
    .username-navbar {
        display: none;
    }
}

@media screen and (max-width: 650px) {
    .username-navbar {
        display: none;
    }
}

.toggle-switch {
    position: relative;
    width: 55px;
    top: 5px;
    display: flex;
    align-items: center;
}

.toggle-switch label {
    position: absolute;
    width: 100%;
    height: 30px;
    background-color: var(--light);
    border-radius: 50px;
    box-shadow: inset 0 0 1px 1px var(--iee-light-gray-2);
    cursor: pointer;
}


.toggle-switch input {
    position: absolute;
    display: none;
}

.slider {
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 50px;
    transition: 0.3s;
}


.slider span {
    font-size: 1.4rem !important;
}

.toggle-switch input:checked~.slider {
    background-color: var(--dark);
}

.slider::before {
    content: "";
    position: absolute;
    top: 7px;
    left: 6px;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    /* box-shadow: inset 8px 1px 2px 0px var(--light); */
    background-color: var(--dark);
    transition: 0.4s;
}

.toggle-switch input:checked~.slider::before {
    transform: translateX(25px);
    background-color: var(--light);
    box-shadow: none;
}
</style>
