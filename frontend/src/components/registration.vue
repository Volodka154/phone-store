<template>
    <div class="registration">
        <h3>Регистрация нового пользователя</h3>
        <p>
            <input class="name" id="name" v-model="name" placeholder="Имя"/>
            <input class="surname" id="surname" v-model="surname" placeholder="Фамилия"/>
        </p>
        <p>
            <input class="login" id="login" v-model="login" placeholder="Email"/>
        </p>
        <p>
            <input class="password" id="password" v-model="password" placeholder="Пароль"/>
        </p>
        <button>Зарегистрироваться</button>
        <router-link to="/authorization">
            <p class="href">Уже есть аккаунт? Войти</p>
        </router-link>
        <router-view></router-view>
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
        align-items:stretch;
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