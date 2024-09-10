<template>
    <div>
        <vs-button @click.prevent="asignarid" style="color: black;" class="forgot-pass pt-3">No recuerdo mi contraseña
        </vs-button>
        <vs-dialog blur v-model="active">
            <template #header>
                <div class="col text-center">
                    <div>
                        <br>
                        <h4 class="not-margin">
                            Cambiar de Contraseña
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-form" style="padding: 1rem;">
                <label class="col-form-label">Usuario</label>
                <vs-input type="text" placeholder="Nombre de usuario" v-model="usuario">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            account_circle
                        </span>
                    </template>
                </vs-input>
                <br>
                <label class="col-form-label">Correo Electrónico</label>
                <vs-input type="text" placeholder="Correo Electrónico" v-model="email">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            mail
                        </span>
                    </template>
                </vs-input>
                <br>
                <vs-button color="#1a2e35" warn block @click.prevent="consultarUsuario">
                    <h6 style="color: white !important;">Recuperar Contraseña</h6>
                </vs-button>
            </div>
            <template #footer>
                <center>
                    <div class="footer-dialog">
                    </div>
                </center>
            </template>
        </vs-dialog>
    </div>
</template>
<script>
export default {
    data() {
        return {
            active: false,
            usuario: '',
            email: '',
            pass: ''
        }
    },
    methods: {
        asignarid() {
            this.active = !this.active;
        },
        consultarUsuario() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            let url = '/administracion/usuario/consultarUsuario'

            axios.get(url, {
                params: {
                    'user': this.usuario,
                    'mail': this.email
                }
            }).then(response => {
                
                let usuario, fullname, email = ''
                let idUser = 0;
                usuario = response.data[0].username,
                    fullname = response.data[0].Nombre + ' ' + response.data[0].Apaterno + ' ' + response.data[0].Amaterno
                email = response.data[0].email
                idUser = response.data[0].id

                this.rndStr(usuario, fullname, email, idUser, loading)
            }).catch(error => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        sendEmailPass(usuario, fullname, email, idUser, pass, loading) {
            let url = '/send-mail'
            axios.get(url, {
                params: {
                    'cUsername': usuario,
                    'cFullname': fullname,
                    'cEmail': email,
                    'nIdUsuario': idUser,
                    'cPass': pass
                }
            }).then(response => {
                
                Swal.fire({
                    icon: "success",
                    title:
                        "Contraseña Reestablecida",
                    text: 'La contraseña se ha reestablecido correctamente, verifíque su bandeja del correo electrónico asociado a su cuenta',
                    showConfirmButton: true,
                    confirmButtonText: "De acuerdo",
                });
                this.active = !this.active;
                loading.close();
            }).catch(error => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        rndStr(usuario, fullname, email, idUser, loading) {
            let text = " "
            let chars = "abcdefghijklmnopqrstuvwxyz"
            let charsMayus = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            let numbers = "0123456789"
            let simbols = '@$!%*#?&'

            for (let i = 0; i < 2; i++) {
                text += charsMayus.charAt(Math.floor(Math.random() * charsMayus.length))
            }
            for (let i = 0; i < 2; i++) {
                text += chars.charAt(Math.floor(Math.random() * chars.length))
            }
            for (let i = 0; i < 2; i++) {
                text += numbers.charAt(Math.floor(Math.random() * numbers.length))
            }
            for (let i = 0; i < 2; i++) {
                text += simbols.charAt(Math.floor(Math.random() * simbols.length))
            }

            this.pass = text;

            this.sendEmailPass(usuario, fullname, email, idUser, this.pass, loading)

        }
    }
}
</script>
<style>
.forgot-pass {
    font-size: 0.9rem;
    text-decoration-line: underline;
    text-underline-offset: 3px;
    color: var(--important-card-bg);
}
</style>