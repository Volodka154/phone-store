<template>
    <div id="app" 
         class="flex-container flex-container-column">
        <my-header/>
        <router-view></router-view>
    </div>
</template>

<script>
import { mapActions } from "vuex";
import MyHeader from "./components/MyHeader.vue";
import axios from 'axios'
export default {
    name: "App",
    components: {
        MyHeader,
    },
    methods:{
        ...mapActions('navbar', [
            'setAllCategoryList'
        ]),
    },
    mounted(){
        // записываем массив категорий в стор
        axios.get('http://localhost:8080/api/catalog/categories')
        .then(res =>{
            this.setAllCategoryList(res.data)
        })
        .catch(err => {console.log('Error\n', err)})
    }   
};
</script>

<style>
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 70px;
}
body{
    margin: 0px;
}
</style>
