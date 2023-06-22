<template>
    <div class="item-page flex-container flex-container-row">
        <div class="cart-list">
            <h3>Корзина</h3>
            <cartItem class="cart-item"/>
            <cartItem/>
        </div>
        <cartFinish class="summ"/>
    </div>
</template>

<script>
import cartItem from './CartItem.vue'
import cartFinish from './CartFinish.vue'

import { mapActions } from 'vuex'

export default {
    components: {
        cartItem,
        cartFinish
    },
    data() {
        return {}
    },
    methods:{
        ...mapActions('navbar', [
            'removePatInNavBarMass',
            'addPatInNavBarMass',
        ]),
    },
    mounted(){
        this.removePatInNavBarMass(1)
        this.addPatInNavBarMass({
            title: 'Корзина',
            path: this.$router.currentRoute.value.fullPath
        })


    }
}
</script>

<style scoped>
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