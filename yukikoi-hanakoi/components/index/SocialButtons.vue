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
    </div>
</template>

<script setup>
import QQIcon from '@/assets/icons/qq-line.svg'
import TwitterIcon from '@/assets/icons/twitter-line.svg'
import BiliBiliIcon from '@/assets/icons/bilibili-line.svg'
import GithubIcon from '@/assets/icons/github-line.svg'
import MailIcon from '@/assets/icons/mail-line.svg'
</script>

<style lang="scss" scoped>
$qq-color: #12B7F5;
$twitter-color: #000;
$bilibili-color: #FB7299;
$github-color: #333;
$gmail-color: #D93025;

.button-group {
    display: flex; // 默认桌面端：横向排列
    align-items: center; // 垂直居中对齐
    justify-content: center; // 水平居中对齐
    flex-wrap: wrap; // 自动换行（避免超出）
    padding: 10px;

    /* 📱 移动端适配 */
    @media screen and (max-width: 768px) {
        display: flex; // 改用网格布局
        gap: 30px; // 按钮之间的间距
        width: 100%; // 占满屏幕宽度
        padding: 20px; // 内边距，防止贴边

        .button {
            width: 60px !important; // 固定为圆形

            span {
                display: none; // 隐藏文字
            }
        }
    }

    /* 去掉 a 标签默认下划线和颜色 */
    a.button {
        text-decoration: none;
        color: inherit;
    }

    .button {
        display: inline-block;
        height: 60px;
        width: 60px; // 初始为圆形按钮
        margin: 0 12px;
        overflow: hidden; // 隐藏溢出的文字（展开时显示）
        background: #fff;
        border-radius: 50px; // 圆角，保持圆形/椭圆形
        cursor: pointer;
        transition: box-shadow 1s ease, width 0.3s ease-out; // 阴影和宽度过渡效果

        /* 🖱️ 悬停效果 */
        &:hover {
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.1); // 悬停阴影
            width: 200px; // 宽度展开，显示文字

            .icon svg {
                fill: #fff; // 图标变白
            }

            span {
                opacity: 1; // 显示文字
                transform: translateX(+10px); // 文字滑入
            }
        }

        .icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 60px;
            width: 60px; // 固定大小，保证圆形区域
            border-radius: 50%; // 保持圆形
            transition: all 0.3s ease-out;
            vertical-align: middle;
            transform: translateX(-1px);

            svg {
                width: 26px;
                height: 26px;
                transition: all 0.3s ease-out;
                fill: #333; // 默认黑灰色
                transform: translateX(1px);
            }
        }

        span {
            font-size: 20px;
            font-weight: 600;
            line-height: 60px; // 与按钮高度一致，保证垂直居中
            margin-left: 10px;
            opacity: 0; // 默认隐藏文字
            transform: translateX(-30px); // 初始位置在左边
            transition: all 0.5s ease; // 动画过渡
            display: inline-block;
            white-space: nowrap; // 禁止换行
            vertical-align: middle;
        }

        /* 不同按钮悬停时的配色 */
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
    }
}
</style>
