<template>
    <div class="button-group">
        <a class="button"
            href="https://qm.qq.com/cgi-bin/qm/qr?k=542-vFFNEi71QkHcsy8JIhdixiqwavga&jump_from=webapi&authKey=igZGlTBrzwv+iNr8HkQei0OHZrQtHMw706mXCthQaSd0RsvAFkwNrYPFzgOh2nTU">
            <div class="icon"><i class="ri-qq-fill"></i></div>
            <span>QQGroup</span>
        </a>
        <a class="button" href="https://x.com/Yosa04942475621">
            <div class="icon"><i class="ri-twitter-x-fill"></i></div>
            <span>Twitter</span>
        </a>
        <a class="button" href="https://space.bilibili.com/433677987">
            <div class="icon"><i class="ri-bilibili-fill"></i></div>
            <span>BiliBili</span>
        </a>
        <a class="button" href="https://github.com/Yueosa">
            <div class="icon"><i class="ri-github-fill"></i></div>
            <span>GitHub</span>
        </a>
        <a class="button" href="mailto:yichengxin7@gmail.com">
            <div class="icon"><i class="ri-mail-fill"></i></div>
            <span>Gmail</span>
        </a>
        <a class="button" href="/home">
            <div class="icon"><i class="ri-home-line"></i></div>
            <span>Home</span>
        </a>
    </div>
</template>

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