<!-- Компонент отвечающий за модальное окно авторизации -->
<template>
    <div class="authorization">
        <h3>Вход в личный аккаунт</h3>
        <p>
            <input class="input-class"
                    v-model="login" 
                    placeholder="Email"/>
        </p>
        <p>
            <input class="input-class"
                    v-model="password" 
                    placeholder="Пароль"/>
        </p>
        <button class="btn-autorisation" @click="onClick">Войти</button>
        <p class="href"
            @click="clickOnCreateAccount">Нет аккаунта? Создать</p>
    </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
import axios from "axios";
export default {
    name: 'authorization',
    props: {},
    data() {
        return {
            login: null,
            password: null,
            refresh: ''
        }
    },
    methods: {
        ...mapActions('user', [
            'setTokenType',
            'setUserId',
            'setUserRole',
            'setAccessToken',
            'removeUserId',
            'setRefreshToken'
        ]),
        onClick() {
            axios.post('http://localhost:8080/api/auth/login', {
                userEmail: String(this.login),
                userPassword: String(this.password)

            }).then(response => this.nameOnHeader(response))
            .catch(err => alert("Неверно введены данные", err));
            
        },
        clickOnCreateAccount() {
            this.$router.push({name: 'registration'})
        },
        nameOnHeader(response){
            const token = response.data;
            this.setTokenType(token.tokenType)
            this.setAccessToken(token.accessToken)
            this.setRefreshToken(token.refreshToken)
            const [headerBase64, payloadBase64] = this.accessToken.split('.');

            const header = JSON.parse(atob(headerBase64));
            const payload = JSON.parse(atob(payloadBase64));
            console.log(payload)
            console.log(header);
            this.setUserId(payload.username + ' ' + payload.usersurname[0] +'.'); //сейчас в токене лежит id и роль, а так же время распада токена
            console.log(payload.username)
            let i = this.userId
            console.log(i)
            if (payload.roles.includes('ADMIN')){
                this.setUserId('ADMIN')
            }
            this.setUserRole(payload.roles)
            this.$router.push({name: 'catalog'})
        }
    },
    computed: {
        ...mapGetters('user', [
            'userId',
            'accessToken'
        ])
    }
}
</script>

<style>
    .authorization {
        z-index: 1000;
        position: fixed;
        display: flex;
        flex-direction: column;
        align-items:stretch;
        width: 500px;
        left: calc(50% - 250px);
        background-color: rgb(248, 248, 248);
        border-radius: 30px;
    }
    
    input{
        background-color: rgb(238, 238, 238);
        width: 85%;
        padding: 5px;
        border-color:rgb(97, 97, 97);
    }

    .href {
        align-self: flex-end;
        margin-right: 15px;
        color: rgb(0, 0, 255);
        cursor: pointer;
    }
    .href:hover {
        color: rgb(0, 0, 220);
    }
    .href:active {
        color: rgb(0, 0, 180);
    }
    .btn-autorisation
    {
        background-color: #00a2e8;
        color: #ffffff;
        border-color: #00a2e8;
        border-style: solid;
        width: 87.5%;
        padding: 5px;
        align-self: center;
        margin-top: 10px;
        border-radius: 5px;
    }
    .btn-autorisation:active {
        background-color: #0776a6;
        border-color: #0776a6;
        border-style: solid;
    }   

</style>