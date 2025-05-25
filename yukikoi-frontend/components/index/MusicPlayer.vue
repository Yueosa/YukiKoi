<template>
    <div>
        <!-- 音频播放器: 设置为隐藏状态，使用 preload="auto" 预加载音频以确保流畅播放 -->
        <audio ref="audioPlayer" src="/music/mainmusic.m4a" preload="auto"></audio>

        <!-- 歌词显示容器: 仅在音乐播放状态时显示，使用 v-show 优化性能 -->
        <div class="lyrics-container" ref="container" v-show="isPlaying">
            <!-- TransitionGroup: 为歌词切换提供动画效果，使用 tag="div" 包装生成的 DOM -->
            <TransitionGroup name="lyric-transition" tag="div">
                <!-- 歌词行: 仅显示当前播放的歌词，使用计算属性 currentLine -->
                <div v-if="currentLine" :key="currentLineIndex" class="lyric-pair active">
                    <div class="japanese">{{ currentLine }}</div>
                </div>
            </TransitionGroup>
        </div>

        <!-- 音乐控制按钮: 点击切换播放状态，使用动态class控制样式 -->
        <div class="music-control" @click="toggleMusic">
            <i :class="['ri-music-2-line', { 'active': isPlaying }]"></i>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, nextTick, computed } from 'vue'

// 组件状态管理
const audioPlayer = ref(null)        // 音频播放器DOM引用
const lrcLines = ref([])            // 解析后的歌词数组
const currentLineIndex = ref(-1)     // 当前播放的歌词索引
const container = ref(null)          // 歌词容器DOM引用
const isPlaying = ref(false)         // 播放状态标志，默认不播放

/**
 * 计算属性：获取当前应显示的歌词
 * 仅当 currentLineIndex 有效时返回对应的日文歌词
 */
const currentLine = computed(() => {
    return currentLineIndex.value >= 0 ? lrcLines.value[currentLineIndex.value]?.ja : ''
})

/**
 * 切换音乐播放状态
 * 点击时完全停止或从头开始播放
 */
const toggleMusic = () => {
    isPlaying.value = !isPlaying.value
    if (isPlaying.value) {
        // 重新播放时从头开始
        audioPlayer.value.currentTime = 0
        audioPlayer.value.play()
    } else {
        audioPlayer.value.pause()
        currentLineIndex.value = -1  // 重置歌词位置
    }
    localStorage.setItem('musicPlaying', isPlaying.value.toString())
}

/**
 * 初始化音乐播放功能
 * 包括歌词加载、解析和播放状态管理
 */
const initMusic = async () => {
    // 加载歌词
    const res = await fetch('/lyrics/mainmusic.lrc')
    const text = await res.text()

    const lines = text.split('\n').filter(line => line.trim())
    const pattern = /\[(\d+):(\d+\.\d+)](.*)/
    const parsed = []

    for (let i = 0; i < lines.length - 1; i += 2) {
        const matchJa = lines[i].match(pattern)
        if (matchJa) {
            parsed.push({
                time: parseInt(matchJa[1]) * 60 + parseFloat(matchJa[2]),
                ja: matchJa[3].trim()
            })
        }
    }

    lrcLines.value = parsed

    // 检查上次的播放状态
    const lastPlayingState = localStorage.getItem('musicPlaying')
    if (lastPlayingState === 'true') {
        // 3秒后自动播放
        setTimeout(() => {
            isPlaying.value = true
            audioPlayer.value.play()
        }, 3000)
    }

    // 音频时间更新事件处理
    audioPlayer.value.ontimeupdate = () => {
        const t = audioPlayer.value.currentTime
        let foundMatch = false

        // 查找当前时间对应的歌词
        for (let i = 0; i < lrcLines.value.length; i++) {
            if (t < lrcLines.value[i].time) {
                if (currentLineIndex.value !== i - 1) {
                    currentLineIndex.value = i - 1
                }
                foundMatch = true
                break
            }
        }

        // 处理最后一句歌词
        if (!foundMatch && t >= lrcLines.value[lrcLines.value.length - 1].time) {
            currentLineIndex.value = lrcLines.value.length - 1
        }
    }

    // 处理音乐播放结束
    audioPlayer.value.addEventListener('ended', () => {
        // 清空当前歌词
        currentLineIndex.value = -1

        // 5秒后重新播放
        setTimeout(() => {
            if (isPlaying.value) {  // 确保还在播放状态
                audioPlayer.value.currentTime = 0
                audioPlayer.value.play()
            }
        }, 5000)
    })
}

/**
 * 组件挂载时的初始化逻辑
 * 处理首次访问和返回访问的不同逻辑
 */
