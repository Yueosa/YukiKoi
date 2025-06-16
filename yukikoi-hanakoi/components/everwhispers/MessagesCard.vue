<template>
    <div class="message-card">
        <div class="info">
            <strong>{{ msg.name }}</strong> 说:
            <div class="text">{{ msg.message }}</div>
            <div class="time">🕒 {{ msg.timestamp }}</div>
        </div>
        <div class="media">
            <img v-if="msg.files.image" :src="getMediaUrl('images', msg.files.image)" alt="图片" class="media-img" />
            <video v-if="msg.files.video" :src="getMediaUrl('videos', msg.files.video)" controls
                class="media-video"></video>
            <audio v-if="msg.files.audio" :src="getMediaUrl('audios', msg.files.audio)" controls
                class="media-audio"></audio>
        </div>
        <button v-if="admin && showDelete" @click="onDelete">🗑️ 删除</button>
    </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { defineProps, defineEmits } from 'vue';

const getMediaUrl = (type: string, filename: string) => {
    // return `http://localhost:8000/storage/everwhispers/${type}/${filename}`
    return `/storage/everwhispers/${type}/${filename}`
}

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
    background: rgba(255, 255, 255, 0.95);
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    margin-bottom: 24px;
    transition: all 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.05);

    &:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
    }

    .info {
        background: rgba(255, 255, 255, 0.7);
        padding: 16px;
        border-radius: 12px;

        strong {
            color: #2c3e50;
            font-size: 1.1em;
            font-weight: 600;
        }

        .text {
            margin: 16px 0;
            line-height: 1.6;
            color: #34495e;
            font-size: 1.02em;
            background: rgba(255, 255, 255, 0.8);
            padding: 12px;
            border-radius: 8px;
        }

        .time {
            font-size: 0.9em;
            color: #7f8c8d;
            display: flex;
            align-items: center;
            gap: 4px;
            background: rgba(248, 248, 248, 0.8);
            padding: 8px 12px;
            border-radius: 6px;
            width: fit-content;
        }
    }

    .media {
        margin-top: 16px;
        display: flex;
        flex-direction: column;
        gap: 12px;

        .media-img {
            max-width: 100%;
            border-radius: 12px;
            transition: transform 0.3s ease;

            &:hover {
                transform: scale(1.02);
            }
        }

        .media-video {
            max-width: 100%;
            border-radius: 12px;
        }

        .media-audio {
            width: 100%;
            margin-top: 8px;
        }
    }

    button {
        margin-top: 16px;
        background: #ff6b6b;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 0.9em;
        transition: all 0.2s ease;
        display: flex;
        align-items: center;
        gap: 6px;

        &:hover {
            background: #ff5252;
            transform: translateY(-1px);
        }

        &:active {
            transform: translateY(1px);
        }
    }
}
</style>
