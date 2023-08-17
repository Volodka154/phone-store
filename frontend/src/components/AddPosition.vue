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
                <button @click = "isCategoryAdd = true">Добавить новую</button>
                <button @click = "isRedact = true">Редактировать</button>
                <button @click = "isDeleteCategory = true">Удалить</button>
                </div>
                <div v-if="isCategoryAdd">
                    <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                    <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                    <button @click="addCategory">Добавить</button>
                </div>
                <div v-if="isRedact">
                    <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                    <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                    <button @click="redact">Сохранить изменения</button>
                </div>
                <div v-if="isDeleteCategory">
                    <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                    <button @click="deleteCategory">Удалить</button>
                </div>
                <p>Подкатегория:</p>
                    <select name="subcateg" class="category-select" v-model="selectSubCategory" @click="getSubCategory">
                        <option v-for="(subCategory, index) in subCategories" :key="index" :value="index" >{{ subCategory }}</option>
                    </select>
                    <div class="flex-container">
                <button @click = "isSubCategoryAdd = true">Добавить новую</button>
                <button @click = "isSubRedact = true">Редактировать</button>
                <button @click = "isDeleteSubCategory = true">Удалить</button>
                <button @click = "isMoveSub = true">Переместить</button>
                </div>
                <div v-if="isSubCategoryAdd">
                    <input class="input-class" v-model="categoryId" placeholder="id Подкатегории"/>
                    <input class="input-class" v-model="categoryIdForSub" placeholder="id Категории для подкатегории"/>
                    <input class="input-class" v-model="parentId" placeholder="id родительской подкатегории"/>
                    <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                    <button @click="addSubCategory">Добавить</button>
                </div>
                <div v-if="isSubRedact">
                    <input class="input-class" v-model="categoryId" placeholder="id Подкатегории"/>
                    <input class="input-class" v-model="categoryIdForSub" placeholder="id Категории для подкатегории"/>
                    <input class="input-class" v-model="parentId" placeholder="id родительской подкатегории"/>
                    <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                    <button @click="subRedact">Сохранить изменения</button>
                </div>
                <div v-if="isDeleteSubCategory">
                    <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                    <button @click="deleteSubCategory">Удалить</button>
                </div>
                <div v-if="isMoveSub">
                    <input class="input-class" v-model="categoryIdForSub" placeholder="id Категории, в которую вы хотите переместить"/>
                    <input class="input-class" v-model="categoryId" placeholder="id Подкатегории"/>
                    <button @click="moveSub">Добавить</button>
                </div>
                <p>Товар:</p>
                <button @click = "isProductAdd = !isProductAdd" >Добавить</button>
                <button @click = "isProductRedact = true">Редактировать</button>
                <button @click = "isDeleteProduct = true">Удалить</button>
                </div>
                    <div v-if="isProductAdd">
                    <input class="input-class" v-model="productAmount" placeholder="Количество товара"/>
                    <input class="input-class" v-model="productDescription" placeholder="Описание товара"/>
                    <p>Есть ли скидка на товар: </p>
                    <select name="categ" class="category-select" v-model="productDiscount">
                    <option>{{ true }}</option>
                    <option>{{ false }}</option>
                    </select>
                    <input class="input-class" v-model="productDiscountPrice" placeholder="Скидочная цена"/>
                    <input class="input-class" v-model="productId" placeholder="Id товара"/>
                    <input class="input-class" v-model="productPictureUrl" placeholder="Ссылка на картинку товара"/>
                    <input class="input-class" v-model="productPrice" placeholder="Цена без скидки"/>
                    <input class="input-class" v-model="productSubcategoryId" placeholder="Id подкатегории"/>
                    <input class="input-class" v-model="productTitle" placeholder="Название товара"/>
                    <button @click="addProduct">Добавить</button>
                </div>
                <div v-if="isProductRedact">
                    <input class="input-class" v-model="productAmount" placeholder="Количество товара"/>
                    <input class="input-class" v-model="productDescription" placeholder="Описание товара"/>
                    <p>Есть ли скидка на товар: </p>
                    <select name="categ" class="category-select" v-model="productDiscount">
                    <option>{{ true }}</option>
                    <option>{{ false }}</option>
                    </select>
                    <input class="input-class" v-model="productDiscountPrice" placeholder="Скидочная цена"/>
                    <input class="input-class" v-model="productId" placeholder="Id товара"/>
                    <input class="input-class" v-model="productPictureUrl" placeholder="Ссылка на картинку товара"/>
                    <input class="input-class" v-model="productPrice" placeholder="Цена без скидки"/>
                    <input class="input-class" v-model="productSubcategoryId" placeholder="Id подкатегории"/>
                    <input class="input-class" v-model="productTitle" placeholder="Название товара"/>
                    <button @click="redactProduct">Сохранить изменения</button>
                </div>
                <div v-if="isDeleteProduct">
                    <input class="input-class" v-model="productId" placeholder="id Категории"/>
                    <button @click="deleteProduct">Удалить</button>
                </div>
            </div>
            <div class="add-new">
              
            </div>
        </div>
    
</template>

