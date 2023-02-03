<template>
    <div class="header">
        <p class="catalog">Каталог</p>
        <div class="right">
            <p class="person">Войти</p>
            <img class="ikon" src="../../content/person.png"/>
            <p class="cart">Корзина</p>
            <img class="ikon" src="../../content/cart.png"/>
        </div>
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
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        height: 7%;
        width: 100%;
        top: 0;
        border-bottom: 1px solid  #7B5427;
    }

    .right {
        justify-items: center;
        display: flex;
        flex-direction: row;
    
    }

    .catalog {
        color: red;
        font-size: 2em;
        width: 13%;
    }

    .person{
        font-size: 2em;
        margin-right: 30px;
    }

    .cart {
        font-size: 2em;
        margin-right: 30px;
    }

    .ikon {
        width: 3em;
        height: 3em;
        align-self: center;
    }
  </style>
  