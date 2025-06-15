<template>
    <div class="message-card">
        <div class="info">
            <strong>{{ msg.name }}</strong> 说:
            <div class="text">{{ msg.message }}</div>
            <div class="time">🕒 {{ msg.timestamp }}</div>
        </div>
        <div class="media">
            <img v-if="msg.files.image" :src="`/storage/everwhispers/images/${msg.files.image}`" alt="图片"
                class="media-img" />
            <video v-if="msg.files.video" :src="`/storage/everwhispers/videos/${msg.files.video}`" controls
                class="media-video"></video>
            <audio v-if="msg.files.audio" :src="`/storage/everwhispers/audios/${msg.files.audio}`" controls
                class="media-audio"></audio>
        </div>
        <button v-if="admin && showDelete" @click="onDelete">🗑️ 删除</button>
    </div>
</template>

<script setup lang="ts">
import { defineProps, defineEmits } from 'vue';

const props = defineProps<{
    msg: any,
    admin?: boolean,
    showDelete?: boolean
}>()

const emit = defineEmits(['delete'])

const onDelete = () => {
    emit('delete', props.msg.id)
}
</script>

<style scoped lang="scss">
.message-card {
    background: rgba(255, 255, 255, 0.9);
    border-radius: 12px;
    padding: 16px;
    box-shadow: 0 2px 8px #0001;
    margin-bottom: 16px;

    .info {
        .text {
            margin: 8px 0;
        }

        .time {
            font-size: 0.8em;
            opacity: 0.6;
        }
    }

    .media {
        margin-top: 12px;
        display: flex;
        flex-direction: column;
        gap: 8px;

        .media-img {
            max-width: 200px;
        }
    }

    .button {
        margin-top: 12px;
        background: #f44;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        cursor: pointer;
    }
}
</style>
