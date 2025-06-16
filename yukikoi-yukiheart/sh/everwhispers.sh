#!/bin/bash

# 定义路径
BASE_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")
JSON_PATH="$BASE_DIR/data/everwhispers/messages.json"
STORAGE_DIR="$BASE_DIR/storage/everwhispers"

# 检查JSON文件是否存在
if [ ! -f "$JSON_PATH" ]; then
    echo "❌ 找不到 JSON 文件：$JSON_PATH"
    exit 1
fi

# 检查存储目录是否存在
if [ ! -d "$STORAGE_DIR" ]; then
    echo "❌ 找不到存储目录：$STORAGE_DIR"
    exit 1
fi

echo "📖 正在读取 JSON 文件并提取引用文件..."

# 使用Python作为备选方案处理JSON
get_used_files() {
    python3 -c "
import json, sys
with open('$JSON_PATH', 'r', encoding='utf-8') as f:
    data = json.load(f)
for item in data:
    files = item.get('files', {})
    if files.get('$1'):
        print(files['$1'])
"
}

# 获取所有被引用的文件
USED_IMAGES=$(get_used_files "image")
if [ $? -ne 0 ]; then
    echo "❌ 读取JSON文件失败"
    exit 1
fi
USED_VIDEOS=$(get_used_files "video")
USED_AUDIOS=$(get_used_files "audio")

# 清理函数
clean_directory() {
    local dir=$1
    local used_files=$2
    local type=$3

    echo "🧹 正在扫描未被引用的${type}文件..."
    
    # 检查目录是否为空
    shopt -s nullglob
    local files=("$dir"/*)
    if [ ${#files[@]} -eq 0 ]; then
        echo "📝 ${type}目录为空"
        return
    fi

    local deleted_count=0
    local kept_count=0

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            if ! echo "$used_files" | grep -q "^${filename}$"; then
                echo "🚮 删除未引用${type}：$filename"
                rm "$file"
                ((deleted_count++))
            else
                ((kept_count++))
            fi
        fi
    done

    echo "📊 ${type}统计: 保留 ${kept_count} 个, 删除 ${deleted_count} 个"
}

# 清理各类型文件
clean_directory "$STORAGE_DIR/images" "$USED_IMAGES" "图片"
clean_directory "$STORAGE_DIR/videos" "$USED_VIDEOS" "视频"
clean_directory "$STORAGE_DIR/audios" "$USED_AUDIOS" "音频"

echo "✅ 清理完成"
