<template>
    <div class="add-position">
        <div class="h-information">
            <div class="wrap-category">
                <p>Смартфоны</p>
                <div class="category">
                    <p>Категория:</p>
                    <select name="categ" class="category-select">
                        <option value="1">Apple</option>
                        <option value="2">Samsung</option>
                        <option value="3">Huawei</option>
                    </select>
                </div>
            </div>
            <div class="add-new">
                <button class="btn-new">Добавить новую</button>
            </div>
        </div>
        <div class="haract">Характеристики:</div>
        <div class="b-information">
            <form class="form">
                <input class="input" type="text" id="name" placeholder="Название">
                <input class="input description" type="text" id="description" placeholder="Описание">
                <input class="input" type="number" id="count" placeholder="Количество">
                <input class="input" type="number" id="price" placeholder="Цена">
                <input class="input" type="number" id="discount" placeholder="Скидка">
            </form>
            <form class="form">
                <input class="input" type="text" id="photo" placeholder="Загрузить фото">
                <input class="input" type="text" id="model" placeholder="Модель">
                <input class="input" type="number" id="memory" placeholder="Память">
                <input class="input" type="text" id="color" placeholder="Цвет">
                <input class="input" type="number" id="battery" placeholder="Емкость аккумулятора">
                <input class="input" type="number" id="country" placeholder="Страна">
            </form>
        </div>
        <button class="btn-add">Добавить товар</button>
    </div>
</template>

<script>
export default {
    name: 'add-position',
    props: {},
    data() {
        return {}
    },
    conputed: {}
}
</script>

<style scoped>

.add-position {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.h-information {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

.wrap-category {
    display: flex;
    flex-direction: column;
    width: 50%;
    align-items: baseline;
}

.category {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

.category-select {
    width: 20em;
    height: 2em;
    margin-left: 3em;
}

.btn-new {
    background-color: #7f7f7f;
    color: black;
    width: 15em;
    height: 3em;
    border: none;
}

.b-information {
    display: flex;
    flex-direction: row;
    width: 100%;
    height: 20em;
    justify-content: space-between;
}

.form {
    margin-top: 1em;
    display: flex;
    flex-direction: column;
    width: 50%;
    justify-content: space-between;
}

.input {
    color: #7f7f7f;
    height: 2em;
    width: 90%;
}

.description {
    height: 5em;
}

.haract{
    text-align: left;
}

.btn-add {
    background-color: #00A2E8;
    color: black;
    width: 20em;
    height: 2em;
    margin: 1em;
    border: none;
    align-self: center;
}
</style>