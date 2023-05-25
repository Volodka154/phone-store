<template>
    <div class="product-page"  id="borderNone">
        <RouterLink :to="{name: 'catalog'}">go back</RouterLink>
        <div v-for="(item, index) in productsList"
        :key="index">
            <catalog-item :infoMass="item"></catalog-item>
        </div>
    </div>
</template>

<script>
import catalogItem from './catalogItem.vue'
import axios from "axios";

export default {
    name: "product-page",
    components: {
        'catalog-item': catalogItem
    },
    props: {},
    data() {
        return {
            productsList:[
                {
                    id: 1,
                    title: 'Apple IPhone 12', 
                    description: 'Дисплей представляет собой прямоугольник с закруглёнными углами. Диагональ этого прямоугольника без учёта закруглений составляет 5,42 дюйма (для iPhone 12 mini), 5,85 дюйма (для iPhone 11 Pro, iPhone XS, iPhone X), 6,06 дюйма (для iPhone 12 Pro, iPhone 12, iPhone 11, iPhone XR), 6,46 дюйма (для iPhone 11 Pro Max, iPhone XS Max) или 6,68 дюйма (для iPhone 12 Pro Max). Фактическая область просмотра меньше.',
                    image: 'https://cdn.svyaznoy.ru/upload/iblock/7f2/ruru_iphone12_q121_white_pdp-image-1b.jpg/resize/453x480/',
                    price: 65000,
                    sale: 63000,
                    quantity: 0,
                },
                {
                    id: 2,
                    title: 'Apple IPhone 13', 
                    description: 'Apple iPhone 13 обладает по-настоящему превосходным экраном с высокой яркостью и контрастностью, однако у него есть два недостатка. Во-первых, дисплей имеет стандартную частоту обновления 60 Гц, тогда как конкуренты имеют 120 Гц. Во-вторых, хоть размеры выреза в дисплее уменьшились, он все равно кажется большим. При просмотре HDR-контента яркость вырастает до целых 1200 нит, а в стандартном режиме – 800 нит. Минимальная яркость тоже отличная – дисплей не будет слепить пользователя ночью.',
                    image: 'https://cdn.svyaznoy.ru/upload/iblock/2df/iphone_13_q421_midnight_pdp_image_position-1a__ru-ru.jpg/resize/453x480/',
                    price: 75000,
                    sale: 70000,
                    quantity: 8,
                },
                {
                    id: 3,
                    title: 'Apple IPhone 14', 
                    description: 'Защита экрана Ceramic Shield, прочная как никакое другое стекло. Водонепроницаемость. Алюминий, используемый в аэрокосмической отрасли. Два размера на выбор, 6.1 дюйма и 6.7 дюйма. И самое долгое время работы от батареи в истории iPhone.',
                    image: 'https://cdn.svyaznoy.ru/upload/iblock/000/0004936c8766c3d968e4ee3e56daf053.jpg/resize/453x480//',
                    price: 89000,
                    sale: 75000,
                    quantity: 22,
                },
            ],
        };
    },
    mounted(){
        console.log(1)
        axios
        .get('http://localhost:8080​/api​/catalog')
        .then(response => (this.title = response.productDtos[1].id))
        .then(response => console.log(response))
        .catch(err => console.log(err));
    },
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