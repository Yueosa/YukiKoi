<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

    <div>

        <!-- 入场动画 -->
        <div>
            <!--正在施工-->
        </div>

        <!-- 所有UI组件 -->
        <div class="main">
            <YukiLogo />
            <TopProfile />
            <SocialButtons />
        </div>

    </div>

</template>


<!-- 全局CSS样式 -->
<style lang="scss">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Font Awesome 5 Brands';
}

html,
body {
    display: grid;
    height: 100vh;
    width: 100vw;
    place-items: center;
    background: linear-gradient(315deg, #f6f6f6 0%, #d1cde3 80%);
}
</style>

<!-- 添加布局样式 -->
<style lang="scss" scoped>
.main {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 40px;
    width: 100vw;
    height: 100vh;
}
</style>

<script setup>
import { Head } from '#components'
import YukiLogo from '~/components/YukiLogo.vue';
import TopProfile from '~/components/index/TopProfile.vue';
import SocialButtons from '~/components/index/SocialButtons.vue';

</script>
