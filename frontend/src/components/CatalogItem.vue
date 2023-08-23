<!-- Один элемент каталога (товар) -->
<template>
    <div>
        <div class="flex-container one-item">
            <img :src="product.pictureUrl" 
                 class="iphone"
                 @click="clickOnPhone"/>
            <div class="name-description">
                <h3 class="title-сolor"
                    @click="clickOnPhone"
                    >{{ product.title }}
                </h3>
                <h5 class="description-color">{{ product.description }}</h5>
            </div>
            <h4 :class="quantityCalculate(product.status)"
                class="center-content">
                {{ allStatus[product.status] }}
            </h4>
            <div class="center-content">
                <div>
                    <h3>{{ product.price }}</h3>
                    <cart-button-gray v-if="product.status == 'EMPTY'">В корзину</cart-button-gray>
                    <cart-button v-else @click="addToCart">В корзину</cart-button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios"
import { mapActions, mapGetters} from "vuex"
import cartButtonGray from "./CartButtonGray.vue"
import cartButton from "./CartButton.vue"
export default {
    props: ['infoItem'],
    components: {
        cartButton,
        cartButtonGray,
    },
    data() {
        return {
            allStatus: {
                AVAILABLE: 'В наличии',
                LOW: 'Мало',
                EMPTY: 'Нет в наличии'
            },
            product: this.infoItem ? this.infoItem : [],
        }
    },
    methods: {
        ...mapActions('cart', [
            'addCart',
        ]),
        quantityCalculate (status) {
            return "quantity-color-" + status
        },
        addToCart(){
            if (this.accessToken) {
                axios.post("http://localhost:8080/api/addProduct", {
                    productId: this.product.id
                }, {
                    headers: {
                        Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                    }
                })
                .then(() => this.addCart(1))
                .catch(err => console.log('err', err))
            } else {
                alert("Необходима авторизация!");
            }
        },
        getSlug(){
            let slug = String(this.title).toLowerCase()
            slug = slug.replace(/ /ig,'-')
            slug = slug + '-' + String(this.product.id)
            return slug
        },
        clickOnPhone(){
            const categoryTemp = this.allCategoryList.filter(item => (item.id === this.product.categoryId) ? true : false)
            this.$router.push({
                name: 'itemPage',
                params:{
                    name: categoryTemp[0].title, 
                    slug: this.getSlug()
                }
            })
        }
    },
    computed: {
        ...mapGetters('user', [
            'tokenType',
            'accessToken'
        ]),
        ...mapGetters('navbar', [
            'allCategoryList'
        ])
    }
}
</script>