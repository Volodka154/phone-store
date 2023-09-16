<!-- Блок, отображающий информацию по заказу, в корзине -->
<template>
    <div id="cart-finish">
        <p class="title-finish-cart">Ваш заказ:</p>
        <p class="count">Кол-во товаров: {{ computedCount }}</p>
        <p class="finish">Итого: {{ computedPrice }} руб.</p>
        <cart-button :isDisabled="false" v-if="!computedCount">Оформить заказ</cart-button>
        <cart-button v-else @click="doTransaction">Оформить заказ</cart-button>
    </div>
</template>
  
<script>
import { axiosInstance } from '../index.js'
import { mapActions, mapGetters } from 'vuex'
import cartButton from "./ui/CartButton.vue"
export default {
    props: {
        propsCount: {
            type: Number,
            default: () => 0
        },
        propsPrice: {
            type: Number,
            default: () => 0
        },
    },
    components: {
        cartButton,
    },
    methods:{
        ...mapActions('cart', [
            'nullCart'
        ]),
        doTransaction() {
            axiosInstance.post('/cart/transaction', 
            {}, {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(()=> {
                this.$emit('update') 
                alert("Покупка оформлена!") 
                this.nullCart()
            })
            .catch(err => alert("Неверно введены данные", err))
        }
    },
    computed: {
        ...mapGetters('user',[
            'accessToken',
            'tokenType'
        ]),
        computedCount() {
            return this.propsCount
        },
        computedPrice() {
            return this.propsPrice
        }
    },
}
</script>