<template>
    <div class="add-position">
        <div class="h-information">
            <div class="wrap-category">
                <div class="category">
                    <p>Категория:</p>
                    <select name="categ" class="category-select" v-model="selectCategory" @click="getCategory">
                        <option v-for="(number, index) in numbers" :key="index" :value="index" >{{ number }}</option>
                    </select>
                </div>
                <div class="flex-container">
                <button @click="isCategoryAdd = true">Добавить новую</button>
                <button>Редактировать</button>
                <button >Удалить</button>
                </div>
                <div v-if="isCategoryAdd">
                    <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                    <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                    <button @click="addCategory">Добавить</button>
                </div>
            </div>
            <div class="add-new">
              
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    name: 'add-position',
    props: {},
    data() {
        return {
            categories: '',
            numbers: [],
            selectCategory: '',
            isCategoryAdd: false,
            categoryId: '',
            categoryTitle: '',
        }
    },
    computed: {
    },
    methods: {
      /*  add(){
            axios.post("http://localhost:8080/admin/product", {
                amount: this.name,
                description: this.description,
                discount: true,
                "discountPrice": 0,
                "id": 111,
                "pictureUrl": "string",
                "price": 0,
                "productPropertyRequest": {
                    "id": 0,
                    "propertyIds": [
                        0
                    ]
                },
                "subcategoryId": 0,
                "title": "string"
            })
            .then(response => console.log(response))
            .catch(err => console.log(err))
        }, */
        getCategory(){
            this.numbers=Array()
            axios.get("http://localhost:8080/api/catalog/categories",{})
            .then(response => this.categories = response.data)
            .catch(err => console.log(err))
            console.log(this.categories.length)
            for (let i=0; i<this.categories.length; i++){
                this.numbers.push(this.categories[i].title)
            }
        },
        addCategory(){
            axios.post("http://localhost:8080/api/admin/category",{
                id: this.categoryId,
                title: this.categoryTitle
            })
            .then(response => console.log(response))
            .catch(err => console.log(err))
        }
    }, 
}
</script>

<style scoped>

.add-position {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.h-information {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

.wrap-category {
    flex-direction: column;
    width: 50%;
    align-items: center;
}

.category {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

.category-select {
    width: 20em;
    height: 2em;
    margin-left: 3em;
}

.btn-new {
    background-color: #7f7f7f;
    color: black;
    width: 15em;
    height: 3em;
    border: none;
}

.b-information {
    display: flex;
    flex-direction: row;
    width: 100%;
    height: 20em;
    justify-content: space-between;
}

.form {
    margin-top: 1em;
    display: flex;
    flex-direction: column;
    width: 50%;
    justify-content: space-between;
}

.input {
    color: #7f7f7f;
    height: 2em;
    width: 90%;
}

.description {
    height: 5em;
}

.haract{
    text-align: left;
}

.btn-add {
    background-color: #00A2E8;
    color: black;
    width: 20em;
    height: 2em;
    margin: 1em;
    border: none;
    align-self: center;
}

.flex-container{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>