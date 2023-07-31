<template>
    <div id="cart-finish">
        <p class="title">Ваш заказ:</p>
        <p class="count" :key="this.countProduct">Кол-во товаров: {{ this.countProduct }}</p>
        <p class="finish" :key="this.totalPrice">Итого: {{ this.totalPrice }} руб.</p>
        <button class="btn-finish">Оформить заказ</button>
    </div>
  </template>
  
  <script>
 import { mapGetters} from "vuex";
// import axios from "axios";
export default {
    name: 'cart-finish',
    props: {},
    data() {
        return {
            products:[],
            count: 0,
            propsrice: 0
        };
    },
    computed: {
        ...mapGetters('cart',[
            'productsInCartList',
            'totalPrice',
            'countProduct'
        ])
    },
    mounted(){
        this.count = this.countProduct
        this.price = this.totalPrice
       // axios.get("http://localhost:8080/api/catalog/product/"+this.id)
       // .then(res => console.log(res))
       // .catch(err => console.log(err))
    }
}
  </script>
    
  <style>
    .cart-finish {
        display: flex;
        flex-direction: column;
        align-items: stretch;
    }

    .title {
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