<template>
    <div class="item-page flex-container flex-container-row">
        <div class="cart-list">
            <h3>Корзина</h3>
            <div v-for="(item) in productMass"
                 :key="item.id">
                 <cart-item :infoItem="item" 
                            @update="handleMountedCart()"/>
            </div>
        </div>
        <cart-finish :propsCount="productInCartMass.count"
                     :propsPrice="productInCartMass.fullPrice" 
                     @update="handleMountedCart()"/>
    </div>
</template>

<script>
import axios from 'axios'
import { mapActions, mapGetters } from 'vuex'
import cartItem from './CartItem.vue'
import cartFinish from './CartFinish.vue'
export default {
    components: {
        cartItem,
        cartFinish
    },
    data() {
        return {
            productInCartMass: {},
            productMass: []
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
        handleMountedCart(){
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
                    this.productMass = this.productInCartMass.userProductDtos
                })

                .catch(err => console.log(err))
            } else {
                alert("Необходима авторизация!");
            }   
        }
    },
    mounted(){    
        this.handleMountedCart()
    }
}
</script>