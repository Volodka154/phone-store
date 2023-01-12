<template>
    <div class="cart">
        <div class="cart-list">
            <h3>Корзина</h3>
            <cartItem class="cart-item"/>
            <cartItem/>
            <cartItem/>
            <cartItem/>
            <cartItem/>
        </div>
        <cartFinish class="summ"/>
    </div>
</template>

<script>
    import cartItem from './cart-item.vue'
    import cartFinish from './cart-finish.vue'
    export default {
        name: 'cart',
        components: {
            cartItem,
            cartFinish
        },
        props: {},
        data() {
            return {}
        },
        conputed: {}
    }
</script>

<style scoped>
    .cart {
        display: flex;
        flex-direction: row;
        background-color: rgb(214, 212, 212);
        width: 100%;
    }

    h3 {
        text-align: left;
        margin-left: 2%;
    }
    .cart-list {
        align-self: flex-start;
        width: 70%;
    }

    .summ {
        align-self: flex-end;
        align-self: center;
        margin-left:3%;
        width: 25%;
        height: 60%;
        background-color: white;
        border-radius: 20px;
    }

    .cart-item {
        width: 100%;
        height: 30%;
        background-color: white;
        border-radius: 20px;
        margin: 2%;
    }

</style>