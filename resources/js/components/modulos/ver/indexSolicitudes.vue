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
                    <Tab title="Historial" :active="activeTab == 5" @click.native="setActiveTab(5)"/>
                </div>
                <div class="p-2-p-md-4 pb-0 mb-4 mx-3 mx-sm-0 tabContent">
                    <div>
                        <div v-if="activeTab == 1">Requisiciones</div>
                        <div v-else-if="activeTab == 2">Memorándums</div>
                        <div v-else-if="activeTab == 3">Oficios</div>
                        <div v-else-if="activeTab == 4">Circulares</div>
                        <div v-else-if="activeTab == 5">Historial</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import methods from '../../../methods';
import Tab from './TabComponent/Tab.vue';

export default {
    components: {
        'Tab': Tab
    },
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            activeTab: sessionStorage.getItem('tabSolicitudes') ? sessionStorage.getItem('tabSolicitudes') : 1,
        }
    },
    watch:{
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
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
