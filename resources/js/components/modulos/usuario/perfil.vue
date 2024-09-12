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
                            <span>Mi Perfil</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card cardRounded shadow-lg py-3 px-3 px-md-5">
                    <div class="row pb-4 d-flex justify-content-center justify-content-lg-start mb-3">
                        <div class="col-12 col-lg-6 col-xl-4 row justify-content-center mb-lg-0 bg-white rounded-soft p-3">
                            <div class="col-12 d-flex justify-content-center pb-2">
                                <div class="portrait-perfil">
                                    <img src="/img/user_default.svg" alt="Foto de perfil">
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-center pb-1">
                                <span class="nametag-perfil">Nombre Nombre Apellido Apellido</span>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                                <span class="badge bg-light" style="font-size: small;">Rol usuario</span>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 col-xl-4 ml-0 ml-md-3 d-flex justify-content-center row center">
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="far fa-envelope"></i><span class="pl-3">Email</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="fas fa-mobile-alt"></i><span class="pl-3">Teléfono Celular</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="fas fa-calendar-day"></i><span class="pl-3">Fecha de nacimiento</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="fas fa-birthday-cake"></i><span class="pl-3">Edad</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                            </div>
                        </div>
                    </div>
                    <div class="edit-btn-perfil">
                        <vs-button block dark>
                            <i class="fas fa-pencil-alt pr-2"></i>Editar
                        </vs-button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style scoped>

</style>