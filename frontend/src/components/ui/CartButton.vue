<!-- Синяя копка "В корзину" -->
<template>
    <div class="cart-button">
        <button class="add-button"
                :disabled="isDisabled">
            <slot></slot>
        </button>
    </div>
</template>

<script>

export default{
    name: 'cart-button',
    props: {
        isDisabled: {
            type: Boolean,
            default: () => false,
        }
    },
}
</script>
