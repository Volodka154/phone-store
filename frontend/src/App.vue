<template>
    <div id="app" 
         class="flex-container flex-container-column">
        <my-header/>
        <router-view></router-view>
    </div>
</template>

<script>
import MyHeader from "./components/MyHeader.vue";
export default {
    name: "App",
    components: {
        MyHeader,
    },
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
