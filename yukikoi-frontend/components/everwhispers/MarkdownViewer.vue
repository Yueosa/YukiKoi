<template>
    <div class="markdown-viewer">
        <div v-if="loading">🌀 正在加载...</div>
        <div v-else-if="error">⚠️ 加载失败：{{ error }}</div>
        <div v-else v-html="rendered" class="md-content"></div>
    </div>
</template>

<script setup lang="ts">
import { useMarkdown } from '@/composables/useMarkdown';

// 默认使用 notes/md 接口，你也可以传入 props 动态修改
const { loading, error, rendered } = useMarkdown('/api/notes/md')
// const { loading, error, rendered } = useMarkdown('http://127.0.0.1:8000/api/notes/md')
</script>

<style scoped lang="scss">
.markdown-viewer {
    width: 100%;
    height: 100%;
    overflow-y: auto;
    padding: 16px;
}

.md-content {
    line-height: 1.6;
    word-break: break-word;

    h1,
    h2,
    h3 {
        margin-top: 1em;
        margin-bottom: 0.5em;
    }

    pre {
        background: #eee;
        padding: 8px;
        border-radius: 6px;
        overflow-x: auto;
    }

    code {
        background: #eee;
        padding: 2px 4px;
        border-radius: 4px;
    }
}
</style>