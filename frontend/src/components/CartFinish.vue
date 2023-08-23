<!-- Блок, отображающий информацию по заказу, в корзине -->
<template>
    <div id="cart-finish">
        <p class="title-finish-cart">Ваш заказ:</p>
        <p class="count">Кол-во товаров: {{ computedCount }}</p>
        <p class="finish">Итого: {{ computedPrice }} руб.</p>
        <cart-button-gray v-if="!computedCount">Оформить заказ</cart-button-gray>
        <cart-button v-else @click="addToCart">Оформить заказ</cart-button>
    </div>
</template>
  
<script>
import axios from "axios"
import { mapActions, mapGetters } from 'vuex'
import cartButtonGray from "./CartButtonGray.vue"
import cartButton from "./CartButton.vue"
export default {
    props: ['propsCount', 'propsPrice'],
    components: {
        cartButton,
        cartButtonGray,
    },
    methods:{
        ...mapActions('cart', [
            'nullCart'
        ]),
        doTransaction(){
            axios.post('http://localhost:8080/api/cart/transaction', 
            {}, {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(()=> {this.$emit('update'), alert("Покупка оформлена!"), this.nullCart()})
            .catch(err => alert("Неверно введены данные", err));
        }
    },
    computed: {
        ...mapGetters('user',[
            'accessToken',
            'tokenType'
        ]),
        computedCount(){
            return this.propsCount
        },
        computedPrice(){
            return this.propsPrice
        }
    },
}
</script>