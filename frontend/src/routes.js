import { createRouter, createWebHashHistory } from 'vue-router';

import CatalogList from './components/CatalogList.vue';
import СatalogItemList from './components/СatalogItemList.vue';


import BackGround from './components/BackGround.vue';
import Authorization from './components/Authorization.vue';
import Registration from './components/Registration.vue';

import ItemPage from './components/ItemPage.vue';
import cart from './components/Cart.vue'
import AddPosition from './components/AddPosition.vue'

const routes = [
    {
        path: '',
        redirect: {name: 'catalog'}
    },
    {
        path: '/catalog',
        name: 'catalog',
        component: CatalogList,
    },
    {
        path: '/item-list-:name',
        name: 'item-list',
        component: СatalogItemList,
    },
    {
        path: '/item-list-:name/:slug',
        name: 'itemPage',
        component: ItemPage,
    },
   

    {
        path: '/back',
        name: 'back',
        component: BackGround,
        props: (route) => ({ 
            nameOfLink: route.query.nameOfProps
        }),
        children: [
            {
                path: 'authorization',
                name: 'authorization',
                component: Authorization
            },
            {
                path: 'registration',
                name: 'registration',
                component: Registration
            }    
        ]
    },
    {
        path: '/cart',
        name: 'cart',
        component: cart
    },
    {
        path: '/addProduct',
        name: 'addProduct',
        component: AddPosition
    }
];

export const router = new createRouter({
    routes,
    history: createWebHashHistory()
});