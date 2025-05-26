<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

    <div class="color-page">
        <NuxtLink to="/" class="back-button" title="返回首页">
            <HomeIcon />
        </NuxtLink>
        <h1 class="title">YukiKoi 印象色彩展示</h1>
        <div class="color-grid">
            <div v-for="(color, index) in colors" :key="index" class="color-box"
                :style="{ backgroundColor: color.hex }">
                <div class="info">
                    <p class="name">{{ color.name }}</p>
                    <p class="hex">{{ color.hex }}</p>
                </div>
            </div>
        </div>
    </div>
</template>


<script setup>
import HomeIcon from '@/assets/icons/home-line.svg'
import Home from './home.vue';
const colors = [
    { name: '浅天蓝', hex: '#c5d5f7' },
    { name: '梦幻白', hex: '#f6f6f6' },
    { name: '柔灰紫', hex: '#d1cde3' },
    { name: '花瓣蓝', hex: '#6c90c4' },
    { name: '柔橙黄', hex: '#f3b969' },
    { name: '丝带蓝', hex: '#5a9bc6' }
]
</script>


<style scoped lang="scss">
/* 返回按钮样式 */
.back-button {
    position: fixed;
    top: 1.5rem;
    right: 1.5rem;
    z-index: 1000;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    font-size: 1.8rem;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    color: #555;

    &:hover {
        transform: scale(1.1);
        color: #000;
    }
}

/* 主页面容器 */
.color-page {
    height: 100dvh;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
    background: linear-gradient(315deg, #f6f6f6 0%, #d1cde3 80%);
    padding: 1rem;
    padding-top: 4.5rem;
    box-sizing: border-box;

    /* 使用 grid 布局实现完全居中 */
    display: grid;
    place-items: center;
}

/* 标题样式 */
.title {
    position: fixed;
    top: 1.5rem;
    left: 1.5rem;
    font-size: clamp(1.5rem, 3vw, 2rem);
    font-family: 'Noto Sans JP', sans-serif;
    color: #444;
    z-index: 1000;
    margin: 0;
    padding: 0;
}

/* 色卡网格容器 */
.color-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    max-width: 80vw;
    min-height: calc(100vh - 8rem);
    /* 减去头部和底部空间 */
    padding: 2rem;
    gap: 2rem;

    /* 内容垂直居中 */
    align-content: center;

    @media (max-width: 768px) {
        gap: 1rem;
        padding: 1rem;
        min-height: calc(100vh - 6rem);
    }
}

/* 色卡样式 */
.color-box {
    flex: 0 1 calc(33.333% - 1rem);
    max-width: 100px;
    min-width: 140px;
    height: 120px;
    padding: 1rem;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: flex-end;
    transition: all 0.3s ease;

    @media (min-width: 1024px) {
        flex: 0 1 calc(25% - 1rem); // 4列
        max-width: calc(25% - 1rem);
    }

    @media (max-width: 768px) {
        flex: 0 1 calc(50% - 0.5rem); // 小屏两列
        max-width: calc(50% - 0.5rem);
        height: 100px;
    }

    &:hover {
        @media (min-width: 769px) {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }
    }

    .info {
        background: rgba(0, 0, 0, 0.3);
        backdrop-filter: blur(4px);
        padding: 0.6rem 1rem;
        border-radius: 6px;
        color: #fff;
        font-size: 0.85rem;
        width: 100%;
        display: flex;
        justify-content: space-between;
        font-family: monospace;

        .name {
            font-weight: bold;
        }
    }

    /* 颜色名称和十六进制值 */
    .name,
    .hex {
        margin: 0;
        line-height: 1.2;
    }

    /* 颜色名称 */
    .name {
        font-weight: bold;
    }

    /* 十六进制值 */
    .hex {
        font-family: monospace;
        opacity: 0.9;
    }
}
</style>
