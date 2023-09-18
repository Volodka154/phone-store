<!-- Модальное окошко выезжающих категорий при нажатии на "Каталог"-->
<template>
    <div class="position-card position-absolute">
        <div class="flex-container flex-container-row">
            <div class="category-card">
                <h3 v-for="(item,index) in categoryList" 
                    :key="index"
                    class="category-card__title cursor-pointer"
                    @click="clickOnCategory(item.title)"
                    @mouseenter="indexShowSubcategories = index"
                    >{{ item.title }}
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
                        @click="clickOnSubCategory(categoryList[indexShowSubcategories].title, item.title)"
                        >{{ item.title }}
                    </h4>
                </div>  
            </Transition>
        </div>
    </div> 
</template>
    
<script>
import { mapActions, mapGetters } from 'vuex'
export default {
    data() {
        return {
            indexShowSubcategories: -1,
            categoryList: []
        }
    },
    mounted() {
        this.categoryList = this.allCategoryList
    },
    methods: {
        ...mapActions('navbar', [
            'changeIsModalCategoryList',
            'setNameByCategory',
            'setNameBySubcategory'
        ]),
        clickOnCategory(propsCategoryName) {
            this.changeIsModalCategoryList()
            localStorage.setItem('nameOfCategory', propsCategoryName)
            localStorage.setItem('nameOfSubcategory', '')
            this.setNameByCategory(propsCategoryName)
            this.setNameBySubcategory('')
            this.$router.push({
                name: 'item-list',
                params:{
                    name: propsCategoryName
                }
            })
        },
        clickOnSubCategory(propsCategoryName, propsSubcategoryName) {
            this.changeIsModalCategoryList()
            localStorage.setItem('nameOfCategory', propsCategoryName)
            localStorage.setItem('nameOfSubcategory', propsSubcategoryName)
            this.setNameByCategory(propsCategoryName)
            this.setNameBySubcategory(propsSubcategoryName)
            this.$router.push({
                name: 'item-list',
                params:{
                    name: propsCategoryName
                }
            })
        }
    },
    computed: {
        ...mapGetters('navbar', [
            'allCategoryList',
        ])
    }
}
</script>