<template>
    <div class="hidden">
        <vs-sidebar square v-model="active" open
            style="background-color: var(--iee-white); box-shadow: var(--iee-shadow);">
            <template #logo>
                <div v-if="changeLogo == 'dark'">
                    <img id="logoNavbar" style="margin-top: 1.15rem; width: 184px !important;">
                </div>
                <div v-else>
                    <img id="logoNavbar" style="margin-top: 1.15rem; width: 184px !important;">
                </div>
            </template>
            <template>
                <vs-sidebar-item id="dashboard.index" to="/">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            home
                        </span>
                    </template>
                    Inicio
                </vs-sidebar-item>
            </template>
            <template>
                <!-- <vs-sidebar-item v-if="listPermisos.includes('errores.index')" id="errores.index"
                    to="/consultaErrorcodes">
                    <template #icon>
                        <i class="fa fa-search"></i>
                    </template>
Consulta de Errores
</vs-sidebar-item> -->
                <vs-sidebar-item v-if="listPermisos.includes('captura.index')" id="captura.index"
                    to="/capturav2">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            app_registration
                        </span>
                    </template>
                    Captura
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('recordatorios.captura')" id="recordatorios.captura"
                    to="/recordatorios">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            notifications
                        </span>
                    </template>
                    Notificaciones
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('solicitudes.index')" id="solicitudes.index"
                    to="/indexSolicitudes">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            list_alt
                        </span>
                    </template>
                    Solicitudes
                </vs-sidebar-item>
                <!-- <vs-sidebar-item v-if="listPermisos.includes('solicitudes.ver')" id="solicitudes.ver"
                    to="/gestionSolicitudes">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            list_alt
                        </span>
                    </template>
                    Solicitudes
                </vs-sidebar-item> -->

                <vs-sidebar-item v-if="listPermisos.includes('admin.catalogos')" id="admin.catalogos" to="/catalogos">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            menu_book
                        </span>
                    </template>
                    Catalogos
                </vs-sidebar-item>

                <!-- <vs-sidebar-item v-if="listPermisos.includes('perfil.index')" id="perfil.index"
                    :to="'/perfil/' + usuario.id">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            account_circle
                        </span>
                    </template>
                    Mi Perfil
                </vs-sidebar-item> -->

                <vs-sidebar-item id="birthday.index" to="/birthday">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            featured_seasonal_and_gifts
                        </span>
                    </template>
                    Cumpleaños
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('admin.usuarios')" id="admin.usuarios" to="/usuarios">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            list
                        </span>
                    </template>
                    Usuarios
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('admin.preferencias')" id="admin.preferencias"
                    to="/preferenciasInterfaz">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            draw
                        </span>
                    </template>
                    Configuraciones
                </vs-sidebar-item>
            </template>
            <template #footer>
                <div class="container-fluid d-flex justify-content-between mx-0 px-0 flex-column-reverse flex-lg-row footer-sb">
                    <!-- <div class="">
                        <vs-tooltip top>
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
                    </div> -->
                    <div class="d-flex align-items-center pb-4">
                        <div class='toggle-switch'>
                            <label>
                                <input type='checkbox' v-model="darkmode" @click="switchTheme">
                                <span class='slider py-1'>
                                    <span v-if="darkmode"
                                        class="material-symbols-rounded d-flex justify-content-start align-items-center ml-0 pl-1 text-white">light_mode
                                    </span>
                                    <span v-else
                                        class="material-symbols-rounded d-flex justify-content-end align-items-center mr-0 pr-1 "
                                        style="color:black !important">dark_mode
                                    </span>
                                </span>
                            </label>
                        </div>
                    </div>
                </div>
            </template>
        </vs-sidebar>
    </div>
</template>
<script>
export default {
    props: [
        'ruta',
        'usuario',
        'listPermisos',
    ],
    data() {
        return {
            fullscreenLoading: false,
            active: 'dashboard.index',
            rolUsuario: sessionStorage.getItem('user_rol'),
            darkmode: (localStorage.getItem('theme') == 'light') ? false : true,
        }
    },
    // watch para actualizar el link active del sidebar cuando este cambie
    watch: {
        $route(to, from) {
            if (this.$route.name != null) {
                this.setActive();
            }
        }
    },
    computed: {
        changeLogo: function () {
            return (localStorage.getItem('theme') == 'light') ? 'light' : 'dark'
        }
    },
    created() {
        this.setActive();
        window.removeEventListener('resize', this.onWindowSizeChange);
    },
    destroyed() {
        window.removeEventListener('resize', this.onWindowSizeChange);
    },
    mounted() {
        this.getRolUsuario();
    },
    methods: {
        // Método que obtiene eltamaño del margin top que se debe aplicar al elemento
        // para evitar quedar debajo del navbar tomando el tamaño del mismo cuando se
        // carga la página y cuando se redimensiona
        getRolUsuario() {
            Echo.private(`logout.user.${this.usuario.id}`)
                .listen('Logout', (e) => {
                    this.logout();
                });
        },
        onWindowSizeChange() {
            let documentWidth = document.documentElement.clientWidth;
            const sidebarElem = document.querySelector(".vs-sidebar-content")
            if (documentWidth < 993) {
                if (!sidebarElem.classList.contains("reduce")) {
                    sidebarElem.classList.add("reduce")
                    sidebarElem.classList.add("hover-expand")
                }
            }
            else {
                if (sidebarElem.classList.contains("reduce")) {
                    sidebarElem.classList.remove("reduce")
                    sidebarElem.classList.remove("hover-expand")
                }
            }
        },
        /** Agrega la validación necesaria para mantener el resaltado de una sección principal en el sidebar cuando se accede a una subsección*/
        setActive() {
            if (this.$route.name === 'perfil.editar') {
                this.active = 'perfil.index';
            } else if(this.$route.name === 'usuario.editar'){
                this.active = 'admin.usuarios';
            } else {
                this.active = this.$route.name;
            }
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
        }, switchTheme() {
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
            EventBus.$emit('darkMode', this.darkmode);
        },
    }
}
</script>
<style>
.vs-sidebar__item__icon {
    background-color: transparent;
}

.vs-sidebar__item {
    color: var(--gray);
}

.vs-sidebar__item.active {
    color: var(--dorado);
}

.vs-sidebar__item:after {
    background-color: var(--dorado);

}
</style>