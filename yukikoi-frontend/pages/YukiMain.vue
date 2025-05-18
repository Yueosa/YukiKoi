<template>
    <div class="p-6 text-center" style="padding-left: 100px; padding-top: 60px;">
        <h1 class="text-3xl font-bold text-pink-500">这是我的第一个VUE页面</h1>
        <p class="mt-4">欢迎来到我的世界，这里没有神，只有我构筑的代码、记忆和光。</p>
        <ArtText text="YukiKoi" />
    </div>
</template>

<script setup>
    import ArtText from '~/components/ArtText.vue'
</script>

<style scoped>
    /* 暂时不写样式 */
</style>
