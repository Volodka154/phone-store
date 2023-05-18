
/*eslint-disable no-unused-vars*/

import { createRouter, createWebHashHistory } from 'vue-router';
import productPage from './components/product-page.vue';
import authorization from './components/authorization.vue';
import registration from './components/registration.vue';
import backGround from './components/backGround.vue';
const routes = [
    {
        path: '/productPage',
        name: 'productPage',
        component: productPage
    },
    {
        path: '/back',
        name: 'back',
        component: backGround,
        props: (route) => ({ 
            nameOfLink: route.query.nameOfProps
        }),
        children: [
            {
                path: '/authorization',
                name: 'authorization',
                component: authorization
            },
            {
                path: '/registration',
                name: 'registration',
                component: registration
            }    
        ]
    }
];

export const router = new createRouter({
    routes,
    history: createWebHashHistory()
});

/*eslint-enable no-unused-vars*/