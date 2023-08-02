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
    methods: {
        ...mapActions('navbar', [
            'removePatInNavBarMass',
            'addPatInNavBarMass',
        ]),
        ...mapGetters('cart', [
            'productInCartList'
        ])
    },
    mounted(){
        this.removePatInNavBarMass(1)
        this.addPatInNavBarMass({
            title: 'Корзина',
            path: this.$router.currentRoute.value.fullPath
        })
        axios.post('http://localhost:8080/api/auth/login', {
            userEmail: 'ww@w.ww',
            userPassword: 'ww'
        })
        .then(response => {
            if (response.status === 200) {
                const token = response.data.accessToken; // Получаем токен из ответа сервера
                axios.get("http://localhost:8080/api/cart", {
                    headers: {
                        Authorization: `Bearer ${token}` // Передаем токен в заголовке запроса
                    }
                })
                .then(response => {
                    this.productInCartMass = response.data
                    console.log(response)
                })
                .catch(err => console.log(err))
            } else {
                alert("Неверно введены данные или такой email уже зарегистрирован!");
            }
            
        })
        .catch(err => console.log(err));
    }
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