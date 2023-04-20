<template>
    <div id="app">
    <header></header>
    </div>
    <router-view></router-view>
</template>

<script>
import header from "@/components/header.vue";
export default {
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
