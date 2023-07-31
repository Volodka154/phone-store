<!-- Модальное окошко выезжающих категорий при нажатии на "Каталог"-->
<template>
    <div class="position-card position-absolute">
        <div class="flex-container flex-container-row">
            <div class="category-card">
                <h3 v-for="(item,index) in categoryList" 
                    :key="index"
                    class="category-card__title"
                    @click="clickOnCategory(item.title)"
                    @mouseenter="indexShowSubcategories = index">
                    {{ item.title }}
                </h3>
            </div>
            <Transition name="slide-fade-fixed"
                        mode="out-in">
                <div class="category-card"
                     style="margin-left: 10px;"
                     :key="indexShowSubcategories"
                     v-if="indexShowSubcategories > -1">
                    <h4 v-for="(item,index) in categoryList[indexShowSubcategories].subcategoryDtos" 
                        :key="index"
                        class="category-card__title"
                        @click="clickOnSubCategory(categoryList[indexShowSubcategories].title, item.title)">
                        {{ item.title }}
                    </h4>
                </div>  
            </Transition>
    
        </div>
    </div> 
    </template>
    
    <script>
    import { mapActions, mapGetters } from 'vuex'
    
    export default {
        name: "category-card",
        props: {},
        data() {
            return {
                indexShowSubcategories: -1,
                categoryList: []
            }
        },
        mounted(){
            this.categoryList = this.allCategoryList()
        },
        methods:{
            ...mapActions('navbar', [
                'changeIsModalCategoryList',
                'setNameByCategory',
                'setNameBySubcategory'
            ]),
            ...mapGetters('navbar', [
                'allCategoryList',
            ]),
            clickOnCategory(propsCategoryName){
                this.changeIsModalCategoryList()
                this.setNameByCategory(propsCategoryName)
                this.$router.push({
                    name: 'item-list',
                    params:{
                        name: propsCategoryName
                    }
                })
            },
            clickOnSubCategory(propsCategoryName, propsSubcategoryName){
                this.changeIsModalCategoryList()
                this.setNameByCategory(propsCategoryName)
                this.setNameBySubcategory(propsSubcategoryName)
                this.$router.push({
                    name: 'item-list',
                    params:{
                        name: propsCategoryName
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