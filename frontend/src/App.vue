<template>
    <div id="app">
        <my-Header/>
        <registration/>
        <router-link to="/productPage">Перейти к Foo</router-link>
        <router-view></router-view>
    </div>
    <router-view></router-view>
</template>

<script>
import registration from "./components/registration.vue";
import myHeader from "./components/my-header.vue";
export default {
    name: "App",
    components: {
        registration,
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
.flex-container {
    width: 99%;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    flex-basis: content;
}
</style>
