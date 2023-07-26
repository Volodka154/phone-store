<!-- Модальное окошко выезжающих категорий при нажатии на "Каталог"-->
<template>
<div class="position-card position-absolute">
    <div class="flex-container flex-container-row">
        <div class="category-card">
            <h3 v-for="(item,index) in titles" 
                :key="index"
                class="category-card__title"
                @click="clickOnCatalogItem(item)"
                @mouseenter="indexShowSubcategories = index">
                {{ item.category }}
            </h3>
        </div>
        <Transition name="slide-fade-fixed"
                    mode="out-in">
            <div class="category-card"
                 style="margin-left: 10px;"
                 :key="indexShowSubcategories"
                 v-if="indexShowSubcategories > -1">
                <h4 v-for="(item,index) in titles[indexShowSubcategories].subcategories" 
                    :key="index"
                    class="category-card__title"
                    @click="clickOnSubCategory(indexShowSubcategories, index)">
                    {{ item }}
                </h4>
            </div>  
        </Transition>

    </div>
</div> 
</template>

<script>
//import axios from 'axios';
import { mapActions } from 'vuex'

export default {
    name: "category-card",
    props: {},
    data() {
        return {
            indexShowSubcategories: -1,
            titles: [
                { 
                    category: 'Смартфоны',
                    subcategories: [
                        "Apple",
                        "realme",
                        "Samsung",
                        "Huawei",
                        "Huawei P60 | P60 Pro",
                        "Кнопочные телефоны",
                    ]
                },
                { 
                    category: 'Аудиотехника',
                    subcategories: [
                        "Портативные колонки",
                        "Умные колонки",
                        "MP3 плееры",
                        "iPod",
                        "Радио",
                        "Диктофоны",
                        "Магнитолы",
                    ]
                },
                { 
                    category: 'Аксессуары',
                    subcategories: [
                        "Беспроводные наушники",
                        "Спортивные наушники",
                        "Игровые наушники",
                        "Наушники накладные",
                        "Наушники-вкладыши",
                        "Гарнитуры для телефонов",
                        "Компьютерные наушники",
                        "Аксессуары для наушников",
                    ]
                },
                { 
                    category: 'Ноутбуки',
                    subcategories: [
                        "Ноутбуки Apple",
                        "Ноутбуки Huawei",
                        "Игровые ноутбуки",
                        "Ноутбуки-трансформеры",
                        "Ноутбуки для бизнеса",
                        "Ультрабуки",
                        "Планшеты",
                    ]
                },
            ]
        };
    },
    mounted(){
        /*axios.get('http://localhost:8080/api/catalog/categories')
        .then(res =>{console.log('Все категории:\n', res.data)})
        .catch(err => {console.log('Error\n', err)})
        */
    },
    methods:{
        ...mapActions('navbar', [
            'changeIsModalCategoryList',
            'setIndexByCategory',
            'setNameBySubcategory'

        ]),
        clickOnCatalogItem(propsName){
            this.changeIsModalCategoryList()
            this.setIndexByCategory(this.titles.indexOf(propsName))
            this.$router.push({
                name: 'item-list',
                params:{
                    name: propsName.category
                }
            })
        },
        clickOnSubCategory(categoryIndex, subcategoryIndex){
            this.changeIsModalCategoryList()
            this.setIndexByCategory(categoryIndex)
            this.setNameBySubcategory(this.titles[categoryIndex].subcategories[subcategoryIndex])
            this.$router.push({
                name: 'item-list',
                params:{
                    name: this.titles[categoryIndex].category
                }
            })
        }
    }
};
</script>

<style>
.position-absolute{
    position:absolute;
}

.position-card{
    top: 76px;
    left: 10px;
}

.category-card{
    text-align: left;
    padding: 0px 20px;
    border-radius: 5px;
    border: 1px solid  #b6b6b6;
    background-color: rgba(255, 255, 255, 0.85);
}

.category-card__title{
    cursor: pointer;
    color: #000000;
}
.category-card__title:hover{
    cursor: pointer;
    color: #4f4f4f;
}

.slide-fade-fixed-enter-active{
    animation: slideFadeFixedIn 0.3s ease-in-out forwards;
}
.slide-fade-fixed-leave-active{
    animation: slideFadeFixedInOut 0.15s ease-in-out forwards;
}
@keyframes slideFadeFixedIn {
    from {transform: translateX(-100%); opacity: 0;}
    to {transform: translateX(0); opacity: 1;}
}
@keyframes slideFadeFixedInOut {
    from {opacity: 1;}
    to {opacity: 0;}
}

</style>