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
            <a class="button" @click="toggleImageSource">
                <div class="icon">
                    <i :class="useLocalImages ? 'ri-hard-drive-line' : 'ri-cloud-line'"></i>
                </div>
                <span>{{ useLocalImages ? '本地模式' : '在线模式' }}</span>
            </a>
            <a class="button" v-for="i in 9" :key="i" @click="showImage(`IMAGE${i}`)">
                <div class="icon">
                    <i class="ri-image-circle-line"></i>
                </div>
                <span>{{ `IMAGE${i}` }}</span>
            </a>
        </div>
        <div class="image-viewer">
            <Transition name="fade" mode="out-in">
                <img class="preview-image" v-if="currentImage" :src="currentImage" :key="currentImage + Date.now()"
                    alt="Selected">
                <p v-else class="placeholder-text">请选择左边的图片~</p>
            </Transition>
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

.fade-enter-active,
.fade-leave-active {
    transition: all 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
    transform: scale(0.98);
}

.fade-enter-to,
.fade-leave-from {
    opacity: 1;
    transform: scale(1);
}
</style>


<script setup>
import { ref } from 'vue'

// 外部图床URL
const imageUrls = {
    IMAGE1: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE1.webp?sign=sIiPcywzss0uV7aVNN2Vw6W2C4AujDPohm9UBF2NHcI=:0',
    IMAGE2: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE2.webp?sign=PB9vmY79T4noYl51v1l03_ibl5ysdxVETIQwLKXsxx0=:0',
    IMAGE3: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE3.webp?sign=9tHH8TxaxJDUYG47Cq0PU6MRqV5nH9qy5OLkbm64ymU=:0',
    IMAGE4: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE4.webp?sign=-wvLIZroHL9UI4K0QEfvY6seFWC8ObfqXlaQwrvv9Ws=:0',
    IMAGE5: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE5.webp?sign=O6rUVjL9MLLb4fvEx-0uVY6Ib7SQ2VJUacGAg5q6pgM=:0',
    IMAGE6: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE6.webp?sign=AfjzXoD5eGg7FLlvHo4n9flZjXFx9_g2Nw3kdn2JJbU=:0',
    IMAGE7: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE7.webp?sign=4VhSr2ht0YBoJzq1Jv15NsfVS4n8wQHACsA2FmOTIw4=:0',
    IMAGE8: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE8.webp?sign=VNEMST-dM9KiiiHeetef70j_rt_iqL-vLfsk-e5fWfM=:0',
    IMAGE9: 'https://ca.alist.castimage.net:5244/d/local/otherUser/ycx/YukiKoi/YukiKoi_home_images/IMAGE9.webp?sign=YsvnZwCxkUFtc2BpJD_n31iJqw3TYppZitnsUpdazrk=:0'
}

// 当前显示的图片
const currentImage = ref(null)
// 是否使用本地图片
const useLocalImages = ref(false)

// 设置图片路径（修复了变量拼接）
const showImage = (imgName) => {
    if (useLocalImages.value) {
        currentImage.value = `/test-image/${imgName}.webp`
    } else {
        currentImage.value = imageUrls[imgName] || null
    }
}

// 切换本地/外链图片样式
const toggleImageSource = () => {
    useLocalImages.value = !useLocalImages.value
    // 切换是清空当前显示
    currentImage.value = null
}

</script>