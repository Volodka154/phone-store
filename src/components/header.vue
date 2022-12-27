<template>
    <div class="header">
        <p class="catalog">Каталог</p>
        <p class="person">Войти</p>
        <p class="cart">Корзина</p>
    </div>
  </template>
  
  <script>
  export default {
    name: 'header',
    components: {
    }
  }
  </script>
  
  <style scoped>
    .header {
        display: flex;
        flex-direction: row;
        justify-content: flex-end;
    }

    .catalog {
        align-self: flex-start;
        background: rgb(223, 174, 174);
        color: red;
        padding: 5px;
        align-self: flex-start;
        margin-right: auto
    }

    .person{
        background: rgb(191, 191, 236);
        padding: 5px;
        margin-right: 5px;
    }

    .cart {
        background: rgb(193, 226, 193);
        padding: 5px;
        margin-right: 2px;
    }
  </style>
  