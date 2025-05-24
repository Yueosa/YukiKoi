<template>
    <div class="top">
        <img class="avatar" src="/avatar/icon2.jpg" alt="avatar">
        <div class="info">
            <p>欢迎来到我的世界, 这里没有神, 只有我构筑的代码、记忆和光</p>
            <p>——Sakura</p>
        </div>
    </div>
</template>

<style lang="scss" scoped>
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

    /* 移动端适配 */
    @media screen and (max-width: 768px) {
        flex-direction: column;
        text-align: center;
        padding: 10px;

        .avatar {
            width: 150px;
            height: 150px;
        }

        .info {
            padding: 10px;
            
            p {
                text-align: center;
                font-size: 16px;
            }
        }
    }
}
</style>
