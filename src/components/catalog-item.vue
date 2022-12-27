<template>
    <div class="catalogItem">
        <p>Item 1</p>
        <p> Price 100</p>
        <p>Add to cart</p>
    </div>
</template>

<script>
    export default {
        name: 'catalog-item',
        props: {},
        data() {
            return {}
        },
        conputed: {}
    }
</script>

<style scoped>
    .catalogItem {
        display: flex;
        flex-direction: column;
    }


</style>