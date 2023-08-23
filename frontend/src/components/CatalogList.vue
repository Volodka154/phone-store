<!-- Список из доступных категорий на главном экране -->
<template>
    <div class="item-page">
        <div class="flex-container flex-container-row flex-wrap-wrap justify-content-start">
            <div class="one-point"
                 v-for="(item,index) in catalog"
                 :key="index"
                 @click="clickOnCatalogItem(item.title)">
                <p>{{ item.title }}</p>
                <img :src="item.picture"
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
                    picture: 'https://du4.edunp.by/files/02019/obj/140/14623/ico/telephone_dial_plate_red.jpg'
                },
                {
                    title: 'Аудиотехника',
                    picture: 'https://img.freepik.com/premium-vector/black-and-white-sketch-tape-recorder-radio-receiver-with-cassettes-and-notes-in-the-style-of-doodle_606560-75.jpg?w=2000'
                },
                {
                    title: 'Аксессуары',
                    picture: 'https://thumbs.dreamstime.com/b/%D0%B7%D0%BD%D0%B0%D1%87%D0%BE%D0%BA-%D0%B0%D0%BA%D1%81%D0%B5%D1%81%D1%81%D1%83%D0%B0%D1%80%D0%BE%D0%B2-smartphone-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D1%83%D1%8E-%D0%BF%D1%80%D0%B5%D0%B4%D0%BF%D0%BE%D1%81%D1%8B%D0%BB%D0%BA%D1%83-127452056.jpg'
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
        clickOnCatalogItem(propsCategoryName){
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