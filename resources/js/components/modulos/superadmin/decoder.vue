<template>
  <div class="mx-auto" style="width: 65% !important;">
    <div class="card">
      <div class="mx-4 my-1 d-flex align-items-center ">
        <vs-button icon shadow @click="consultaCodigo()" class="m-0">
          <i class="fa fa-search" style="font-size: 30px;"></i>
        </vs-button>
        <div class="w-100">
          <el-input class="search-error" placeholder="Ingrese un código de error" v-model="codigoError" @keyup.enter="consultaCodigo"
            style="margin: none !important; font-size: 25px !important; font-weight: bold !important;">
          </el-input>
          <!-- <vs-input v-model="codigoError" placeholder="Name"
            style="padding: none !important; margin: none !important; font-size: 25px !important; font-weight: bold !important;" /> -->
        </div>

      </div>
    </div>
    <div><h2 style="font-weight: 600;" class="mt-5 mb-3">Resultados</h2></div>
    <template v-if="nombreFuncion">
      <TarjetaResultado :codigoError="codigoError" :tipoError="tipoError" :nombreFuncion="nombreFuncion" :idErrorSolicitud="idErrorSolicitud" />
    </template>
  </div>
</template>
<script>
let methods = require('../../../methods.js')
import TarjetaResultado from './ResultCard.vue'

export default {
  components: {
    TarjetaResultado,
  },
  data() {
    return {
      codigoError: '',
      tipoError: '',
      nombreFuncion: '',
      idErrorSolicitud: ''
    }
  },
  created(){
    const loading = this.$vs.loading({
      type: 'square',
      color: '#00a19a',
      background: '#FFFFFF',
      text: 'Cargando...'
    });

    setTimeout(() => {
      loading.close();
    }, 500);
  },
  methods: {
    consultaCodigo() {
      if (this.codigoError) {
        let descripcion = methods.decryptStringWithXORFromHex(this.codigoError).split('.')
        this.nombreFuncion = descripcion[0]
        this.idErrorSolicitud = descripcion[1]
        this.tipoError = descripcion[1].length > 2 ? "sp" : "js"
      }
    }
  }
}
</script>
<style>
.search-error.el-input {
  background-color: transparent !important;
}

.el-input>.el-input__inner {
  background-color: var(--iee-bg-color2) !important;
  border: none !important;
  /* padding: 1.5rem 0.7rem !important; */
  border-radius: 15px !important;
  color: var(--text-color) !important;
}

.search-error.el-input>.el-input__inner {
  background-color: var(--iee-bg-color2) !important;
  border: none !important;
  /* padding: 1.5rem 0.7rem !important; */
  border-radius: 0 !important;
  color: var(--text-color) !important;
}

.search-error.el-input>.el-input__inner:focus {
  padding: 1.5rem 1rem !important;
  /* font-size: ; */
  transition: all .15s ease;
  border-bottom: 1px solid var(--text-color) !important;
}
</style>