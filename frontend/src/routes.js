import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

/*eslint-disable no-unused-vars*/

import productPage from './components/product-page.vue';

const routes = [
    {
        path: '/productPage',
        component: 'productPage'
    }
];

export const router = new VueRouter({
    routes,
    mode: 'history'
});

/*eslint-enable no-unused-vars*/