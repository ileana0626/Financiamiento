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
                <vs-sidebar-item v-if="listPermisos.includes('solicitudes.captura')" 
                id="solicitudes.captura" to="/captura">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            app_registration
                        </span>
                    </template>
                    Captura
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('recordatorios.captura')"  id="recordatorios.captura" to="/recordatorios">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            notifications
                        </span>
                    </template>
                    Notificaciones
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('solicitudes.ver')"  id="solicitudes.ver" to="/solicitudes">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            list_alt
                        </span>
                    </template>
                    Solicitudes
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('admin.catalogos')"  id="admin.catalogos" to="/catalogos">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            menu_book
                        </span>
                    </template>
                    Catalogos
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('perfil.index')"  id="perfil.index" :to="'/perfil/' + usuario.id">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            account_circle
                        </span>
                    </template>
                    Mi Perfil
                </vs-sidebar-item>

                <vs-sidebar-item  id="birthday.index" to="/birthday">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            featured_seasonal_and_gifts
                        </span>
                    </template>
                    Cumpleaños
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('admin.usuarios')"  id="admin.usuarios" to="/usuarios">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            list
                        </span>
                    </template>
                    Usuarios
                </vs-sidebar-item>

                <vs-sidebar-item v-if="listPermisos.includes('admin.preferencias')"  id="admin.preferencias" to="/preferenciasInterfaz">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            draw
                        </span>
                    </template>
                    Configuraciones
                </vs-sidebar-item>
            </template>
            <template #footer>
                <vs-row justify="space-between" v-if="listPermisos.includes('faq.index')">
                    <vs-tooltip top>
                        <vs-button id="faqBtn" size="large" icon href="/faq"
                            v-loading.fullscreen.lock="fullscreenLoading"
                            style="cursor: pointer; background-color: var(--iee-white-dark);">
                            <span class="material-symbols-rounded" style="color: var(--iee-bg-color) !important;">
                                help
                            </span>
                        </vs-button>
                        <template #tooltip> Ayuda</template>
                    </vs-tooltip>
                </vs-row>
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
            darkmode: (localStorage.getItem('theme') == 'light') ? 'light' : 'dark',
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
        setActive(){
            if(this.$route.name === 'perfil.editar'){
                this.active = 'perfil.index';
            } else{
                this.active = this.$route.name;
            }
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