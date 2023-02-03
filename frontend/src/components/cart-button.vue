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
    conputed: {},
};
</script>

<style scoped>
button {
    background-color: #00a2e8;
    color: #ffffff;
    border-radius: 5px;
    border-width: 10px;
    border-color: #00a2e8;
    border-style: solid;
}
button:active {
    background-color: #0776a6;
    border-radius: 5px;
    border-width: 10px;
    border-color: #0776a6;
    border-style: solid;
}
</style>