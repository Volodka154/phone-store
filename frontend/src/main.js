import { createApp } from 'vue'
import App from './App.vue'
import { router } from './routes.js'
import { store } from './store/'
import { vuetify } from './vuetify.js'
import './style/style.css'
import 'vuetify/styles'

createApp(App)
.use(router)
.use(vuetify)
.use(store)
.mount('#app')