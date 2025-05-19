<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

    <YukiLogo />

    <div class="main">
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
            <a class="button" href="tencent://message/?uin=3197806371&Site=&Menu=yes">
                <div class="icon">
                    <i class="ri-qq-fill"></i>
                </div>
                <span>QQ</span>
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
            <a class="button" href="/test">
                <div class="icon">
                    <i class="ri-home-line"></i>
                </div>
                <span>Home</span>
            </a>
        </div>
    </div>
</template>


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
    background: linear-gradient(315deg, #ffffff 0%, #b6d8fc 90%);
}
</style>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");

$qq-color: #12B7F5;
$twitter-color: #000;
$bilibili-color: #FB7299;
$github-color: #333;
$gmail-color: #D93025;

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
        border: 2px solid #aaa;
        object-fit: cover;
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
            background: $qq-color;
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
            color: $qq-color;
        }
    }
}
</style>


<script setup>
import { Head } from '#components'
import YukiLogo from '~/components/YukiLogo.vue';
</script>
