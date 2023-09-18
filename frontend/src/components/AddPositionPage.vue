<template>
    <div class="item-page">
        <div class="h-information">
            <div class="wrap-category">
                
                <div class="container">
                    <p>Категория:</p>
                </div>

                <div class="flex-container">
                    <button class="add-button" @click = "isCategoryAdd = !isCategoryAdd">Добавить</button>
                    <button class="add-button" @click = "isRedact = !isRedact">Редактировать</button>
                    <button class="add-button" @click = "isDeleteCategory = !isDeleteCategory">Удалить</button>
                </div>

                <div class="container">
                    <div v-if="isCategoryAdd">
                        <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                        <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                        <button class="add-button" @click="addCategory">Добавить</button>
                    </div>

                    <div v-if="isRedact">
                        <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                        <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                        <button class="add-button" @click="redact">Сохранить изменения</button>
                    </div>

                    <div v-if="isDeleteCategory">
                        <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                        <button class="add-button" @click="deleteCategory">Удалить</button>
                    </div>
                </div>

                <div class="container">
                    <p>Подкатегория:</p>
                </div>

                <div class="flex-container">
                    <button class="add-button" @click = "isSubCategoryAdd = !isSubCategoryAdd">Добавить</button>
                    <button class="add-button" @click = "isSubRedact = !isSubRedact">Редактировать</button>
                    <button class="add-button" @click = "isDeleteSubCategory = !isDeleteSubCategory">Удалить</button>
                    <button class="add-button" @click = "isMoveSub = !isMoveSub">Переместить</button>
                </div>

                <div class="container">
                    <div v-if="isSubCategoryAdd">
                        <input class="input-class" v-model="categoryId" placeholder="id Подкатегории"/>
                        <input class="input-class" v-model="categoryIdForSub" placeholder="id Категории для подкатегории"/>
                        <input class="input-class" v-model="parentId" placeholder="id родительской подкатегории"/>
                        <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                        <button class="add-button" @click="addSubCategory">Добавить</button>
                    </div>

                    <div v-if="isSubRedact">
                        <input class="input-class" v-model="categoryId" placeholder="id Подкатегории"/>
                        <input class="input-class" v-model="categoryIdForSub" placeholder="id Категории для подкатегории"/>
                        <input class="input-class" v-model="parentId" placeholder="id родительской подкатегории"/>
                        <input class="input-class" v-model="categoryTitle" placeholder="Название Категории"/>
                        <button class="add-button" @click="subRedact">Сохранить изменения</button>
                    </div>

                    <div v-if="isDeleteSubCategory">
                        <input class="input-class" v-model="categoryId" placeholder="id Категории"/>
                        <button class="add-button" @click="deleteSubCategory">Удалить</button>
                    </div>

                    <div v-if="isMoveSub">
                        <input class="input-class" v-model="categoryIdForSub" placeholder="id Категории, в которую вы хотите переместить"/>
                        <input class="input-class" v-model="categoryId" placeholder="id Подкатегории"/>
                        <button class="add-button" @click="moveSub">Добавить</button>
                    </div>
                </div>

                <div class="container">
                    <p>Товар:</p>
                </div>

                <div class="flex-container">
                    <button class="add-button" @click = "isProductAdd = !isProductAdd" >Добавить</button>
                    <button class="add-button" @click = "isProductRedact = !isProductRedact">Редактировать</button>
                    <button class="add-button" @click = "isDeleteProduct = !isDeleteProduct">Удалить</button>
                    <button class="add-button" @click = "isRedactProductProperty = !isRedactProductProperty">Редактировать характеристику</button>
                    <button class="add-button" @click = "isAddProperty = !isAddProperty">Добавить характеристику</button>
                </div>

                <div class="container">
                    <div v-if="isProductAdd">
                        <input class="input-class" v-model="productAmount" placeholder="Количество товара"/>
                        <input class="input-class" v-model="productDescription" placeholder="Описание товара"/>
                        <div class="category-select">
                            <p>Есть ли скидка на товар: </p>
                            <select name="categ" v-model="productDiscount">
                            <option>{{ true }}</option>
                            <option>{{ false }}</option>
                            </select>
                        </div>
                        <input class="input-class" v-model="productDiscountPrice" placeholder="Скидочная цена"/>
                        <input class="input-class" v-model="productId" placeholder="Id товара"/>
                        <input class="input-class" v-model="productPictureUrl" placeholder="Ссылка на картинку товара"/>
                        <input class="input-class" v-model="productPrice" placeholder="Цена без скидки"/>
                        <input class="input-class" v-model="productSubcategoryId" placeholder="Id подкатегории"/>
                        <input class="input-class" v-model="productPropertyId" placeholder="Id набора характеристик"/>
                        <input class="input-class" v-model="productTitle" placeholder="Название товара"/>
                        <button class="add-button" @click="addProduct">Добавить</button>
                    </div>

                    <div v-if="isProductRedact">
                        <input class="input-class" v-model="productAmount" placeholder="Количество товара"/>
                        <input class="input-class" v-model="productDescription" placeholder="Описание товара"/>
                        <div class="category-select">
                            <p>Есть ли скидка на товар: </p>
                            <select name="categ" v-model="productDiscount">
                            <option>{{ true }}</option>
                            <option>{{ false }}</option>
                            </select>
                        </div>
                        <input class="input-class" v-model="productDiscountPrice" placeholder="Скидочная цена"/>
                        <input class="input-class" v-model="productId" placeholder="Id товара"/>
                        <input class="input-class" v-model="productPictureUrl" placeholder="Ссылка на картинку товара"/>
                        <input class="input-class" v-model="productPrice" placeholder="Цена без скидки"/>
                        <input class="input-class" v-model="productSubcategoryId" placeholder="Id подкатегории"/>
                        <input class="input-class" v-model="productPropertyId" placeholder="Id набора характеристик"/>
                        <input class="input-class" v-model="productTitle" placeholder="Название товара"/>
                        <button class="add-button" @click="redactProduct">Сохранить изменения</button>
                    </div>

                    <div v-if="isDeleteProduct">
                        <input class="input-class" v-model="productId" placeholder="id Категории"/>
                        <button class="add-button" @click="deleteProduct">Удалить</button>
                    </div>

                    <div v-if="isRedactProductProperty">
                        <input class="input-class" v-model="productPropertyRedactId" placeholder="id Свойства"/>
                        <input class="input-class" v-model="productPropertyId" placeholder="id набора свойств"/>
                        <input class="input-class" v-model="productPropertyRedactName" placeholder="Название свойства"/>
                        <input class="input-class" v-model="productPropertyRedactValue" placeholder="Значение свойства"/>
                        <button class="add-button" @click="productPropertyRedact">Сохранить изменения</button>
                    </div>

                    <div v-if="isAddProperty">
                        <input class="input-class" v-model="productPropertyId" placeholder="id свойства"/>
                        <input class="input-class" v-model="productPropertyRedactId" placeholder="id набора свойств"/>
                        <input class="input-class" v-model="productPropertyRedactName" placeholder="Название свойства"/>
                        <input class="input-class" v-model="productPropertyRedactValue" placeholder="Значение свойства"/>
                        <button class="add-button" @click="addProperty">Сохранить изменения</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { axiosInstance } from '../index.js'
