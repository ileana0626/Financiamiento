<template>
<div class="">
    <div class="content-header">
      <div class="container-fluid mb-md-3 pl-4 pl-md-3 pt-0">
        <div class="float-sm-right mr-5">
          <!-- Breadcrumb (navegacion) -->
          <ul class="breadcrumb">
            <li>
              <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
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
        <!--Todo el contenido principal de la vista ira dentro de este div-->
        <div class="card cardRounded px-1 px-sm-3 pt-2 pb-0 shadow-lg mb-5">
            <h1>Perfil de usuario</h1>
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