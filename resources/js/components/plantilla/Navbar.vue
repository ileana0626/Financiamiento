<template>
    <nav class="main-header navbar navbar-expand navbar-white navbar-light"
        style="background-color: var(--iee-bg-color); border-bottom: 1px solid var(--iee-bg-color);">
        <ul class="navul mr-auto navbar-nav">
            <li class="nav-item">
                <p class="navText">
                    <b>Sistema de la Dirección Administrativa</b>
                </p>

                <p class="navText">
                    <small>
                        <b>Instituto Electoral del Estado</b>
                    </small>
                </p>
            </li>
        </ul>

        <div class="navul navbar-nav">
            <div class="row pr-sm-4 p-2">
                <vs-tooltip bottom>
                    <span style="cursor: pointer;" class="material-symbols-rounded">
                        notifications
                    </span>
                    <template #tooltip> Notificaciones</template>
                </vs-tooltip>
                &nbsp;&nbsp;&nbsp;
                <vs-tooltip bottom>
                    <span style="cursor: pointer;" @click="ruta" class="material-symbols-rounded">
                        help
                    </span>
                    <template #tooltip> Ayuda</template>
                </vs-tooltip>
            </div>
            <div class="row d-flex justify-content-center ml-0 ml-md-2">
                <div class="col-12 col-md-4 d-flex justify-content-center justify-content-md-end">
                    <vs-tooltip bottom>
                        <vs-avatar style="cursor: pointer;" circle v-if="loadedFoto.rutaFP" badge badge-color="#a5904a"  @click.prevent="perfil">
                            <img :src="og + loadedFoto.rutaFP" alt="Foto de perfil" @error="errorIMG">
                        </vs-avatar>
                        <vs-avatar style="cursor: pointer;" circle badge badge-color="#a5904a" v-else  @click.prevent="perfil">
                            <img src="/img/LOGO_NUEVO.png" alt="Foto de perfil">
                        </vs-avatar>
                        <template #tooltip>Perfil</template>
                    </vs-tooltip>
                </div>
                <div class="col-12 col-md-6 py-2 d-flex justify-content-center justify-content-md-start align-self-center">
                    <small class="text-bold">{{ datosPersonales.Nombre }}</small>
                </div>
            </div>
        </div>
    </nav>
</template>
<script>
import methods from '../../methods.js'
export default {
    props: ['showMenuBtn', 'listPermisos',],
    data() {
        return {
            datosPersonales: {
                Nombre: sessionStorage.getItem('navName') ? sessionStorage.getItem('navName') : '',
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
            id: sessionStorage.getItem('idUsuario') ? JSON.parse(sessionStorage.getItem('idUsuario')) : 0
        }
    },

    computed: {
        // updateTime() {
        //     setInterval(() => {
        //         this.getCurrentTime()
        //     }, 60000)
        //     return this.currentTimeDB;
        // }
    },

    mounted() {
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
            window.location.href = '/perfil/' + this.id
        }
        
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
