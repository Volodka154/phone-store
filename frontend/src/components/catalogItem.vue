<template>
    <div class="productCard">
        <div class="flex-container" >
            <img :src="this.infoMass.pictureUrl" class="iphone" />
            <div class="nameDescription">
                <h3 class="titleColor">{{title }}</h3>
                <h5 class="descriptionColor">{{description }}</h5>
            </div>
            <h4 :class="quantituCalculate(quantity)">{{ allStatus[quantity] }}</h4>
 

            <div>
                <h3>{{ price }}</h3>
                <cart-button-gray v-if="quantity == 'EMPTY'" />
                <cart-button v-else  @click="addToCart(id)"/>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import cartButtonGray from "./cart-button-gray";
import cartButton from "./cart-button.vue";
export default {
    name: "productCard",
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
            products:[],
            status: "AVAILABLE",
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
        quantituCalculate (status) {
            return "quantity-color-" + status
        },
        addToCart(id){
            axios.post("http://localhost:8080/api/addProduct", {
                productId:id
            })
        .then(response => console.log(response))
        .catch(err => console.log(err))
        }
    }
};
</script>

<style scoped>
.blockClass1 {
    height: 33%;
    width: 100%;
}
.flex-container {
    width: 100%;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    flex-basis: content;
}
.nameDescription {
    width: 30%;
}
.descriptionColor {
    color: rgba(0, 0, 0, 0.65);
    font-weight: 400;
    font-size: 12px;
    line-height: 22px;
    text-align: left;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -moz-box;
    -moz-box-orient: vertical;
    display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
    line-clamp: 4;
    box-orient: vertical;
}
.titleColor {
    color: #33b75c;
}

.titleColor:active {
    color: #185b2d;
}
.quantity-color-LOW {
    color: #ffce29;
    margin-top: 4em;
    min-width: 20%;
    max-width: 20%;
}
.quantity-color-EMPTY{
    color: #ee2a29;
    margin-top: 4em;
    min-width: 20%;
    max-width: 20%;
}
.quantity-color-AVAILABLE {
    color: #33b75c;
    margin-top: 4em;
    min-width: 20%;
    max-width: 20%;
}
#borderNone{
    border-style:none;
}
.iphone {
    align-self: center;
    width: 10%;
    height: 10%;
}
.max-width-300px{
    max-width: 180px;
    width: 12%;
    align-self: center;
}
</style>