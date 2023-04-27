<template>
    <div class="authorization">
        <h3>Вход в личный аккаунт</h3>
        <p>
            <input id="login" v-model="login" placeholder="Email"/>
        </p>
        <p>
            <input id="password" v-model="password" placeholder="Пароль"/>
        </p>
        <button>Войти</button>
        <router-link to="/registration">
            <p class="href">Нет аккаунта? Создать</p>
        </router-link>
        <router-view></router-view>
    </div>
</template>

<script>

export default {
    name: 'authorization',
    components: {
    },
    props: {},
    data() {
        return {
            login: null,
            password: null
        }
    },
    conputed: {}
}
</script>

<style>
    .authorization {

        display: flex;
        flex-direction: column;
        align-items:stretch;
        height: 80%;
        width: 60%;
        min-height: 400px;
        background-color: rgb(248, 248, 248);
        border-radius: 30px;
    }

    input {
        background-color: rgb(238, 238, 238);
        width: 85%;
        padding: 5px;
    }

    button {
        width: 85%;
        padding: 5px;
        align-self: center;
        margin-top: 10px;
        background-color: rgb(201, 201, 201);
    }

    .href {
        align-self: flex-end;
        margin-right: 15px;
        color: blue;
    }

</style>