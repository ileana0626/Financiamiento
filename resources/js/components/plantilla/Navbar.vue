<template>
    <nav class="main-header navbar navbar-expand navbar-white navbar-light"
        style="background-color: var(--iee-white); border-bottom: 1px solid var(--iee-white);">
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
        <div class="navul navbar-nav my-auto d-flex align-items-center" v-if="showSwitchTheme">
            <vs-tooltip left>
                <div class="mode-toggle m-auto">
                    <div class='toggle-switch m-auto'>
                        <label>
                            <input type='checkbox' v-model="darkmode" @click="switchTheme">
                            <span class='slider py-1'>
                                <span v-if="darkmode"
                                    class="material-symbols-rounded d-flex justify-content-start align-items-center ml-0 pl-1 text-white">dark_mode</span>
                                <span v-else
                                    class="material-symbols-rounded d-flex justify-content-end align-items-center mr-0 pr-1">light_mode</span>
                            </span>
                        </label>
                    </div>
                </div>
                <template #tooltip>
                    {{ (darkmode) ? 'Claro' : 'Obscuro' }}
                </template>
            </vs-tooltip>
        </div>
        <div class="navul navbar-nav">
            <span class="username-navbar navText pr-3">
                <strong><small class="text-bold mx-2">{{ updateTime + ' hrs.' }}</small></strong>
            </span>
        </div>
        <div :class="mostrarSalir == false ? 'd-none' : ''">
            <vs-tooltip bottom>
                <vs-button id="logoutBtn" icon danger size="large" @click.prevent="logout">
                    <span class="material-symbols-rounded"
                        style="color: #FFFFFF !important; font-size: 20px !important; ">
                        logout
                    </span>
                </vs-button>
                <template #tooltip>
                    Salir
                </template>
            </vs-tooltip>
        </div>
    </nav>
</template>
<script>
export default {
    props: ['showMenuBtn', 'listPermisos',],
    data() {
        return {
            mostrarSalir: true,
            listaPermisos: [],
            userLogged: JSON.parse(sessionStorage.getItem('authUser')),
            darkmode: (localStorage.getItem('theme') == 'light') ? false : true,
            showSwitchTheme: true,
            currentTimeDB: ''
        }
    },

    computed: {
        updateTime() {
            setInterval(() => {
                this.getCurrentTime()
            }, 60000)
            return this.currentTimeDB;
        }
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

        switchTheme() {
            if (localStorage.getItem('theme') == 'light') {
                localStorage.setItem('theme', 'dark');
                document.documentElement.setAttribute('data-theme', 'dark');
            } else {
                localStorage.setItem('theme', 'light');
                document.documentElement.setAttribute('data-theme', 'light');
                // this.darkmode = !this.darkmode;
            }
            this.darkmode = !this.darkmode;
            // console.log(localStorage.getItem('theme'));
            // console.log(this.darkmode);
            EventBus.$emit('darkMode',this.darkmode);
        },

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
