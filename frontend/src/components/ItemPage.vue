<!-- Страница одного товара -->
<template>
    <div class="item-page">
        <!-- открытие фото товара -->
        <div v-if="isClickOnImg"
             class="exit-back-color1">
            <div class="show-iphone"
                 ref="modalBackdrop">
                <img :src="product.pictureUrl"
                     class="show-iphone__img"
                     @click="clickOnImg"/> 
            </div>
        </div>
        <!-- Описание товара -->
        <div class="flex-container flex-container-row">
            <img :src="product.pictureUrl" 
                 class="iphone-page cursor-pointer"
                 @click="clickOnImg"/>
            <div class="name-description">
                <h2 class="title-сolor cursor-noneptr"
                    >{{ product.title }}
                </h2>
                <h5 class="description-color-page">{{ product.description }}</h5>
            </div>
            <div class="center-content">
                <div>
                    <h3>{{ product.price }} руб.</h3>
                    <h4 :class="quantityCalculate(product.status)">
                        {{ allStatus[product.status] }}
                    </h4>
                    <cart-button-gray v-if="product.status == 'EMPTY'">В корзину</cart-button-gray>
                    <cart-button v-else  @click="addToCart">В корзину</cart-button>
                </div>
            </div>
        </div>
        <!-- Характеристики -->
        <div>
            <div @click="specificationsOnDisplay"
                 class="option-item-page"
                 :style="mrgnBtmTable"
                 style="transition: 1s;"
                >Характеристики
                <img src="KeyboardArrowRightOutlined.svg"
                     class="icon-item-page"
                     :class="rotateIcon(specificationsClick)">
            </div>
            <transition-group tag="table" 
                              name="slide-fade"
                              class="table-item-page">
                <tr v-for="(value, key) in visibleRows" 
                    :key="key"
                    class="tr-item-page">
                    <td class="td-item-page">{{ value[1].name }}</td>
                    <td class="td-item-page">{{ value[1].value }}</td>
                </tr>
            </transition-group>
        </div>
        <!-- Отзывы -->
        <div>
            <div @click="reviewsOnDisplay"
                 class="option-item-page"
                >Отзывы
                <img src="KeyboardArrowRightOutlined.svg"
                     class="icon-item-page"
                     :class="rotateIcon(reviewsClick)">
            </div>
            <transition-group name="slide-fade"
                              mode="out-in"
                              class="flex-container flex-container-column">
                <div v-if="userReview"
                     class="reviews-item">
                    <p>Написать отзыв</p>
                    <div class="all-stars">
                        <img v-for="index in 5"
                             :key="index"
                             class="star"
                             @click="setScoreInReview(index)"
                             :src="starInReview(index)">
                        <p></p>
                        <div class="flex-container flex-container-row justify-content-start review-photo">
                            <img v-for="(item,index) in tempReviewsPhoto"
                                 :key="index"
                                 :src="item.dataUrl"
                                 @dblclick="removetempReviewPhoto(index)">
                        </div>
                        <input id="file"
                               type="file"
                                @change="handleFileSelect"
                                accept=".img, .png, .jpg, jpeg"
                                multiple/>
                        <p></p>
                        <input class="input-class"
                               v-model="tempReviewsDescription" 
                               placeholder="Комментарий"/>
                        <p></p>
                        <button @click="sendFeedback">
                            Отправить
                        </button>
                    </div>
                </div>
                
                <div v-for="(item,index) in visibleReviewsRows"
                     :key="index"
                     class="reviews-item">
                    <div v-if="this.userName=='ADMIN'" class="flex">
                        <button class="button-class" @click="deleteText(index)">Удалить текст</button>
                        <button class="button-class" @click="deletePicture(index)">Удалить фото</button>
                        <button class="button-class" @click="deleteReview(index)">Удалить отзыв</button>
                    </div>
                    <item-page-review :propsReview="item"/>
                </div>
            </transition-group>
        </div>
        <!-- Соответсвующие товары -->
        <div>
            <div class="cursor-noneptr option-item-page"
                >Сопутствующие товары
            </div>
            <div class="review-photo flex-container flex-container-row">
                <div v-for="item in massForRelatedProducts"
                     :key="item.id"
                     class="related-item">
                     <related-product :propsRelated="item"/>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import { mapActions, mapGetters } from 'vuex'
import cartButtonGray from "./CartButtonGray";
import cartButton from "./CartButton.vue";
import ItemPageReview from "./ItemPageReview.vue";
import RelatedProduct from "./RelatedProduct.vue";
import { storage } from '../firebase.js'
import { ref, uploadBytes, getDownloadURL } from "firebase/storage";

