<template>
    <div class="productCard">
        <p></p>
        <div class="flex-container">
            <div class="max-width-300px">
                <img :src="image" class="iphone" />
            </div>
            <div class="nameDescription">
                <h3 class="titleColor">{{ title }}</h3>
                <h5 class="descriptionColor">{{ description }}</h5>
            </div>
            <h4 v-if="quantity >= 10" 
                class="quantityColorGreen"
                >В наличии
            </h4>
            <h4
                v-else-if="quantity <= 9 && quantity > 0"
                class="quantityColorYellow"
            >Мало
            </h4>
            <h4 v-else class="quantityColorRed"
                >Нет в наличии
            </h4>
            <div>
                <h3>{{ price }}</h3>
                <cart-button-gray v-if="quantity == 0" />
                <cart-button v-else />
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
            image: this.infoMass.image,
            title: this.infoMass.title,
            description: this.infoMass.description,
            quantity: this.infoMass.quantity,
            price: this.infoMass.price,
            sale: this.infoMass.sale,
        };
    },
    mounted(){
        axios
        .get('http://localhost:8080​/api​/catalog')
        .then(response => (this.title = response.productDtos[1].id)).then(response => console.log(response))
        .catch(err => console.log(err));
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
}
.titleColor {
    color: #33b75c;
}

.titleColor:active {
    color: #185b2d;
}
.quantityColorYellow {
    color: #ffce29;
    margin-top: 4em;
}
.quantityColorRed {
    color: #ee2a29;
    margin-top: 4em;
}
.quantityColorGreen {
    color: #33b75c;
    margin-top: 4em;
}
#borderNone{
    border-style:none;
}
.iphone {
    width: 100%;
}
.max-width-300px{
    max-width: 180px;
    width: 12%;
    align-self: center;
}
</style>