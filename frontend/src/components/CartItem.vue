<template>
    <div class="flex-container center-content one-item">
        <!--<input class="checkbox" type="checkbox" id="checkbox" v-model="checked"/>-->
        <img :src="product.pictureUrl"
             class="iphone"
             style="cursor: default;"/>
        <p class="title__cart"
           >{{ product.title }}
        </p>
        <div class="count__cart">
            <div class="amount__cart">
                <button @click="countMinus(product.id)"
                        class="btn-count"
                    >-
                </button>
                <p>{{ product.amount }}</p>
                <button @click="countPlus(product.id)"
                        class="btn-count"
                    >+
                </button>
            </div>
            <p @click="deleteProduct(product.id)"
               class="delete__cart"
                >Удалить
            </p>
        </div>
        <p class="price__cart">{{ product.price }}</p>
    </div>
</template>

<script>
import { mapActions, mapGetters} from "vuex";
import axios from "axios";
export default {
    name: 'cart',
    props: ['infoItem'],
    data() {
        return {
            product: this.infoItem ? this.infoItem : []
        };
    },
    computed: {
        ...mapGetters('cart',[
            'productsInCartList'
        ]),        
        ...mapGetters('user', [
            'tokenType',
            'accessToken',
        ]),
    },
    methods: {
        ...mapActions('cart', [
            'addProductInCart',
            'removeProductOutCart'
        ]),
        countPlus(id){
            console.log(this.tokenType)
            axios.put('http://localhost:8080/api/cart/addAmount',{
                productId: id
            }, {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(res => console.log(res))
            .catch(err => console.log(err))
                
        },
        countMinus(id){
            axios.post('http://localhost:8080/api/cart/reduceAmount',{
                productId: id
            }, {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(res => console.log(res))
            .catch(err => console.log(err))
        },
        deleteProduct(id){
            axios.delete('http://localhost:8080/api/cart/deleteProduct', {
                data: {
                    productId: id
                },
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            }).then(res => console.log(res))
            .catch(err => console.log(err))
        }
    }
}
</script>

<style scoped>
    .amount__cart {
        display: flex;
        flex-direction: row;
        align-items: baseline;
        justify-content: center;
    }

    .title__cart {
        color: #33b75c;
    }
    .count__cart {
        width: 25%;
        align-items: center;
    }

    .btn-count {
        height: 20px;
        width: 20px;
        margin: 1ch;
    }

    .price__cart {
        font-size: smaller;
        width: 20%;
    }

    .delete__cart {
        color: rgb(87, 155, 219);
        cursor: pointer;
        margin: 0px 0px;
    }
    .delete__cart:hover {
        color: rgb(39, 107, 171);
    }
    
    .checkbox{
        width: 20px;
        height: 20px;
    }
</style>