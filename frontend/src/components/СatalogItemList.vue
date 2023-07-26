<!-- Список из товаров одной категории -->
<template>
    <div class="item-page">
        <div class="flex-container flex-container-row"
             style="justify-content: end;" >
            <div class="flex-container flex-container-row"
                 style="justify-content: end; cursor: pointer;"
                 @click="clickOnFilter">
                <p>{{ isFilter ? "Сначала дороже":"Сначала дешевле" }}</p>
                <img src="Filter.svg" class="ikon">            
            </div>
        </div>
        <div v-for="(item) in productsList"
             :key="item.id">
            <catalog-item :infoMass="item"></catalog-item>
        </div>
    </div>
</template>

<script>
import CatalogItem from './CatalogItem.vue'
import axios from "axios";
import { mapActions, mapGetters } from 'vuex';
export default {
    components: {
        CatalogItem
    },
    data() {
        return {
            key: this.indexInCategory(),
            isFilter: false,
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
    methods:{
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
        ]),
        ...mapGetters('navbar', [
            'indexInCategory',
            //'nameOfSubcategory'
        ]),
        clickOnFilter(){
            this.isFilter = ! this.isFilter
            this.isFilter ? this.productsList.sort((a,b) => (a.price < b.price) ? 1 : -1)
                          : this.productsList.sort((a,b) => (a.price > b.price) ? 1 : -1)
        }
    },
    watch: {
        '$route.params.name': {
            immediate: true,    // обработчик вызывается и при обновлении
            handler() {
                //this.productsList = []
                this.removePatInNavBarMass(1)
                this.addPatInNavBarMass({
                    title: this.$router.currentRoute.value.params.name,
                    path: this.$router.currentRoute.value.fullPath
                })
                const categoryID = this.indexInCategory() + 1
                axios.get('http://localhost:8080/api/catalog/category/' + categoryID)
                .then(res =>{
                    //console.log('Все товары:\n', res.data.productDtos)
                    this.productsList = res.data.productDtos
                })
                .catch(err => {console.log('Error\n', err)})
                // проверка на наличие подкатегории
                /*if (this.nameOfSubcategory) {
                    this.addPatInNavBarMass({
                        title: this.nameOfSubcategory,
                        path: this.$router.currentRoute.value.fullPath
                    })
                }*/
            }
  
        }
    }
};
</script>

<style>
.item-page {
    border: 1px solid;
    margin: 10px 60px;
}
.flex-container {
    display: flex;
    flex-basis: content;
    justify-content: space-between;
}
.flex-container-row {
    flex-direction: row;
    flex-wrap: nowrap;
}
.flex-container-column {
    flex-direction: column;
    flex-wrap: nowrap;
}
</style>