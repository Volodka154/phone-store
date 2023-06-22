<!-- Компонент отвечающий за header на всех страницах -->
<template>
    <div class="flex-container flex-container-column">
        <div class="my-header flex-container flex-container-row">
            <div class="flex-container flex-container-row">
                <img class="ikon ikon__menu"
                     @click="changeIsModalCategoryList"
                     src="IosMenu.svg">
                
                <span class="catalog btn-header"
                      @click="movingByNavBar(pathInNavBarMass[0].path)"
                      >Phone-shop
                </span>
            </div>
            <Transition name="slide"
                        mode="out-in">
                <category-card v-if="isModalCategoryList"/>
            </Transition>
            <div class="right">
                <span class="btn-header"
                      @click="clickOnAutorization">
                    Войти
                </span>
                <img class="ikon"
                     @click="clickOnAutorization"
                     src="profile.svg">
    
                <span class="btn-header"
                      @click="clickOnCart">
                    Корзина
                </span>
                <img class="ikon"
                     @click="clickOnCart"
                     src="cart.svg">
            </div>
        </div>
        <div class="nav-bar flex-container flx-jc-start">
            <span v-for="(item,index) in pathInNavBarMass"
                 :key="index"
                 @click="movingByNavBar(item.path)"
                >
                <span v-if="index" style="margin: 0px 10px">-</span>
                <span class="nav-bar__item">
                    {{ item.title }}
                </span>
    
            </span>
        </div>
    </div>
</template>
    
<script>
import { mapActions } from 'vuex'
import { mapGetters } from 'vuex'
import CategoryCard from './CategoryCard.vue'
export default {
    name: 'my-header',
    components: {
        CategoryCard
    },
    data() {
        return {

        }
    },
    methods: {
        clickOnAutorization(){
            if(this.isModalCategoryList){
                this.changeIsModalCategoryList()
            }
            this.$router.push({
                name: 'back',
                query: {
                    nameOfProps: 'authorization',
                }
            })
        },
        clickOnCart() {
            this.$router.push({
                name: 'back',
                query: {
                    nameOfProps: 'cart',
                }
            })
        },
        ...mapActions('navbar', [
            'changeIsModalCategoryList'
        ]),
        movingByNavBar(path){
            this.$router.push(path)
        }

    },
    computed:{
        ...mapGetters('navbar', [
            'isModalCategoryList',
            'pathInNavBarMass'
        ])
    }
    }
</script>

<style>
/* анимация выезжания */
.slide-enter-active{
    animation: slideIn 0.3s;
}
.slide-leave-active{
    animation: slideOut 0.3s;
}
@keyframes slideIn {
    from {transform: translateX(-100%); opacity: 0;}
    to {transform: translateX(0); opacity: 1;}
}
@keyframes slideOut {
    from {transform: translateX(0); opacity: 1;}
    to {transform: translateX(-100%); opacity: 0;}
}

.my-header {
    z-index: 999;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    border-bottom: 1px solid  #b6b6b6;
    background-color: #ffffff;
    color: #000000;
}

.nav-bar{
    text-align: left;
    top: 70px;
    padding: 0px 60px;
    color:#747474;
}

.nav-bar__item:hover{
    text-decoration: underline #747474;
    cursor: pointer;
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
    cursor: pointer;
    padding: 10px;
}

.ikon__menu{
    width: 40px !important;
    height: 40px !important;
}

.btn-header{
    font-size: 20px;
    padding: 0px 0px; 
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
    