export default {
    components: {
        cartButton,
        cartButtonGray,
        ItemPageReview,
        RelatedProduct
    },
    data() {
        return {
            product:{},

            allStatus: {
                AVAILABLE: 'В наличии',
                LOW: 'Мало',
                EMPTY: 'Нет в наличии'
            },

            visibleRows: [],
            currentIndexForSpecifications: -1,
            visibleReviewsRows: [],
            currentIndexForReviews: -1,

            isClickOnImg: false,
            specificationsClick: false,
            reviewsClick: false,

            massForRelatedProducts: [],

            specifications: {},

            tempReviewsScore: 1,
            tempReviewsPhoto: [],
            tempReviewsDescription: '',
        }
    },
    beforeMount(){
        document.addEventListener("click", this.closeImgModal);
        document.addEventListener("keydown", this.closeImgModal);
    },
    beforeUnmount() {
        document.removeEventListener("click", this.closeImgModal);
        document.removeEventListener("keydown", this.closeImgModal);
    },
    methods: {
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
            'setNameByCategory',
            'setNameBySubcategory'
        ]),
        ...mapActions('cart', [
            'addCart'
        ]),
        handleMountedPhone(){
            let ID = this.$router.currentRoute.value.params.slug
            ID = ID.split('-').pop()
            axios.get('http://localhost:8080/api/catalog/product/' + ID)
            .then(response => {
                this.product = response.data
                const categoryTemp = this.allCategoryList.filter(item => (item.id === this.product.categoryId) ? true : false)
                const subcategoryTemp = categoryTemp[0].subcategoryDtos.filter(item => (item.id === this.product.subcategoryId) ? true: false)
                // очищаем массив navbar
                this.removePatInNavBarMass(1)
                // устанавливаем значение категории
                this.setNameByCategory(categoryTemp[0].title)
                this.addPatInNavBarMass({
                    title: categoryTemp[0].title,
                    path: '/item-list-' + categoryTemp[0].title
                    //path: this.$router.currentRoute.value.fullPath
                })
                // устанавливаем значение подкатегории
                this.setNameBySubcategory(subcategoryTemp[0].title)
                this.addPatInNavBarMass({
                    title: subcategoryTemp[0].title,
                    path: '/item-list-' + categoryTemp[0].title
                })
                // устанавливаем название
                this.addPatInNavBarMass({
                    title: this.product.title,
                    path: this.$router.currentRoute.value.fullPath
                })
            })
            .catch(err => {console.log('Error\n', err)})
            // устанавлвиваем соответсвующие товары 
            axios.get('http://localhost:8080/api/catalog')
            .then(response => {
                this.massForRelatedProducts = response.data.productDtos.filter(item => {
                    let firstWord = this.product.title.split(' ')[0]
                    let secondWord = this.product.title.split(' ')[1]
                    if (item.id == this.product.id){
                        return false
                    }
                    else if (item.title.includes(firstWord) || item.title.includes(secondWord)) {
                        return true
                    }
                    return false
                })
            })
            .catch(err => {console.log('Error\n', err)})
        },
        addToCart(){
            if (this.accessToken) {
                axios.post("http://localhost:8080/api/addProduct", {
                    productId: this.product.id
                }, {
                    headers: {
                        Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                    }
                })
                .then(() => this.addCart(1) )
                .catch(err => console.log('err', err))
            } else {
                alert("Необходима авторизация!");
            }
        },
        clickOnImg() {
            this.isClickOnImg = ! this.isClickOnImg
        },
        closeImgModal(event){
            if (event.target === this.$refs.modalBackdrop) {
                this.clickOnImg()
            }
            if (event.code === "Escape") {
                this.clickOnImg()
            }
        },
        quantityCalculate(status) {
            return "quantity-color-" + status
        },
        specificationsOnDisplay() {
            if ((this.currentIndexForSpecifications == -1) || (this.currentIndexForSpecifications == Object.entries(this.specifications).length)){
                this.specificationsClick ? this.currentIndexForSpecifications-- : this.currentIndexForSpecifications++
                this.specificationsClick = !this.specificationsClick
            }
        },
        reviewsOnDisplay() {
            if ((this.currentIndexForReviews == -1) || (this.currentIndexForReviews == this.product.userFeedbackDtos.length)){
                this.reviewsClick ? this.currentIndexForReviews-- : this.currentIndexForReviews++
                this.reviewsClick = !this.reviewsClick
            }
        },
        rotateIcon(status){
            return status ? 'rotate-90left' : 'rotate-90right'
        },
        starInReview(index){
            return index <= this.tempReviewsScore ? "IosStar.svg" : "IosStarOutline.svg" 
        },
        setScoreInReview(index){
            this.tempReviewsScore = index
        },
        sendFeedback(){
            const urlPromise = this.tempReviewsPhoto.map(file => {
                // отправка на облако firebase
                const mountainsRef = ref(storage, file.name)
                return uploadBytes(mountainsRef, file.file)
                .then(() => {
                    // получение url 
                    return getDownloadURL(mountainsRef)
                    .then(url => {
                        return url
                    })
                    .catch(err => {
                        console.log('Error:', err)
                        return null  
                    })
                })
                .catch(err => {
                    console.log('Error:', err)
                    return null
                })
            })
            Promise.all(urlPromise).then(urlMass => {
                this.visibleReviewsRows.push({
                    firstName: this.userName, 
                    lastName: '',
                    comment: this.tempReviewsDescription,
                    feedback: this.tempReviewsScore,
                    picturesUrls: this.tempReviewsPhoto.map(file => file.dataUrl),
                })
                this.currentIndexForReviews++
                axios.post(`http://localhost:8080/api/catalog/product/${this.product.id}/addFeedback`,{
                    comment: this.tempReviewsDescription,
                    feedback: this.tempReviewsScore,
                    picturesUrls: urlMass
                }, {
                    headers:{
                        Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                    }
                })
                .then(res => {this.product = res.data})
                .catch(err => {console.log('Error\n', err)})
                this.tempReviewsScore = 0
            })
        },
        handleFileSelect(e){
            const fileArr = Array.from(e.target.files)
            fileArr.forEach(file => {
                let reader = new FileReader();
                reader.onload = event => {
                    const nameOfFile = new Date() + ' - ' + file.name
                    const dataUrl = event.target.result;
                    this.tempReviewsPhoto.push({
                        name: nameOfFile,
                        file: file,
                        dataUrl: dataUrl
                    })
                }
                reader.readAsDataURL(file);
            })            
        },
        removetempReviewPhoto(index){
            this.tempReviewsPhoto.splice(index,1)
        },
        deletePicture(index){
            axios.delete('http://localhost:8080/api/admin/catalog/product/'+this.product.id+'/deletePhotosFeedback', 
            {
                data:{
                    feedbackId: this.product.userFeedbackDtos[index].userFeedbackId//id отзыва сюда
                },
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Фотография удалена",response))
            .catch(err => alert("Товара или отзыва не существует",err)) 
        },
        deleteText(index){
            axios.put('http://localhost:8080/api/admin/catalog/product/'+this.product.id+'/deleteCommentFeedback', { //id товара сюда
                feedbackId: this.product.userFeedbackDtos[index].userFeedbackId //id отзыва сюда
            },
            {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Текст удален",response))
            .catch(err => alert("Товара или отзыва не существует",err))
        },
        deleteReview(index){
            axios.delete('http://localhost:8080/api/admin/catalog/product/'+this.product.id+'/deleteFeedback',            
            {
                data:{
                    feedbackId: this.product.userFeedbackDtos[index].userFeedbackId//id отзыва сюда
                },
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => alert("Отзыв удален",response))
            .catch(err => alert("Товара или отзыва не существует",err))
        } 
    },
    computed: {
        mrgnBtmTable(){
            return this.visibleRows.length ? '' : 'margin-bottom: 0px;'
        },
        userReview(){
            if (this.reviewsClick && this.tempReviewsScore && this.accessToken){
                return true
            }
            return false
        },
        ...mapGetters('navbar', [
            'allCategoryList'
        ]),        
        ...mapGetters('user', [
            'accessToken',
            'tokenType',
            'userName'
        ])
    },
    watch:{
        '$route.params.slug': {
            immediate: true,    // обработчик вызывается и при обновлении
            handler() {
                this.handleMountedPhone()
            }
        },
        currentIndexForSpecifications(){
            this.specifications = this.product.properties
            if(this.specificationsClick){
                const newMass = Object.entries(this.specifications)
                if(this.currentIndexForSpecifications < newMass.length){
                    setTimeout(() => {
                        this.visibleRows.push(newMass[this.currentIndexForSpecifications])
                        this.currentIndexForSpecifications++
                    }, 10)
                }
            }
            else if(!this.specificationsClick && this.visibleRows.length){
                setTimeout(() => {
                    this.visibleRows.pop()
                    this.currentIndexForSpecifications--
                }, 10)
            }
        },
        currentIndexForReviews(){
            if(this.reviewsClick){
                if(this.currentIndexForReviews < this.product.userFeedbackDtos.length){
                    setTimeout(() => {
                        this.visibleReviewsRows.push(this.product.userFeedbackDtos[this.currentIndexForReviews])
                        this.currentIndexForReviews++
                    }, 10)
                }
            }
            else if(!this.reviewsClick && this.visibleReviewsRows.length){
                setTimeout(() => {
                    this.visibleReviewsRows.pop()
                    this.currentIndexForReviews--
                }, 10)
            }
        }
    }
}
</script>