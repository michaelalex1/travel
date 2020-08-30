/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import Vue from 'vue'
import VueRouter from 'vue-router'

import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
Vue.use(Loading)
Vue.component('pagination', require('laravel-vue-pagination'));

Vue.use(VueRouter)

import App from './views/App'

import ListCategory from './views/admin/category/index'
import ListChildren from './views/admin/category/children'
// Vue.component('category-children', require('./views/admin/category/children').default);


import ListProduct from './views/admin/product/index'
import ListClient from './views/admin/client/index'
import CreateClient from './views/admin/client/create'
// import HeaderConteiner from './views/admin/container/header'
Vue.component('header-conteiner', require('./views/admin/container/header').default);
//ventas
import ListVenta from './views/admin/ventas/index'





const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/category/list',
            name: 'ListCategory',
            component: ListCategory
        },
        {
            path: '/admin/category/listChildren/:id',
            name: 'ListChildren',
            component: ListChildren
        },
        {
            path: '/product/list',
            name: 'ListProduct',
            component: ListProduct
        },
        {
            path: '/client/list',
            name: 'ListClient',
            component: ListClient
        },
        {
            path: '/client/create',
            name: 'CreateClient',
            component: CreateClient
        },
        {
            path: '/admin/ventas/list',
            name: 'ListVenta',
            component: ListVenta
        }



    ],
});

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
const app = new Vue({
    el: '#app',
    components: { App },
    router,
});
