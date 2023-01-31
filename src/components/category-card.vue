<template>
    <div class="category-card">
        <block :class="class1">
            <h2>{{ title }}</h2>
            <h2>{{ title }}</h2>
            <h2>{{ title }}</h2>
            <h2>{{ title }}</h2>
        </block>
    </div>
</template>

<script>
export default {
    name: "category-card",
    props: {},
    data() {
        return {
            title: "Смартфоны",
            class1: "blockClass1",
            title2: "Аудиотехника",
            title3: "Аксессуары",
        };
    },
    computed: {},
};
</script>

<style scoped>

.blockClass1 {
    width: 25%;
    background: rgb(248, 248, 248);
    border-radius: 20px;
}
</style>