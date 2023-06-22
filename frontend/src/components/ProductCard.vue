<template>
    <div class="productCard" v-for="(product,key) in products" :key="key">
        <div class="flex-container" >
            <img :src="product.pictureUrl" class="iphone" />
            <div class="nameDescription">
                <h3 class="titleColor">{{ product.title }}</h3>
                <h5 class="descriptionColor">{{ product.description }}</h5>
            </div>

            <h4 v-if="product.status == 'AVAILABLE'" class="quantityColorGreen">В наличии</h4>
            <h4
                v-else-if="product.status  == 'LOW'"
                class="quantityColorYellow"
            >
                Мало
            </h4>
            <h4 v-else class="quantityColorRed">Нет в наличии</h4>

            <div>
                <h3>{{ product.price }}</h3>
                <cart-button-gray v-if="product.status == 'EMPTY'" />
                <cart-button v-else />
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import cartButtonGray from "./CartButtonGray";
import cartButton from "./CartButton.vue";
export default {
    name: "productCard",
    components: {
        cartButton,
        cartButtonGray,
    },
    props: {},
    data() {
        return {
            products:[]
        };
    },
    computed: {},
    mounted(){
        //axios.get("http://localhost:8080/api/catalog/product/1").
        //then(res => {this.image = res.data.pictureUrl, console.log(res.data.pictureUrl),
        //this.title = res.data.title, console.log(res.data),
        //this.description = res.data.description , this. quantity = res.data.status,  }).
        //catch(err => console.log(err))

        axios.get("http://localhost:8080/api/catalog")
        .then(res => {
            for (let product in res.data.productDtos) { 
            this.products.push(res.data.productDtos[product]);}
        })
        .catch(err => console.log(err))
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
    width: 12%;
    height: 12%;
}
</style>