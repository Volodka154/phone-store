<template>
    <div class="main-wrapper">
        <p>{{ title }}</p>
        <catalog/>
        <cart/>
        <authorization/>
    </div>
</template>

<script>
    import catalog from './catalog'
    import cart from './cart'
    import authorization from './authorization'

    export default {
        name: 'main-wrapper',
        components: {
            catalog,
            cart,
            authorization
        },
        props: {},
        data() {
            return {
                title: 'Main wrapper'
            }
        },
        computed: {},
        methods: {},
        watch: {},
        mounted() {
            console.log('Hello')
        },

    }
</script>

<style>
    .main-wrapper {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        max-width: 900px;
        margin: 0 auto;
    }
</style>
