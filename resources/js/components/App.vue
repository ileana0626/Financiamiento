<template>
    <div id="app" class="">
        <Sidebar :ruta="ruta" :usuario="authUser" :listPermisos="listRolPermisosByUsuario">
        </Sidebar>
        <div class="page-container" style="background-color: var(--iee-bg-color);">
            <Navbar class="navibar" :ruta="ruta" :listPermisos="listRolPermisosByUsuario"></Navbar>
            <div class="content-wrapper" style="background-color: var(--iee-bg-color);">
                <router-view></router-view>
            </div>
            <Footer></Footer>
        </div>


        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
</template>

<script>
import Navbar from './plantilla/Navbar.vue'
import Sidebar from './plantilla/Sidebar.vue'
import Footer from './plantilla/Footer.vue'
export default {
    components: {
        Navbar,
        Sidebar,
        Footer
    },
    props: [
        'ruta',
        'usuario',
        'listPermisos'
    ],
    data() {
        return {
            authUser: this.usuario,

            showSidebar: false,
            showLMargin: true,
            listRolPermisosByUsuario: [],
            listaPermisos: [],
        }
    },
    mounted() {
        this.getElementHeight();
        this.listRolPermisosByUsuario = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
        EventBus.$on('verifyAuthenticatedUser', data => {
            this.authUser = data;
        });
        EventBus.$on('notifyRolPermisosByUsuario', data => {
            this.listRolPermisosByUsuario = [];
            this.listRolPermisosByUsuario = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
        });
        this.listaPermisos = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));

        this.checkPermisos();
    },
    methods: {
        // Método que obtiene eltamaño del margin top que se debe aplicar al elemento 
        // para evitar quedar debajo del navbar tomando el tamaño del mismo cuando se
        // carga la página y cuando se redimensiona
        getElementHeight() {
            let navbar = document.querySelector('.navibar');
            let height = navbar.offsetHeight;
            let contenidoRegistro = document.querySelector('.content-wrapper');
            contenidoRegistro.style.paddingTop = (height + 20) + "px";

            window.onresize = function () {
                let navbar = document.querySelector('.navibar');
                let height = navbar.offsetHeight;
                let contenidoRegistro = document.querySelector('.content-wrapper');
                contenidoRegistro.style.paddingTop = (height + 20) + "px";
            }
        },

        checkPermisos() {
            this.listaPermisos = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
            if (this.listaPermisos != null) {
                if (this.listaPermisos.includes('preguntas.evaluacion')) {
                    this.showLMargin = false;
                }
            }
            else {
                this.showLMargin = false;

            }
        },
        getInterfaceSettings() {
            const url = "/administracion/usuario/getInterfaceSettings"
            axios.get(url).then(response => {
                const { data } = response
                const value = data[0].status
                sessionStorage.setItem('watermark', value)
                EventBus.$emit('watermarkEvent', value);
            })
        }
    }
}
</script>
