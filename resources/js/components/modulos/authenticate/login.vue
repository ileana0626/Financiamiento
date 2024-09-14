<template>
  <div class="d-flex flex-column flex-md-row">
    <div class="img mx-auto my-auto" style="max-height: 100vh !important">
      <img src="/img/admin.webp" alt="banner" />
    </div>
    <div
      class="d-flex justify-content-center align-items-center p-5 bgSizing"
      style="background-color: #fff"
    >
      <form class="tabletSizing">
        <br /><br />
        <h3
          style="
            text-align: center !important;
            margin-bottom: 3rem !important;
            color: #c2b280 !important;
            font-weight: 700;
          "
        >
          SISTEMA DE LA DIRECCIÓN ADMINISTRATIVA
        </h3>
        <br /><br />
        <div class="center">
          <div class="width-75">
            <vs-input
              id="loginUsr"
              :state="error ? 'danger' : ''"
              icon-after
              type="text"
              v-model="fillLogin.cUserName"
              placeholder="Nombre de usuario"
              color="#C2B280"
              label="Usuario"
            >
              <template #icon>
                <span class="material-symbols-rounded"> person </span>
              </template>
            </vs-input>
            <br /><br />
            <vs-input
              id="loginPass"
              color="#C2B280"
              v-model="fillLogin.cContrasena"
              type="password"
              placeholder="Contraseña"
              icon-after
              :state="error ? 'danger' : ''"
              @keyup.enter="login"
              label="Contraseña"
              :visiblePassword="hasVisiblePassword"
              @click-icon="hasVisiblePassword = !hasVisiblePassword"
            >
              <template #icon>
                <!-- <i class="fas fa-lock"></i> -->
                <span
                  v-if="!hasVisiblePassword"
                  class="material-symbols-rounded"
                >
                  visibility
                </span>
                <span v-else class="material-symbols-rounded">
                  visibility_off
                </span>
              </template>
            </vs-input>
            <recuperarpas/>
          </div>
        </div>
        <br />
        <!-- CAPTCHA -->
        <div class="d-flex flex-column justify-content-center container-fluid">
          <div class="d-flex justify-content-center py-5">
            <template>
              <vue-recaptcha
                @verify="onVerify"
                @expired="onExpired"
                sitekey="6LcmAmQkAAAAAONlOcyEGpQIJp7YvRQoQeyrPeY_"
              >
              </vue-recaptcha>
            </template>
          </div>
          <div
            class="d-flex justify-content-center"
            style="
              color: white;
              font-size: 0.85rem;
              font-weight: bold !important;
              letter-spacing: 1px;
            "
            v-if="captchaError == true"
          >
            Por favor marque la casilla de verificación.
          </div>
        </div>
        <br />
        <div class="center">
          <div class="width-75">
            <vs-button
              dark
              block
              @click.prevent="login"
              style="
                background-color: #c2b280 !important;
                font-size: 18px;
                width: 100% !important;
                margin-bottom: 7rem !important;
                font-weight: 700;
              "
              >INICIAR SESIÓN
            </vs-button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { VueRecaptcha } from "vue-recaptcha";
import recuperarpas from "./recuperarpas.vue";

let methods = require('../../../methods')

