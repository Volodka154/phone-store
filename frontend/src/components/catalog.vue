<template>
    <div class="catalog">
        <catalogItem/>
    </div>
</template>

<script>

    import catalogItem from './catalog-item.vue'
    export default {
        name: 'catalog',
        components: {
            catalogItem
        },
        props: {},
        data() {
            return {}
        },
        conputed: {}
    }


</script>

<style scoped>

</style>