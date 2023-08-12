<template>
    <div class="item-page flex-container flex-container-row">
        <div class="cart-list">
            <h3>Корзина</h3>
            <div v-for="(item) in productInCartMass.userProductDtos"
                 :key="item.id">
                <cart-item :infoItem="item"/>
            </div>
        </div>
        <cart-finish :propsCount="productInCartMass.count"
                     :propsPrice="productInCartMass.fullPrice"/>
    </div>
</template>

<script>
import cartItem from './CartItem.vue'
import cartFinish from './CartFinish.vue'
import axios from 'axios'
import { mapActions, mapGetters } from 'vuex'

export default {
    components: {
        cartItem,
        cartFinish
    },
    data() {
        return {
            productInCartMass: {}
        }
    },
    computed: {
        ...mapGetters('cart', [
            'productInCartList'
        ]),
        ...mapGetters('user', [
            'tokenType',
            'accessToken'
        ])
    },
    methods: {
        ...mapActions('navbar', [
            'removePatInNavBarMass',
            'addPatInNavBarMass',
        ]),
    },
    mounted(){
        this.removePatInNavBarMass(1)
        this.addPatInNavBarMass({
            title: 'Корзина',
            path: this.$router.currentRoute.value.fullPath
        })
        
        if (this.accessToken) {
            axios.get("http://localhost:8080/api/cart", {
                headers: {
                    Authorization: `${this.tokenType} ${this.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(response => {
                this.productInCartMass = response.data
            })
            .catch(err => console.log(err))
        } else {
            alert("Необходима авторизация!");
        }       
    },
}
</script>

<style scoped>
    .cart-list {
        align-self: flex-start;
        width: 70%;
    }
    .summ {
        align-self: flex-end;
        align-self: center;
        margin-left:3%;
        width: 25%;
        height: 60%;
        background-color: white;
        border-radius: 20px;
    }
</style>