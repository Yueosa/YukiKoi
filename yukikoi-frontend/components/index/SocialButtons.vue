<template>
    <div class="button-group">
        <a class="button" target="_blank"
            href="https://qm.qq.com/cgi-bin/qm/qr?k=O6KD1bt5WDvQw47kzjaDuYIASzar_y-F&jump_from=webapi&authKey=AnF+0ddOwtFY4laf9lDJ9Om7tj5oZE2dfuHJlQfOO2CXaeTOOVdJxlxIg9wSs4WQ">
            <div class="icon">
                <QQIcon />
            </div>
            <span>QQGroup</span>
        </a>
        <a class="button" href="https://x.com/Yosa04942475621">
            <div class="icon">
                <TwitterIcon />
            </div>
            <span>Twitter</span>
        </a>
        <a class="button" href="https://space.bilibili.com/433677987">
            <div class="icon">
                <BiliBiliIcon />
            </div>
            <span>BiliBili</span>
        </a>
        <a class="button" href="https://github.com/Yueosa">
            <div class="icon">
                <GithubIcon />
            </div>
            <span>GitHub</span>
        </a>
        <a class="button" href="mailto:yichengxin7@gmail.com">
            <div class="icon">
                <MailIcon />
            </div>
            <span>Gmail</span>
        </a>
        <a class="button" href="/home">
            <div class="icon">
                <HomeIcon />
            </div>
            <span>Home</span>
        </a>
    </div>
</template>

<script setup>
import QQIcon from '@/assets/icons/qq-line.svg'
import TwitterIcon from '@/assets/icons/twitter-line.svg'
import BiliBiliIcon from '@/assets/icons/bilibili-line.svg'
import GithubIcon from '@/assets/icons/github-line.svg'
import MailIcon from '@/assets/icons/mail-line.svg'
import HomeIcon from '@/assets/icons/home-line.svg'
</script>

<style lang="scss" scoped>
$qq-color: #12B7F5;
$twitter-color: #000;
$bilibili-color: #FB7299;
$github-color: #333;
$gmail-color: #D93025;
$home-color: #5a9bc6;

.button-group {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    padding: 10px;

    /* 移动端适配 */
    @media screen and (max-width: 768px) {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-rows: repeat(2, 1fr);
        gap: 30px;
        width: 100%;
        padding: 20px;
    }

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

            .icon svg {
                fill: #fff;
            }

            span {
                opacity: 1;
                transform: translateX(+10px);
            }
        }

        .icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 60px;
            width: 60px;
            border-radius: 50%;
            transition: all 0.3s ease-out;
            vertical-align: middle;
            transform: translateX(-1px);

            svg {
                width: 26px;
                height: 26px;
                transition: all 0.3s ease-out;
                fill: #333;
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
            vertical-align: middle;
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