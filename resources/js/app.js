require('./bootstrap');

window.Vue = require('vue');

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import locale from 'element-ui/lib/locale/lang/es';
window.Vue.use(ElementUI, {locale});

import VCalendar from "v-calendar";
window.Vue.use(VCalendar);

import Swal from 'sweetalert2'
window.Swal = Swal;

import Vuesax from 'vuesax'
import 'vuesax/dist/vuesax.css'
  Vue.use(Vuesax, {
  })

export const EventBus = new Vue();
window.EventBus = EventBus;

import Howler from 'howler'
window.Howler = Howler;

import VueSimpleAccordion from 'vue-simple-accordion';
import 'vue-simple-accordion/dist/vue-simple-accordion.css';
Vue.use(VueSimpleAccordion, {});

Vue.component('App', require('./components/App.vue').default);
Vue.component('Auth', require('./components/Auth.vue').default);

import router from './routes'
const app = new Vue({
    el: '#app',
    router
});
