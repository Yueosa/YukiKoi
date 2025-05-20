<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

    <div>

        <!-- 入场动画 -->
        <div v-if="!loaded" class="loading-screen">
            <div class="pulse-line" :class="{ exit: exiting }"></div>
            <div class="red-line"></div>
            <div class="red-blur-bg"></div>
        </div>

        <!-- 所有UI组件 -->
        <div class="main">
            <YukiLogo />
            <!-- 头像组 -->
            <div class="top">
                <img class="avatar" src="/avatar/userhead_icon.jpg" alt="avatar">
                <div class="info">
                    <p>欢迎来到我的世界, 这里没有神, 只有我构筑的代码、记忆和光</p>
                    <p>——Sakura</p>
                </div>
            </div>
            <!-- 按钮组 -->
            <div class="button-group">
                <a class="button"
                    href="https://qm.qq.com/cgi-bin/qm/qr?k=542-vFFNEi71QkHcsy8JIhdixiqwavga&jump_from=webapi&authKey=igZGlTBrzwv+iNr8HkQei0OHZrQtHMw706mXCthQaSd0RsvAFkwNrYPFzgOh2nTU">
                    <div class="icon">
                        <i class="ri-qq-fill"></i>
                    </div>
                    <span>QQGroup</span>
                </a>
                <a class="button" href="https://x.com/Yosa04942475621">
                    <div class="icon">
                        <i class="ri-twitter-x-fill"></i>
                    </div>
                    <span>Twitter</span>
                </a>
                <a class="button" href="https://space.bilibili.com/433677987">
                    <div class="icon">
                        <i class="ri-bilibili-fill"></i>
                    </div>
                    <span>BiliBili</span>
                </a>
                <a class="button" href="https://github.com/Yueosa">
                    <div class="icon">
                        <i class="ri-github-fill"></i>
                    </div>
                    <span>GitHub</span>
                </a>
                <a class="button" href="mailto:yichengxin7@gmail.com">
                    <div class="icon">
                        <i class="ri-mail-fill"></i>
                    </div>
                    <span>Gmail</span>
                </a>
                <a class="button" href="/home">
                    <div class="icon">
                        <i class="ri-home-line"></i>
                    </div>
                    <span>Home</span>
                </a>
            </div>
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


