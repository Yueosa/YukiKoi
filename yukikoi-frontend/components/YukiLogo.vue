<template>
    <div class="art-text">
        <i class="ri-poker-hearts-line"></i>
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


<style lang="scss" scoped>
.art-text {
    position: fixed;
    top: 16px;
    left: 16px;
    z-index: 1000;

    font-weight: 900;
    font-size: 42px;
    color: #0077ff3a;

    //font-family: 'Font Awesome 5 Brands';
    //font-family: "Zen Maru Gothic";
    //font-family: "M PLUS Rounded 1c";
    //font-family: "Sawarabi Gothic";
    font-family: "Noto Sans JP";
    letter-spacing: 2px;

    text-shadow: 1px 1px 1px rgb(175, 233, 218);

    background-clip: text;
    background-image: linear-gradient(315deg, #23c4b6 0%, #1276b9 90%);
}
</style>
