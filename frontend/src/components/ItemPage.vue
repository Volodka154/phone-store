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
                 class="iphone-page"
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
                    <cart-button-gray v-if="product.status == 'EMPTY'" />
                    <cart-button v-else  @click="addToCart"/>
                </div>
            </div>
        </div>
        <!-- Характеристики -->
        <div>
            <div @click="specificationsOnDisplay"
                 class="option-item-page"
                 :style="mrgnBtmTable">
                Характеристики
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
                 class="option-item-page">
                Отзывы
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
                        <div class="flx-jc-start review-photo flex-container flex-container-row">
                            <img v-for="(item,index) in tempReviewsPhoto"
                                 :key="index"
                                 :src="item"
                                 @dblclick="removetempReviewPhoto(index)">
                        </div>
                        <input id="fileItem"
                               type="file"
                               @change="handleFileSelect"
                               accept=".img, .png, .jpg, jpeg"
                               style="padding-left: 0px;"
                               multiple />
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
                        <div class="flex" v-if="this.userId=='ADMIN'">
                
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
            <div class="cursor-noneptr option-item-page">
                Сопутствующие товары
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
import cartButtonGray from "./CartButtonGray";
import cartButton from "./CartButton.vue";
import ItemPageReview from "./ItemPageReview.vue";
import RelatedProduct from "./RelatedProduct.vue";
import { mapActions, mapGetters } from 'vuex'
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

            titleOfCategory: 'Смартфоны',
            titleOfSubcategory: '',

            massForRelatedProducts: [],

            specifications: {
            },

            tempReviewsScore: 1,
            tempReviewsPhoto: ['https://c.dns-shop.ru/thumb/st1/fit/0/0/1cc5440fcbbaae8e5697e61f15d0980f/0a5d4dcd76ccf1183e108eab7b641de4b90111291756c7685498824cbf867f17.jpg.webp'],
            tempReviewsDescription: '',
        };
    },
    beforeMount(){
        document.addEventListener("click", this.closeImgModal);
        document.addEventListener("keydown", this.closeImgModal);
    },
    beforeUnmount() {
        document.removeEventListener("click", this.closeImgModal);
        document.removeEventListener("keydown", this.closeImgModal);
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
            console.log(this.userId)
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
    },
    methods: {
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
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
                this.titleOfCategory = this.nameOfCategory ? this.nameOfCategory : "Категория"
                this.addPatInNavBarMass({
                    title: categoryTemp[0].title,
                    path: '/item-list-' + categoryTemp[0].title
                    //path: this.$router.currentRoute.value.fullPath
                })
                // устанавливаем значение подкатегории
                this.titleOfSubcategory = this.nameOfSubcategory ? this.nameOfSubcategory : "Подкатегория"
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
            console.log('this.currentIndexForReviews', this.currentIndexForReviews)
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
            if(this.tempReviewsDescription){                
                this.visibleReviewsRows.push({
                    comment: this.tempReviewsDescription,
                    feedback: this.tempReviewsScore,
                    picturesUrls: this.tempReviewsPhoto,
                })
                this.currentIndexForReviews++

                axios.post(`http://localhost:8080/api/catalog/product/${this.product.id}/addFeedback`,{
                    comment: this.tempReviewsDescription,
                    feedback: this.tempReviewsScore,
                    picturesUrls: this.tempReviewsPhoto
                }, {
                    headers:{
                        Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                    }
                })
                .then(res => {this.product = res.data})
                .catch(err => {console.log('Error\n', err)})

                this.tempReviewsScore = 0
            }
        },
        handleFileSelect(e){
            let fileArr = Array.prototype.slice.call(e.target.files)
            fileArr.forEach(item => {
                if (!item.type.match('image.*')){
                    return
                }

                let reader = new FileReader()
                reader.onload = (e) => {
                    this.tempReviewsPhoto.push(e.target.result)
                }
                reader.readAsDataURL(item)      // запуск процесса чтения файла
            });
            console.log(this.tempReviewsPhoto)
        },
        removetempReviewPhoto(index){
            this.tempReviewsPhoto.splice(index,1)
        },
        deletePicture(index){
            console.log(this.product)
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
            console.log()
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
            'nameOfCategory',
            'nameOfSubcategory',
            'allCategoryList'
        ]),        
        ...mapGetters('user', [
            'accessToken',
            'tokenType',
            'userId'
        ])
    }
};
</script>

<style>
.slide-fade-enter-active {
    animation: tableRowAnimationIn 0.5s ease-in-out forwards;
}
.slide-fade-leave-active {
    animation: tableRowAnimationOut 0.5s ease-in-out forwards;    

}
@keyframes tableRowAnimationIn {
  from {
    opacity: 0;
    border-bottom: 1px solid #ffffff;
    transform: translateY(-15px);
  }
  to {
    opacity: 1;
    border-bottom: 1px solid #f2f2f2;
    transform: translateY(0);
  }
}
@keyframes tableRowAnimationOut {
  from {
    opacity: 1;
    border-bottom: 1px solid #f2f2f2;
    transform: translateY(0);
  }
  to {
    opacity: 0;
    border-bottom:1px solid #fcfcfc;
    transform: translateY(-15px);
  }
}

.table-item-page {
    width: 100%;
    border-collapse: collapse;
    text-align: left;
}
.tr-item-page:nth-child(odd){
    background-color: #f7f7f7;
}
.tr-item-page:nth-child(even){
    background-color: #fcfcfc;
}
.tr-item-page:last-child {
    border-bottom: none;
}
.td-item-page {
    padding: 8px;
    width: 50%;
}

.cursor-noneptr {
    pointer-events: none;
}
.reviews-item {
    margin-top: 20px;
    padding: 10px;
    border-radius: 5px;
    background-color: rgb(240, 240, 240, 1);
    box-shadow: 0px 0px 50px 10px rgb(222, 222, 222);
}

.description-color-page {
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 0;
    -webkit-box-orient: vertical;
    font-size: 16px;
    text-align: left;

}
.iphone-page {
    align-self: center;
    width: 250px;
}
.show-iphone {
    z-index: 1000;
    position: fixed;
    display: flex;
    justify-content: center;
    height: 80%;
    width: 100%;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    transform: 1s;
}
.show-iphone__img {
    width: auto;
    height: auto;
    object-fit: contain;
    border-radius: 30px;
    border: 5px solid #ffffff;
}
.title-сolor {
    color: #33b75c;
    cursor: auto;
}
.icon-item-page {
    width: 24px;
    position: absolute;
}
.rotate-90left{
    transform: rotate(90deg);
    transform-origin: center center;
    transition: 0.4s;
}
.rotate-90right{
    transform: rotate(0deg);
    transform-origin: center center;
    transition: 0.4s;
}

.option-item-page {
    cursor: pointer;
    font-size: 18px;
    margin: 20px 0px;
}
.option-item-page:hover {
    color: rgb(110, 110, 110);
}

.flex{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    justify-items: center;
    width: 30%;
}
</style>