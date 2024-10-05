<template>
    <div class="content-header">
        <div id="contentRegistro" class="content container-fluid h-auto mb-5 mb-sm-0">
            <div class="row">
                <div class="col-sm-6 mx-auto">
                    <div class="card cardintro d-flex flex-row" style="height: 19rem">
                        <div class="tituloCard flex-grow-1 p-3 align-self-center" style="color: var(--iee-white);">
                            <h5 class="font-weight-bold tituloin">
                                ¡Buen día {{ cfullname }}!
                            </h5>
                            <h6 class="subtituloin font-weight-bold subtituloin">
                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Modi odit facilis neque
                                corporis laborum sit, ratione consectetur officiis quae, itaque deleniti ullam amet
                                soluta labore repellat, expedita numquam assumenda impedit.
                            </h6>
                        </div>
                        <div class="align-self-center">
                            <img src="/img/imglogro.webp" style="height: 10vh !important;">
                        </div>
                    </div>
                    <!-- <div class="col ">
                        <div class="row mt-4 rowvalidados">
                        </div>
                    </div> -->
                </div>
                <div class="col-sm-5 mx-auto">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width:100px; background-color: var(--iee-white);" @click.prevent="showListaCumple = !showListaCumple">
                                    Name
                                </vs-th>
                                <vs-th style="width:100px; background-color: var(--iee-white);" @click.prevent="">
                                    Email
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i" v-for="(tr, i) in $vs.getPage(users, page, max)" :data="tr"
                                style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ tr.name }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.email }}
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound>
                            <div style="background-color: var(--iee-white) !important;">
                                Sin resultados...
                            </div>
                        </template>
                        <template #footer>
                            <vs-pagination color="dark" v-model="page" :length="$vs.getLength(users, max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
            <!-- <div class="col-11 card fechasPeriodos mx-auto my-4"
                style="background-color: var(--iee-white) !important; color: var(--text-color)">
                <div class="row d-flex justify-content-center my-5">
                    <div class="col-sm-12 col-xl-6 mx-auto d-flex flex-column justify-content-center p-2">
                        <div class="card d-flex justify-content-center align-items-center px-4 py-2 mx-auto my-3"
                            v-if="renderComponent" style="box-shadow: var(--iee-shadow);">
                            <div v-for="periodo in periodos" :key="periodo.nombre">
                                <div v-if="periodo.nombre == 'Registro'" class="mx-auto text-center">
                                    <h5 class="mx-auto py-2"><strong>Eventos</strong></h5>
                                </div>
                            </div>
                        </div>
                        <div v-for="periodo in periodos" :key="periodo.nombre">
                            <div v-if="periodo.nombre == 'Registro'" class="d-flex justify-content-center">
                                <v-calendar v-if="periodo.calendario" expanded :columns="2" :rows="1"
                                    :attributes="attrsRegistro" />
                            </div>
                        </div>

                    </div>
                </div>
            </div> -->
        </div>
        <vs-dialog v-model="showListaCumple" prevent-close auto-width id="listaCumple">
            <template #header>
                <div class="col text-center">
                    <div>
                        <br />
                        <h4 class="not-margin font-weight-bold">
                            Hoy es cumpleaños de
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-content">
                <table class="table" v-if="listaHoy.length > 0" style="color: var(--iee-white-dark) !important;">
                    <thead>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Adscripción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(cumple, index) in listaHoy" :key="index">
                            <td>{{ cumple.nombre }}</td>
                            <td>{{ cumple.adscripcion }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <template #footer>
                <div class="footer-dialog">
                    <div class="d-flex justify-content-center flex-column flex-md-row">
                        <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'listaBD'+darkMode" @click.prevent="showListaCumple = !showListaCumple">
                            <div style="color: var(--btn-txt-color); font-weight: 700;">
                                Aceptar
                            </div>
                        </vs-button>                     
                    </div>                    
                </div>
            </template>
        </vs-dialog>        
    </div>
</template>
<script>

import DatePicker from 'v-calendar';
let methods = require('../../../methods')
export default {
    components: {
        DatePicker
    },
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            userLoggedPermissions: JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario')),
            userLoggedRol: JSON.parse(sessionStorage.getItem('rolUsuario')),
            cfullname: '',
            fechasPeriodos: '',
            renderComponent: true,
            periodos: [],
            attrsRegistro: [],

            saludo: (sessionStorage.getItem('saludo')) ? sessionStorage.getItem('saludo') : 'N/A',
            page: 1,
            max: 5,
            users: [
                {
                    "id": 1,
                    "name": "Leanne Graham",
                    "username": "Bret",
                    "email": "Sincere@april.biz",
                    "website": "hildegard.org",
                },
                {
                    "id": 2,
                    "name": "Ervin Howell",
                    "username": "Antonette",
                    "email": "Shanna@melissa.tv",
                    "website": "anastasia.net",
                },
                {
                    "id": 3,
                    "name": "Clementine Bauch",
                    "username": "Samantha",
                    "email": "Nathan@yesenia.net",
                    "website": "ramiro.info",
                },
                {
                    "id": 4,
                    "name": "Patricia Lebsack",
                    "username": "Karianne",
                    "email": "Julianne.OConner@kory.org",
                    "website": "kale.biz",
                },
                {
                    "id": 5,
                    "name": "Chelsey Dietrich",
                    "username": "Kamren",
                    "email": "Lucio_Hettinger@annie.ca",
                    "website": "demarco.info",
                },
                {
                    "id": 6,
                    "name": "Mrs. Dennis Schulist",
                    "username": "Leopoldo_Corkery",
                    "email": "Karley_Dach@jasper.info",
                    "website": "ola.org",
                },
                {
                    "id": 7,
                    "name": "Kurtis Weissnat",
                    "username": "Elwyn.Skiles",
                    "email": "Telly.Hoeger@billy.biz",
                    "website": "elvis.io",
                },
                {
                    "id": 8,
                    "name": "Nicholas Runolfsdottir V",
                    "username": "Maxime_Nienow",
                    "email": "Sherwood@rosamond.me",
                    "website": "jacynthe.com",
                },
                {
                    "id": 9,
                    "name": "Glenna Reichert",
                    "username": "Delphine",
                    "email": "Chaim_McDermott@dana.io",
                    "website": "conrad.com",
                },
                {
                    "id": 10,
                    "name": "Clementina DuBuque",
                    "username": "Moriah.Stanton",
                    "email": "Rey.Padberg@karina.biz",
                    "website": "ambrose.net",
                }
            ],
            listaHoy: [],
            globos: [],
            showListaCumple: false,
        }
    },
    watch:{
        showListaCumple(newVal,oldVal){
            setTimeout(() => {
                if(!!newVal){
                    this.globosAnim();
                }                
            }, 100);
        }
    },
    mounted() {
        this.getUsuario();
        window.scrollTo(0, 0);
    },
    async created() {
        EventBus.$on('darkMode', (data)=>{this.darkMode = data});
        this.getFechas();
        await this.getTodayDates();
    },
    methods: {
        getFechas() {
            let url = '/administracion/usuario/getFechasPeriodos'
            axios.get(url).then(response => {
                this.fechasPeriodos = response.data;
                this.getTimeDiff();
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            });
        },
        getTimeDiff() {
            this.fechasPeriodos.forEach(periodo => {
                let dateInicio = periodo.fechaInicio + ' ' + periodo.horaInicio;
                let msecInicio = Date.parse(dateInicio);

                let yearInicio = 0, monthInicio = 0, dayInicio = 0;
                let yearFin = 0, monthFin = 0, dayFin = 0;

                // /*FORMAT FECHA INICIO*/
                yearInicio = new Date(dateInicio);
                yearInicio = yearInicio.getFullYear();

                monthInicio = new Date(dateInicio);
                monthInicio = monthInicio.getMonth() + 1;

                dayInicio = new Date(dateInicio);
                dayInicio = dayInicio.getDate();

                let dateFin = periodo.fechaFin + ' ' + periodo.horaFin;
                let msecFin = Date.parse(dateFin);

                /*FORMAT FECHA FIN*/
                yearFin = new Date(dateFin);
                yearFin = yearFin.getFullYear();

                monthFin = new Date(dateFin);
                monthFin = monthFin.getMonth() + 1;

                dayFin = new Date(dateFin);
                dayFin = dayFin.getDate();

                let msecToday = Date.now();
                let msecTodayToInicio = msecInicio - msecToday;
                let msecTodayToFin = msecFin - msecToday;
                let msecInicioToFin = msecFin - msecInicio;

                let yearToInicio = 0, monthToInicio = 0, dayToInicio = 0;
                let hoursToInicio = 0, minutesToInicio = 0, secondsToInicio = 0;

                let yearToFin = 0, monthToFin = 0, dayToFin = 0;
                let hoursToFin = 0, minutesToFin = 0, secondsToFin = 0;

                let yearInicioToFin = 0, monthInicioToFin = 0, dayInicioToFin = 0;
                let hoursInicioToFin = 0, minutesInicioToFin = 0, secondsInicioToFin = 0;

                /*CALCULAR TIEMPO RESTANTE DE LA FECHA DE HOY  LA FECHA DE INICIO*/
                if (Math.floor(msecTodayToInicio / 1000 / 60 / 60 / 24 / 30 / 12) > 0) {
                    yearToInicio = Math.floor(msecTodayToInicio / 1000 / 60 / 60 / 24 / 30 / 12);
                    msecTodayToInicio -= yearToInicio * 1000 * 60 * 60 * 24 * 30 * 12;
                }
                if (Math.floor(msecTodayToInicio / 1000 / 60 / 60 / 24 / 30) > 0) {
                    monthToInicio = Math.floor(msecTodayToInicio / 1000 / 60 / 60 / 24 / 30);
                    msecTodayToInicio -= monthToInicio * 1000 * 60 * 60 * 24 * 30;
                }

                if (Math.floor(msecTodayToInicio / 1000 / 60 / 60 / 24) > 0) {
                    dayToInicio = Math.floor(msecTodayToInicio / 1000 / 60 / 60 / 24);
                    msecTodayToInicio -= dayToInicio * 1000 * 60 * 60 * 24;
                }

                if (Math.floor(msecTodayToInicio / 1000 / 60 / 60) > 0) {
                    hoursToInicio = Math.floor(msecTodayToInicio / 1000 / 60 / 60);
                    msecTodayToInicio -= hoursToInicio * 1000 * 60 * 60;
                }

                if (Math.floor(msecTodayToInicio / 1000 / 60)) {
                    minutesToInicio = Math.floor(msecTodayToInicio / 1000 / 60);
                    msecTodayToInicio -= minutesToInicio * 1000 * 60;
                }

                if (Math.floor(msecTodayToInicio / 1000) > 0) {
                    secondsToInicio = Math.floor(msecTodayToInicio / 1000);
                    msecTodayToInicio -= secondsToInicio * 1000;
                }


                /*CALCULAR TIEMPO RESTANTE DE LA FECHA DE HOY  LA FECHA DE FIN*/
                if (Math.floor(msecTodayToFin / 1000 / 60 / 60 / 24 / 30 / 12) > 0) {
                    yearToFin = Math.floor(msecTodayToFin / 1000 / 60 / 60 / 24 / 30 / 12);
                    msecTodayToFin -= yearToFin * 1000 * 60 * 60 * 24 * 30 * 12;
                }
                if (Math.floor(msecTodayToFin / 1000 / 60 / 60 / 24 / 30) > 0) {
                    monthToFin = Math.floor(msecTodayToFin / 1000 / 60 / 60 / 24 / 30);
                    msecTodayToFin -= monthToFin * 1000 * 60 * 60 * 24 * 30;
                }

                if (Math.floor(msecTodayToFin / 1000 / 60 / 60 / 24) > 0) {
                    dayToFin = Math.floor(msecTodayToFin / 1000 / 60 / 60 / 24);
                    msecTodayToFin -= dayToFin * 1000 * 60 * 60 * 24;
                }

                if (Math.floor(msecTodayToFin / 1000 / 60 / 60) > 0) {
                    hoursToFin = Math.floor(msecTodayToFin / 1000 / 60 / 60);
                    msecTodayToFin -= hoursToFin * 1000 * 60 * 60;
                }

                if (Math.floor(msecTodayToFin / 1000 / 60)) {
                    minutesToFin = Math.floor(msecTodayToFin / 1000 / 60);
                    msecTodayToFin -= minutesToFin * 1000 * 60;
                }

                if (Math.floor(msecTodayToFin / 1000) > 0) {
                    secondsToFin = Math.floor(msecTodayToFin / 1000);
                    msecTodayToFin -= secondsToFin * 1000;
                }

                /*CALCULAR TIEMPO RESTANTE DE LA FECHA DE INICIO  LA FECHA DE FIN*/
                if (Math.floor(msecInicioToFin / 1000 / 60 / 60 / 24 / 30 / 12) > 0) {
                    yearInicioToFin = Math.floor(msecInicioToFin / 1000 / 60 / 60 / 24 / 30 / 12);
                    msecInicioToFin -= yearInicioToFin * 1000 * 60 * 60 * 24 * 30 * 12;
                }
                if (Math.floor(msecInicioToFin / 1000 / 60 / 60 / 24 / 30) > 0) {
                    monthInicioToFin = Math.floor(msecInicioToFin / 1000 / 60 / 60 / 24 / 30);
                    msecInicioToFin -= monthInicioToFin * 1000 * 60 * 60 * 24 * 30;
                }

                if (Math.floor(msecInicioToFin / 1000 / 60 / 60 / 24) > 0) {
                    dayInicioToFin = Math.floor(msecInicioToFin / 1000 / 60 / 60 / 24);
                    msecInicioToFin -= dayInicioToFin * 1000 * 60 * 60 * 24;
                }

                if (Math.floor(msecInicioToFin / 1000 / 60 / 60) > 0) {
                    hoursInicioToFin = Math.floor(msecInicioToFin / 1000 / 60 / 60);
                    msecInicioToFin -= hoursInicioToFin * 1000 * 60 * 60;
                }

                if (Math.floor(msecInicioToFin / 1000 / 60)) {
                    minutesInicioToFin = Math.floor(msecInicioToFin / 1000 / 60);
                    msecInicioToFin -= minutesInicioToFin * 1000 * 60;
                }

                if (Math.floor(msecInicioToFin / 1000) > 0) {
                    secondsInicioToFin = Math.floor(msecInicioToFin / 1000);
                    msecInicioToFin -= secondsInicioToFin * 1000;
                }

                const newPeriodo = {
                    nombre: periodo.nombre,
                    calendario: (periodo.verCalendario > 0) ? true : false,
                    inicio: {
                        msec: msecInicio,
                        fullDate: new Date(dateInicio),
                        year: yearInicio,
                        month: monthInicio,
                        day: dayInicio,
                    },
                    fin: {
                        msec: msecFin,
                        fullDate: new Date(dateFin),
                        year: yearFin,
                        month: monthFin,
                        day: dayFin,
                    },
                    todayToInicio: {
                        msec: (msecInicio - msecToday),
                        years: yearToInicio,
                        months: monthToInicio,
                        days: dayToInicio,
                        hours: hoursToInicio,
                        minutes: minutesToInicio,
                        seconds: secondsToInicio,
                    },
                    todayToFin: {
                        msec: (msecFin - msecToday),
                        years: yearToFin,
                        months: monthToFin,
                        days: dayToFin,
                        hours: hoursToFin,
                        minutes: minutesToFin,
                        seconds: secondsToFin,
                    },
                    inicioToFin: {
                        msec: (msecFin - msecInicio),
                        years: yearInicioToFin,
                        months: monthInicioToFin,
                        days: dayInicioToFin,
                        hours: hoursInicioToFin,
                        minutes: minutesInicioToFin,
                        seconds: secondsInicioToFin,
                    },
                }

                this.periodos.push(newPeriodo);

            });
            this.setDatesOnCalendar();
        },
        setDatesOnCalendar() {
            let newCalendar = {};
            let newToday = {};
            this.periodos.forEach(periodo => {
                switch (periodo.nombre) {
                    case 'Registro':
                        newCalendar = {
                            highlight: {
                                start: { fillMode: 'solid', color: 'gray' },
                                base: { fillMode: 'light', color: 'gray' },
                                end: { fillMode: 'solid', color: 'gray' },
                            },
                            dates: { start: new Date(periodo.inicio.fullDate), end: new Date(periodo.fin.fullDate) }
                        }
                        this.attrsRegistro.push(newCalendar);
                        newToday = {
                            key: 'today',
                            highlight: 'teal',
                            dates: new Date(),
                        }
                        this.attrsRegistro.push(newToday);
                        break;
                    default:
                        break;
                }
            });
        },

        forceRerender() {
            this.renderComponent = false;

            this.$nextTick(() => {
                this.renderComponent = true;
            });
        },
        getUsuario() {
            let sessFolio = sessionStorage.getItem('idFolioUsuario');
            let sessFullName = sessionStorage.getItem('fullname');
            let sessUsername = sessionStorage.getItem('username');
            let sessCorreo = sessionStorage.getItem('correo');
            let sessUsrRol = sessionStorage.getItem('rolUsuario');


            if ( sessFullName == null || sessUsername == null || sessUsrRol == null) {
                let url = '/administracion/usuario/getUsuario';
                axios.get(url).then(response => {
                    this.cfullname = response.data[0].fullname.trim();
                    sessionStorage.setItem('idUsuario', response.data[0].id);
                    sessionStorage.setItem('fullname', this.cfullname);
                    sessionStorage.setItem('username', response.data[0].username);
                    EventBus.$emit('infoNav', response.data[0].id);
                }).catch(error => {
                    console.log(error);
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);
                });
            }
            else {
                this.cfullname = sessFullName;
            }
        },
        async getTodayDates() {
            const url = '/administracion/birthday/getTodayDates';
            try {
                const response = await axios.get(url);
                if(response.status === 200){
                    this.listaHoy = response.data;
                    if(this.listaHoy.length > 0){
                        this.showListaCumple = true;
                    }
                }
            } catch (error) {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);
            }
        },
        globosAnim() {           
            const numero = 25;
            // const wrapper = document.getElementsByClassName('wrapper')[0];
            const wrapper = document.getElementById('listaCumple');
            const colors = ['#ff0000','#fd11fd','#0000ff','#00ff00','#ffd700'];
            wrapper.style.overflow = "hidden";
            
            for(let i = 0; i< numero;i++){
                const globo = document.createElement('div'); // Crea un nuevo elemento div
                globo.classList.add('globo'); // Añade la clase 'globo'

                // Posición horizontal aleatoria
                const leftPosition = Math.random() * (wrapper.clientWidth - 100);
                globo.style.left = `${leftPosition}px`;
                globo.style.bottom = '-10.5rem'; // Empieza desde el fondo
                globo.style.backgroundColor = colors[(i + 1) % 5];
                wrapper.appendChild(globo); // Agrega el globo al wrapper

                const delay = i * 125; // Delay incremental

                anime({
                    targets: globo,
                    translateY: -1195, // Desplazamiento vertical
                    easing: 'easeInOutExpo',
                    duration: 3000,
                    delay: delay,
                    complete: () => {
                        wrapper.removeChild(globo); // Elimina el globo del wrapper al completar
                    }
                });
            }
        },
    }

}
</script>
<style>
.square-chart-container,
.landscape-chart-container,
.ultrawide-chart-container {
    display: flex !important;
    justify-content: center !important;
    align-items: center !important;
    margin-top: 4rem;
    margin-left: 1.5rem;
    margin-right: 1.5rem;
    padding: 2rem;
    width: 100% !important;
}

