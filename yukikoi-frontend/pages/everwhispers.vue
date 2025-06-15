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
                    <MarkdownViewer />
                </div>
            </div>
            <!-- 大家留下的部分 -->
            <div class="onther">
                <div class="oninput">
                    <p>占位</p>
                </div>
                <div class="onmessages">
                    <div v-if="loadingMessages">留言加载中...</div>
                    <MessageCard v-for="msg in messages" :key="msg.id" :msg="msg" :admin="true" :showDelete="true"
                        @delete="handleDelete" />
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

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import MarkdownViewer from '@/components/everwhispers/MarkdownViewer.vue'
import MessageCard from '@/components/everwhispers/MessagesCard.vue'
import { getMessages, deleteMessage } from '@/composables/useApi'

const messages = ref<any[]>([])
const loadingMessages = ref(true)

const fetchMessages = async () => {
    loadingMessages.value = true
    const res = await getMessages()
    if (Array.isArray(res)) {
        messages.value = res.reverse() // 倒序展示
    }
    loadingMessages.value = false
}

const handleDelete = async (id: string) => {
    await deleteMessage(id)
    fetchMessages()
}

onMounted(fetchMessages)
</script>
