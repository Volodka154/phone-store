<!-- Список из товаров одной категории -->
<template>
    <div class="item-page">
        <div class="flex-container flex-container-row justify-content-end">
            <div class="flex-container flex-container-row justify-content-end cursor-pointer"
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
import axios from "axios";
import { mapActions, mapGetters } from 'vuex';
import CatalogItem from './CatalogItem.vue'
export default {
    components: {
        CatalogItem
    },
    data() {
        return {
            isFilter: false,
            productsList: [],
        };
    },
    methods:{
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
        ]),
        clickOnFilter(){
            this.isFilter = ! this.isFilter
            this.isFilter ? this.productsList.sort((a,b) => (a.price < b.price) ? 1 : -1)
                          : this.productsList.sort((a,b) => (a.price > b.price) ? 1 : -1)
        },
        handleCategSubcategChange(){
            this.productsList = []
            this.removePatInNavBarMass(1)
            this.addPatInNavBarMass({
                title: this.$router.currentRoute.value.params.name,
                path: this.$router.currentRoute.value.fullPath
            })
            const categoryID = this.allCategoryList.findIndex(item => item.title === this.nameOfCategory) + 1
            axios.get('http://localhost:8080/api/catalog/category/' + categoryID)
            .then(res =>{
                this.productsList = res.data.productDtos
                // проверка на наличие подкатегории
                if (this.nameOfSubcategory) {
                    this.addPatInNavBarMass({
                        title: this.nameOfSubcategory,
                        path: this.$router.currentRoute.value.fullPath
                    })
                    this.productsList = this.productsList.filter(item => item.title.toLowerCase().includes(this.nameOfSubcategory.toLowerCase()))
                }
            })
            .catch(err => {console.log('Error\n', err)})
        }
    },
    computed:{
        watchedSubcategory(){
            return this.$store.getters["navbar/nameOfSubcategory"]
        },
        ...mapGetters('navbar', [
            'allCategoryList',
            'nameOfCategory',
            'nameOfSubcategory'
        ])
    },  
    watch: {
        '$route.params.name': {
            immediate: true,    // обработчик вызывается и при обновлении
            handler() {
                this.handleCategSubcategChange()
            }
        },
        watchedSubcategory(){
            this.handleCategSubcategChange()
        }
    }
}
</script>