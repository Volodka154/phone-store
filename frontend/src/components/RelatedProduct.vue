<!-- Один элемент "соответсвующих товаров" на странице любого продукта -->
<template>
    <div class="flex-container flex-container-column"
         @click="clickOnPhone()">
        <h5 class="title-сolor max-str-2 margin-top-0">
            {{ relatedItem.title }}
        </h5>
        <div class="review-photo">
            <img class="object-fit-contain"
                 :src="relatedItem.pictureUrl">
        </div>
        <h4>{{ relatedItem.price }} руб.</h4>
    </div>
</template>
  
<script>
export default {
    props: {
        propsRelated: {
            type: Object,
            required: () => true,
            default: () => {}
        }
    },
    data() {
        return {
            relatedItem: this.propsRelated
        }
    },
    methods: {
        getSlug() {
            let slug = String(this.relatedItem.title).toLowerCase()
            slug = slug.replace(/ /ig,'-')
            slug = slug + '-' + String(this.relatedItem.id)
            return slug
        },
        clickOnPhone() {
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