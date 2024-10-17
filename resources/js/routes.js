import Vue from 'vue';
import Router from 'vue-router';
import Dashboard from './components/modulos/dashboard/index.vue';
import Login from './components/modulos/authenticate/login.vue';
import PreferenciasInterfaz from "./components/modulos/admin/Preferenciasinterfaz.vue";
import Captura from "./components/modulos/captura/registro.vue";
import Recordatorio from "./components/modulos/captura/recordatorios.vue";
import Catalogos from "./components/modulos/catalogos/index.vue";
import Cumplea from "./components/modulos/cumpleaños/index.vue";
import IndexUsers from "./components/modulos/usuario/index.vue";
import EditUser from "./components/modulos/usuario/edit.vue";
import GestioSolicitudes from "./components/modulos/ver/gestiosSolicitudes.vue";
import Editar from './components/modulos/captura/editar.vue';
import Capturav2 from './components/modulos/captura/registrov2.vue';
import Perfil from './components/modulos/usuario/perfil/perfil.vue';
import EditPerfil from './components/modulos/usuario/perfil/editPerfil.vue';

import Error404 from './components/plantilla/404.vue';
import SADecoder from './components/modulos/superadmin/decoder.vue';


Vue.use(Router)
const { isNavigationFailure, NavigationFailureType } = Router;

const originalPush = Router.prototype.push;
Router.prototype.push = function push(location) {
    originalPush.call(this, location).catch(error => {
        if(!isNavigationFailure(error, NavigationFailureType.duplicated)) {
            throw Error(error)
        }
    })
};

function verificarAcceso(to, from, next) {
    let authUser = JSON.parse(sessionStorage.getItem('authUser'));
    if (authUser) {
        let listRolPermisosByUsuario = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
        if (listRolPermisosByUsuario.includes(to.name)) {
            next();
        } else {
            let listRolPermisosByUsuarioFilter = [];
            listRolPermisosByUsuarioFilter.map(function (x) {
                if (x.includes('index')) {
                    listRolPermisosByUsuarioFilter.push(x);
                }
            });
            if (to.name == 'dashboard.index') {
                next({ name: listRolPermisosByUsuarioFilter[0] });
            } else {
                next(from.path);
            }
        }
    } else {
        next('/login');
    }
}

async function verificarUsuarioAutenticado(to,from,next){
    const url = '/administracion/admin/isUserValid';
    const nId = to.params.id;
    try {
        let authUser = JSON.parse(sessionStorage.getItem('authUser'));
        if(authUser){
            let listRolPermisosByUsuario = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
            if (listRolPermisosByUsuario.includes(to.name)) {
                const response = await axios.get(url,{
                    params: {'reqId': nId}
                });
                const datos = response.data;
                if(!!datos){
                    next();
                } else {
                    next('*');
                }
            } else {
                next('/');
            }            
        } else {
            next('/');
        }
    } catch (error) {
        next('*');
        console.log(error);
    }
}
async function userValidToEdit(to,from,next){
    const url = '/administracion/admin/validUserToEdit';
    const nId = to.params.id;
    try {
        let authUser = JSON.parse(sessionStorage.getItem('authUser'));
        if(authUser){
            let listRolPermisosByUsuario = JSON.parse(sessionStorage.getItem('lisRolPermisosByUsuario'));
            if (listRolPermisosByUsuario.includes(to.name)) {
                const response = await axios.get(url,{
                    params: {'reqId': nId}
                });
                const datos = response.data;
                if(!!datos){
                    next();
                } else {
                    next('*');
                }
            } else {
                next('/');
            }            
        } else {
            next('/');
        }
    } catch (error) {
        next('*');
        console.log(error);
    }
}

export default new Router({
    routes: [
        { path: '/login', name: 'login', component: Login, beforeEnter: (to, from, next) => { let authUser = JSON.parse(sessionStorage.getItem('authUser')); if (authUser) { next({ name: 'dashboard.index' }); } else { next(); } } },
        { path: '/', name: 'dashboard.index', component: Dashboard, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '/consultaErrorcodes', name: 'errores.index', component: SADecoder , beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '/captura', name: 'solicitudes.captura', component: Captura,beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); }   },
        { path: '/recordatorios', name: 'recordatorios.captura', component: Recordatorio, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); }   },
        { path: '/catalogos', name: 'admin.catalogos', component: Catalogos, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); }   },
        { path: '/preferenciasInterfaz', name: 'admin.preferencias', component: PreferenciasInterfaz, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); }   },
        { path: '/perfil/:id', name: 'perfil.index',props: true, component: Perfil, beforeEnter:async (to, from, next)=>{await verificarUsuarioAutenticado(to, from, next); }},
        { path: '/perfil/editar/:id', name: 'perfil.editar', props:true, component: EditPerfil, beforeEnter: async (to, from, next) => {await verificarUsuarioAutenticado( to, from, next); }},
        { path: '/birthday', name: 'birthday.index', component: Cumplea },
        { path: '/usuarios', name: 'admin.usuarios', component: IndexUsers , beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '/usuarios/editar/:id', name: 'usuario.editar', component: EditUser, props: true, beforeEnter: async (to, from, next) => {await userValidToEdit(to, from, next); } },
        { path: '/gestionSolicitudes', name: 'solicitudes.ver', component: GestioSolicitudes, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '/editar/:id', name: 'editar.solicitud', component: Editar, props:true },
        { path: '/capturav2', name: 'captura.index', component: Capturav2, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '*', name: 'faq.index', component: Error404 }


    ],
    mode: 'history',
    linkActiveClass: 'active'
})