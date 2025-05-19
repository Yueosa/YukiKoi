<template>

    <Head>
        <!-- RemixIcon CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css">
    </Head>

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
    </div>
</template>


<style>
@import url(https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap);

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

html,
body {
    display: grid;
    height: 100%;
    width: 100%;
    place-items: center;
    background: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
}

.button-group {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    height: 100vh;
    width: 100vw;
}

a.button {
    text-decoration: none;
    color: inherit;
}

.button-group .button {
    display: inline-block;
    height: 60px;
    width: 60px;
    margin: 0 5px;
    overflow: hidden;
    background: #fff;
    border-radius: 50px;
    cursor: pointer;
    transition: box-shadow 1s ease, width 0.3s ease-out;
}

.button-group .button:hover {
    box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.1);
    width: 200px;
}

.button-group .button .icon {
    display: inline-block;
    height: 60px;
    width: 60px;
    text-align: center;
    border-radius: 50px;
    box-sizing: border-box;
    line-height: 60px;
    transition: all 0.3s ease-out;
}

.button-group .button:nth-child(1):hover .icon {
    background: #12B7F5;
}

.button-group .button:nth-child(2):hover .icon {
    background: #000000;
}

.button-group .button:nth-child(3):hover .icon {
    background: #FB7299;
}

.button-group .button:nth-child(4):hover .icon {
    background: #333;
}

.button-group .button:nth-child(5):hover .icon {
    background: #D93025;
}

.button-group .button .icon i {
    font-size: 25px;
    line-height: 60px;
    transition: all 0.3s ease-out;
}

.button-group .button:hover .icon i {
    color: #fff;
}

.button-group .button span {
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

.button-group .button:hover span {
    opacity: 1;
    transform: translateX(+10px);
}

.button-group .button:nth-child(1):hover span {
    color: #12B7F5;
}

.button-group .button:nth-child(2):hover span {
    color: #000000;
}

.button-group .button:nth-child(3):hover span {
    color: #FB7299;
}

.button-group .button:nth-child(4):hover span {
    color: #333;
}

.button-group .button:nth-child(5):hover span {
    color: #D93025;
}
</style>


<script setup>
import { Head } from '#components'
</script>
