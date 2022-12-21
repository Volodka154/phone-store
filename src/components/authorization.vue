<template>
    <div class="authorization">
        <p>Вход в личный аккаунт</p>
        <p>
            <input id="login" v-model="login" placeholder="Логин"/>
        </p>
        <p>
            <input id="password" v-model="password" placeholder="Пароль"/>
        </p>
        <button>Войти</button>
        <p class="href">Нет аккаунта? Создать</p>
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
        height: 80%;
        width: 60%;
        min-height: 400px;
        background-color: rgb(248, 248, 248);
    }

    input {
        background-color: rgb(226, 226, 226);
        width: 85%;
        padding: 5px;
    }

    button {
        width: 85%;
        padding: 5px;
        align-self: center;
        margin-top: 10px;
    }

    .href {
        align-self: flex-end;
        margin-right: 15px;
        color: blue;
    }

</style>