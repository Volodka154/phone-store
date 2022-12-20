<template>
    <div class="registration">
        <p>Если уже зарегистрированы, нажмите</p>
        <button>Authorization</button>

        <authorization/>
    </div>
</template>

<script>
    import authorization from './authorization';

export default {
    name: 'registration',
    components: {
        authorization
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