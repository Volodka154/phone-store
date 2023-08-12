<!-- Компонент отвечающий за header на всех страницах -->
<template>
    <div class="flex-container flex-container-column">
        <div class="my-header flex-container flex-container-row">
            <div class="flex-container flex-container-row">
                <img class="ikon ikon__menu"
                     @click="changeIsModalCategoryList"
                     src="IosMenu.svg">
                
                <span class="catalog btn-header"
                      @click="movingByNavBar(pathInNavBarMass[0])"
                      >Phone-shop
                </span>
                <button v-if="this.accessToken=='ADMIN'" @click="clickOnChange">Добавить товар</button>
            </div>
            <Transition name="slide"
                        mode="out-in">
                <category-card v-if="isModalCategoryList"/>
            </Transition>
            <div class="right">
                <span class="btn-header" v-if="!this.accessToken"
                      @click="clickOnAutorization">
                    Войти
                </span>

                <span class="btn-header" v-if="this.accessToken"
                      @click="clickOnAutorization">
                    Выйти
                </span>

                <img class="ikon"
                     @click="clickOnAutorization"
                     src="profile.svg">

                <span class="btn-header" v-if="this.accessToken"
                      @click="clickOnAutorization">
                    {{ this.accessToken.slice(0, 5) }}
                </span>

    
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
                 @click="movingByNavBar(item)"
                >
                <span v-if="index" style="margin: 0px 10px">-</span>
                <span class="nav-bar__item">
                    {{ item.title }}
                </span>
    
            </span>
        </div>
        <p></p>
        <div class="nav-bar flex-container flx-jc-start">
            <button @click="clickOnAddProduct">Добавить продукт</button>
        </div>
    </div>
</template>
    
<script>
import { mapActions } from 'vuex'
import { mapGetters } from 'vuex'
import CategoryCard from './CategoryCard.vue'

import axios from 'axios'
export default {
    name: 'my-header',
    components: {
        CategoryCard
    },
    data() {
        return {
            id: '',
            countCart: 0
        }
    },
    methods: {
        clickOnAddProduct(){
            console.log('Добавить продукт')
            axios.post('http://localhost:8080/api/auth/login', {
                userEmail: 'ww@w.ww',
                userPassword: 'ww'
            })
            .then(response => {
                if (response.status === 200) {
                    const token = response.data.accessToken; // Получаем токен из ответа сервера

                    axios.post('http://localhost:8080/api/admin/product',{
                        amount: 5,
                        description: "string",
                        discount: true,
                        discountPrice: 50,
                        id: 2000,
                        pictureUrl: "string",
                        price: 3000,
                        productPropertyRequest: {
                            id: 111,
                            propertyIds: [
                                1,2
                            ]
                        },
                        subcategoryId: 11,
                        title: "string"
                    },{
                        headers: {
                            Authorization: `Bearer ${token}` // Передаем токен в заголовке запроса
                        }       
                    })
                    .then(res =>{console.log(res)})
                    .catch(err => {console.log(err)})
                } else {
                    alert("Неверно введены данные или такой email уже зарегистрирован!");
                }
            })
            .catch(err => console.log(err));
        },






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
            if (this.accessToken) {
                this.$router.push({
                    name: 'cart'
                })
            }
            else {
                alert("Необходима авторизация!"); 
            }

        },
        clickOnChange() {
            this.$router.push({
                name: 'back',
                query: {
                    nameOfProps: 'addProduct',
                }
            })
        },
        ...mapActions('navbar', [
            'changeIsModalCategoryList',
            'setNameBySubcategory'
        ]),
        movingByNavBar(itemInPath){
            // это нужно для зануления подкатегории, если мы хотим перейти просто в категорию
            if (this.allCategoryList.findIndex(item => item.title === itemInPath.title) !== -1){
                this.setNameBySubcategory('')
            }
            this.$router.push(itemInPath.path)
        }
    },
    computed:{
        ...mapGetters('navbar', [
            'isModalCategoryList',
            'pathInNavBarMass',
            'allCategoryList',
        ]),
        ...mapGetters('user', [
            'accessToken',
            'refreshToken'
        ]),
        ...mapGetters('cart',[
            'countProduct'
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
    