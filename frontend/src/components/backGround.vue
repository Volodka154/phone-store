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
    name: 'backGround',
    props: ['nameOfLink'],
    data() {
        return {
        }
    },
    mounted(){
        this.$router.push({ name: this.nameOfLink })
        document.addEventListener("click", this.closeAuthorizationModal);
        document.addEventListener("keydown", this.closeAuthorizationModal);
    },  
    beforeUnmount() {
        document.removeEventListener("click", this.closeAuthorizationModal);
        document.removeEventListener("keydown", this.closeAuthorizationModal);
    },
    methods: {
        closeAuthorizationModal(event){
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

<style>
    /* Затемнение */
    .exit-back-color1:before{
        content: '';
        position:fixed;
        left: 0;
        top: 0;
        width:100%;
        height:100%;
        opacity: 0.7;
        justify-content:center;
        align-items:center;
        background:rgba(120, 120, 120, 0.7);
        z-index:999;
    }

    .authorization {
        z-index: 1000;
        position: fixed;
        display: flex;
        flex-direction: column;
        align-items:stretch;
        width: 500px;
        left: calc(50% - 250px);
        top: 100px;
        background-color: rgb(248, 248, 248);
        border-radius: 30px;
    }

    .input-class {
        background-color: rgb(255, 255, 255);
        padding: 5px;
        border-radius: 5px;
        border: 1.5px solid;
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