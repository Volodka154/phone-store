<template>
    <div class="registration">
        <p>Регистрация нового пользователя</p>
        <p>
            <input class="name" id="name" v-model="name" placeholder="Имя"/>
            <input class="surname" id="surname" v-model="surname" placeholder="Фамилия"/>
        </p>
        <p>
            <input class="login" id="login" v-model="login" placeholder="Логин"/>
        </p>
        <p>
            <input class="password" id="password" v-model="password" placeholder="Пароль"/>
        </p>
        <button>Зарегистрироваться</button>
        <p class="href">Уже есть аккаунт? Войти</p>
    </div>
</template>

<script>

export default {
    name: 'registration',
    components: {
    },
    props: {},
    data() {
        return {
            name: null,
            surname: null,
            login: null,
            password: null
        }
    },
    conputed: {}
}
</script>

<style scoped>
    .registration {
        display: flex;
        flex-direction: column;
        height: 80%;
        width: 60%;
        min-height: 400px;
        background-color: rgb(248, 248, 248);
        border-radius: 20px;
    }

    .name,
    .surname {
        background-color: rgb(238, 238, 238);
        padding: 5px;
        width: 40%;
        margin: 1.5%;
    }

    .login,
    .password {
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