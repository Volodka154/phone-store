<template >
    <div class="registration">
        <h3>Регистрация</h3>
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
        <button
            @click="onClick">Зарегистрироваться</button>
        <p class="href" @click="onClickEnter">Уже есть аккаунт? Войти</p>
    </div>
</template>

<script>
import axios from "axios";

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
    computed: {},
    methods: {
        onClick() {
            axios.post("http://localhost:8080/api/auth/register", {
                firstName: this.name,
                lastName: this.surname,
                userEmail: this.login,
                userPassword: this.password
            }).then(response => console.log(response))
            .catch(err => console.log(err));
        },
        onClickEnter(){

        }
    }
}
</script>

<style scoped>
    .registration {
        display: flex;
        flex-direction: column;
        align-items:stretch;
        height: 60%;
        width: 40%;
        min-height: 400px;
        background-color: rgb(216, 229, 245);
        border-radius: 20px;
        margin: auto;
    }
.form{
    align-content: center;
}
    .name,
    .surname {
        background-color: rgb(255, 255, 255);
        padding: 5px;
        width: 40%;
        margin: 1.5%;
        border-radius: 10px;
        border:1.5px solid;
    }

    .login,
    .password {
        background-color: rgb(255, 255, 255);
        width: 85%;
        padding: 5px;
        border-radius: 10px;
        border:1.5px solid;
    }

    button {
        width: 85%;
        padding: 5px;
        align-self: center;
        margin-top: 10px;
        background-color: rgb(194, 211, 250);
        border-radius: 10px;
        border:1.5px solid;
    }

    .href {
        align-self: flex-end;
        margin-right: 15px;
        color: blue;

    }

</style>