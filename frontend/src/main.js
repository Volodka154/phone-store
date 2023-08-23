import { createApp } from 'vue';
import App from './App.vue';
import {router} from './routes.js';
import {store} from './store/'
import './style/style.css'

createApp(App)
.use(router)
.use(store)
.mount('#app')