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
import { mapActions } from 'vuex'
export default {
    data() {
        return {
            login: null,
            password: null,
            refresh: '',
        }
    },
    mounted() {
        this.removePatInNavBarMass(1)       // зачистка всего в navBar 
        localStorage.setItem('nameOfCategory', '')
        localStorage.setItem('nameOfSubcategory', '')
        this.setNameByCategory('')
        this.setNameBySubcategory('')
    },
    methods: {
        ...mapActions('user', [
            'setUserState'
        ]),
        ...mapActions('cart', [
            'addCart',
            'nullCart'
        ]),
        ...mapActions('navbar', [
            'removePatInNavBarMass',
            'setNameByCategory',
            'setNameBySubcategory'
        ]),
        setAuthData() {
            axiosInstance.post('/auth/login', {
                userEmail: String(this.login),
                userPassword: String(this.password)
            })
            .then(response => this.nameOnHeader(response))
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
            const [ , payloadBase64] = token.accessToken.split('.')
            const payload = JSON.parse(atob(payloadBase64))
            let userNameForState = payload.roles.includes('ADMIN') 
                ? 'ADMIN' 
                : `${payload.username} ${payload.usersurname[0]}.`
            this.setUserState([
                userNameForState, 
                payload.roles,
                token.tokenType,
                token.accessToken, 
                token.refreshToken,
            ])
            this.$router.push({name: 'catalog'})
            axiosInstance.get("/cart", {
                headers: {
                    Authorization: `${token.tokenType} ${token.accessToken}` // Передаем токен в заголовке запроса
                }
            })
            .then(res => { 
                this.nullCart()
                this.addCart(res.data.count)
            })
            .catch(err => console.log(err))            
        }
    },
}
</script>