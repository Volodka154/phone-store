import { createRouter, createWebHashHistory } from 'vue-router'

import CatalogListPage from './components/CatalogListPage.vue'
import СatalogItemListPage from './components/СatalogItemListPage.vue'

import BackGround from './components/BackGround.vue'
import Authorization from './components/Authorization.vue'
import Registration from './components/Registration.vue'

import ItemPage from './components/ItemPage.vue'
import CartPage from './components/CartPage.vue'
import AddPositionPage from './components/AddPositionPage.vue'

const routes = [
    {
        path: '',
        redirect: {name: 'catalog'}
    },
    {
        path: '/catalog',
        name: 'catalog',
        component: CatalogListPage,
    },
    {
        path: '/item-list-:name',
        name: 'item-list',
        component: СatalogItemListPage,
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
        path: '/cartPage',
        name: 'cartPage',
        component: CartPage
    },
    {
        path: '/addProduct',
        name: 'addProduct',
        component: AddPositionPage
    }
]

export const router = new createRouter({
    routes,
    history: createWebHashHistory()
})