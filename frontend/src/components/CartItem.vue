<template>
    <div class="cart-item" v-for="(product,id) in products" :key="id">
        <input class="checkbox" type="checkbox" id="checkbox" v-model="checked"/>
        <img class="image" :src="product.pictureUrl"/>
        <p class="title">{{ product.title }}</p>
        <div class="count">
            <div class="amount">
                <button class="btn-count" @click="countPlus(product.id)">-</button>
                <p>1</p>
                <button class="btn-count" @click="countMinus(product.id)">+</button>
            </div>
            <p class="delete" @click="deleteProduct(product.id)">Удалить</p>
        </div>
        <p class="price">{{ product.price }}</p>
    </div>
</template>

<script>
import { mapActions, mapGetters} from "vuex";
// import axios from "axios";
export default {
    name: 'cart',
    props: {},
    data() {
        return {
            products:[]
        };
    },
    computed: {
        ...mapGetters('cart',[
            'productsInCartList'
        ]),
    },
    methods: {
        ...mapActions('cart', [
            'addProductInCart',
            'removeProductOutCart'
        ]),
     
        /*
       countPlus(id){
            
            axios.get("http://localhost:8080/api/addProduct", {
                productId:this.id
            })
            .then(response => console.log(response))
            .catch(err => console.log(err))
        },
        countMinus(id){

        },  */
        deleteProduct(id){
            this.removeProductOutCart(id)
            this.products = this.productsInCartList
        }
    },
    mounted(){
        this.products = this.productsInCartList

       // axios.get("http://localhost:8080/api/catalog/product/"+this.id)
       // .then(res => console.log(res))
       // .catch(err => console.log(err))
    }
}
</script>

<style scoped>
    .cart-item {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
    }


    .image {
        height: 15%;
        width: 15%;
    }

    .title {
        top: 0;
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

    
    .checkbox{
        width: 20px;
        height: 20px;
    }

</style>