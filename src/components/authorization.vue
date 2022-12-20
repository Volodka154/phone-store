<template>
    <div class="authorization">
        <p>Ещё не зарегистрировались? Нажмите</p>
        <button>registration</button>
        
        <registration/>
    </div>
</template>

<script>
    import registration from './registration'

export default {
    name: 'authorization',
    components: {
        registration
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