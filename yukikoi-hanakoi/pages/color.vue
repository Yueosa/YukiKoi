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

/* 页面主容器 */
.color-page {
    height: 100dvh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(315deg, #f6f6f6 0%, #d1cde3 80%);
    padding: 1rem;
    box-sizing: border-box;
    overflow: hidden; // 避免滚动
}

/* 标题样式（可选加玻璃背景） */
.title {
    position: fixed;
    top: 1.5rem;
    left: 1.5rem;
    font-size: clamp(1.5rem, 3vw, 2rem);
    font-family: 'Noto Sans JP', sans-serif;
    color: #444;
    z-index: 1000;
    margin: 0;
    padding: 0.4rem 1rem;
    border-radius: 8px;
}

/* 色卡网格容器 */
.color-grid {
    display: grid;
    place-items: center;
    gap: 2rem;

    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: repeat(2, auto);

    max-width: 800px;
    max-height: 600px;
    width: 100%;
    height: 100%;
    margin: 0 auto;
    padding: 2rem;
    box-sizing: border-box;

    @media (max-width: 768px) {
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(3, auto);
        max-width: 100vw;
        max-height: 500px;
        gap: 1.5rem;
    }
}

.color-box {
    width: 100%;
    max-width: 140px;
    height: 120px;
    border-radius: 12px;
    padding: 1rem;
    display: flex;
    align-items: flex-end;
    justify-content: center;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    background-color: #fff;

    @media (max-width: 768px) {
        max-width: 110px;
        max-height: 100px;
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

        @media (max-width: 768px) {
            font-size: 10px;
        }

        .name {
            font-weight: bold;
        }
    }

    .name,
    .hex {
        margin: 0;
        line-height: 1.2;
    }

    .hex {
        opacity: 0.9;
    }
}
</style>
