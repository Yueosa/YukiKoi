# YukiKoi
ユメアカリ

###### 欢迎来到我的世界，这里没有神，只有我构建的代码、记忆和光
###### ——Sakura

---

## 构建环境说明`yukikoi-frontend`

| 目录/文件 | 作用 | 举例 |
|-|-|-|
| `app.py` | **Nuxt** 应用的入口点 |
| `nuxt.config.ts` | **Nuxt** 配置文件，模块写在这里 |
| `pages/` | 页面自动路由目录 | 创建 `pages/about.vue` 就自动成为 `/about` |
| `.nuxt` | **Nuxt** 内部编译缓存目录（不要动哦~）|
| `package.json` | 项目依赖 & 脚本配置 |
| `components/` | 存放我手写的 `Vue` 组件 |
| `layouts` | 创建 `layouts/default.vue` 才会被 **Nuxt** 识别为布局 |
| `tailwind.config.ts` | 自定义 `Nuxt UI` |
| `.output` | 编译产物输出（仅开发模式下出现） |

---

## 所有配置步骤：

sudo pacman -S pyenv

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

proxychains pyenv install 3.10.13

proxychains pyenv global 3.10.13

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc

echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc 

echo 'eval "$(pyenv init -)"' >> ~/.zshrc 

source ~/.zshrc 

proxychains curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc

echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc

echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc

source ~/.zshrc

nvm install 20

nvm use 20

npm install -g pnpm

proxychains pnpm create nuxt@latest yukikoi-frontend

