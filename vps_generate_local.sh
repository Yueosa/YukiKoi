#!/bin/bash
set -e  # 任意命令失败时立即退出

echo "🚀 开始部署 Nuxt + FastAPI..."

# Step 1: 进入前端项目目录
cd ~/YukiKoi/yukikoi-frontend || exit 1

# Step 2: 安装依赖并构建
pnpm install
pnpm generate

# Step 3: 拷贝构建结果
sudo cp -r .output/public/* /var/www/yukikoi/

# Step 4: 后端拉代码并（可选）升级依赖
cd ~/YukiKoi/yukikoi-rearend || exit 1
git pull origin main
# 如果 requirements.txt 有变化可加下面这行
# source /root/.pyenv/versions/3.10.13/envs/YukiKoi/bin/activate && pip install -r requirements.txt

# Step 5: 重启后端服务
echo "🔄 重启 FastAPI 后端服务..."
sudo systemctl restart yukikoi-backend

# Step 6: 重载 nginx（如果配置更新）
echo "🔁 重载 Nginx..."
sudo nginx -t && sudo systemctl reload nginx

# Step 7: 检查服务状态
echo "📡 Nginx 状态："
sudo systemctl status nginx --no-pager
echo "📡 FastAPI 状态："
sudo systemctl status yukikoi-backend --no-pager

echo "✅ 部署完成！访问地址：https://yeastar.xin/"

