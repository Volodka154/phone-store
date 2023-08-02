<template>
    <div id="cart-finish">
        <p class="title-finish-cart">Ваш заказ:</p>
        <p class="count">Кол-во товаров: {{ this.computedCount }}</p>
        <p class="finish">Итого: {{ this.computedPrice }} руб.</p>
        <button class="btn-finish">Оформить заказ</button>
    </div>
  </template>
  
  <script>
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