.square-chart,
.landscape-chart,
.ultrawide-chart {
    width: 100% !important;
    position: relative !important;
}

.square-chart-container {
    width: 33% !important;
}

.landscape-chart-container {
    width: 66% !important;
}

.ultrawide-chart-container {
    width: 100% !important;
}

.square-chart canvas {
    min-height: 425px;
    min-width: 300px;
    height: 425px;
    max-width: 100%;
}

.landscape-chart canvas {
    min-width: 300px;
    width: 850px;
    max-width: 100%;
    min-height: 350px;
    /* height:425px; */
    max-height: 425px;
}

.ultrawide-chart canvas {
    min-width: 300px;
    width: 1700px;
    max-width: 100%;
    min-height: 350px;
    /* height:425px; */
    max-height: 425px;
}

/*
  Enter and leave animations can use different
  durations and timing functions.
*/
.slide-fade-enter-active {
    transition: all 0.3s ease-out;
}

.slide-fade-leave-active {
    transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}

.slide-fade-enter-from,
.slide-fade-leave-to {
    transform: translateX(20px);
    opacity: 0;
}

.vc-container {
    background-color: var(--iee-white);
    color: var(--text-color)
}

.vc-title {
    color: var(--text-color) !important;
}

.cubeContainer {
    position: absolute !important;
    width: 100% !important;
    height: 100vh !important;
    top: 0 !important;
    left: 0 !important;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: #050505d5;
    z-index: 20000000;
    overflow: hidden;
}

