<template>
    <div class="art-text">
        <i class="ri-poker-hearts-line"></i>
        <i class="ri-home-line"></i>
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
    font-family: "Noto Sans JP";
    letter-spacing: 2px;

    // 提高对比度的渐变：深蓝紫 -> 柔金
    background-image: linear-gradient(135deg, #3e4f7f, #5a9bc6 30%, #f3b969 90%);
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;

    // 柔和阴影，增加可读性但不刺眼
    text-shadow: 1px 1px 4px rgba(80, 100, 140, 0.2);
}
</style>
