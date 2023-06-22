import {createStore} from 'vuex';

import navbar from './modules/navbar'
import cart from './modules/cart'

export const store = createStore({
    state() {
        return{
        }
    },
    modules: {
        navbar,
        cart
    }
})