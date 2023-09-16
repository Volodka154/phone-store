<!-- Компонент отвечающий за серую часть экрана,
на котором появляется модальное авторизации, регистрации и т.д.
Отвечает за логику закрывания модальных окон. -->
<template>
    <div class="exit-back-color1" 
         @click="closeAuthorizationModal"
         ref="modalBackdrop">
        <router-view></router-view>
    </div>
</template>

<script>
export default {
    props: {
        nameOfLink: {
            type: String,
            required: () => true,
        }
    },
    mounted() {
        this.$router.push({
            name: this.nameOfLink,
            query: {
                nameOfProps: this.nameOfLink,
            }
        })
        document.addEventListener("click", this.closeAuthorizationModal);
        document.addEventListener("keydown", this.closeAuthorizationModal);
    },  
    beforeUnmount() {
        document.removeEventListener("click", this.closeAuthorizationModal);
        document.removeEventListener("keydown", this.closeAuthorizationModal);
    },
    methods: {
        closeAuthorizationModal(event) {
            if (event.target === this.$refs.modalBackdrop) {
                this.$router.push('/')
            }
            if (event.code === "Escape") {
                this.$router.push('/')
            }
        }
    }
}
</script>