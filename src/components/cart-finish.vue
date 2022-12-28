<template>
    <div id="cart-finish">
        <p class="title">Ваш заказ:</p>
        <p class="count">Кол-во товаров:  3</p>
        <p class="finish">Итого: 32946 руб.</p>
        <button class="btn-finish">Оформить заказ</button>
    </div>
  </template>
  
  <script>
    export default {
        name: 'cart-finish',
        components: {
        }
    }
  </script>
    
  <style>
    .cart-finish {
        width: 30%;
        background-color: white;
    }

    .title {
        text-decoration: underline;

    }

    .btn-finish {
        background-color: rgba(44, 116, 223, 0.589);
        border: none;
        border-radius: 5px;
    }
  </style>