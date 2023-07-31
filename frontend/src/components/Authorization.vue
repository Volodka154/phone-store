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
            'setUserId',
            'removeUserId',
            'setRefreshToken'
        ]),
        onClick() {
            axios.post('http://localhost:8080/api/auth/login', {
                userEmail: String(this.login),
                userPassword: String(this.password)

            }).then(response => this.nameOnHeader(response))
            .catch(err => alert("Неверно введены данные или такой email уже зарегистрирован!", err));
            
        },
        clickOnCreateAccount() {
            this.$router.push({name: 'registration'})
        },
        nameOnHeader(response){
            const token = response.data.accessToken;
            this.refresh = response.data.refreshToken;
            console.log(this.refresh)
            axios.post('http://localhost:8080/api/auth/refresh', {
               refreshToken: this.refresh
            }).then(response => this.refresh = response)
            .catch(err => alert("Неверно введены данные или такой email уже зарегистрирован!", err));
            console.log('!!!!!!!!!!!!!!!!!!1')
            console.log(this.refresh)
            this.setRefreshToken(this.refresh)
            const [headerBase64, payloadBase64] = token.split('.');

            const header = JSON.parse(atob(headerBase64));
            const payload = JSON.parse(atob(payloadBase64));
            console.log(payload)
            console.log(header);
            this.setUserId(payload.username); //сейчас в токене лежит id и роль, а так же время распада токена
            let i = this.userId
            console.log(i)
            if (payload.roles=='ADMIN'){
                this.setUserId('ADMIN')
            }
            this.$router.push({name: 'catalog', params:{token: this.refresh}})
        }
    },
    computed: {
        ...mapGetters('user', [
            'userId',
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