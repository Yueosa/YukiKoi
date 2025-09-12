<template>
    <div class="icon-group" :class="{ animate: playIntro }">
        <!-- 留言板页面图标 -->
        <a href="https://ever.yeastar.xin" class="button" target="_blank" rel="noopener noreferrer">
            <img src="https://ca.alist.castimage.net:5244/d/synology/otherUser/ycx/YukiKoi/YukiKoi_home_icons/mail-ai-line.png?sign=cGwFsIJvufibU-tsT8GkFaPWKMY0cizPorsFdgPk_ck=:0"
                alt="everwhispers_icon">
            <p>Ever</p>
        </a>
        <!-- 印象色页面图标 -->
        <a href="/color" class="button" target="_self">
            <img src="https://ca.alist.castimage.net:5244/d/synology/otherUser/ycx/YukiKoi/YukiKoi_home_icons/dropper-line.png?sign=fCS7FUVXOfPHU54jd-iXAEN-W5Ag7D5-N2gNrkC0B7Y=:0"
                alt="color_icon">
            <p>Color</p>
        </a>
        <!-- 博客页面图标 -->
        <a href="https://blog.yeastar.xin/" class="button" target="_blank" rel="noopener noreferrer">
            <img src="https://ca.alist.castimage.net:5244/d/synology/otherUser/ycx/YukiKoi/YukiKoi_home_icons/blogger-line.png?sign=dKeKeWnAx7DtBDfcy41BiJ8KE_dzK4xEF85J5pPHRBM=:0"
                alt="blog_icon">
            <p class="Text">BLog</p>
        </a>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue"

// 模拟信号：刷新页面自动触发动画
const playIntro = ref(false)

onMounted(() => {
    setTimeout(() => {
        playIntro.value = true // 之后改成主页触发（子组件接受主页传来的全局signal）
    }, 300) // 给个延迟，让动画更自然
})
</script>


<style scoped lang="scss">
$color-main: #6c90c4; // 主色调（文字、下划线、hover 效果等用）

.icon-group {
    // 整个图标组固定在右上角
    position: fixed;
    top: 0;
    right: 28px;
    display: flex; // 横向排列
    gap: 12px; // 按钮之间的间距
    z-index: 1000;

    .button {
        // 按钮本体：flex 布局，图标 + 文字水平排列
        display: flex;
        align-items: center; // 垂直居中
        gap: 12px; // 图标和文字之间的间距
        padding: 16px 12px; // 点击区域
        border: none;
        text-decoration: none; // 去掉默认下划线
        color: $color-main;
        font-weight: lighter;

        // ====== 进场动画的初始状态 ======
        opacity: 0; // 初始透明
        transform: translateY(-20px); // 初始上移一点
        transition: opacity 0.6s ease, transform 0.6s ease;
        // ↑ 这里的 transition 专门给进场动画用

        img {
            display: none; // PC 端默认隐藏图标，移动端再显示
        }

        p {
            position: relative; // 方便伪元素绝对定位
            margin: 0;
            font-size: 24px;

            // ====== 下划线伪元素 ======
            &::before {
                content: "";
                position: absolute;
                bottom: 32px; // 下划线与文字保持一定间距（这里是 6px）
                left: 50%; // 下划线初始居中
                width: 80%; // 下划线宽度是文字的 80%
                height: 3px; // 下划线厚度
                background-color: $color-main;

                // 初始状态：缩小为 0
                transform: translateX(-50%) scaleX(0);
                transform-origin: center; // 缩放的基点在中间
                transition: transform 0.15s ease; // 动画更快更灵敏
            }
        }

        // ====== 悬停效果 ======
        &:hover {
            // 按钮整体 hover：轻微上移+放大
            transform: translateY(-4px) scale(1.05);
            transition: transform 0.25s ease;
            // ↑ 注意这里重新声明 transition，避免被进场动画覆盖
        }

        &:hover p::before {
            // 文字下划线展开：从中间向两边展开
            transform: translateX(-50%) scaleX(1);
        }
    }

    // ====== 进场动画控制 ======
    &.animate {
        .button {
            opacity: 1;
            transform: translateY(0); // 回到正常位置
        }

        // 每个按钮依次延迟出现，形成「一个接一个」的效果
        .button:nth-child(1) {
            transition-delay: 0s;
        }

        .button:nth-child(2) {
            transition-delay: 0.2s;
        }

        .button:nth-child(3) {
            transition-delay: 0.4s;
        }
    }

    // ====== 移动端响应式 ======
    @media (max-width: 800px) {
        flex-direction: column; // 垂直排列
        gap: 8px;
        top: 12px;
        right: 12px;

        .button {
            flex-direction: column; // 图标和文字垂直堆叠
            align-items: center;
            padding: 12px 12px;

            img {
                display: block; // 小屏幕显示图标
            }

            p {
                display: none; // 小屏幕隐藏文字
            }
        }
    }
}
</style>
