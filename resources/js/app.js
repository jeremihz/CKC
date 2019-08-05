/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
Vue.component('calendar-component', require('./components/CalendarComponent.vue').default);
Vue.component('example', require('./components/FileUpload.vue'));
Vue.component('image-component', require('./components/ImageuploadComponent.vue'));
import moment from 'moment';
import { Form, HasError, AlertError } from 'vform';
import jsPDF from 'jspdf';
import 'jspdf-autotable';

import  Gate from "./Gate";
Vue.prototype.$gate =  new Gate(window.user);

import swal from 'sweetalert2';
import ReadMore from 'vue-read-more';
 
 Vue.use(ReadMore);

window.swal = swal;

window.jsPDF = jsPDF;

const toast = swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

window.toast = toast;

window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)
Vue.component('pagination', require('laravel-vue-pagination'));

import VueRouter from 'vue-router'
Vue.use(VueRouter)

import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
    color: 'rgb(143, 255, 199)',
    failedColor: 'red',
    height: '3px'
})


let routes = [
    { path: '/dashboard', component: require('./components/dashboard.vue').default },
    { path: '/profile', component: require('./components/profile.vue').default },
    { path: '/users', component: require('./components/users.vue').default },
    { path: '/ministries', component: require('./components/ministries.vue').default },
    { path: '/developers', component: require('./components/developers.vue').default },
    { path: '/pastors', component: require('./components/pastors.vue').default },
    { path: '/church', component: require('./components/church.vue').default },
    { path: '/membership', component: require('./components/churchprofile.vue').default },
    { path: '/communication', component: require('./components/Communication.vue').default},
    { path: '/claims-admin', component: require('./components/ClaimsAdmin.vue').default},
    { path: '/claim_details/:ministryId', component: require('./components/ClaimDetails.vue').default},
    { path: '/claims', component: require('./components/CampClaims.vue').default},
    { path: '/notice', component: require('./components/Notice.vue').default},
    { path: '/calendar-component', component: require('./components/CalendarComponent.vue').default },
    { path: '/contribution', component: require('./components/Contribution.vue').default },
    { path: '/image-component', component: require('./components/ImageuploadComponent.vue').default },
    { path: '/upload', component: require('./components/ImageUploadComponent2.vue').default },
    { path: '/contributiondetails', component: require('./components/ContributionDetails.vue').default },
    { path: '/contributionpastor', component: require('./components/Contributionpastor.vue').default },
    { path: '/church-contributions/:churchId', component: require('./components/ChurchContributions.vue').default },
    { path: '/campmeeting', component: require('./components/CampMeeting.vue').default },
    { path: '/weekdetails/:week', component: require('./components/CampDetails.vue').default },
    { path: '/viewevents', component: require('./components/ViewEvents.vue').default },
    { path: '*', component: require('./components/NotFound.vue').default },
    {path: '/church_details/:ministryId', component: require('./components/ChurchDetails.vue').default},
]
const router = new VueRouter({
mode:'history',
    routes // short for `routes: routes`
})
Vue.filter('upText', function(text){
    return text.charAt(0).toUpperCase() + text.slice(1)
});

Vue.filter('myDate',function(created){
    return moment(created).format('MMMM Do YYYY');
});


window.Fire =  new Vue();
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);
Vue.component(
    'not-found',
    require('./components/NotFound.vue').default
);
// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    data:{
        search:''
    },
    methods:{
        searchit:_.debounce(()=>{
            Fire.$emit('searching');
        },1000)
    }
});
