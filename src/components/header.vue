<template>
    <div class="header">
        <p class="catalog">Каталог</p>
        <p class="person">Войти</p>
        <p class="cart">Корзина</p>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Header',
    components: {
    }
  }
  </script>
  
  <style scoped>
    .header {
        position: fixed;
        height: 7%;
        width: 100%;
        top: 0;
        border-bottom: 1px solid  #7B5427;
    }

    .catalog {
        position: absolute;
        background: rgb(223, 174, 174);
        left: 0;
        width: 13%;
    }

    .person{
        position: absolute;
        background: rgb(191, 191, 236);
        right: 13%;
        width: 13%;
        margin-right: 1%;
    }

    .cart {
        position: absolute;
        background: rgb(193, 226, 193);
        right: 0;
        width: 13%;
    }
  </style>
  