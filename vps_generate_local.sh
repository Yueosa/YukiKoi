#!/bin/bash
set -e  # 任意命令失败时立即退出

echo "🚀 开始部署 Nuxt..."

# Step 1: 进入项目目录
cd ~/YukiKoi/yukikoi-frontend || exit 1

# Step 2: 安装依赖并构建
pnpm install
pnpm generate

# Step 3: 拷贝构建结果
sudo cp -r .output/public/* /var/www/yukikoi/

# Step 4: 重载 nginx（如果配置更新）
echo "🔁 重载 Nginx..."
sudo nginx -t && sudo systemctl reload nginx

# Step 5: 检查服务状态
echo "📡 Nginx 状态："
sudo systemctl status nginx --no-pager

echo "✅ Nuxt 已部署完成！访问地址：https://yeastar.xin/"

