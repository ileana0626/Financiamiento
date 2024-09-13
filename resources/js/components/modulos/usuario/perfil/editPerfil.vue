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
                        <li>
                            <router-link to="/perfil"><span>
                                Mi Perfil
                            </span></router-link>
                        </li>
                        <li class="breadActive">
                            <span>Editar</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <h1 style="color: var(--iee-white-dark);">Editar perfil</h1>        
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',

            passActual: '',
            passNueva: '',
            passConfirmar: '',
        }
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
    },
    methods: {

    }
}
</script>

<style scoped>

</style>