<!-- Один элемент каталога (товар) -->
<template>
    <div>
        <div class="flex-container one-item">
            <img :src="this.infoMass.pictureUrl" 
                 class="iphone"
                 @click="clickOnPhone"/>
            <div class="name-description">
                <h3 class="title-сolor"
                    @click="clickOnPhone"
                    >{{ title }}
                </h3>
                <h5 class="description-color">{{ description }}</h5>
            </div>
            <h4 :class="quantityCalculate(quantity)"
                class="center-content">
                {{ allStatus[quantity] }}
            </h4>
            <div class="center-content">
                <div>
                    <h3>{{ price }}</h3>
                    <cart-button-gray v-if="quantity == 'EMPTY'" />
                    <cart-button v-else @click="addToCart"/>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapActions, mapGetters} from "vuex";
import axios from "axios";
import cartButtonGray from "./CartButtonGray";
import cartButton from "./CartButton.vue";
export default {
    props: ['infoMass'],
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
            image: this.infoMass.pictureUrl,
            title: this.infoMass.title,
            description: this.infoMass.description,
            quantity: this.infoMass.status,
            price: this.infoMass.price,
            sale: this.infoMass.sale,
            id: this.infoMass.id
        };
    },
    methods: {
        ...mapActions('cart',[
            'addProductInCart',
            'changeTotalPrice',
            'changeCountProduct'
        ]),
        ...mapGetters('cart',[
            'productsInCartList'
        ]),
        ...mapGetters('user', [
            'tokenType',
            'accessToken'
        ]),
        quantityCalculate (status) {
            return "quantity-color-" + status
        },
        addToCart(){
            if (this.accessToken()) {
                axios.post("http://localhost:8080/api/addProduct", {
                    productId: this.id
                }, {
                    headers: {
                        Authorization: `${this.tokenType()} ${this.accessToken()}` // Передаем токен в заголовке запроса
                    }
                })
                .then(response => console.log(response))
                .catch(err => console.log('err', err))
            } else {
                alert("Необходима авторизация!");
            }
        },
        getSlug(){
            let slug = String(this.title).toLowerCase()
            slug = slug.replace(/ /ig,'-')
            slug = slug + '-' + String(this.id)
            return slug
        },
        clickOnPhone(){
            const nameInRoute = this.$router.currentRoute.value.params.name
            this.$router.push({
                name: 'itemPage',
                params:{
                    name: nameInRoute, 
                    slug: this.getSlug()
                }
            })
        }
    }
};
</script>

<style>
.one-item {
    margin-top: 40px;
    margin-bottom: 40px;
}
.one-item:first-child {
    margin-top: 0px;
}
.name-description {
    width: 30%;
}
.description-color {
    color: rgba(0, 0, 0, 0.65);
    font-weight: 400;
    font-size: 12px;
    line-height: 22px;
    text-align: left;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
}
.title-сolor {
    color: #33b75c;
}
.title-сolor:hover {
    color: #185b2d;
    cursor: pointer;
}
.center-content {
    display: flex;
    align-items: center;
    justify-content: center;
}
.quantity-color-LOW {
    color: #ffce29;
    min-width: 20%;
    max-width: 20%;
}
.quantity-color-EMPTY{
    color: #ee2a29;
    min-width: 20%;
    max-width: 20%;
}
.quantity-color-AVAILABLE {
    color: #33b75c;
    min-width: 20%;
    max-width: 20%;
}
#borderNone{
    border-style: none;
}
.iphone {
    align-self: center;
    width: 10%;
    height: 10%;
    cursor: pointer;
}
.max-width-300px{
    max-width: 180px;
    width: 12%;
    align-self: center;
}
</style>