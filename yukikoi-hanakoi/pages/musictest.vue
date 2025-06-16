<template>
    <div class="music-player">
        <audio id="bgm" src="/music/mainmusic.m4a" controls autoplay></audio>

        <div class="lyrics-container" ref="container">
            <div v-for="(line, index) in lrcLines" :key="index"
                :class="['lyric-pair', { active: index === currentLineIndex }]"
                :ref="el => { if (index === currentLineIndex) activeElement = el }">
                <div class="japanese">{{ line.ja }}</div>
                <div class="chinese">{{ line.zh }}</div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, nextTick } from 'vue'
const lrcLines = ref([])

const currentLineIndex = ref(-1)
const container = ref(null)
let activeElement = null

onMounted(async () => {
    const res = await fetch('/lyrics/mainmusic.lrc')
    const text = await res.text()

    const lines = text.split('\n').filter(line => line.trim())
    const pattern = /\[(\d+):(\d+\.\d+)](.*)/

    const parsed = []

    for (let i = 0; i < lines.length - 1; i += 2) {
        const matchJa = lines[i].match(pattern)
        const matchZh = lines[i + 1].match(pattern)

        if (matchJa && matchZh) {
            parsed.push({
                time: parseInt(matchJa[1]) * 60 + parseFloat(matchJa[2]),
                ja: matchJa[3].trim(),
                zh: matchZh[3].trim()
            })
        }
    }

    lrcLines.value = parsed

    const audio = document.getElementById('bgm')
    audio.ontimeupdate = () => {
        const t = audio.currentTime

        for (let i = lrcLines.value.length - 1; i >= 0; i--) {
            if (t >= lrcLines.value[i].time) {
                if (currentLineIndex.value !== i) {
                    currentLineIndex.value = i
                    // 自动滚动到当前歌词
                    nextTick(() => {
                        if (activeElement && container.value) {
                            activeElement.scrollIntoView({
                                behavior: 'smooth',
                                block: 'center'
                            })
                        }
                    })
                }
                break
            }
        }
    }
})
</script>

<style scoped>
.music-player {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
    padding: 20px;
    height: 100vh;
}

.lyrics-container {
    max-height: 70vh;
    width: 100%;
    max-width: 800px;
    overflow-y: auto;
    padding: 20px;
    font-size: 20px;
    margin: 0 auto;
    scroll-behavior: smooth;

    /* 自定义滚动条样式 */
    &::-webkit-scrollbar {
        width: 6px;
    }

    &::-webkit-scrollbar-thumb {
        background-color: rgba(0, 170, 255, 0.5);
        border-radius: 3px;
    }
}

.lyric-pair {
    margin-bottom: 24px;
    opacity: 0.5;
    transition: all 0.3s;
    padding: 8px;
    border-radius: 4px;
}

.lyric-pair.active {
    color: #00aaff;
    font-weight: bold;
    opacity: 1;
    transform: scale(1.02);
    background: rgba(0, 170, 255, 0.1);
}

.japanese {
    font-size: 1.2em;
    margin-bottom: 5px;
}

.chinese {
    color: #666;
    font-size: 1em;
}
</style>
