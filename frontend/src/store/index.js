import {createStore} from 'vuex';

import navbar from './modules/navbar'
import cart from './modules/cart'
import user from './modules/user'

export const store = createStore({
    state() {
        return{
        }
    },
    modules: {
        navbar,
        cart,
        user
    }
})