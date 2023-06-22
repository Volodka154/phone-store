<!-- Страница одного товара -->
<template>
    <div class="item-page">
        <!-- открытие фото товара -->
        <div v-if="isClickOnImg"
             class="exit-back-color1">
            <div class="show-iphone"
                 ref="modalBackdrop">
            <img :src="this.product.pictureUrl"
                    class="show-iphone__img"
                    @click="clickOnImg"/> 
            </div>
        </div>

        <div class="flex-container flex-container-row">
            <img :src="this.product.pictureUrl" 
                 class="iphone"
                 @click="clickOnImg"/>
            <div class="name-description">
                <h2 class="title-сolor cursor-noneptr"
                    >{{ this.product.title }}
                </h2>
                <h5 class="description-color">{{ this.product.description }}</h5>
            </div>
            <div class="center-content">
                <div>
                    <h3>{{ this.product.price }} руб.</h3>
                    <h4 :class="quantityCalculate(this.product.status)">
                        {{ allStatus[this.product.status] }}
                    </h4>
                    <cart-button-gray v-if="this.product.status == 'EMPTY'" />
                    <cart-button v-else  @click="addToCart(id)"/>
                </div>
            </div>
        </div>
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
                    <td class="td-item-page">{{ value[0] }}</td>
                    <td class="td-item-page">{{ value[1] }}</td>
                </tr>
            </transition-group>
        </div>

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
                <div v-for="(item,index) in visibleReviewsRows"
                    :key="index"
                    class="reviews-item">
                        <ItemPageReview :propsReview="item"/>
                </div>
            </transition-group>
        </div>
        <div class="cursor-noneptr">
            <div class="option-item-page">
                Сопутствующие товары
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import cartButtonGray from "./cart-button-gray";
import cartButton from "./cart-button.vue";
import ItemPageReview from "./ItemPageReview.vue";
import { mapActions, mapGetters } from 'vuex'
export default {
    components: {
        cartButton,
        cartButtonGray,
        ItemPageReview
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
            currentIndex: -1,
            visibleReviewsRows: [],
            currentIndexForReviews: -1,

            isClickOnImg: false,
            specificationsClick: false,
            reviewsClick: false,

            titleOfCategory: 'Смартфоны',
            titleOfSubcategory: '',

            specifications: {
                'Операционная система': 'iOS',
                'Разрешение экрана': '2796x1290 Пикс',
                'Экран': '6.7"/2796x1290 Пикс',
                'Технология экрана': 'OLED',
                'Тип экрана': 'Super Retina XDR Pro Motion',
                'Частота обновления': '120 Гц',
                'Яркость': '2000 кд/кв.м',
                'Тип процессора': 'A16 Bionic',
                'Количество ядер': '6',
                'Встроенная память (ROM)': '128 ГБ',
                'Количество основных камер': '3 шт',
                'Основная камера МПикс': '48/12/12',
                'Вспышка': 'Да',
                'Оптический зум на увеличение (x)': '6'
            },
            reviews: [
            {
                    name: 'NNikiTOS',
                    score: 5,
                    photo: [
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                    ],
                    date: "05.04.2023",
                    description: 'В целом норм, но можно было и лучше.'
                },
                {
                    name: 'Fialka',
                    score: 1,
                    photo: [
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjIQzvLBWKeyXFYm3-ELXQJTqytGX4c15Jpg&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjIQzvLBWKeyXFYm3-ELXQJTqytGX4c15Jpg&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjIQzvLBWKeyXFYm3-ELXQJTqytGX4c15Jpg&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjIQzvLBWKeyXFYm3-ELXQJTqytGX4c15Jpg&usqp=CAU',
                    ],
                    date: "06.04.2023",
                    description: 'В целом норм, но можно было и лучше.'
                },
                {
                    name: 'LopiTalk',
                    score: 2,
                    photo: [
                        'https://icdn.lenta.ru/images/2021/07/30/11/20210730113026240/square_320_cbd61957ca82963760b8544edfd20b31.jpg',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjIQzvLBWKeyXFYm3-ELXQJTqytGX4c15Jpg&usqp=CAU'
                    ],
                    date: "07.04.2023",
                    description: 'В целом норм, но можно было и лучше.'
                }
            ]
        };
    },
    beforeMount(){
        document.addEventListener("click", this.closeImgModal);
        document.addEventListener("keydown", this.closeImgModal);
    },
    mounted(){
        let ID = this.$router.currentRoute.value.params.slug
        ID = ID.split('-').pop()
        axios.get('http://localhost:8080/api/catalog/product/' + ID)
        .then(response => {
            this.product = response.data
            this.titleOfCategory = 'Смартфоны'
            this.titleOfSubcategory = response.data.title.split(' ')[0]
        })
        .catch(err => {console.log('Error\n', err)})
    },
    updated(){
        this.removePatInNavBarMass(1)
        this.addPatInNavBarMass({
            title: this.titleOfCategory,
            path: this.$router.currentRoute.value.fullPath
        })
        this.addPatInNavBarMass({
            title: this.titleOfSubcategory,
            path: this.$router.currentRoute.value.fullPath
        })
        this.addPatInNavBarMass({
            title: this.product.title,
            path: this.$router.currentRoute.value.fullPath
        })
    },
    beforeUnmount() {
        document.removeEventListener("click", this.closeImgModal);
        document.removeEventListener("keydown", this.closeImgModal);
    },
    watch:{
        currentIndex(){
            if(this.specificationsClick){
                const newMass = Object.entries(this.specifications)
                if(this.currentIndex < newMass.length){
                    setTimeout(() => {
                        this.visibleRows.push(newMass[this.currentIndex])
                        this.currentIndex++
                    }, 25)
                }
            }
            else if(!this.specificationsClick && this.visibleRows.length){
                setTimeout(() => {
                    this.visibleRows.pop()
                    this.currentIndex--
                }, 25)
            }
        },
        currentIndexForReviews(){
            if(this.reviewsClick){
                if(this.currentIndexForReviews < this.reviews.length){
                    setTimeout(() => {
                        this.visibleReviewsRows.push(this.reviews[this.currentIndexForReviews])
                        this.currentIndexForReviews++
                    }, 50)
                }
            }
            else if(!this.reviewsClick && this.visibleReviewsRows.length){
                setTimeout(() => {
                    this.visibleReviewsRows.pop()
                    this.currentIndexForReviews--
                }, 50)
            }
        }
    },
    methods: {
        ...mapGetters('navbar', [
            'pathInNavBarMass'
        ]),
        ...mapActions('navbar', [
            'addPatInNavBarMass',
            'removePatInNavBarMass',
        ]),
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
            if ((this.currentIndex == -1) || (this.currentIndex == Object.entries(this.specifications).length)){
                this.specificationsClick ? this.currentIndex-- : this.currentIndex++
                this.specificationsClick = !this.specificationsClick
            }
        },
        reviewsOnDisplay() {
            if ((this.currentIndexForReviews == -1) || (this.currentIndexForReviews == this.reviews.length)){
                this.reviewsClick ? this.currentIndexForReviews-- : this.currentIndexForReviews++
                this.reviewsClick = !this.reviewsClick
            }
        },
        rotateIcon(status){
            return status ? 'rotate-90left' : 'rotate-90right'
        }
    },
    computed: {
        mrgnBtmTable(){
            console.log(this.visibleRows.length)
            return this.visibleRows.length ? '' : 'margin-bottom: 0px;'
        }
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
/*
.tr-item-page-old {
    animation: tableRowAnimation 0.6s;
    transition-timing-function: ease-in-out;
    animation-fill-mode: forwards;
}
@keyframes tableRowAnimation {
  from {
    opacity: 0;
    border-bottom:#fcfcfc;
    transform: translateY(-15px);
  }
  to {
    opacity: 1;
    border-bottom: 1px solid #f2f2f2;
    transform: translateY(0);
  }
}
 */
.reviews-item {
    margin-top: 20px;
    text-align: left;
    padding: 10px;
    border-radius: 5px;
    background-color: rgb(240, 240, 240, 1);
    box-shadow: 0px 0px 50px 10px rgb(222, 222, 222);
}

.description-color {
    -webkit-line-clamp: 20;
    font-size: 16px;
}
.iphone {
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
</style>