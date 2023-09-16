<template>
    <div id="app" 
         class="flex-container flex-container-column">
        <main-header id="mainHeader"/>
        <router-view></router-view>
    </div>
</template>

<script>
import { axiosInstance } from './index.js'
import { mapActions } from "vuex"
import MainHeader from "./components/MainHeader.vue"
export default {
    name: "App",
    components: {
        MainHeader,
    },
    methods:{
        ...mapActions('navbar', [
            'setAllCategoryList'
        ]),
    },
    mounted(){
        // записываем массив категорий в стор
        axiosInstance.get('/catalog/categories')
        .then(res =>{
            this.setAllCategoryList(res.data)
        })
        .catch(err => {console.log('Error\n', err)})
    }   
}
</script>

<style>
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
}
body{
    margin: 0px;
}
</style>