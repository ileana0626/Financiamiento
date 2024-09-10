<template>
    <div class=''>
      <div class="content-header">
        <div class="container-fluid mb-md-3 pl-4 pl-md-3 pt-0">
          <div class='float-sm-right mr-5'>
            <ul class='breadcrumb'>
              <li>
                <router-link to='/'><span class='material-symbols-rounded v-align-icon-bc'>home</span></router-link>
              </li>
              <li style="color: var(--text-color) !important">
                Configuración
              </li>
              <li class='breadActive'>
                <span>Preferencias de interfaz</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
  
      <div class="px-3 px-md-5 container-fluid">
        <div class="mx-3 mt-5 mt-md-4">
          <div class='mx-auto card card-info px-0  p-3 shadow'>
            <h2>Preferencias de Interfaz</h2>
            <div class="card p-3  mt-3" style="min-width: fit-content; width: 20vw; background-color: var(--iee-white) !important;">
              <div class="flex-flex-column">
                <span style="font-weight: 500; font-size: 15px; color: #919191;">
                  Marca de agua
                </span>
                <div class="d-flex align-items-center">
                  <el-switch v-model="interfaceWatermark" active-color="var(--dorado)" inactive-color="#d1d1d1"
                    active-value="A" inactive-value="I" @change="setInterfaceSettings">
                  </el-switch>
                  <span style="padding-left: 7px; font-size: 17px;">
                    <template v-if="interfaceWatermark == 'A'">Activada</template>
                    <template v-else> Desactivada</template>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  <script>
  let methods = require('../../../methods');
  
  export default {
    data() {
      return {
        interfaceWatermark: sessionStorage.getItem('watermark')
      }
    },
    watch: {
      interfaceWatermark(newVal, oldVal) {
        if (newVal != oldVal) {
          sessionStorage.setItem('watermark', newVal)
          let wmDiv = document.getElementById("watermark");
          if (newVal == 'A') {
            if (!wmDiv.classList.contains("watermark")) {
              wmDiv.classList.add("watermark");
            }
          }
          else {
            wmDiv.classList.remove("watermark");
          }
        }
      }
    },
    created() {
    },
    mounted() {
      EventBus.$on('watermarkEvent', data => {
        this.interfaceWatermark = data;
        let wmDiv = document.getElementById("watermark");
        if (data == 'A') {
          if (!wmDiv.classList.contains("watermark")) {
            wmDiv.classList.add("watermark");
          }
        }
        else {
          wmDiv.classList.remove("watermark");
        }
      });
    },
    methods: {
      setInterfaceSettings() {
        const url = "/administracion/usuario/setInterfaceSettings";
  
        axios.post(url, {
          'watermarkValue': this.interfaceWatermark
        }).then((response) => {
          this.openNotification();
        }).catch(error => {
          const loadingParam = this.$vs;
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[nombreMetodo.length -1], loading);
        });
      },
      getInterfaceSettings() {
        const url = "/administracion/usuario/getInterfaceSettings"
        axios.get(url).then(response => {
          const { data } = response
          const value = data[0].status
          sessionStorage.setItem('watermark', value)
          EventBus.$emit('watermarkEvent', value);
        }).catch(error => {
          const loadingParam = this.$vs;
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[nombreMetodo.length -1], loading);
        });
      },
      openNotification() {
        const noti = this.$vs.notification({
          flat: true,
          progres: 'auto',
          icon: '<i class="far fa-check-circle"></i>',
          color: '#70590b',
          position: 'top-right',
          title: 'Configuración de Interfaz',
          text: this.interfaceWatermark == 'A' ? 'La marca de agua se ha activado' : ' La marca de agua se ha desactivado'
        })
      },
    }
  }
  </script>
  <style scoped></style>