<!-- Отзывы на странице товара -->
<template>
    <div>
        <div class="review-title flex-container flex-container-row">
            <h4 class="review-title__name">{{review.name}}</h4>
            <span class="review-title__date">{{review.date}}</span>
        </div>
        <div class="all-stars">
            <img v-for="index in 5"
                 :key="index"
                 class="star"
                 :src="starInReview(index)">
        </div>
        <div class="flx-jc-start review-photo flex-container flex-container-row">
            <img v-for="(item,index) in review.photo"
                 :key="index"
                 :src="item">
        </div>
        <h5 class="review-desc">{{review.description}}</h5>
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
            return index <= this.review.score ? "IosStar.svg" : "IosStarOutline.svg" 
        }
    }
}
</script>

<style>
.review-title {
    justify-content: space-between;
}
.review-title__name {
    margin-bottom: 0px;
}
.review-title__date {
    font-size: 12px;
}
.all-stars {
    margin: 20px 0px;
    text-align: left;
}
.star {
    height: 20px;
}
.review-photo {
    overflow: auto;
}
.review-photo img{
    margin-right: 10px;
    border-radius: 5px;
    width: 150px;
    height: 150px;
    object-fit: cover;
}
.review-photo img:last-child {
    margin-right: 0px;
}
.review-desc {
    font-size: 14px;
}
</style>