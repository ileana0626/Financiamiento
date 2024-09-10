<template>
  <div style="overflow: hidden;">
    <transition name="slide-fade" mode="out-in">
      <router-view></router-view>
    </transition>
  </div>
</template>

<script>
export default {
  mounted() {
    this.getRefrescarUsuarioAutenticado();
  },
  methods: {
    getRefrescarUsuarioAutenticado() {
      if (this.$router.currentRoute.name != 'login' &&  this.$router.currentRoute.name != 'resetpass') {
        let url = '/authenticate/getRefrescarUsuarioAutenticado';
        axios.get(url).then(response => {
          if (response.data.startsWith("<!DOCTYPE html>", 0)) {
            const exception = new Error();
            exception.response = {
              status: 401,
            }
            throw exception;
          }
        }).catch(error => {
          if (error.response.status == 401) {
            Swal.fire({
              icon: 'warning',
              title: 'La sesión ha expirado, por favor ingresa nuevamente',
              showConfirmButton: true,
              confirmButtonText: 'Entendido'
            }).then((result) => {
              sessionStorage.clear();
              this.$router.push({ name: 'login' });
              location.reload();
            });
          }
        });
      }
    }
  }
}
</script>

<style></style>