<script>
import { mapGetters } from 'vuex';
import axios from 'axios';
export default {
    name: 'add-position',
    props: {},
    data() {
        return {
            categories: '',
            numbers: [],
            subCategories: [],
            selectCategory: '',
            isCategoryAdd: false,
            categoryId: '',
            categoryTitle: '',
            isRedact: false,
            isDeleteCategory: false,
            selectSubCategory: '',
            isSubCategoryAdd: false,
            isSubRedact: false,
            isDeleteSubCategory: false,
            isMoveSub: false,
            categoryIdForSub: '',
            parentId: '',
            isProductAdd: false,
            isProductRedact: false,
            isDeleteProduct: false,
            productAmount: '',
            productDescription: '',
            productDiscount: 'Есть ли скидка на товар',
            productDiscountPrice: '',
            productId: '',
            productPictureUrl: '',
            productPrice: '',
            productSubcategoryId: '',
            productTitle: '',
        }
    },
    computed: {
        ...mapGetters('user',[
            'accessToken',
            'refreshToken'
        ])
    },
    methods: {
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
        getSubCategory(){
            this.subCategories = Array()
            axios.get("http://localhost:8080/api/catalog/subcategories",{})
            .then(response => this.categories = response.data)
            .catch(err => console.log(err))
            console.log(this.categories.length)
            for (let i=0; i<this.categories.length; i++){
                this.subCategories.push(this.categories[i].title)
            }
        },
        addCategory(){
            axios.post("http://localhost:8080/api/admin/category",{
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Категория добавлена",response))
            .catch(err => alert("Ошибка",err))
            this.isCategoryAdd = false
        },
        redact(){
            axios.put("http://localhost:8080/api/admin/category",{
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Категория отредактирована",response))
            .catch(err => alert("Категории с таким id не существует",err))
            this.isRedact = false
        },
        deleteCategory(){
            let id = this.categoryId
            axios.delete('http://localhost:8080/api/admin/deleteCategory/' + id,
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Категория удалена",response))
            .catch(err => alert("Категории с таким id не существует",err))
            this.isDeleteCategory= false
        },
        addSubCategory(){
            axios.post("http://localhost:8080/api/admin/subcategory",{
                categoryId: this.categoryIdForSub,
                parentId: this.parentId,
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Подкатегория добавлена",response))
            .catch(err => alert("Ошибка",err))
            this.isSubCategoryAdd = false
        },
        subRedact(){
                axios.put("http://localhost:8080/api/admin/subcategory",{
                categoryId: this.categoryIdForSub,
                parentId: this.parentId,
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Подкатегория отредактирована",response))
            .catch(err => alert("Ошибка",err))
            this.isSubRedact = false
        },
        deleteSubCategory(){
            let id = this.categoryId
            axios.delete('http://localhost:8080/api/admin/deleteSubcategory/' + id,
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Подкатегория удалена",response))
            .catch(err => alert("Подкатегории с таким id не существует",err))
            this.isDeleteSubCategory= false
        },
        moveSub(){
                axios.put("http://localhost:8080/api/admin/moveSubcategoryToCategory",{
                    catId: this.categoryIdForSub,
                    subId: this.categoryId
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Подкатегория перемещена",response))
            .catch(err => alert("Ошибка",err))
            this.isMoveSub = false
        },
        addProduct(){
                axios.post("http://localhost:8080/api/admin/product",{
                    amount: this.productAmount,
                    description: this.productDescription,
                    discount: this.productDiscount,
                    discountPrice: this.productDiscountPrice,
                    id: this.productId,
                    pictureUrl: this.productPictureUrl,
                    price: this.productPrice,
                    productPropertyRequest: {
                        id: 1,
                        propertyIds: [
                            111
                        ]
                    },
                    subcategoryId: this.productSubcategoryId,
                    title: this.productTitle
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Товар добавлен",response), this.isProductAdd = false)
            .catch(err => alert("Ошибка",err), this.isProductAdd = true)
            
        },
        deleteProduct(){
            let id = this.productId
            axios.delete('http://localhost:8080/api/admin/deleteProduct/' + id,
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Товар удален",response))
            .catch(err => alert("Товара с таким id не существует",err))
            this.isDeleteProduct = false
        },
        redactProduct(){
                axios.put("http://localhost:8080/api/admin/product",{
                    amount: this.productAmount,
                    description: this.productDescription,
                    discount: this.productDiscount,
                    discountPrice: this.productDiscountPrice,
                    id: this.productId,
                    pictureUrl: this.productPictureUrl,
                    price: this.productPrice,
                    productPropertyRequest: {
                        id: this.productPropertyId,
                        propertyIds: [
                            {
                            id: 0,
                            name: 0,
                            value: 0
                            }
                        ]
                    },
                    subcategoryId: this.productSubcategoryId,
                    title: this.productTitle
            },
            {
                headers: {
                            Authorization: `Bearer ${this.accessToken}` // Передаем токен в заголовке запроса
                        }
            })
            .then(response => alert("Товар добавлен",response), this.isProductRedact = false)
            .catch(err => alert("Ошибка",err), this.isProductRedact = true)
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