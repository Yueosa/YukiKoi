<template>
    <div class="main">
        <!-- 小组件部分 -->
        <div class="login">
            <p>小组件部分，还没实现捏~</p>
        </div>

        <!-- 页面主体 -->
        <div class="thebody">
            <!-- 我自己的部分 -->
            <div class="me">
                <div class="myinput">
                    <p>占位</p>
                </div>
                <div class="mymessages">
                    <div v-if="loading" class="md-loading">加载中...</div>
                    <div v-else v-html="renderedHtml" class="md"></div>
                </div>
            </div>
            <!-- 大家留下的部分 -->
            <div class="onther">
                <div class="oninput">
                    <p>占位</p>
                </div>
                <div class="onmessages">
                    <p>cloumns</p>
                </div>
            </div>
        </div>

    </div>
</template>

<style lang="scss" scoped>
.main {

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Font Awesome 5 Brands';
    }

    display: grid;
    grid-template-rows: 10% 1fr;
    height: 100vh;
    width: 100vw;
    background: linear-gradient(315deg, #f7f1f1 0%, #cfd6b2 90%);

    .login {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.9);
    }

    .thebody {
        display: grid;
        grid-template-columns: 1fr 1fr;
        height: 100%;
        width: 100%;
        gap: 24px;
        padding: 21px 5vw;
        box-sizing: border-box;

        .me,
        .onther {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 16px;
            padding: 24px;
            min-width: 0;
            height: 100%;
            display: flex;
            flex-direction: column;
            gap: 16px;
            box-shadow: 0 2px 12px #0001;

            .myinput,
            .oninput {
                display: grid;
                background: rgba(0, 0, 0, 0.2);
                align-items: center;
                justify-content: center;
                border-radius: 16px;
            }

            .mymessages,
            .onmessages {
                display: grid;
                padding: 24px;
                align-items: flex-start;
                justify-content: left;
                flex: 1 1 0;
                min-height: 0;
                overflow-y: auto;
                scrollbar-width: none;
                -ms-overflow-style: none;
                border-radius: 16px;
                background: rgba(0, 0, 0, 0.2);

                &::-webkit-scrollbar {
                    display: none;
                }
            }
        }
    }
}
</style>

<script setup>
import { ref, onMounted } from 'vue'
import MarkdownIt from 'markdown-it'

const loading = ref(true)
const mdText = ref('')
const renderedHtml = ref('')
const error = ref('')

onMounted(async () => {
    try {
        // fetch 后端接口
        const res = await fetch('/api/notes/md')
	// vps 使用 nginx 做了反代处理，所以直接请求，本地测试需要添加http://127.0.0.1:8000/...**
        const json = await res.json()
        console.log('后端返回：', json)

        if (typeof json.content === 'string') {
            mdText.value = json.content
            const md = new MarkdownIt()
            renderedHtml.value = md.render(mdText.value)
            console.log(renderedHtml.value)
        } else if (json.error) {
            error.value = '后端错误' + json.error
        } else {
            error.value = '未知错误：后端不存在 content 和 error'
        }
        loading.value = false
    } catch (err) {
        error.value = '获取失败：' + err
        loading.value = false
    }
})
</script>
