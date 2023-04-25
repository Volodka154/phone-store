<template>
    <div id="app">
    <Head/>
    <catalog/>
    </div>
    <router-view></router-view>
</template>

<script>
import Head from "@/components/Head.vue";
import Catalog from "@/components/catalog.vue";
export default {
    components: {Head, Catalog}
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
.flex-container {
    width: 99%;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    flex-basis: content;
}
</style>