.xd img {
    position: absolute;
    top: 50px;
    right: 50px;
    width: 100px;
    height: 100px;
    border-radius: 100%;
}

.cube {
    position: relative;
    width: 300px;
    height: 300px;
    transform-style: preserve-3d;
    transform: rotateX(-30deg);
    animation: cubeAnimate 4s linear infinite;
    z-index: inherit !important;
}

@keyframes cubeAnimate {
    0% {
        transform: rotateX(-30deg) rotateY(0deg);
    }

    100% {
        transform: rotateX(-30deg) rotateY(360deg);
    }
}

.cube div {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    transform-style: preserve-3d;
    z-index: inherit !important;
}

.cube div span {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(#151515, #00a199);
    transform: rotateY(calc(90deg * var(--i))) translateZ(150px);

    z-index: inherit !important;
}

.cube .top {
    position: absolute;
    top: 0;
    left: 0;
    width: 300px;
    height: 300px;
    background: #222;
    transform: rotateX(90deg) translateZ(150px);
    z-index: inherit !important;
}

.cube .top::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 300px;
    height: 300px;
    background: #00a199;
    transform: translateZ(-400px);
    filter: blur(20px);
    box-shadow: 0 0 120px rgba(0, 0, 255, 0.2),
        0 0 200px rgba(0, 161, 153, 0.4),
        0 0 300px rgba(0, 161, 153, 0.6),
        0 0 400px rgba(0, 161, 153, 0.8),
        0 0 500px rgba(0, 161, 153, 1);

    z-index: inherit !important;
}

