import Vue from 'vue';
import { createApp } from 'vue';
import App from './App.vue';
import {router} from './routes.js';

createApp(App).mount('#app')

new Vue ({
    router
})