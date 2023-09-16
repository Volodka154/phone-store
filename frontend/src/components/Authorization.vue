<!-- Компонент отвечающий за модальное окно авторизации -->
<template>
    <div class="authorization">
        <h3>Вход в личный аккаунт</h3>
        <p>
            <input v-model="login" 
                   placeholder="Email"/>
        </p>
        <p>
            <input v-model="password" 
                   placeholder="Пароль"/>
        </p>
        <button class="btn-autorisation" @click="setAuthData">Войти</button>
        <p class="href"
            @click="clickOnCreateAccount">Нет аккаунта? Создать</p>
    </div>
</template>

<script>
import axios from "axios"
import { mapActions, mapGetters } from 'vuex'
export default {
    data() {
        return {
            login: null,
            password: null,
            refresh: '',
            product: []
        }
    },
    methods: {
        ...mapActions('user', [
            'setTokenType',
            'setUserName',
            'setUserRole',
            'setAccessToken',
            'removeUserName',
            'setRefreshToken'
        ]),
        ...mapActions('cart', [
            'addCart'
        ]),
        setAuthData() {
            axios.post('http://localhost:8080/api/auth/login', {
                userEmail: String(this.login),
                userPassword: String(this.password)

            }).then(response => this.nameOnHeader(response))
            .catch(err => alert("Неверно введены данные", err))
        },
        clickOnCreateAccount() {
            this.$router.push({
                name: 'registration',
                query: {
                    nameOfProps: 'registration',
                }
            })
        },
        nameOnHeader(response) {
            const token = response.data;
            this.setTokenType(token.tokenType)
            this.setAccessToken(token.accessToken)
            this.setRefreshToken(token.refreshToken)
            const [ , payloadBase64] = this.accessToken.split('.');
            const payload = JSON.parse(atob(payloadBase64));
            this.setUserName(payload.username + ' ' + payload.usersurname[0] +'.'); //сейчас в токене лежит id и роль, а так же время распада токена
            if (payload.roles.includes('ADMIN')) {
                this.setUserName('ADMIN')
            }
            this.setUserRole(payload.roles)
            this.$router.push({name: 'catalog'})
            axios.get("http://localhost:8080/api/cart", {
                headers: {
                    Authorization: `Bearer ${response.data.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(res => { 
                this.product = res.data.count
                this.addCart(this.product)
            })
            .catch(err => console.log(err))            
        }
    },
    computed: {
        ...mapGetters('user', [
            'userName',
            'accessToken'
        ])
    }
}
</script>