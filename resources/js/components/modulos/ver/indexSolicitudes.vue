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
                            <span>Solicitudes</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="d-flex justify-content-start align-items-center tabContainer">
                    <Tab title="Requisición" :active="activeTab == 1" @click.native="setActiveTab(1)"/>
                    <Tab title="Memorándum" :active="activeTab == 2" @click.native="setActiveTab(2)"/>
                    <Tab title="Oficio" :active="activeTab == 3" @click.native="setActiveTab(3)"/>
                    <Tab title="Circular" :active="activeTab == 4" @click.native="setActiveTab(4)"/>
                    <Tab title="Copias C." :active="activeTab == 5" @click.native="setActiveTab(5)" v-if="showAdminTabs"/>
                    <Tab title="Seguimiento" :active="activeTab == 6" @click.native="setActiveTab(6)" v-if="showAdminTabs"/>
                    <Tab title="Historial" :active="activeTab == 7" @click.native="setActiveTab(7)" v-if="showAdminTabs"/>
                </div>
                <div class="p-2-p-md-4 pb-0 mb-4 mx-3 mx-sm-0 tabContent">
                    <div>
                        <Requisiciones v-if="activeTab == 1" :rol="rolUsuario" :user="idUsuario"/>
                        <Memos v-else-if="activeTab == 2" :rol="rolUsuario" :user="idUsuario"/>
                        <Oficios v-else-if="activeTab == 3" :rol="rolUsuario" :user="idUsuario"/>
                        <Circulares v-else-if="activeTab == 4" :rol="rolUsuario" :user="idUsuario"/>
                        <Copias v-else-if="activeTab == 5"/>
                        <Seguimiento v-else-if="activeTab == 6"/>
                        <Historial v-else-if="activeTab == 7"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import methods from '../../../methods';
import Tab from './TabComponent/Tab.vue';
import Requisiciones from './TabComponent/Requisiciones.vue';
import Memos from './TabComponent/Memos.vue';
import Oficios from './TabComponent/Oficios.vue';
import Circulares from './TabComponent/Circulares.vue';
import CopiasCon from './TabComponent/CopiasCon.vue';
import Seguimiento from './TabComponent/Seguimiento.vue';
import HistorialSol from './TabComponent/HistorialSol.vue';

export default {
    components: {
        'Tab': Tab,
        'Requisiciones': Requisiciones,
        'Memos': Memos,
        'Oficios': Oficios,
        'Circulares': Circulares,
        'Copias': CopiasCon,
        'Seguimiento': Seguimiento,
        'Historial': HistorialSol,
    },
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            activeTab: sessionStorage.getItem('tabSolicitudes') ? sessionStorage.getItem('tabSolicitudes') : 1,
            rolUsuario: sessionStorage.getItem('rolUsuario') ? Number(sessionStorage.getItem('rolUsuario')) : 0,
            idUsuario: sessionStorage.getItem('idUsuario') ? Number(sessionStorage.getItem('idUsuario')) : 0,
        }
    },
    computed:{
        showAdminTabs(){
            return this.rolUsuario != 4;
        }
    },
    watch:{
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data});
    },
    async mounted() {
    },
    methods: {
        setActiveTab(num){
            this.activeTab = num;
            sessionStorage.setItem('tabSolicitudes', num);
        },

    },
}
</script>