onMounted(() => {
    // 检查是否是第一次访问
    const hasVisited = localStorage.getItem('hasVisited')
    if (!hasVisited) {
        // 第一次访问，设置标记并开始播放
        localStorage.setItem('hasVisited', 'true')
        localStorage.setItem('musicPlaying', 'true')
        setTimeout(() => {
            isPlaying.value = true
            audioPlayer.value?.play()
        }, 3000)
    } else {
        // 非第一次访问，检查上次的播放状态
        const lastPlayingState = localStorage.getItem('musicPlaying')
        if (lastPlayingState === 'true') {
            setTimeout(() => {
                isPlaying.value = true
                audioPlayer.value?.play()
            }, 3000)
        }
    }

    initMusic()
})
</script>

<style lang="scss" scoped>
/**
 * 歌词容器基础样式
 * 使用固定定位确保在页面滚动时保持位置
 */
.lyrics-container {
    /* 定位相关 */
    position: fixed; // 固定定位，不随页面滚动
    left: 16px; // 左侧边距，与Logo对齐
    top: 80px; // 顶部边距，位于Logo下方
    max-width: 90vw; // 最大宽度，防止超出屏幕
    height: 60vh; // 高度占视口60%

    /* 滚动相关 */
    overflow-y: auto; // 垂直方向可滚动
    padding: 20px; // 内边距，提供空间感

    /* 移动端适配 */
    @media screen and (max-width: 768px) {
        position: fixed; // 保持固定定位
        left: 0; // 取消左偏移，占满宽度
        top: 5vh; // 调整顶部位置
        width: 100%; // 占满容器宽度
        height: auto; // 自适应高度
        max-height: 40vh; // 限制最大高度
        z-index: 1; // 确保不被其他元素遮挡

        /* 移动端歌词样式调整 */
        .lyric-pair {
            font-size: 1.1em; // 稍微减小字体
            padding: 8px; // 减小内边距
            margin: 8px 0; // 减小外边距
        }
    }

    /* 歌词行样式 */
    .lyric-pair {
        font-size: 1.25em; // 设置合适的字体大小
        text-align: left; // 文本左对齐
        padding: 10px; // 内边距
        margin: 10px 0; // 上下外边距
        transition: all 0.3s ease; // 平滑过渡效果

        /* 当前播放歌词样式 */
        &.active {
            color: rgba(89, 132, 158, 0.63); // 特殊颜色标识
            font-weight: bold; // 加粗显示
        }
    }
}

/**
 * 音乐控制按钮样式
 * 固定位置且易于点击
 */
.music-control {
    /* 定位相关 */
    position: fixed; // 固定定位
    top: 3.2vh; // 顶部距离
    right: 10vh; // 右侧距离

    /* 尺寸和形状 */
    width: 40px; // 按钮宽度
    height: 40px; // 按钮高度
    border-radius: 50%; // 圆形形状

    /* 布局相关 */
    display: flex; // 弹性布局
    align-items: center; // 垂直居中
    justify-content: center; // 水平居中

    /* 交互相关 */
    cursor: pointer; // 鼠标指针
    font-size: 30px; // 图标大小
    color: #5a9bc6; // 图标颜色
    transition: all 0.3s ease; // 过渡动画

    /* 悬停效果 */
    &:hover {
        transform: scale(1.1); // 放大效果
    }

    /* 图标样式 */
    i {
        transition: all 0.3s ease; // 图标过渡效果

        /* 激活状态 */
        &.active {
            color: #5a9bc6; // 激活颜色
            transform: scale(1.1); // 放大效果
        }
    }

    /* 移动端适配 */
    @media screen and (max-width: 768px) {
        width: 50px; // 增大点击区域
        height: 50px; // 增大点击区域
        top: 2.5%; // 调整位置
        right: 15%; // 调整位置
        -webkit-tap-highlight-color: transparent; // 禁用点击高亮

        /* 扩大点击区域的透明覆盖层 */
        &::before {
            content: '';
            position: absolute;
            top: -10px;
            right: -10px;
            bottom: -10px;
            left: -10px;
            border-radius: 50%;
        }

        /* 移动端图标大小调整 */
        i {
            font-size: 26px;
        }
    }
}

/**
 * 歌词切换动画
 * 使用贝塞尔曲线实现平滑过渡
 */
.lyric-transition-enter-active,
.lyric-transition-leave-active {
    transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1);
}

/* 进入和离开的动画状态 */
.lyric-transition-enter-from,
.lyric-transition-leave-to {
    opacity: 0;
    transform: translateY(10px);
}

/* 移动端动画距离调整 */
@media screen and (max-width: 768px) {

    .lyric-transition-enter-from,
    .lyric-transition-leave-to {
        transform: translateY(8px); // 减小移动距离
    }
}
</style>
