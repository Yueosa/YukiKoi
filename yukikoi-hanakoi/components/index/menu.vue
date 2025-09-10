<template>
    <div class="floating-group">
        <div class="group" @click="toggleMenu" :class="{ 'active': isOpen }">
            <MenuIcon />
        </div>
        <div class="button-wrapper" :class="{ 'open': isOpen }">
            <!-- 留言板页面图标 -->
            <a href="/everwhispers" class="button" target="_blank" rel="noopener noreferrer">
                <img src="https://ca.alist.castimage.net:5244/d/synology/otherUser/ycx/YukiKoi/YukiKoi_home_icons/mail-ai-line.png?sign=cGwFsIJvufibU-tsT8GkFaPWKMY0cizPorsFdgPk_ck=:0"
                    alt="">
            </a>
            <!-- 印象色页面图标 -->>
            <a href="/color" class="button">
                <img src="https://ca.alist.castimage.net:5244/d/synology/otherUser/ycx/YukiKoi/YukiKoi_home_icons/dropper-line.png?sign=fCS7FUVXOfPHU54jd-iXAEN-W5Ag7D5-N2gNrkC0B7Y=:0"
                    alt="">
            </a>
            <!-- 博客页面图标 -->
            <a href="https://blog.yeastar.xin/" class="button">
                <img src="https://ca.alist.castimage.net:5244/d/synology/otherUser/ycx/YukiKoi/YukiKoi_home_icons/blogger-line.png?sign=dKeKeWnAx7DtBDfcy41BiJ8KE_dzK4xEF85J5pPHRBM=:0"
                    alt="">
            </a>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import MenuIcon from '@/assets/icons/tent-line.svg'
const isOpen = ref(false)
const toggleMenu = () => isOpen.value = !isOpen.value
</script>

<style scoped lang="scss">
$color-main: #5a9bc6;
$color-bg: rgba(255, 255, 255, 0.6);
$color-border: rgba(90, 155, 198, 0.2);

.floating-group {
    position: fixed;
    top: 3vh;
    right: 3vh;
    z-index: 999;

    .group {
        font-size: 28px;
        color: $color-main;
        cursor: pointer;
        text-align: center;
        transition: opacity 0.3s ease;
        opacity: 0.8;

        &:hover {
            opacity: 1;
        }

        &.active {
            animation: clickPulse 0.3s ease;
        }
    }

    .button-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        margin-top: 0.4rem;
        pointer-events: none;
        opacity: 0;
        transform: translateY(-4px);
        transition: all 0.3s ease;
        visibility: hidden;

        &.open {
            opacity: 1;
            pointer-events: auto;
            transform: translateY(0);
            visibility: visible;
        }
    }

    .button {
        width: 38px;
        height: 38px;
        border-radius: 50%;
        background-color: $color-bg;
        border: 1px solid $color-border;
        display: flex;
        align-items: center;
        justify-content: center;
        color: $color-main;
        font-size: 18px;
        text-decoration: none;
        transition: background-color 0.3s ease;

        &:hover {
            background-color: rgba(255, 255, 255, 0.85);
        }
    }
}

@keyframes clickPulse {
    0% {
        transform: scale(1);
    }

    50% {
        transform: scale(1.2);
    }

    100% {
        transform: scale(1);
    }
}
</style>
