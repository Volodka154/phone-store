<template>
    <div id="cart-finish">
        <p class="title-finish-cart">Ваш заказ:</p>
        <p class="count">Кол-во товаров: {{ this.computedCount }}</p>
        <p class="finish">Итого: {{ this.computedPrice }} руб.</p>
        <button class="btn-finish" @click="doTransaction">Оформить заказ</button>
    </div>
  </template>
  
  <script>
import { mapGetters, mapActions } from 'vuex';
import axios from "axios";
export default {
    name: 'cart-finish',
    props: ['propsCount', 'propsPrice'],
    computed: {
        computedCount(){
            return this.propsCount
        },
        computedPrice(){
            return this.propsPrice
        },    
        ...mapGetters('user',[
            'accessToken',
            'tokenType'
        ])    
    },
    methods:{
        ...mapActions('cart', [
            'nullCart'
        ]),
        doTransaction(){
            axios.post('http://localhost:8080/api/cart/transaction', {
            },
            {
                headers: {
                            Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            }).then(()=> {this.$emit('update'), alert("Покупка оформлена!"), this.nullCart()})
            .catch(err => alert("Неверно введены данные", err));
        }
    }
}
  </script>
    
  <style>
    .cart-finish {
        display: flex;
        flex-direction: column;
        align-items: stretch;
    }

    .title-finish-cart {
        text-decoration: underline;
    }

    .btn-finish {
        height: 4ch;
        color: white;
        background-color: #00A2E8;
        border: none;
        margin-bottom: 3ch;
        border-radius: 5px;
    }
  </style>