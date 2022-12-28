<template>
    <div class="cart">
        <div class="cart-list">
            <h3>Корзина</h3>
            <cartItem/>
            <cartItem/>
            <cartItem/>
            <cartItem/>
            <cartItem/>
        </div>
        <cartFinish/>
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
    }

    h3 {
        text-align: left;
    }
    .cart-list {
        align-self: flex-start;
    }

</style>