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
        display: flex;
        flex-direction: column;
        align-items: stretch;
    }

    .title {
        text-decoration: underline;

    }

    .btn-finish {
        height: 4ch;
        background-color: #00A2E8;
        border: none;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        margin-bottom: 3ch;
    }
  </style>