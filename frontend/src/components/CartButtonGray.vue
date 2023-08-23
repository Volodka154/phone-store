<!-- Серая копка "В корзину" -->
<template>
    <div class="cart-button-gray">
        <button class="add-button"
                :disabled="true">
            <slot></slot>
        </button>
    </div>
</template>