<!-- Компонент отвечающий за header на всех страницах -->
<template>
    <div class="my-header">
        <span class="catalog btn-header"
                  @click="catalogButton = ! catalogButton"
                  >Каталог
        </span>
        <transition name="slide"
                    mode="out-in">
            <categoryCard v-if="catalogButton"/>
        </transition>
        <div class="right">
            <span class="btn-header"
                  @click="clickOnAutorization"
                  >Войти
            </span>
            <img class="ikon"
                 src="profile.svg">

            <span class="btn-header"
                  >Корзина
            </span>
            <img class="ikon"
                 src="cart.svg">
        </div>
    </div>
</template>
  
<script>
import categoryCard from './category-card.vue'
export default {
    name: 'my-header',
    components: {
        categoryCard
    },
    data() {
        return {
            catalogButton: false
        }
    },
    methods: {
        clickOnAutorization(){
            this.$router.push({
                name: 'back',
                query: {
                    nameOfProps: 'authorization',
                }
            })
        }
    },
  }
  </script>
  
  <style>
    /* анимация выезжания */
    .slide-enter-active{
        animation: slideIn 0.5s;
    }
    .slide-leave-active{
        animation: slideOut 0.5s;
    }
    @keyframes slideIn {
        from {transform: translateX(-110%);}
        to {transform: translateX(0);}
    }
    @keyframes slideOut {
        from {transform: translateX(0);}
        to {transform: translateX(-110%);}
    }

    .my-header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        position: fixed;
        height: 50px;
        width: 100%;
        top: 0;
        left: 0;
        border-bottom: 1px solid  #b6b6b6;
        background-color: #ffffff;
        color: #000000;
    }

    .right {
        justify-items: center;
        display: flex;
        flex-direction: row;
    }

    .catalog {
        font-size: 40px !important;
        color: rgb(255, 0, 0);        
    }
    .catalog:hover{
        color: rgb(220, 0, 0);
    }   
    .catalog:active{
        color: rgb(180, 0, 0);
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
        width: 24px;
        height: 24px;
        align-self: center;
    }

    .btn-header{
        font-size: 20px;
        padding: 10px 10px; 
        align-self: center;
        cursor: pointer; 
    }

    .btn {
        padding: 10px 20px;
        border: none; 
        text-decoration: none; 
        font-size: 16px;
        text-align: center;
        cursor: pointer;
        border-radius: 5px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.25); 
        color: white;
    }

    .btn-login {
        background-color: #4CAF50; /* Задаем цвет фона */
    }
    .btn-cart {
        background-color: #c7bc41; /* Задаем цвет фона */
    }
    .btn-auto {
        background-color: #4c8fc8; /* Задаем цвет фона */
        margin: 0px 31px;
    }

  </style>
  