export default {
  data() {
    return {
      fillLogin: {
        cUserName: "",
        cContrasena: "",
      },
      fullscreenLoading: false,
      error: 0,
      mensajeError: [],
      listRolPermisosByUsuario: [],
      listRolPermisosByUsuarioFilter: [],
      listProgreso: [],
      listProgresoFilter: [],
      active: 0,
      notiPos: "top-left",
      totalIntentos: undefined,

      captchaResponse: "",
      captchaError: false,
      hasVisiblePassword: false,
    };
  },
  components: { VueRecaptcha,recuperarpas },
  created() {
    const inputs = document.querySelectorAll(".input");
    function addcl() {
      let parent = this.parentNode.parentNode;
      parent.classList.add("focus");
    }

    function remcl() {
      let parent = this.parentNode.parentNode;
      if (this.value == "") {
        perent.classList.remove("focus");
      }
    }

    inputs.forEach((inputs) => {
      inputs.addEventListener("focus", addcl);
      inputs.addEventListener("blur", remcl);
    });
  },
  // call after ui finished rendering
  mounted() {
    this.verificaTelInput();
  },
  methods: {
    getIntentosUsuario(loading) {
      let ruta = "/administracion/usuario/getTotalIntentos";
      axios
        .get(ruta, {
          params: {
            usrTel: this.fillLogin.cUserName,
          },
        })
        .then((response) => {
          if (response.data[0]) {
            this.totalIntentos = response.data[0].INTENTOS_LOGIN;
          } else {
            this.totalIntentos = -1;
          }
          if (this.totalIntentos == -1) {
            loading.close();
            this.loginFailed();
            const noti = this.$vs.notification({
              position: this.notiPos,
              duration: 10000,
              color: "danger",
              title: "Alerta",
              text: "Estas credenciales no coinciden con nuestros registros y/o la cuenta esta desactivada.",
            });
          } else if (this.totalIntentos < 3) {
            // this.logout();
            let url = "/authenticate/login";
            axios
              .post(url, {
                cUserName: this.fillLogin.cUserName,
                cContrasena: this.fillLogin.cContrasena,
              })
              .then((response) => {
                if (response.data.code == 200) {
                  this.getListarRolPermisosByUsuario(
                    response.data.authUser,
                    loading
                  );
                } else {
                  if (response.data.code == 500) {
                    loading.close();
                    Swal.fire({
                      icon: "warning",
                      title: "Alerta",
                      text: "Ha ocurrido un error, por favor inténtelo más tarde.",
                      showConfirmButton: true,
                      confirmButtonText: "Entendido",
                    });
                  } else {
                    this.setTotalIntentos(1);
                    this.loginFailed();
                    loading.close();
                    const noti = this.$vs.notification({
                      position: this.notiPos,
                      duration: 10000,
                      color: "danger",
                      title: "Alerta",
                      text: this.mensajeError[0],
                    });
                  }
                }
              });
          } else {
            loading.close();
            if (this.totalIntentos == 3) {
              Swal.fire({
                icon: "warning",
                title: "¡Alerta!",
                text: "Su cuenta ha sido desactivada debido a varios intentos fallidos de inicio de sesión. \n Comuníquese al 222 303 11 00 Ext. 1218 para obtener más detalles.",
                showConfirmButton: true,
                confirmButtonText: "Entendido",
              });
            }
          }
        })
        .catch((error) => {
          loading.close();
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    setTotalIntentos(valor) {
      let url = "/administracion/usuario/setTotalIntentos";
      axios.post(url, {
        valor: valor,
        usrTel: this.fillLogin.cUserName,
      }).then(response => {
      }).catch(error => {
        let nombreMetodo = url.split('/');
        methods.catchHandler(error, nombreMetodo[3]);
      });
    },
    login() {
      if (this.validarLogin()) {
        return;
      } else {
        const loading = this.$vs.loading({
          type: "square",
          color: "#00a19a",
          background: "#FFFFFF",
          text: "Cargando...",
        });

        this.getIntentosUsuario(loading);
      }
    },
    logout() {
      let url = "administracion/usuario/logout";
      axios
        .post(url, {
          userName: this.fillLogin.cUserName,
        });
        // .catch((error) => {});
    },
    validarLogin() {
      this.error = 0;
      this.mensajeError = [];

      if (!this.fillLogin.cUserName) {
        this.mensajeError.push("Error tel falta");
        const noti = this.$vs.notification({
          position: this.notiPos,
          duration: 10000,
          color: "danger",
          title: "Alerta",
          text: "El número de teléfono es un campo obligatorio",
        });
      } else {
        if (this.fillLogin.cUserName.length < 6) {
          this.mensajeError.push("Error tel menor que 10");
          const noti = this.$vs.notification({
            position: this.notiPos,
            duration: 10000,
            color: "danger",
            title: "Alerta",
            text: "Estas credenciales no coinciden con nuestros registros y/o la cuenta esta desactivada.",
          });
        }
      }
      if (!this.fillLogin.cContrasena) {
        this.mensajeError.push("Error pass falta");
        const noti = this.$vs.notification({
          position: this.notiPos,
          duration: 10000,
          color: "danger",
          title: "Alerta",
          text: "La contraseña es un campo obligatorio",
        });
      }
      // if (!this.captchaResponse) {
      //     this.captchaError = true;
      //     this.mensajeError.push('Error captcha falta');
      //     const noti = this.$vs.notification({
      //         position: this.notiPos,
      //         duration: 10000,
      //         color: 'danger',
      //         title: 'Alerta',
      //         text: 'Por favor marca la casilla de verificación CAPTCHA'
      //     });
      // }
      if (this.mensajeError.length) {
        this.error = 1;
      }
      return this.error;
    },
    loginFailed() {
      this.error = 0;
      this.mensajeError = [];
      this.mensajeError.push(
        "Estas credenciales no coinciden con nuestros registros y/o la cuenta esta desactivada."
      );
      this.fillLogin.cContrasena = "";
      if (this.mensajeError.length) {
        this.error = 1;
      }
      return this.error;
    },
    async loginSuccess(loading) {
      this.setTotalIntentos(0);
      await this.getSaludoInicio();
      // loading.close();
      setTimeout(() => {
        this.$router.push({ name: "dashboard.index" });
        location.reload();
      }, 1000);
    },
    async getSaludoInicio(){
      const url = "/administracion/usuario/getSaludoInicio";

      try {
        const response = await axios.get(url);
        if(response.status === 200){
          sessionStorage.setItem('saludo', response.data[0].mensaje);
        } else {
          sessionStorage.setItem('saludo', '¡Ten un buen día para trabajar!');
        }
      } catch (error) {
        sessionStorage.setItem('saludo', '¡Ten un buen día para trabajar!');
      }
      
    },
    async getListarRolPermisosByUsuario(authUser, loading) {
      let ruta = "/administracion/usuario/getListarRolPermisosByUsuario";
      await axios
        .get(ruta, {
          params: {
            nIdUsuario: authUser.id,
          },
        })
        .then((response) => {
          this.listRolPermisosByUsuario = response.data;
          this.consultarRolUsuario(authUser.id)
          this.filterListarRolPermisosByUsuario(authUser, loading);
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    filterListarRolPermisosByUsuario(authUser, loading) {
      let me = this;
      me.listRolPermisosByUsuario.map(function (x, y) {
        me.listRolPermisosByUsuarioFilter.push(x.SLUG);
      });
      sessionStorage.setItem(
        "lisRolPermisosByUsuario",
        JSON.stringify(me.listRolPermisosByUsuarioFilter)
      );
      sessionStorage.setItem("authUser", JSON.stringify(authUser));
      this.loginSuccess(loading);
    },
    consultarRolUsuario(id) {
      let url = "/administracion/usuario/consultarRolUsuario";
      let idRol = 0;
      axios
        .get(url, {
          params: {
            idUsuario: id,
          },
        })
        .then((response) => {
          idRol = response.data[0].idRol;
          sessionStorage.setItem("rolUsuario", JSON.stringify(idRol));
        })
        .catch((error) => {
          let nombreMetodo = url.split('/');
          methods.catchHandler(error, nombreMetodo[3]);
        });
    },
    verificaTelInput() {
      document
        .getElementById("loginUsr")
        .addEventListener("keypress", (event) => {
          if (
            !`${event.target.value}${event.key}`.match(/^[A-Za-z0-9]{0,10}$/)
          ) {
            // block the input if result does not match
            event.preventDefault();
            event.stopPropagation();
            return false;
          }
        });
    },
    // Métodos para el captcha
    onVerify: function (response) {
      this.captchaResponse = response;
      this.captchaError = false;
    },

    onExpired: function (response) {
      this.captchaResponse = "";
    },
    showRecuperarContrasena() {
      Swal.fire({
        icon: "info",
        title: "Recuperar contraseña",
        text: "Si no recuerda su contraseña de acceso, por favor comuníquese al 000-000-0000",
        showConfirmButton: true,
        confirmButtonText: "De acuerdo",
      });
    },
  }
};
</script>
<style scoped>
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

p {
  color: #fff;
}

.vs-input-parent--state-success .vs-input {
  background: var(--iee-light-gray) !important;
}

.vs-input-parent--state-danger .vs-input,
.vs-input:focus,
.vs-input-parent:focus {
  background: var(--iee-light-gray) !important;
}
.loginContainer {
  width: 100vw;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 7rem;
  padding: 0 5rem;
  float: left;
  align-items: center;
  background-color: #00a19a;
}

.img {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.login-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align-last: center;
  text-align: center;
  flex-grow: 1 1 auto;
}

.login-content h2 {
  margin: 15px 0;
  color: rgb(255, 255, 255);
  text-transform: uppercase;
  font-size: 2.9rem;
}

.login-content .input-div {
  position: relative;
  display: grid;
  grid-template-columns: 7% 93%;
  margin: 25px 0;
  padding: 5px 0;
  border-bottom: 2px solid #ffffff;
}

.login-content .input-div.one {
  margin-top: 0;
}

.i {
  color: #ffffff;
  display: flex;
  justify-content: center;
  align-items: center;
}

.i i {
  transition: 0.3s;
}

.vs-input-parent
  >>> .vs-input-content
  label.vs-input__label.vs-input__label--label {
  font-size: 1rem !important;
  font-weight: 700 !important;
  color: #595959;
}

/* #loginUsr.vs-input-parent--state-danger .vs-input,
#loginPass.vs-input-parent--state-danger .vs-input {
    background: rgb(255, 255, 255) !important;
    background-color: rgb(255, 255, 255) !important;
} */

.input-div > div {
  position: relative;
  height: 45px;
}

.input-div > div > h5 {
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: rgb(255, 255, 255);
  font-size: 18px;
  transition: 0.3s;
}

.input-div::before,
.input-div::after {
  content: "";
  position: absolute;
  bottom: -2px;
  width: 0%;
  height: 2px;
  background-color: 0.4s;
}

.input-div::before {
  right: 50%;
}

.input-div::after {
  left: 50%;
}

.input-div.focus::before,
.input-div.focus::after {
  width: 50%;
}

.input-div.focus > div > h5 {
  top: -5px;
  font-size: 15px;
}

.input-div.focus > .i > i {
  color: #ffffff;
}

.input-div > div > input {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  background: none;
  padding: 0.5rem 0.7rem;
  font-size: 1.2rem;
  color: rgb(255, 255, 255);
  font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol";
}

.input-div.pass {
  margin-bottom: 4px;
}

a {
  display: block;
  text-align: right;
  text-decoration: none;
  color: rgb(255, 255, 255);
  font-size: 0.9rem;
  transition: 0.3s;
}

a:hover {
  color: #ffffff;
}

.btn:hover {
  background-position: right;
}

.vs-notification__content__header h4 {
  font-size: 18px !important;
}

.vs-notification__content__text p {
  font-size: 16px !important;
}

.img img {
  min-width: 70vw !important;
  height: 100vh;
}

.width-75 {
  width: 75% !important;
}

.img:after {
  content: "";
  background-color: #f5f8f9;
  position: absolute;
  width: 1px;
  height: 75%;
}

.forgot-pass {
  font-size: 0.9rem;
  text-decoration-line: underline;
  text-underline-offset: 3px;
  color: var(--important-card-bg);
}

.forgot-pass:hover {
  cursor: pointer;
  color: #c2b280;
}

@media screen and (max-width: 1920px) {
  .img img {
    max-width: 70vw !important;
  }
}

@media screen and (max-width: 1740px) {
  .img img {
    max-width: 69vw !important;
  }
}

@media screen and (max-width: 1700px) {
  .img img {
    max-width: 68vw !important;
  }
}

@media screen and (max-width: 1580px) {
  .img img {
    max-width: 66vw !important;
  }
}

@media screen and (max-width: 1520px) {
  .img img {
    max-width: 64vw !important;
  }
}

@media screen and (max-width: 1480px) {
  .img img {
    max-width: 63vw !important;
  }
}

@media screen and (max-width: 1390px) {
  .img img {
    max-width: 61vw !important;
  }
}

@media screen and (max-width: 1290px) {
  .img img {
    max-width: 57vw !important;
  }
}

@media screen and (max-width: 1225px) {
  .img img {
    max-width: 55vw !important;
  }
}

@media screen and (max-width: 1160px) {
  .img img {
    max-width: 52vw !important;
  }
}

@media screen and (max-width: 1050px) {
  .bgSizing {
    min-width: 100vw !important;
    min-height: 100vh;
    max-height: none !important;
  }

  .tabletSizing {
    max-width: 70% !important;
  }
}

@media screen and (max-width: 1000px) {
  .login-content h2 {
    font-size: 2.4rem;
    margin: 8px 0;
  }
}

@media screen and (max-width: 650px) {
  form {
    width: 379px;
  }

  .tabletSizing {
    max-width: none !important;
  }
}

@media screen and (max-width: 1366px) {
  .wave {
    display: none;
  }

  .login-content {
    justify-content: center;
  }
}
</style>
