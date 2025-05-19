<template>
    <div class="main-container">
        <h1 class="title">这是我的第一个VUE页面</h1>
        <p class="subtitle">
            欢迎来到我的世界，这里没有神，只有我构筑的代码、记忆和光。
        </p>
        <ArtText text="YukiKoi" />
    </div>
</template>


<script setup lang="ts">
import ArtText from '~/components/ArtText.vue'
import BackMain from '~/components/BackMain.vue';
</script>


<style scoped>
.main-container {
    padding: 60px 0 0 100px;
    text-align: center;
    background-color: #fdf6f9;
}

.title {
    font-size: 1.875rem;
    font-weight: bold;
    color: #ec4899;
}

.subtitle {
    margin-top: 1rem;
    color: #555;
}
</style>
