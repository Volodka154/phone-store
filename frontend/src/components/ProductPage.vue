<template>
    <div class="product-page"  id="borderNone">
        <productCard/> 
        <div class="leftClass">
        <p @click="specificationsOnDisplay"> Характеристики: </p>
        <h4 v-if="specificationsClick"> {{ specifications }} </h4>
        <p @click="reviewsOnDisplay"> Отзывы: </p>
        <h4 v-if="reviewsClick"> {{ rewiews }} </h4>
        <p> Сопутствующие товары: </p>
        <h4 >{{ relateds }}</h4>
        </div>
    </div>
</template>

<script>
import productCard from './ProductCard.vue'
import axios from "axios";

export default {
    name: "product-page",
    components: {
        productCard
    },
    props: {},
    data() {
        return {
            specificationsClick: false,
            reviewsClick: false,
            relateds: 'Извините, сопутствующих товаров не найдено :(',
            rewiews: 'какие-то отзывы',
            specifications: 'какие-то характеристики товара',
            title: "Смартфоны",
            class1: "blockClass1",
            title2: "Аудиотехника",
            title3: "Аксессуары",
        };
    },
    computed: {},
    mounted(){
        console.log(1)
        axios
        .get('http://localhost:8080​/api​/catalog')
        .then(response => (this.title = response.productDtos[1].id))
        .then(response => console.log(response))
        .catch(err => console.log(err));
    },

    methods: {
        specificationsOnDisplay() {
                    this.specificationsClick = !this.specificationsClick
                    this.reviewsClick = false
                },
        reviewsOnDisplay() {
                    this.reviewsClick = !this.reviewsClick
                    this.specificationsClick = false
                }
    }
};
</script>

<style scoped>
.productPage{
    border-width: 1px;
    border-color: rgba(0, 0, 0, 0.1);
    border-style: none none none none;
}
.leftClass{
    position:fixed;
    left: 5%;
}
p{
    color:#ED1C24;
    text-decoration-line: underline;
    left: 0px;
}
h4{
    color:rgba(0, 0, 0, 0.744);
}
</style>