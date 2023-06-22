import {createStore} from 'vuex';

import navbar from './modules/navbar'

export const store = createStore({
    state() {
        return{
        }
    },
    modules: {
        navbar,
    }
})