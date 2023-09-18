<!-- Список из товаров одной категории -->
<template>
    <div class="item-page">
        <div class="flex-container flex-container-row justify-content-end">
            <div v-if="productsList.length"
                 class="flex-container flex-container-row justify-content-end cursor-pointer"
                 @click="clickOnFilter">
                <p>{{ isFilter ? "Сначала дороже" : "Сначала дешевле" }}</p>
                <img src="Filter.svg" class="ikon">            
            </div>
        </div>
        <div v-for="(item) in productsList"
             :key="item.id">
            <catalog-item :infoItem="item"></catalog-item>
        </div>
    </div>
</template>

<script>
import { axiosInstance } from '../index.js'
import { mapActions, mapGetters } from 'vuex'
import CatalogItem from './CatalogItem.vue'
export default {
    components: {
        CatalogItem
    },
    data() {
        return {
            isFilter: false,
            productsList: [],
        }
    },
    methods:{
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
        ]),
        clickOnFilter() {
            this.isFilter = ! this.isFilter
            this.isFilter ? this.productsList.sort((a,b) => (a.price < b.price) ? 1 : -1)
                          : this.productsList.sort((a,b) => (a.price > b.price) ? 1 : -1)
        },
        handleCategSubcategChange() {
            this.productsList = []
            this.removePatInNavBarMass(1)
            this.addPatInNavBarMass({
                title: this.$router.currentRoute.value.params.name,
                path: this.$router.currentRoute.value.fullPath
            })
            const categoryID = this.allCategoryList.findIndex(item => item.title === this.nameOfCategory) + 1
            axiosInstance.get('/catalog/category/' + categoryID)
            .then(res =>{
                this.productsList = res.data.productDtos
                // проверка на наличие подкатегории
                if (this.nameOfSubcategory) {
                    const obj = {
                        title: this.nameOfSubcategory,
                        path: this.$router.currentRoute.value.fullPath
                    }
                    // функция handleCategSubcategChange отрабатывает два раза при переходе в подкатегорию другой категории, поэтому добавляет подкатегорию два раза
                    // здесь мы проверяем наличие подкатегории в массиве всех путей
                    let isObjInArr = false
                    this.pathInNavBarMass.filter(item => {
                        if (obj.title == item.title && obj.path == item.path) {
                            isObjInArr = true
                        }
                    })
                    if (!isObjInArr) {
                        this.addPatInNavBarMass(obj)
                    }
                    this.productsList = this.productsList.filter(item => item.title.toLowerCase().includes(this.nameOfSubcategory.toLowerCase()))
                }
            })
            .catch(err => {console.log('Error\n', err)})
        }
    },
    computed: {
        watchedSubcategory() {
            return this.$store.getters["navbar/nameOfSubcategory"]
        },
        watchedAllCategoryList() {
            return this.$store.getters["navbar/allCategoryList"]
        },
        ...mapGetters('navbar', [
            'allCategoryList',
            'nameOfCategory',
            'nameOfSubcategory',
            'pathInNavBarMass'
        ])
    },  
    watch: {
        '$route.params.name': {
            immediate: true,    // обработчик вызывается и при обновлении
            handler() {
                this.handleCategSubcategChange()
            }
        },
        watchedSubcategory() {
            this.handleCategSubcategChange()
        },
        watchedAllCategoryList() {
            this.handleCategSubcategChange()
        }
    }
}
</script>