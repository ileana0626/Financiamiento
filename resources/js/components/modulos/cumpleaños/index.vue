<template>
    <div class="col">
        <div class="float-sm-right mr-5">
            <ul class="breadcrumb">
                <li style="font-family: 'KGHappy'">
                    <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                </li>
                <li class="breadActive">
                    <span>
                        Cumpleaños
                    </span>
                </li>
            </ul>
        </div>
        <br><br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Cumpleaños</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="active = !active"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #header>
                            <vs-input v-model="search" border placeholder="Escribe un Nombre"
                                class="inputSearchPreguntas" />
                        </template>
                        <template #thead>
                            <vs-tr>
                                <vs-th sort
                                    @click="NewlistBirthday = $vs.sortData($event, NewlistBirthday, 'adscripcion')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Adscripción
                                </vs-th>
                                <vs-th sort @click="NewlistBirthday = $vs.sortData($event, NewlistBirthday, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Nombre
                                </vs-th>
                                <vs-th sort @click="NewlistBirthday = $vs.sortData($event, NewlistBirthday, 'dia')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Día
                                </vs-th>
                                <vs-th sort @click="NewlistBirthday = $vs.sortData($event, NewlistBirthday, 'mes')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Mes
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Proxímo
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Acciones
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(NewlistBirthday, search), page, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ tr.adscripcion }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.dia }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.mes }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ nextBD(tr.dia, tr.idMes) }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Imagen de felicitaciones" v-if="felicitar(tr.dia, tr.idMes)"
                                        placement="top">
                                        <vs-button id="logoutBtn" icon color="rgb(58,197,55)" size="large"
                                            @click.prevent="generarImagen(tr.nombre, tr.dia, tr.idMes)">
                                            <span class="material-symbols-rounded" style="color: white !important;">
                                                celebration
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm " @click.prevent="modalEditar(tr.id,tr.nombre,tr.id_adscripcion,tr.idMes,tr.dia)"
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound>
                            <div style="background-color: var(--iee-white) !important;">
                                Sin resultados...
                            </div>
                        </template>
                        <template #footer>
                            <vs-pagination v-model="page" color="dark"
                                :length="$vs.getLength($vs.getSearch(NewlistBirthday, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <vs-dialog blur v-model="active" id="pwd">
            <template #header>
                <div class="col text-center">
                    <div>
                        <br>
                        <h4 class="not-margin">
                            Registrar Cumpleaños
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-form">
                <label class="col-form-label">Nombre</label>
                <vs-input type="text" placeholder="Nombre" v-model="nombre" autocomplete="off">
                    <template #message-danger v-if="errorNombre.length > 0">
                        {{ errorNombre }}
                    </template>
                </vs-input>
                <br>
                <label class="col-form-label">Adscripción</label>
                <vs-select type="text" placeholder="Adscripción" v-model="adscripcion" v-if="catAdscripcion.length > 0"
                    filter :color="colors[0].color" autocomplete="off">
                    <template #message-danger v-if="errorAdscripcion.length > 0">
                        {{ errorAdscripcion }}
                    </template>

                    <vs-option v-for="(item, index) in catAdscripcion" :key="index" :label="item.nombre"
                        :value="item.id">
                        {{ item.nombre }}
                    </vs-option>
                </vs-select>
                <br>
                <label class="col-form-label">Mes</label>
                <vs-select type="text" placeholder="Adscripción" v-model="mes" v-if="catMeses.length > 0" filter
                    :color="colors[0].color" autocomplete="off">
                    <template #message-danger v-if="errorMes.length > 0">
                        {{ errorMes }}
                    </template>
                    <vs-option v-for="(item, index) in catMeses" :key="index" :label="item.mes" :value="item.id">
                        {{ item.mes }}
                    </vs-option>
                </vs-select>
                <br>
                <label class="col-form-label">Día</label>
                <vs-select type="text" placeholder="Adscripción" v-model="dia" v-if="dias.length > 0" filter
                    :color="colors[0].color" autocomplete="off">
                    <template #message-danger v-if="errorDia.length > 0">
                        {{ errorDia }}
                    </template>
                    <vs-option v-for="(item, index) in dias" :key="index" :label="item.dia" :value="item.dia">
                        {{ item.dia }}
                    </vs-option>
                </vs-select>
                <br>

                <vs-button style="background-color: var(--iee-black) !important;" id="pwdb" block
                    @click.prevent="guardarBirthday">
                    Registrar
                </vs-button>
            </div>
            <template #footer>
                <center>
                    <div class="footer-dialog">
                    </div>
                </center>
            </template>
        </vs-dialog>
        <vs-dialog blur v-model="active2" id="pwd">
            <template #header>
                <div class="col text-center">
                    <div>
                        <br>
                        <h4 class="not-margin">
                            Editar Cumpleaños
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-form">
                <label class="col-form-label">Nombre</label>
                <vs-input type="text" placeholder="Nombre" v-model="editarNombre" autocomplete="off">
                    <template #message-danger v-if="errorNombreEditar.length > 0">
                        {{ errorNombreEditar }}
                    </template>
                </vs-input>
                <br>
                <label class="col-form-label">Adscripción</label>
                <vs-select type="text" placeholder="Adscripción" v-model="editarAdscripcion" v-if="catAdscripcion.length > 0"
                    filter :color="colors[0].color" autocomplete="off">
                    <template #message-danger v-if="errorAdscripcionEditar.length > 0">
                        {{ errorAdscripcionEditar }}
                    </template>

                    <vs-option v-for="(item, index) in catAdscripcion" :key="index" :label="item.nombre"
                        :value="item.id">
                        {{ item.nombre }}
                    </vs-option>
                </vs-select>
                <br>
                <label class="col-form-label">Mes</label>
                <vs-select type="text" placeholder="Adscripción" v-model="editarMes" v-if="catMeses.length > 0" filter
                    :color="colors[0].color" autocomplete="off">
                    <template #message-danger v-if="errorMesEditar.length > 0">
                        {{ errorMesEditar }}
                    </template>
                    <vs-option v-for="(item, index) in catMeses" :key="index" :label="item.mes" :value="item.id">
                        {{ item.mes }}
                    </vs-option>
                </vs-select>
                <br>
                <label class="col-form-label">Día</label>
                <vs-select type="text" placeholder="Adscripción" v-model="editarDia" v-if="dias.length > 0" filter
                    :color="colors[0].color" autocomplete="off">
                    <template #message-danger v-if="errorDiaEditar.length > 0">
                        {{ errorDiaEditar }}
                    </template>
                    <vs-option v-for="(item, index) in dias" :key="index" :label="item.dia" :value="item.dia">
                        {{ item.dia }}
                    </vs-option>
                </vs-select>
                <br>

                <vs-button style="background-color: var(--iee-black) !important;" id="pwdb" block
                    @click.prevent="EditarBirthday()">
                    Editar
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
let methods = require('../../../methods')
export default {
    data() {
        return {
            og: window.location.origin + '/',
            colors: [
                {
                    color: 'warn'
                },

            ],
            idEditar : 0,
            page: 1,
            max: 10,
            search: '',
            listBirthday: [],
            NewlistBirthday: [],
            catAdscripcion: [],
            catMeses: [],
            active: false,
            active2: false,
            nombre: '',
            adscripcion: '',
            dia: '',
            mes: '',
            error: 0,
            errorNombre: '',
            errorAdscripcion: '',
            errorDia: '',
            errorMes: '',
            dias: [],
            editarNombre:'',
            editarAdscripcion:'',
            editarDia:'',
            editarMes:'',
            errorNombreEditar: '',
            errorAdscripcionEditar: '',
            errorDiaEditar: '',
            errorMesEditar: '',
            

        }
    },
    created() {
        const loading = this.$vs.loading({
            type: 'square',
            color: '#00a19a',
            background: '#FFFFFF',
            text: 'Cargando...'
        });

        this.checkCrear(loading);
    },
    mounted() {
        this.obtenerDatos(10)
        this.obtenerDatos(11)
        this.creardias()
    },
    computed:{
        nextBD() {
            return(dia, mes)=>{
                if(!!dia && !!mes){
                    let hoy = new Date();
                    let anioActual = hoy.getFullYear();
                    let dateBD = new Date(anioActual, mes - 1, dia, 0, 0, 0, 0);
                    if ((dia === hoy.getDate()) && (hoy.getMonth() === (mes - 1))) return 'Hoy';

                    if(dateBD < hoy) dateBD.setFullYear(anioActual + 1);
                    return dateBD.toLocaleDateString('es-ES',{day: '2-digit', month: '2-digit', year: 'numeric'});
                }
            }
        },
        felicitar(){
            return(dia, mes)=>{
                if(!!dia && !!mes){
                    let hoy = new Date();
                    return ((dia === hoy.getDate()) && (hoy.getMonth() === (mes - 1))); 
                }
            }            
        }
    },
    methods: {
        checkCrear(loading) {
            this.getbirthday(loading)
        },
        obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            axios.get(url, {
                params: {
                    'tipo': tipo,
                    'consulta': 2
                }
            }).then(response => {
                switch (tipo) {
                    case 10:
                        this.catAdscripcion = response.data
                        break;
                    case 11:
                        this.catMeses = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },
        creardias() {
            for (var i = 0; i <= 30; i++) {
                this.dias.push({
                    'dia': i + 1
                })
            }

        },
        getbirthday(loading) {
            let url = '/administracion/usuario/getbirthday';
            this.NewlistBirthday = []
            axios.get(url).then((response) => {
                this.listBirthday = response.data
                this.filterBirthday()
                loading.close()
            }).catch((error) => {
                loading.close();
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);
            });
        },
        filterBirthday() {
            let me = this;
            let conteo = 0;
            me.listBirthday.map(function (x, y) {
                me.NewlistBirthday.push({
                    'continua': conteo += 1,
                    'adscripcion': x.adscripcion,
                    'nombre': x.nombre,
                    'dia': x.dia,
                    'mes': x.mes,
                    'idMes' : x.idMes,
                    'id_adscripcion':x.id_adscripcion,
                    'id' : x.id
                })
            })
        },
        guardarBirthday() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            this.validar()
            if (this.error == 1) {
                loading.close();
                Swal.fire({
                    icon: 'warning',
                    title: 'Algunos de los campos se encuentran vacíos. \n Verifique los datos e inténtelo de nuevo.',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            } else {
                let url = '/administracion/usuario/guardarBirthday';
                axios.post(url, {
                    'tipo': 1,
                    'id': 0,
                    'nombre': this.nombre,
                    'adscripcion': this.adscripcion,
                    'mes': this.mes,
                    'dia': this.dia
                }).then(response => {
                    loading.close();
                    this.getbirthday(loading)
                    this.limpiarCampos()
                    Swal.fire({
                        icon: 'success',
                        title: 'Registrado correctamente',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo'
                    });
                }).catch((error) => {
                    loading.close();
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3], this.$router);
                });
            }
        },
        EditarBirthday() {
            const loading = this.$vs.loading({
                type: 'square',
                color: '#00a19a',
                background: '#FFFFFF',
                text: 'Cargando...'
            });
            this.validarEditar()
            if (this.error == 1) {
                loading.close();
                Swal.fire({
                    icon: 'warning',
                    title: 'Algunos de los campos se encuentran vacíos. \n Verifique los datos e inténtelo de nuevo.',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            } else {
                let url = '/administracion/usuario/EditarBirthday';
                axios.post(url, {
                    'tipo': 2,
                    'id': this.idEditar,
                    'nombre': this.editarNombre,
                    'adscripcion': this.editarAdscripcion,
                    'mes': this.editarMes,
                    'dia': this.editarDia
                }).then(response => {
                    loading.close();
                    this.getbirthday(loading)
                    this.limpiarCampos()
                    Swal.fire({
                        icon: 'success',
                        title: 'Registro actualizado correctamente',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo'
                    });
                }).catch((error) => {
                    loading.close();
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3], this.$router);
                });
            }
        },
        validar() {
            this.error = 0;
            this.limpiarError()

            this.nombre = this.nombre.trim()
            if (this.nombre == '') {
                this.error = 1
                this.errorNombre = 'Escriba el nombre del personal'
            }
            if (this.adscripcion == '') {
                this.error = 1
                this.errorAdscripcion = 'Seleccione el area adscripto'
            }
            if (this.dia == '') {
                this.error = 1
                this.errorDia = 'Seleccione el día'
            }
            if (this.mes == '') {
                this.error = 1
                this.errorMes = 'Seleccione el mes'
            }
        },
        validarEditar() {
            this.error = 0;
            this.limpiarError()

            this.editarNombre = this.editarNombre.trim()
            if (this.editarNombre == '') {
                this.error = 1
                this.errorNombreEditar = 'Escriba el nombre del personal'
            }
            if (this.editarAdscripcion == '') {
                this.error = 1
                this.errorAdscripcionEditar = 'Seleccione el area adscripto'
            }
            if (this.editarDia == '') {
                this.error = 1
                this.errorDiaEditar = 'Seleccione el día'
            }
            if (this.editarMes == '') {
                this.error = 1
                this.errorMesEditar = 'Seleccione el mes'
            }
        },
        limpiarError() {
            this.errorNombre = ''
            this.errorAdscripcion = ''
            this.errorDia = ''
            this.errorMes = ''
            this.errorNombreEditar = ''
            this.errorAdscripcionEditar = ''
            this.errorDiaEditar = ''
            this.errorMesEditar = ''
        },
        limpiarCampos() {
            this.nombre = ''
            this.adscripcion = ''
            this.dia = ''
            this.mes = ''
            this.editarNombre = ''
            this.editarAdscripcion = ''
            this.editarDia = ''
            this.editarMes = ''
        },
        modalEditar(id,nombre,adscripcion,mes,dia){
            this.editarNombre = nombre
            this.editarAdscripcion = adscripcion
            this.editarDia =  dia
            this.editarMes = mes
            this.idEditar = id
            this.active2 = !this.active2
        },
        async generarImagen( rowName, dia, mes ) {
            let imgURL = this.og + 'img/cumple/plantilla_BD.png';

            const canvas = document.createElement('canvas')
            canvas.width = 2560;
            canvas.height = 1440;
            canvas.id = 'felicitar';
            let ctx = canvas.getContext('2d');

            const load = methods.loading( this.$vs );
            try {
                const response = await axios.get(imgURL, {responseType: 'blob'});
                if(response.status === 200) {
                    const imgData = response.data;
                    const imgBlob = new Blob([imgData], { type: 'image/png' });
                    const url = URL.createObjectURL(imgBlob);   
                    
                    const img = new Image();
                    let fecha = 'Hoy, ' + this.fechaTarjeta(dia, mes);
                    img.onload = function() {
                        // Dibujar la imagen en el canvas
                        ctx.drawImage(img, 0, 0);

                        // Escribir texto sobre el canvas
                        ctx.fillStyle = '#4715f5'; // Color del texto
                        ctx.font = "50px 'KGHappy'"; // Estilo de fuente
                        ctx.shadowColor = 'red';
                        ctx.shadowBlur = 25;
                        setTimeout(() => {                      
                        }, 300);
                        ctx.fillText(fecha, 690, 735);

                        let nameProperties = ctx.measureText(rowName);
                        let widthName = nameProperties.width;
                        ctx.fillText(rowName, Math.floor(canvas.width / 2) - Math.floor(widthName / 2), 1050)

                        // Liberar el objeto URL
                        URL.revokeObjectURL(url);

                        // Generar y descargar el Blob como PNG
                        canvas.toBlob(function(blob) {
                            const link = document.createElement('a');
                            link.href = URL.createObjectURL(blob);
                            link.download = 'felicitacion.png';
                            link.click();
                        }, 'image/png');
                    };
                    img.src = url;                    
                }
            } catch (error) {
                console.log(error);
            } finally {
                load.close();
            }
        },
        fechaTarjeta(dia, mes) {
            let hoy = new Date();
            let anioActual = hoy.getFullYear();
            let dateBD = new Date(anioActual, mes - 1, dia, 0, 0, 0, 0);
            return dateBD.toLocaleDateString('es-ES',{day: '2-digit', month: 'long', year: 'numeric'});            
        },
    }
}
</script>

<style></style>