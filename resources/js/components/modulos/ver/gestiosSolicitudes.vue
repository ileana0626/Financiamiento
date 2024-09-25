<template>
    <div class="">
        <div class="content-header">
            <div class="container-fluid mb-md-3 pl-4 pl-md-3 pt-0" id="miga-gestion-servicios">
                <div class="float-sm-right mr-5">
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

        <div class="px-0 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-2">
                <div class="d-flex justify-content-start align-items-center tabContainer mx-3 mx-sm-0" >
                    <TabComponent title="Solicitudes" :active="activeTab == 3" @click.native="section(3)" />
                    <TabComponent title="Historial" :active="activeTab == 4" @click.native="section(4)" />
                </div>
                <div class="p-2 p-md-4 pb-0 mb-4 mx-3 mx-sm-0 tabContent">
                    <div >
                        <Pendientes v-if="activeTab == 3"></Pendientes>
                        <Historial v-if="activeTab == 4"></Historial>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import TabComponent from './TabComponent/Tab';
import Pendientes from './TabComponent/Pendientes.vue';
import Historial from './TabComponent/Historial.vue';


export default {
    components: {
        'TabComponent': TabComponent,
        'Pendientes': Pendientes,
        'Historial': Historial,
    },
    data() {
        return {
            userRol: sessionStorage.getItem('user_rol'),
            activeTab: 3,
            tituloSeccion: 'Inicio',
        }
    },
    created() {
        let storedTab = sessionStorage.getItem('tabIdGServicios');
        if (storedTab != null) {
            this.activeTab = storedTab;
            this.setActiveTab(storedTab)
        } else {
            this.activeTab = 3;
            sessionStorage.setItem('tabIdGServicios', 3);
        }
    },
    destroyed() {
    },
    mounted() {
        EventBus.$emit('EventoNav', false);
    },
    beforeDestroy() {
        EventBus.$emit('EventoNav', true);
    },
    methods: {
        setActiveTab(num) {
            this.activeTab = num;

             if (num == 3) {
                this.tituloSeccion = "Solicitudes";
            } else if (num == 4) {
                this.tituloSeccion = "Historial";
            }

            sessionStorage.setItem('tabIdGServicios', num);

        },
        section(active) {
            switch (active) {
                case 1: this.setActiveTab(1); break;
                case 2: this.setActiveTab(2); break;
                case 3: this.setActiveTab(3); break;
                case 4: this.setActiveTab(4); break;
                case 5: this.setActiveTab(5); break;
                case 6: this.setActiveTab(6); break;
                default: break;
            }
        },
    }
}
</script>
<style scoped></style>