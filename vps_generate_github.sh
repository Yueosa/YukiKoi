#!/bin/bash
set -e  # 任意命令失败时立即退出

echo "🔄 开始部署 Nuxt + FastAPI..."

# Step 1: 拉取最新代码
echo "⚛️ 拉取 GitHub 提交..."
cd ~/YukiKoi/ || exit 1
git pull origin main

# Step 2: 构建 Nuxt
echo "⚛️ 构建 Nuxt..."
cd yukikoi-hanakoi || exit 1
pnpm install
pnpm generate

# Step 3: 拷贝构建结果
sudo cp -r .output/public/* /var/www/yukikoi/

# Step 4: 重启后端服务
echo "⚛️ 构建 Python 依赖..."
cd ~/YukiKoi/yukikoi-yukiheart || exit 1
source YukiKoi/bin/activate
pip install -r requirements.txt
echo "🔄 重启 FastAPI 后端服务..."
sudo systemctl restart yukikoi-backend
echo "🔄 重啟 三級域名服务"
sudo systemctl restart everwhispers
sudo systemctl restart streamlit

# Step 5: 重载 nginx（如果配置更新）
echo "🔁 重载 Nginx..."
sudo nginx -t && sudo systemctl reload nginx

# Step 6: 检查服务状态
echo "📡 Nginx 状态："
sudo systemctl status nginx --no-pager
echo "📡 FastAPI 状态："
sudo systemctl status yukikoi-backend --no-pager

echo "✅ Nuxt + FastAPI 已部署完成！访问地址：https://yeastar.xin/"
