import Vue from 'vue';
import Router from 'vue-router';
import Dashboard from './components/modulos/dashboard/index.vue';
import Login from './components/modulos/authenticate/login.vue';
import PreferenciasInterfaz from "./components/modulos/admin/Preferenciasinterfaz.vue";
import Captura from "./components/modulos/captura/registro.vue";
import listaSolicitudes from "./components/modulos/ver/versolicitudes.vue";
import Recordatorio from "./components/modulos/captura/recordatorios.vue";
import Catalogos from "./components/modulos/catalogos/index.vue";

import Perfil from './components/modulos/usuario/perfil.vue';

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


export default new Router({
    routes: [
        { path: '/login', name: 'login', component: Login, beforeEnter: (to, from, next) => { let authUser = JSON.parse(sessionStorage.getItem('authUser')); if (authUser) { next({ name: 'dashboard.index' }); } else { next(); } } },
        { path: '/', name: 'dashboard.index', component: Dashboard, beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '/consultaErrorcodes', name: 'errores.index', component: SADecoder , beforeEnter: (to, from, next) => { verificarAcceso(to, from, next); } },
        { path: '/captura', name: 'solicitudes.captura', component: Captura  },
        { path: '/solicitudes', name: 'solicitudes.ver', component: listaSolicitudes  },
        { path: '/recordatorios', name: 'recordatorios.captura', component: Recordatorio  },
        { path: '/catalogos', name: 'admin.catalogos', component: Catalogos  },
        { path: '/perfil', name: 'usuario.perfil', component: Perfil},
        { path: '/preferenciasInterfaz', name: 'admin.preferencias', component: PreferenciasInterfaz  },
        { path: '*', component: Error404 }

    ],
    mode: 'history',
    linkActiveClass: 'active'
})