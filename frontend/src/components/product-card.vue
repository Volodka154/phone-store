<template>
    <div class="productCard">
        <div class="flex-container" >
            <img src="" class="iphone" />
            <div class="nameDescription">
                <h3 class="titleColor">{{ title }}</h3>
                <h5 class="descriptionColor">{{ description }}</h5>
            </div>

            <h4 v-if="quantity >= 10" class="quantityColorGreen">В наличии</h4>
            <h4
                v-else-if="quantity <= 9 && quantity > 0"
                class="quantityColorYellow"
            >
                Мало
            </h4>
            <h4 v-else class="quantityColorRed">Нет в наличии</h4>

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
    components: {
        cartButton,
        cartButtonGray,
    },
    props: {},
    data() {
        return {
            image: "",
            title: "Смартфон Apple iPhone 14",
            description:
                "В этой модели установлены три основные камеры (48 Мп, 12 Мп и 12 Мп) и фронтальный модуль(7 мп), можно записывать видео в качестве 4К с частотой 30 кадров в секунду. Основной объектив снабжен сапфировым защитным стеклом.",
            quantity: "0",
            price: "115999",
            sale: "110999",
        };
    },
    computed: {},
    mounted(){
        console.log(1)
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
    width: 12%;
    height: 12%;
}
</style>