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
                <div class="card cardRounded py-3 px-3 px-md-5" :class="!!darkMode ? 'shadow-lg-dark' : 'shadow-lg'" :key="'c1' + darkMode">
                    <div class="row pb-4 d-flex justify-content-center justify-content-lg-start mb-3">
                        <div class="col-12 col-lg-6 col-xl-4 row justify-content-center mb-lg-0 rounded-soft p-3 iee-white">
                            <div class="col-12 d-flex justify-content-center pb-2">
                                <div class="portrait-perfil bg-white">
                                    <img src="/img/user_default.svg" alt="Foto de perfil">
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-center pb-2">
                                <span class="nametag-perfil">Nombre Nombre Apellido Apellido</span>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                                <span class="badge bg-light" style="font-size: small;">Rol usuario</span>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 col-xl-4 ml-0 ml-md-3 d-flex justify-content-center row center">
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="far fa-envelope font-txt-theme"></i><span class="pl-3">Email</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="fas fa-mobile-alt font-txt-theme"></i><span class="pl-3">Teléfono Celular</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="fas fa-calendar-day font-txt-theme"></i><span class="pl-3">Fecha de nacimiento</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                                <i class="fas fa-birthday-cake font-txt-theme"></i><span class="pl-3">Edad</span>
                            </div>
                            <div class="col-12 col-md-6 col-lg-12 pb-1 pb-md-2 pb-lg-1">
                            </div>
                        </div>
                    </div>
                    <div class="edit-btn-perfil">
                        <vs-button block :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'edit'+darkMode">
                            <div style="color: var(--btn-txt-color); font-weight: 700;">
                                <i class="fas fa-user-edit pr-2" style="font-size: 0.8125rem !important;"></i>Editar
                            </div>
                        </vs-button>
                    </div>
                </div>
                <div class="row pt-4">
                    <div class="col-12 col-md-6 card-info">
                        <div class="card-header d-flex">
                            <h3 class="card-title font-weight-bold">Actualizar contraseña</h3>
                        </div>
                        <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                            <div class="row">
                                <div class="col-12 col-xl-10 px-3 pb-3">
                                    <label class="col-form-label">Contraseña actual</label>
                                    <vs-input id="contrasenaActual" type="password" color="#C2B280" icon-after
                                        placeholder="Contraseña actual" autocomplete="off">
                                    </vs-input>
                                </div>
                                <div class="col-12 col-xl-6 px-3 pb-3">
                                    <label class="col-form-label">Nueva contraseña</label>
                                    <vs-input id="contrasenaNueva" type="password" color="#C2B280" icon-after
                                        placeholder="Nueva contraseña" autocomplete="off">
                                    </vs-input>
                                </div>
                                <div class="col-12 col-xl-6 px-3 pb-3">
                                    <label class="col-form-label">Confirmar contraseña</label>
                                    <vs-input id="contrasenaConfirma" type="password" color="#C2B280" icon-after
                                        placeholder="Confirmar contraseña" autocomplete="off">
                                    </vs-input>
                                </div>
                                <div class="col-12 px-3 d-flex justify-content-center">
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                        </div>
                                    </vs-button>      
                                    <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'pass'+darkMode">
                                        <div style="color: var(--btn-txt-color); font-weight: 700;">
                                            <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar
                                        </div>
                                    </vs-button>                                
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>            
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
        }
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
    }
}
</script>

<style scoped>

</style>