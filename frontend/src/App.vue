<template>
    <div id="app">
        <my-Header/>
        <router-view></router-view>

    </div>
</template>

<script>
import myHeader from "./components/my-header.vue";
export default {
    name: "App",
    components: {
        myHeader,
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
    margin-top: 60px;
}
body{
    margin: 0;
}
.flex-container {
    width: 99%;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    flex-basis: content;
}
</style>
