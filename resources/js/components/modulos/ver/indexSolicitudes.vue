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
                <div class="d-flex justify-content-start align-items-center tabContainer" :class="numTabs > 2 ? 'scrollTab' : ''" ref="tabContainer">
                    <Tab title="Memorándum" :active="activeTab == 1" @click.native="setActiveTab(1)" v-if="notSupervisor" :class="tabColour(memo_count)"/>
                    <Tab title="Oficio" :active="activeTab == 2" @click.native="setActiveTab(2)" v-if="notSupervisor" :class="tabColour(oficio_count)"/>
                    <Tab title="Circular" :active="activeTab == 3" @click.native="setActiveTab(3)" v-if="notSupervisor" :class="tabColour(circular_count)"/>
                    <Tab title="Copias C." :active="activeTab == 7" @click.native="setActiveTab(7)" v-if="showAdminTabs && notSupervisor"/>
                    <Tab title="Requisición" :active="activeTab == 8" @click.native="setActiveTab(8)" v-if="notSupervisor" :class="tabColour(requi_count)"/>
                    <Tab title="Correo" :active="activeTab == 6" @click.native="setActiveTab(6)" v-if="notSupervisor" :class="tabColour(correo_count)"/>
                    <Tab title="Escrito" :active="activeTab == 4" @click.native="setActiveTab(4)" v-if="notSupervisor" :class="tabColour(escrito_count)"/>
                    <Tab title="Tarjeta" :active="activeTab == 5" @click.native="setActiveTab(5)" v-if="notSupervisor" :class="tabColour(tarjeta_count)"/>
                    <Tab title="Seguimiento" :active="activeTab == 9" @click.native="setActiveTab(9)" v-if="showAdminTabs"/>
                    <Tab title="Historial" :active="activeTab == 10" @click.native="setActiveTab(10)"/>
                </div>
                <div class="p-2-p-md-4 pb-0 mb-4 mx-0 tabContent">
                    <div class="mx-0">
                        <Memos v-if="activeTab == 1" :rol="rolUsuario" :user="idUsuario"/>
                        <Oficios v-else-if="activeTab == 2" :rol="rolUsuario" :user="idUsuario"/>
                        <Circulares v-else-if="activeTab == 3" :rol="rolUsuario" :user="idUsuario"/>
                        <Escrito v-else-if="activeTab == 4" :rol="rolUsuario" :user="idUsuario" :idTipoSolicitud="6"/>
                        <Tarjeta v-else-if="activeTab == 5" :rol="rolUsuario" :user="idUsuario" :idTipoSolicitud="7"/>
                        <Correo v-else-if="activeTab == 6" :rol="rolUsuario" :user="idUsuario" :idTipoSolicitud="8"/>
                        <Copias v-else-if="activeTab == 7"/>
                        <Requisiciones v-else-if="activeTab == 8" :rol="rolUsuario" :user="idUsuario"/>
                        <Seguimiento v-else-if="activeTab == 9"/>
                        <Historial v-else-if="activeTab == 10" :rol="rolUsuario" :user="idUsuario"/>
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
import Extra from './TabComponent/Extra.vue';

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
        'Escrito': Extra,
        'Tarjeta': Extra,
        'Correo': Extra,
    },
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            activeTab: sessionStorage.getItem('tabSolicitudes') ? sessionStorage.getItem('tabSolicitudes') : 1,
            rolUsuario: sessionStorage.getItem('rolUsuario') ? Number(sessionStorage.getItem('rolUsuario')) : 0,
            idUsuario: sessionStorage.getItem('idUsuario') ? Number(sessionStorage.getItem('idUsuario')) : 0,

            memo_count: sessionStorage.getItem('memo_count') ? Number(sessionStorage.getItem('memo_count')) : 0,
            oficio_count: sessionStorage.getItem('oficio_count') ? Number(sessionStorage.getItem('oficio_count')) : 0,
            circular_count: sessionStorage.getItem('circular_count') ? Number(sessionStorage.getItem('circular_count')) : 0,
            requi_count: sessionStorage.getItem('requi_count') ? Number(sessionStorage.getItem('requi_count')) : 0,
            escrito_count: sessionStorage.getItem('escrito_count') ? Number(sessionStorage.getItem('escrito_count')) : 0,
            tarjeta_count: sessionStorage.getItem('tarjeta_count') ? Number(sessionStorage.getItem('tarjeta_count')) : 0,
            correo_count: sessionStorage.getItem('correo_count') ? Number(sessionStorage.getItem('correo_count')) : 0,

            numTabs: 0,
        }
    },
    computed:{
        showAdminTabs(){
            return this.rolUsuario != 4;
        },
        notSupervisor() {
            return this.rolUsuario != 3;
        },
        tabColour(){
            return (count) => {
                if(count){
                    if(count > 0) return 'tab-notify';
                }
            }
        },
    },
    watch:{
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data});
    },
    async mounted() {
        if( this.activeTab == 1 && !this.notSupervisor ){
            this.activeTab = 6;
            sessionStorage.setItem('tabSolicitudes', 6);
        }
        // evento de la navbar
        EventBus.$on('tabCounts', (data) => {
            this.memo_count = data.memo;
            this.oficio_count = data.oficio;
            this.circular_count = data.circular;
            this.requi_count = data.requi;
            this.escrito_count = data.escrito;
            this.tarjeta_count = data.tarjeta;
            this.correo_count = data.correo;
        });
        this.numTabs = this.getNumTabs();
    },
    methods: {
        getNumTabs(){
            return this.$refs.tabContainer.children.length;
        },
        setActiveTab(num){
            /**
             * 1: memo
             * 2: oficio
             * 3: circular
             * 4: escrito
             * 5: tarjeta
             * 6: correo
             * 8: requi
             */
            this.activeTab = num;
            sessionStorage.setItem('tabSolicitudes', num);
            
            switch(num){
                case 1:
                    EventBus.$emit('updateCounts','MEMORÁNDUM');
                    this.memo_count = 0;
                    break;
                case 2:
                    EventBus.$emit('updateCounts','OFICIO');
                    this.oficio_count = 0;
                    break;
                case 3:
                    EventBus.$emit('updateCounts','CIRCULAR');
                    this.circular_count = 0;
                    break;
                case 4:
                    EventBus.$emit('updateCounts','ESCRITO');
                    this.escrito_count = 0;
                    break;
                case 5:
                    EventBus.$emit('updateCounts','TARJETA');
                    this.tarjeta_count = 0;
                    break;
                case 6:
                    EventBus.$emit('updateCounts','CORREO');
                    this.correo_count = 0;
                    break;
                case 8:
                    EventBus.$emit('updateCounts','REQUSICIÓN');
                    this.requi_count = 0;
                    break;
            }
            
        },
    },
}
</script>
