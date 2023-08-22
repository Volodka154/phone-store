<!-- Компонент отвечающий за модальное окно регистрации -->
<template>
    <div class="authorization">
        <h3>Регистрация нового пользователя</h3>
        <p>
            <input class="input-class name" 
                   v-model="name" 
                   placeholder="Имя"/>
                   
            <input class="input-class surname" 
                   v-model="surname" 
                   placeholder="Фамилия"/>
        </p>
        <p>
            <input class="input-class login" 
                   v-model="login" 
                   placeholder="Email"/>
        </p>
        <p>
            <input class="input-class password" 
                   v-model="password" 
                   placeholder="Пароль"/>
        </p>
        <button class="btn-autorisation"
                @click="onClick"
                >Зарегистрироваться
        </button>
        <p class="href" 
           @click="clickOnAutorization"
           >Уже есть аккаунт? Войти
        </p>
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
            }).then(response => alert("Успешно зарегистрированы",response))
            .catch(err => alert("Неверно введены данные или такой email уже зарегистрирован!", err));
            this.$router.push({name: 'authorization'})
        },
        clickOnAutorization(){
            this.$router.push({name: 'authorization'})
        },
    }
}
</script>

<style>
.form{
    align-content: center;
}
    .name,
    .surname {
        width: 40%;
        margin: 1.5%;
    }

</style>