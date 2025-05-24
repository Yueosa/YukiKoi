<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

    <div class="color-page">
        <NuxtLink to="/" class="back-button" title="返回首页">
            <i class="ri-home-line"></i>
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
.back-button {
    position: fixed;
    top: 1.2rem;
    right: 1.5rem;
    font-size: 1.6rem;
    color: #555;
    z-index: 1000;
    transition: transform 0.2s ease, color 0.2s ease;

    &:hover {
        transform: scale(1.2);
        color: #000;
    }
}

.color-page {
    padding: 2rem;
    background: linear-gradient(to bottom, #fefefe, #eaeaf4);
    font-family: 'Noto Sans JP', sans-serif;

    .title {
        font-size: 2rem;
        text-align: center;
        margin-bottom: 2rem;
        color: #444;
    }

    .color-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 2rem;
        max-width: 960px;
        margin: 0 auto;
    }

    .color-box {
        height: 150px;
        border-radius: 12px;
        color: #fff;
        display: flex;
        align-items: flex-end;
        padding: 1rem;
        position: relative;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);

        .info {
            backdrop-filter: blur(4px);
            background-color: rgba(0, 0, 0, 0.3);
            padding: 0.6rem 1rem;
            border-radius: 6px;
            font-size: 0.85rem;
        }

        .name {
            font-weight: bold;
        }

        .hex {
            font-family: monospace;
        }

        &:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }
    }
}
</style>
