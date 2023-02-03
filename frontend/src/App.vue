<template>
    <div id="app">
        <productCard />
        <productCard />
        <productCard />
        <productCard />
        <productCard />
        <productCard />
        <div class="flex-container">
            <categoryCard class="blockClass1" />
            <categoryCard class="blockClass1" />
            <categoryCard class="blockClass1" />
        </div>
    </div>
</template>

<script>
import productCard from "./components/product-card.vue";
import categoryCard from "./components/category-card.vue";
export default {
    name: "App",
    components: {
        productCard,
        categoryCard
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
