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
        <button class="btn btn-auto">Войти</button>
        <p class="href"
            @click="clickOnCreateAccount">Нет аккаунта? Создать</p>
    </div>
</template>

<script>

export default {
    name: 'authorization',
    props: {},
    data() {
        return {
            login: null,
            password: null
        }
    },
    methods: {
        clickOnCreateAccount() {
            this.$router.push({name: 'registration'})
        },
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
    
    input {
        background-color: rgb(238, 238, 238);
        width: 85%;
        padding: 5px;
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

</style>