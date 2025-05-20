<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet" />
    </Head>

    <div class="flex h-screen">
        <div class="linebest">
            <a class="button" href="/" @click="currentImage = null">
                <div class="icon">
                    <i class="ri-home-line"></i>
                </div>
                <span>HOME</span>
            </a>
            <a class="button" v-for="i in 9" :key="i" @click="showImage(`IMAGE${i}`)">
                <div class="icon">
                    <i class="ri-image-circle-line"></i>
                </div>
                <span>{{ `IMAGE${i}` }}</span>
            </a>
        </div>
        <div class="image-viewer">
            <img class="preview-image" v-if="currentImage" :src="currentImage" alt="Selected">
            <p v-else class="placeholder-text">请选择左边的图片~</p>
        </div>
    </div>
</template>


<style>
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
    background: linear-gradient(315deg, #dba6a6 0%, #e5f1b6 90%);
}
</style>

<style scoped>
.linebest {
    position: fixed;
    left: 0;
    bottom: 100px;
    z-index: 999;

    width: 50px;
    background-color: #1e1f2b;
    padding: 10px 0;
    border-radius: 0 10px 10px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
    transition: width 0.5s ease;

    a.button {
        text-decoration: none;
    }

    &:hover {
        width: 140px;

        .button span {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .button {
        width: 100%;
        height: 50px;
        display: flex;
        justify-content: left;
        align-items: center;
        padding-left: 10px;
        gap: 10px;
        cursor: pointer;
        color: #b0b0b0;
        transition: background 0.2s;

        &:hover {
            background-color: #2a2b3a
        }

        .icon i {
            font-size: 24px;
        }

        span {
            opacity: 0;
            transform: translateX(-20px);
            transition: all 0.6s ease;
            white-space: nowrap;
            font-size: 16px;
            padding: 5px;
        }
    }

}

.image-viewer {
    position: absolute;
    top: 5%;
    bottom: 5%;
    left: 10%;
    right: 10%;
    display: flex;
    justify-content: center;
    align-items: center;

    .preview-image {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
    }

    .placeholder-text {
        color: #6b7280;
        font-size: 40px;
        text-align: center;
    }
}
</style>


<script setup>
import { ref } from 'vue'

// 当前显示的图片
const currentImage = ref(null)

// 设置图片路径（修复了变量拼接）
const showImage = (imgName) => {
    currentImage.value = `/test-image/${imgName}.webp`
}
</script>
