<template>
    <div class="cart-item">
        <input class="checkbox" type="checkbox" id="checkbox" v-model="checked"/>
        <img class="image" src="https://klike.net/uploads/posts/2020-07/1594278030_1.jpg"/>
        <p class="title">Смартфон</p>
        <div class="count">
            <div class="amount">
                <button class="btn-count">-</button>
                <p>1</p>
                <button class="btn-count">+</button>
            </div>
            <p class="delete">Удалить</p>
        </div>
        <p class="price">20 542 р.</p>
    </div>
</template>

<script>
export default {
    name: 'cart',
    props: {},
    data() {
        return {}
    },
    conputed: {}
}
</script>

<style scoped>
    .cart-item {
        display: flex;
        flex-direction: row;
    }


    .image {
        height: 15%;
        width: 15%;
    }

    .title {
        color: rgb(65, 190, 65);
        width: 45%;
        text-align: left;
    }

    .amount {
        display: flex;
        flex-direction: row;
        align-items: baseline;
    }

    .count {
        display: flex;
        flex-direction: column;
        width: 15%;
        align-items: center;
    }

    .btn-count {
        height: 20px;
        width: 20px;
        margin: 1ch;
    }

    .price {
        font-size: smaller;
        width: 20%;
    }

    .delete {
        color: rgb(87, 155, 219);
    }

</style>