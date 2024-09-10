<template>
  <div style="max-width: 100% !important; border-radius: 10px;" class="px-4 py-3 shadow">
    <div class="d-flex justify-content-between align-items-center">
      <!-- Error busqueda -->
      <div class="d-flex no-wrap mb-3 align-items-center"
        style="white-space: nowrap; overflow: hidden; padding-left: 0 !important;">
        <span class="errorTitle bold mr-2">Detalles del error</span>
        <span class="errorDesc mt-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
          ( {{ codigoError }} )
        </span>
      </div>
    </div>
    <!-- Nombre -->
    <div class="d-flex flex-column mb-3">
      <span class="errorDesc">Nombre</span>
      <span class="errorDescDesc bold"> {{ nombreFuncion }} </span>
    </div>
    <div class="d-flex justify-content-between">
      <!-- Tipo -->
      <div class="d-flex descCardBg">
        <template v-if="tipoError == 'sp'">
          <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" width="40px"
            height="40px" class="m-2" />
        </template>
        <template v-else>
          <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" width="40px"
            height="40px" class="m-2" />
        </template>
        <div class="d-flex flex-column">
          <span class="errorDesc">Tipo</span>
          <div>
            <template v-if="tipoError == 'sp'">
              <span class="errorDescDesc bold"> Procedimiento Almacenado </span>
            </template>
            <template v-else>
              <span class="errorDescDesc bold"> Código Vue.js </span>
            </template>
          </div>
        </div>
      </div>

      <!-- Código MySQL -->
      <div class="d-flex descCardBg">
        <div class="m-2 mr-3">
          <i class="fa fa-bug iconSize"></i>
        </div>
        <div class="d-flex flex-column align-items-start">
          <span class="errorDesc">Id error</span>
          <template v-if="tipoError == 'sp'">
            <span class="errorDescDesc bold"> {{ idErrorSolicitud }} </span>
          </template>
          <template v-else>
            <span class="errorDescDesc bold"> N/A</span>
          </template>
        </div>
      </div>

    </div>
  </div>
</template>
<script>
let methods = require('../../../methods.js')

export default {
  name: "TarjetaResultado",
  props: ['codigoError', 'tipoError', 'nombreFuncion', 'idErrorSolicitud'],
  data() {
    return {
    }
  },
  created() {
  },
  methods: {}
}
</script>
<style scoped>
.errorTitle {
  font-size: 1.5rem;
}

.errorDesc {
  font-size: 1.05rem;
  font-weight: 500;
  color: #919191;
}

.errorDescDesc {
  font-size: 1.25rem;
}

.descCardBg {
  background-color: var(--iee-light-gray);
  border-radius: 15px;
  padding:  0.8rem 1.5rem 0.8rem 0.8rem;
}

.bold {
  font-weight: 700;
}

.iconSize{
  font-size: 40px;
}

.shadow {
  /* https://smoothshadows.com/#djEsMSw1LDAuMDcsNjQsMzAsMCwjMDMwNzEyLCNmM2Y0ZjYsI2ZmZmZmZiwy */
  box-shadow: 0px 1px 3px rgba(3, 7, 18, 0.01),
    0px 5px 10px rgba(3, 7, 18, 0.03),
    0px 11px 23px rgba(3, 7, 18, 0.04),
    0px 19px 41px rgba(3, 7, 18, 0.06),
    0px 30px 64px rgba(3, 7, 18, 0.07);

}
</style>