<!-- 初始化加载动画样式 -->
<style lang="scss" scoped>
.loading-screen {
    position: fixed;
    inset: 0;
    background-color: #0b0f1a;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    overflow: hidden;
    transform: translateZ(0);
    will-change: opacity;

    .pulse-line {
        width: 100vw;
        height: 2px;
        transform: translate3d(0, 0, 0);
        will-change: transform, opacity;

        background: linear-gradient(to right,
                transparent 0%,
                #3fd2ff 0%,
                #3fd2ff 20%,
                #0b0f1a 50%,
                #3fd2ff 80%,
                #3fd2ff 100%);
        box-shadow: 0 0 2px #1d647a;
        animation:
            fadeIn 1s ease-out forwards, // [0ms-1000ms] 淡入 + 进入中间
            flicker 2.5s ease-in-out infinite 1s; // [1000ms起] 呼吸光效

        &.exit {
            animation: exitRight 2s ease forwards; // [4000ms-5000ms] 向右退出 + 渐隐
        }
    }

    @keyframes fadeIn {
        0% {
            opacity: 0;
            transform: translateX(-100%);
        }

        100% {
            opacity: 0.75;
            transform: translateX(0);
        }
    }

    @keyframes flicker {

        0%,
        100% {
            opacity: 0.75;
            box-shadow: 0 0 2px #1d647a;
        }

        50% {
            opacity: 0.9;
            box-shadow: 0 0 4px #3fd2ff;
        }
    }

    @keyframes exitRight {
        from {
            opacity: 0.75;
            transform: translateX(0);
        }

        to {
            opacity: 0;
            transform: translateX(100%);
        }
    }

    .red-line {
        position: absolute;
        top: 50%;
        left: -100%;
        width: 100vw;
        height: 2px;
        background: linear-gradient(to right, #ff6b6b, #ff4c4c);
        box-shadow: 0 0 6px rgba(255, 50, 50, 0.6);
        filter: blur(0.5px);
        animation: redLineIn 1s ease-out 4.8s forwards; // [4500ms-5700ms] 从左滑入，稍快停留在中间30%
    }

    @keyframes redLineIn {
        0% {
            transform: translateX(0);
            opacity: 0;
        }

        100% {
            transform: translateX(30%);
            opacity: 1;
        }
    }

}

.loading-screen,
.pulse-line,
.red-line,
.red-blur-bg {
    // 未来用于红色模糊背景
    transform: translateZ(0);
    will-change: transform, opacity;
    backface-visibility: hidden; // 防止绘制抖动
}
</style>


<!-- UI组件样式 -->
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");

$qq-color: #12B7F5;
$twitter-color: #000;
$bilibili-color: #FB7299;
$github-color: #333;
$gmail-color: #D93025;
$home-color: #5a9bc6;

.main {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 40px;
    width: 100vw;
    height: 100vh;
}

.top {
    display: flex;
    padding: 20px;
    align-items: center;
    gap: 20px;

    .avatar {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        border: 3px solid #bfcce5;
        object-fit: cover;
        box-shadow:
            0 0 12px rgba(175, 180, 200, 0.3),
            0 4px 12px rgba(120, 130, 160, 0.2);
        background: radial-gradient(circle, #f6f6f6 0%, #d1cde3 100%);
        padding: 4px;
    }

    .info {
        padding: 10px 30px;
        color: #000;
        font-weight: bold;

        p {
            text-align: right;
            line-height: 200%;
            font-size: 20px;
        }

    }
}

.button-group {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;

    a.button {
        text-decoration: none;
        color: inherit;
    }

    .button {
        display: inline-block;
        height: 60px;
        width: 60px;
        margin: 0 12px;
        overflow: hidden;
        background: #fff;
        border-radius: 50px;
        cursor: pointer;
        transition: box-shadow 1s ease, width 0.3s ease-out;

        &:hover {
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.1);
            width: 200px;

            .icon i {
                color: #fff;
            }

            span {
                opacity: 1;
                transform: translateX(+10px);
            }
        }

        .icon {
            display: inline-block;
            height: 60px;
            width: 60px;
            text-align: center;
            border-radius: 50px;
            box-sizing: border-box;
            line-height: 60px;
            transition: all 0.3s ease-out;

            i {
                font-size: 25px;
                line-height: 60px;
                transition: all 0.3s ease-out;
            }
        }

        span {
            font-size: 20px;
            font-weight: 600;
            line-height: 60px;
            margin-left: 10px;
            opacity: 0;
            transform: translateX(-30px);
            transition: all 0.5s ease;
            display: inline-block;
            white-space: nowrap;
        }

        &:nth-child(1):hover .icon {
            background: $qq-color;
        }

        &:nth-child(2):hover .icon {
            background: $twitter-color;
        }

        &:nth-child(3):hover .icon {
            background: $bilibili-color;
        }

        &:nth-child(4):hover .icon {
            background: $github-color;
        }

        &:nth-child(5):hover .icon {
            background: $gmail-color;
        }

        &:nth-child(6):hover .icon {
            background: $home-color;
        }

        &:nth-child(1):hover span {
            color: $qq-color;
        }

        &:nth-child(2):hover span {
            color: $twitter-color;
        }

        &:nth-child(3):hover span {
            color: $bilibili-color;
        }

        &:nth-child(4):hover span {
            color: $github-color;
        }

        &:nth-child(5):hover span {
            color: $gmail-color;
        }

        &:nth-child(6):hover span {
            color: $home-color;
        }
    }
}
</style>


<script setup>
import { Head } from '#components'
import YukiLogo from '~/components/YukiLogo.vue';
import { ref, onMounted } from 'vue'

const loaded = ref(false)
const exiting = ref(false)

onMounted(() => {
    // [4000ms] 蓝线开始退出动画（exit class）
    setTimeout(() => {
        exiting.value = true
    }, 4000)

    // [10000ms] 所有动画结束，页面主内容加载
    setTimeout(() => {
        loaded.value = true
    }, 10000)
})

</script>
