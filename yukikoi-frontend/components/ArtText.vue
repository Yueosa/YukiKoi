<template>
    <div class="art-text">
        {{ text }}
    </div>
</template>


<script setup>
defineProps({
    text: {
        type: String,
        default: 'YukiKoi'
    }
})
</script>


<style scoped>
.art-text {
    position: fixed;
    top: 16px;
    left: 16px;
    z-index: 1000;

    font-weight: bold;
    font-size: 36px;
    color: #ff69b4;

    font-family: "Comic Sans MS", "Segoe Print", cursive, sans-serif;

    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}
</style>