import { mapActions, mapGetters } from 'vuex'
export default {
    data() {
        return {
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
            productPropertyId: '',
            isRedactProductProperty: false,
            productPropertyRedactId: '',
            productPropertyRedactName: '',
            productPropertyRedactValue: '',
            isAddProperty: false,
        }
    },
    mounted(){
        this.removePatInNavBarMass(1)       // зачистка всего в navBar 
        localStorage.setItem('nameOfCategory', '')
        localStorage.setItem('nameOfSubcategory', '')
        this.setNameByCategory('')
        this.setNameBySubcategory('')
    },
    methods: {
        ...mapActions('navbar', [
            'setAllCategoryList',
            'removePatInNavBarMass',
            'setNameByCategory',
            'setNameBySubcategory'
        ]),
        updateCategoryListInStore() {
            // записываем массив категорий в стор
            axiosInstance.get('/catalog/categories')
            .then(res =>{
                this.setAllCategoryList(res.data)
            })
            .catch(err => {console.log('Error\n', err)})
        },
        addCategory() {
            axiosInstance.post("/admin/category",{
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Категория добавлена",response), this.updateCategoryListInStore())
            .catch(err => alert("Ошибка",err))
            this.isCategoryAdd = false
        },
        redact() {
            axiosInstance.put("/admin/category",{
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Категория отредактирована",response), this.updateCategoryListInStore())
            .catch(err => alert("Категории с таким id не существует",err))
            this.isRedact = false
        },
        deleteCategory() {
            let id = this.categoryId
            axiosInstance.delete('/admin/deleteCategory/' + id,
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Категория удалена",response), this.updateCategoryListInStore())
            .catch(err => alert("Категории с таким id не существует",err))
            this.isDeleteCategory= false
        },
        addSubCategory() {
            axiosInstance.post("/admin/subcategory",{
                categoryId: this.categoryIdForSub,
                parentId: this.parentId,
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Подкатегория добавлена",response), this.updateCategoryListInStore())
            .catch(err => alert("Ошибка",err))
            this.isSubCategoryAdd = false
        },
        subRedact() {
            axiosInstance.put("/admin/subcategory",{
                categoryId: this.categoryIdForSub,
                parentId: this.parentId,
                id: this.categoryId,
                title: this.categoryTitle
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Подкатегория отредактирована",response), this.updateCategoryListInStore())
            .catch(err => alert("Ошибка",err))
            this.isSubRedact = false
        },
        deleteSubCategory() {
            let id = this.categoryId
            axiosInstance.delete('/admin/deleteSubcategory/' + id,
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Подкатегория удалена",response), this.updateCategoryListInStore())
            .catch(err => alert("Подкатегории с таким id не существует",err))
            this.isDeleteSubCategory= false
        },
        moveSub() {
            axiosInstance.put("/admin/moveSubcategoryToCategory",{
                catId: this.categoryIdForSub,
                subId: this.categoryId
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Подкатегория перемещена",response), this.updateCategoryListInStore())
            .catch(err => alert("Ошибка",err))
            this.isMoveSub = false
        },
        addProduct() {
            axiosInstance.post("/admin/product",{
                amount: this.productAmount,
                description: this.productDescription,
                discount: this.productDiscount,
                discountPrice: this.productDiscountPrice,
                id: this.productId,
                pictureUrl: this.productPictureUrl,
                price: this.productPrice,
                productPropertyId: this.productPropertyId ,
                subcategoryId: this.productSubcategoryId,
                title: this.productTitle
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Товар добавлен",response), this.isProductAdd = false)
            .catch(err => alert("Ошибка",err), this.isProductAdd = true)
        },
        deleteProduct() {
            let id = this.productId
            axiosInstance.delete('/admin/deleteProduct/' + id,
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Товар удален",response))
            .catch(err => alert("Товара с таким id не существует",err))
            this.isDeleteProduct = false
        },
        redactProduct() {
            axiosInstance.put("/admin/product",{
                amount: this.productAmount,
                description: this.productDescription,
                discount: this.productDiscount,
                discountPrice: this.productDiscountPrice,
                id: this.productId,
                pictureUrl: this.productPictureUrl,
                price: this.productPrice,
                productPropertyId: this.productPropertyId ,
                subcategoryId: this.productSubcategoryId,
                title: this.productTitle
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Товар добавлен",response), this.isProductRedact = false)
            .catch(err => alert("Ошибка",err), this.isProductRedact = true)
        },
        productPropertyRedact() {
            axiosInstance.put('/admin/property', {
                id: this.productPropertyRedactId,
                name: this.productPropertyRedactName,
                prodPropId: this.productPropertyId,
                value: this.productPropertyRedactValue
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Характеристика отредактирована",response))
            .catch(err => alert("Товара или свойства не существует",err))
            this.isRedactProductProperty = false
        },
        addProperty() {
            axiosInstance.post('/admin/property', {
                id: this.productPropertyId,
                name: this.productPropertyRedactName,
                prodPropId: this.productPropertyRedactId,
                value: this.productPropertyRedactValue
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Характеристика добавлена",response))
            .catch(err => alert("Неверный id набора свойств",err))
            this.isRedactProductProperty = false
        }
    },
    computed: {
        ...mapGetters('user', [
            'accessToken',
            'tokenType'
        ])
    }
}
</script>

<style scoped>
.h-information {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

.wrap-category {
    display:flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
    justify-content: center;
}
.input {
    color: #7f7f7f;
    height: 2em;
    width: 90%;
}

.flex-container{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    width: 50%;
}

.container{
    margin: 1%;
    width: 50%;
}

.category-select{
    display: flex;
    flex-direction: row;
    align-items: center;
    width: 100%;
    justify-content: center;
}
</style>