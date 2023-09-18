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
import { axiosInstance } from '../index.js'
import { mapActions, mapGetters } from 'vuex'
export default {
    data() {
        return {
            login: null,
            password: null,
            refresh: '',
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
            'addCart',
            'nullCart'
        ]),
        setAuthData() {
            axiosInstance.post('/auth/login', {
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
            const token = response.data
            localStorage.setItem('tokenType', token.tokenType)
            localStorage.setItem('accessToken', token.accessToken)
            localStorage.setItem('refreshToken', token.refreshToken)
            this.setTokenType(token.tokenType)
            this.setAccessToken(token.accessToken)
            this.setRefreshToken(token.refreshToken)
            const [ , payloadBase64] = this.accessToken.split('.')
            const payload = JSON.parse(atob(payloadBase64))
            localStorage.setItem('userName', payload.username + ' ' + payload.usersurname[0] +'.')
            this.setUserName(payload.username + ' ' + payload.usersurname[0] +'.') //сейчас в токене лежит id и роль, а так же время распада токена
            if (payload.roles.includes('ADMIN')) {
                localStorage.setItem('userName', 'ADMIN')
                this.setUserName('ADMIN')
            }
            localStorage.setItem('userRole', payload.roles)
            this.setUserRole(payload.roles)
            this.$router.push({name: 'catalog'})
            axiosInstance.get("/cart", {
                headers: {
                    //Authorization: `${token.tokenType} ${response.data.accessToken}` // Передаем токен в заголовке запроса
                    Authorization: `${localStorage.getItem('tokenType')} ${localStorage.getItem('accessToken')}` // Передаем токен в заголовке запроса
                }
            })
            .then(res => { 
                this.nullCart()
                this.addCart(res.data.count)
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