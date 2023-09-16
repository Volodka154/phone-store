<!-- Список из доступных категорий на главном экране -->
<template>
    <div class="item-page">
        <div class="flex-container flex-container-row flex-wrap-wrap justify-content-start">
            <div class="one-point"
                 v-for="item in catalog"
                 :key="item.title"
                 @click="clickOnCatalogItem(item.title)">
                <p>{{ item.title }}</p>
                <img :src="require(`../assets/${item.picture}`)"
                     class="picture">
            </div>
        </div>
    </div>
</template>
    
<script>
import { mapActions } from 'vuex'
export default {
    data(){
        return {
            catalog: [
                {
                    title: 'Смартфоны',
                    picture: 'phone.jpg'
                },
                {
                    title: 'Аудиотехника',
                    picture: 'audio.avif'
                },
                {
                    title: 'Аксессуары',
                    picture: 'accessories.webp'
                }
            ]
        }
    },
    methods:{
        ...mapActions('navbar', [
            'removePatInNavBarMass',
            'setNameByCategory',
            'setNameBySubcategory'
        ]),
        clickOnCatalogItem(propsCategoryName) {
            this.setNameByCategory(propsCategoryName)
            this.$router.push({
                name: 'item-list',
                params:{
                    name: propsCategoryName
                }
            })
        }
    },
    mounted(){
        this.removePatInNavBarMass(1)       // зачистка всего в navBar 
        this.setNameByCategory('')
        this.setNameBySubcategory('')
    }
}
</script>