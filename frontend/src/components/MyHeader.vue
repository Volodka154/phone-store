<!-- Компонент отвечающий за header на всех страницах -->
<template>
    <div class="all-header flex-container flex-container-column">
        <div class="my-header flex-container flex-container-row">
            <div class="flex-container flex-container-row">
                <img class="ikon ikon__menu"
                     @click="changeIsModalCategoryList"
                     src="IosMenu.svg">
                <span class="catalog btn-header"
                      @click="movingByNavBar(pathInNavBarMass[0])"
                      >Phone-shop
                </span>
            </div>
            <Transition name="slide"
                        mode="out-in">
                <category-card v-if="isModalCategoryList"/>
            </Transition>
            <div class="justify-items-center">
                <span class="btn-header" v-if="!accessToken"
                      @click="clickOnAutorization"
                    >Войти
                </span>
                <span v-if="accessToken"
                      class="btn-header" 
                      @click="clickOnUnautorization"
                    >Выйти
                </span>
                <img class="ikon"
                     @click="clickOnAutorization"
                     src="profile.svg">
                <span v-if="accessToken"
                      class="color-blue btn-header" 
                      style="margin-right: 10px;"
                      @click="clickOnAutorization"
                    >{{ userName }} 
                </span>
                <span class="btn-header"
                      @click="clickOnCart"
                      >Корзина ({{ countCart }})
                </span>
                <img class="ikon"
                     @click="clickOnCart"
                     src="cart.svg">
            </div>
        </div>
        <div class="nav-bar">
            <span v-for="(item,index) in pathInNavBarMass"
                  :key="index"
                  @click="movingByNavBar(item)">
                <span v-if="index" style="margin: 0px 10px">-</span>
                <span class="nav-bar__item">{{ item.title }}</span>
            </span>
        </div>
        <div v-if="this.userRole=='ADMIN'"
             class="nav-bar">
            <button class="add-button" 
                    @click="clickOnAdminBtn"
                >Администрирование
            </button>
        </div>
    </div>
</template>
    
<script>
import axios from 'axios'
import { mapActions, mapGetters } from 'vuex'
import CategoryCard from './CategoryCard.vue'
export default {
    components: {
        CategoryCard
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
        clickOnUnautorization(){
            axios.post('http://localhost:8080/api/auth/logout',
            {},{
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }       
            })
            .then(res =>{console.log(res)})
            .catch(err => {console.log(err)})
            this.removeUserName()
            this.removeAccessToken()
            this.removeUserRole()
            this.removeRefreshToken()
            this.removeTokenType()
            this.nullCart()
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
        clickOnAdminBtn() {
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
        ...mapActions('user', [
            'removeUserName',
            'removeAccessToken',
            'removeUserRole',
            'removeRefreshToken',
            'removeTokenType',
        ]),
        ...mapActions('cart', [
            'nullCart'
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
            'refreshToken',
            'userRole',
            'userName',
            'tokenType'
        ]),
        ...mapGetters('cart',[
            'countCart'
        ])
    }
}
</script>