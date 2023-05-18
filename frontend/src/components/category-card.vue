<template>
    <div class="category-card">
        <div v-for="title in titles" 
             :key="title">
            <h2>{{ title }}</h2>
        </div>
        {{ token }}
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "category-card",
    props: {},
    data() {
        return {
            token: null,
            titles: [
                 'Смартфоны',
                 'Аудиотехника',
                 'Аксессуары'
            ]
        };
    },
    mounted(){
        console.log('category-card')
        // получаю все категории и убеждаюсь, что у меня ничего нет
        axios.get('http://localhost:8080/api/catalog/categories')
        .then(res =>{console.log('Все категории:\n', res.data)})
        .catch(err => {console.log('Error\n', err)})
        // достаю токен для своего пользователя
        axios.post('http://localhost:8080/api/auth/login', {
            userEmail: "vova505@mail.ru",
            userPassword: "123"
        })
        .then(response => { console.log(response.data.accessToken)
            this.token = response.data.accessToken })
        // пытаюсь добавить первую категорию
        axios.post('http://localhost:8080/api/admin/category', {
            id: 1,
            title: "Ноутбуки"        
        })
        .then(res => console.log(res))
        .catch(err => {console.log('Error\n', err)})
    },
};
</script>

<style>
.category-card{
    position:absolute;
    padding: 20px;
    top: 71px;
    left: 10px;
    border-radius: 5px;
    border: 1px solid;
}
</style>