.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}

@media screen and (max-width: 1415px) {
    .coltamano {
        flex: 0 0 100%;
        max-width: 100%;
        position: relative;
        width: 100%;
        padding-right: 7.5px;
        padding-left: 7.5px;
    }

    .cardimgint {
        width: 100%;

    }

    .imgcintro {
        width: 51%;
    }

    .charts-container {
        flex-wrap: wrap !important;
    }

    .square-chart-container,
    .landscape-chart-container {
        width: 86.5% !important;
        padding: 2rem;
    }
}

@media screen and (max-width: 832px) {
    .imgcintro {
        height: fit-content;
    }

    .subtituloinicio {
        font-size: 3.5rem;
    }

    .content-header h1 {
        font-size: 1.5rem;
        margin: 0;
    }

}

@media screen and (max-width: 402px) {
    .imgcintro {
        display: none;
    }

    .imgprogreso {
        display: none;
    }

    .imgprogresos {
        display: none !important;
    }

    .subtituloinicio {
        font-size: 3.5rem;
    }

    .content-header h1 {
        font-size: 1.5rem;
        margin: 0;
    }

    .coltamano {
        margin-top: 0 !important;
    }

    .rowvalidados {
        margin-top: 0 !important;
    }
}

@media screen and (max-width: 468px) {
    .mrevisar {
        margin-left: 0 !important;
    }

    .cardestado {
        width: 100%;
        margin-left: 0 !important;
    }
}

@media screen and (max-width: 280px) {
    .content-header h1 {
        font-size: 1.3rem;
        margin: 0;
    }
}

@media screen and (max-height: 600px) {
    .cardestado {
        height: 37vh;


    }
}
</style>