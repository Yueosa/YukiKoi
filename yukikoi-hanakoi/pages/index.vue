<template>

    <Head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

    <div class="page-container">
        <!-- 入场动画 -->
        <div>
            <!--正在施工-->
        </div>

        <!-- 所有UI组件 -->
        <div class="main">
            <YukiLogo />
            <RightTop />
            <MusicPlayer />
            <TopProfile />
            <SocialButtons />
        </div>
    </div>
</template>

<style lang="scss" scoped>
// 首先重置所有默认样式
:global(html),
:global(body) {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    overflow: hidden; // 防止出现滚动条
}

.page-container {
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Font Awesome 5 Brands';
    }

    position: fixed; // 改为固定定位
    top: 0;
    left: 0;
    width: 100%; // 使用百分比而不是 vw
    height: 100%; // 使用百分比而不是 vh
    background: linear-gradient(315deg, #f6f6f6 0%, #d1cde3 80%);
    overflow-x: hidden; // 防止水平滚动

    .main {
        position: relative; // 改为相对定位
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 40px;
    }
}
</style>

<script setup>
import { Head } from '#components'
import YukiLogo from '~/components/YukiLogo.vue';
import TopProfile from '~/components/index/TopProfile.vue';
import SocialButtons from '~/components/index/SocialButtons.vue';
import RightTop from '~/components/index/menu.vue'
import MusicPlayer from '~/components/index/MusicPlayer.vue'

</script>
