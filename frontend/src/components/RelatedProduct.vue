<!-- Один элемент "соответсвующих товаров" на странице любого продукта -->
<template>
    <div class="flex-container flex-container-column"
         @click="clickOnPhone()">
        <h5 class="title-сolor max-str-2 mrgn-top-0">{{ relatedItem.title }}</h5>
        <div class="review-photo">
            <img :src="relatedItem.pictureUrl"
            class="related-photo">
        </div>
        <h4>{{ relatedItem.price }} руб.</h4>
    </div>
</template>
  
<script>
export default {
    name: 'related-product',
    props: ['propsRelated'],
    data() {
        return {
            relatedItem: this.propsRelated
        }
    },
    methods: {
        getSlug(){
            let slug = String(this.relatedItem.title).toLowerCase()
            slug = slug.replace(/ /ig,'-')
            slug = slug + '-' + String(this.relatedItem.id)
            return slug
        },
        clickOnPhone(){
            const nameInRoute = this.$router.currentRoute.value.params.name
            this.$router.push({
                name: 'itemPage',
                params:{
                    name: nameInRoute, 
                    slug: this.getSlug()
                }
            })
        }

    }
}
</script>

<style>
.max-str-2{
    line-height: 1.1rem;
    text-overflow: ellipsis; /* Добавление многоточия, если текст обрезан */
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.mrgn-top-0{
    margin-top: 0px !important;
}
.related-item {
    margin: 5px 10px;
    text-align: left;
    padding: 10px;
    border-radius: 5px;
    background: linear-gradient(to bottom, rgba(240, 240, 240, 1), rgba(240, 240, 240, 0.5));
}
.related-item:first-child{
    margin-left: 0px;
}
.related-photo{
    object-fit: contain !important;
}
</style>