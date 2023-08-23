<!-- Отзывы на странице товара -->
<template>
    <div>
        <div class="flex-container flex-container-row">
            <h4 class="margin-bottom-0">
                {{review.lastName + ' ' + review.firstName}}
            </h4>
        </div>
        <div class="all-stars">
            <img v-for="index in 5"
                 :key="index"
                 class="star"
                 :src="starInReview(index)">
        </div>
        <div class="justify-content-start review-photo flex-container flex-container-row">
            <img v-for="(item,index) in review.picturesUrls"
                 :key="index"
                 :src="item">
        </div>
        <h5 class="review-desc">{{review.comment}}</h5>
    </div>
</template>

<script>
export default {
    props: ["propsReview"],
    data(){
        return {
            review: this.propsReview,
        }
    },
    methods: {
        starInReview(index){
            return index <= this.review.feedback ? "IosStar.svg" : "IosStarOutline.svg" 
        }
    }
}
</script>