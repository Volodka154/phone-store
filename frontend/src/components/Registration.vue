<!-- Компонент отвечающий за модальное окно регистрации -->
<template>
    <div class="authorization">
        <h3>Регистрация нового пользователя</h3>
        <p style="justify-content: space-between; display: flex;">
            <input class="width-45" 
                   v-model="name" 
                   placeholder="Имя"
                   @input="replaceOnEngWords($event, 'name')"/>
            <input class="width-45" 
                   v-model="surname" 
                   placeholder="Фамилия"
                   @input="replaceOnEngWords($event, 'surname')"/>
        </p>
        <p>
            <input v-model="login" 
                   placeholder="Email"/>
        </p>
        <p>
            <input v-model="password" 
                   placeholder="Пароль"/>
        </p>
        <button class="btn-autorisation"
                @click="clickOnRegistration"
                >Зарегистрироваться
        </button>
        <p class="href" 
           @click="clickOnAutorization"
           >Уже есть аккаунт? Войти
        </p>
    </div>
</template>

<script>
import { axiosInstance } from '../index.js'
export default {
    data() {
        return {
            name: null,
            surname: null,
            login: null,
            password: null
        }
    },
    methods: {
        replaceOnEngWords(e, data) {
            e.target.value = e.target.value.replace(/[^A-Za-z]/ig, '')
            this[data] = e.target.value
        },
        clickOnRegistration() {
            axiosInstance.post("/auth/register", {
                firstName: this.name,
                lastName: this.surname,
                userEmail: this.login,
                userPassword: this.password
            })
            .then(response => {
                alert("Успешно зарегистрированы", response)
                this.clickOnAutorization()
            })
            .catch(err => alert("Неверно введены данные или такой email уже зарегистрирован!", err))
        },
        clickOnAutorization() {
            this.$router.push({
                name: 'authorization',
                query: {
                    nameOfProps: 'authorization',
                }
            })
        },
    }
}
</script>