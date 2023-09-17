<!-- Один элемент корзины (товар) -->
<template>
    <div class="flex-container center-content one-item justify-content-space-between">
        <img :src="product.pictureUrl"
             class="iphone"
             @click="clickOnPhone"/>
        <p class="title-сolor"
           @click="clickOnPhone"
           >{{ product.title }}
        </p>
        <div class="count__cart">
            <div class="flex-container flex-container-row align-items-baseline justify-content-center">
                <button @click="countMinus"
                        class="btn-count"
                    >-
                </button>
                <p>{{ product.amount }}</p>
                <button @click="countPlus"
                        class="btn-count"
                    >+
                </button>
            </div>
            <p @click="deleteProduct"
               class="delete__cart"
                >Удалить
            </p>
        </div>
        <p class="price__cart">{{ product.price * product.amount }}</p>
    </div>
</template>

<script>
import { axiosInstance } from '../index.js'
import { mapActions, mapGetters } from "vuex"
export default {
    props: {
        infoItem: {
            type: Object,
            required: () => true,
            default: () => {}
        }
    },
    data() {
        return {
            product: this.infoItem
        }
    },
    updated() {
        this.product = this.infoItem
    },
    methods: {
        ...mapActions('cart', [
            'addCart',
            'removeCart'
        ]),
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
            'setNameByCategory',
            'setNameBySubcategory'
        ]),
        countPlus() {
            axiosInstance.put('/cart/addAmount',{
                productId: this.product.productId
            }, {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(() => {this.$emit('update'), this.addCart(1)})
            .catch(err => console.log(err))
        },
        countMinus() {
            axiosInstance.post('/cart/reduceAmount',{
                productId: this.product.productId
            }, {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(() => {this.$emit('update'), this.removeCart(1)})
            .catch(err => console.log(err))
        },
        deleteProduct() {
            axiosInstance.delete('/cart/deleteProduct', {
                data: {
                    productId: this.product.productId
                },
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(() => {this.$emit('update'), this.removeCart(this.product.amount)})
            .catch(err => console.log(err))
        },
        getSlug() {
            let slug = String(this.product.title).toLowerCase()
            slug = slug.replace(/ /ig,'-')
            slug = slug + '-' + String(this.product.productId)
            return slug
        },
        clickOnPhone() {
            // запрос на товар
            axiosInstance.get('/catalog/product/' + this.product.productId)
            .then(response => {
                const productByAxios = response.data
                const categoryTemp = this.allCategoryList.filter(item => (item.id === productByAxios.categoryId) ? true : false)
                const subcategoryTemp = categoryTemp[0].subcategoryDtos.filter(item => (item.id === productByAxios.subcategoryId) ? true: false)
                // очищаем массив navbar
                this.removePatInNavBarMass(1)
                // устанавливаем значение категории
                this.setNameByCategory(categoryTemp[0].title)
                this.addPatInNavBarMass({
                    title: categoryTemp[0].title,
                    path: '/item-list-' + categoryTemp[0].title
                })
                // устанавливаем значение подкатегории
                this.setNameBySubcategory(subcategoryTemp[0].title)
                this.addPatInNavBarMass({
                    title: subcategoryTemp[0].title,
                    path: '/item-list-' + categoryTemp[0].title
                })
                // устанавливаем название
                this.addPatInNavBarMass({
                    title: this.product.title,
                    path: this.$router.currentRoute.value.fullPath
                })
                this.$router.push({
                    name: 'itemPage',
                    params:{
                        name: categoryTemp[0].title, 
                        slug: this.getSlug()
                    }
                })
            })
            .catch(err => {console.log('Error\n', err)})
        }
    },
    computed: {      
        ...mapGetters('user', [
            'tokenType',
            'accessToken',
        ]),
        ...mapGetters('navbar', [
            'allCategoryList'
        ]),
    }
}
</script>