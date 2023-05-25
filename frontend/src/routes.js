import { createRouter, createWebHashHistory } from 'vue-router';
import catalogList from './components/catalogList.vue';
//import addPosition from './components/add-position.vue';
import productPage from './components/product-page.vue';
import authorization from './components/authorization.vue';
import registration from './components/registration.vue';
import backGround from './components/backGround.vue';
import catalogItemList from './components/catalogItemList.vue';
const routes = [
    {
        path: '',
        redirect: {name: 'catalog'}
    },
    {
        path: '/catalog',
        name: 'catalog',
        component: catalogList,
    },
    {
        path: '/item-list-:name',
        name: 'item-list',
        component: catalogItemList
    },
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
                path: 'authorization',
                name: 'authorization',
                component: authorization
            },
            {
                path: 'registration',
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