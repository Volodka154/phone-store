<template>
    <div class="category-card">
        <h2 v-for="title in titles" 
             :key="title"
             class="category-card__title"
             @click="clickOnCatalogItem(title)">
            {{ title }}
        </h2>
        {{ token }}
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
            token: null,
            titles: [
                 'Смартфоны',
                 'Аудиотехника',
                 'Аксессуары',
                 'Ноутбуки'
            ]
        };
    },
    mounted(){
        console.log('category-card', this.$store.getters.indexInCategory)
        // получаю все категории и убеждаюсь, что у меня ничего нет
        /*axios.get('http://localhost:8080/api/catalog/categories')
        .then(res =>{console.log('Все категории:\n', res.data)})
        .catch(err => {console.log('Error\n', err)})
        */
       // достаю токен для своего пользователя
        /*axios.post('http://localhost:8080/api/auth/login', {
            userEmail: "v@m.ru",
            userPassword: "1"
        })
        .then(response => { console.log(response.data.accessToken)
            this.token = response.data.accessToken })
        */
        // пытаюсь добавить первую категорию
        /*axios.post('http://localhost:8080/api/admin/category', {
            id: 1,
            title: "Ноутбуки"        
        })
        .then(res => console.log(res))
        .catch(err => {console.log('Error\n', err)})*/
        /*axios.get('http://localhost:8080/api/catalog')
        .then(res =>{console.log('Все товары:\n', res.data)})
        .catch(err => {console.log('Error\n', err)})*/
    },
    methods:{
        ...mapActions([
            'changeIsModalCategoryList',
            'setIndexByCategory'

        ]),
        clickOnCatalogItem(propsName){
            this.changeIsModalCategoryList()
            this.setIndexByCategory(this.titles.indexOf(propsName))
            this.$router.push({
                name: 'item-list',
                params:{
                    name: propsName
                }
            })
        }
    }
};
</script>

<style>
.category-card{
    position:absolute;
    text-align: left;
    padding: 0px 20px;
    top: 61px;
    left: 10px;
    border-radius: 5px;
    border: 1px solid  #b6b6b6;
    background-color: #ffffff;
}

.category-card__title{
    cursor: pointer;
    color: #000000;
}
.category-card__title:hover{
    cursor: pointer;
    color: #4f4f4f;
}
</style>