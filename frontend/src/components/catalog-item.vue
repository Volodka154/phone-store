<template>
    <div class="catalogItem">
        <img class="image" src="https://klike.net/uploads/posts/2020-07/1594278030_1.jpg"/>
        <div class="box-description">
            <router-link to="/product">
                <p class="title">Название телефона</p>
            </router-link>
            <p class="description">Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. 
                Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. 
                Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. Большое описание. 
            </p>
        </div>
        <p class="isHave">В наличии</p>
        <div class="box-price">
            <p class="price">20 533 р.</p>
            <button class="btn-cart">В корзину</button>
        </div>
        <router-view></router-view>
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
        flex-direction: row;
        align-items: center;

    }

    .image {
        height: 15%;
        width: 13%;
    }

    .box-description {
        width: 65%;
    }

    .box-price {
        width: 15%;
    }

    .price {
        font-size: smaller;
    }

    .isHave {
        width: 7%;
        font-size: small;
        color: rgb(64, 202, 64);
    }

    .title {
        text-align: left;
        color: rgb(64, 202, 64);
    }

    .description {
        text-align: left;
    }

    .btn-cart {
        background-color: rgba(45, 101, 255, 0.603);
        color: white;
        padding: 2%;
        border: none;
    }


</style>