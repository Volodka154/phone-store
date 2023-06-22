<!-- Синяя копка "В корзину" -->
<template>
    <div class="cart-button">
        <button>В корзину</button>
    </div>
</template>


<script>
export default {
    name: "cart-button",
    props: {},
    data() {
        return {};
    },
    computed: {},
};
</script>

<style scoped>
button {
    background-color: #00a2e8;
    color: #ffffff;
    border: 1px solid #00a2e8;
    padding: 10px;
    border-radius: 5px;
}
button:hover {
    background-color: #0098d9;
    border-color: #0098d9;
}
button:active {
    background-color: #0776a6;
    border-color: #0776a6;
}
</style>