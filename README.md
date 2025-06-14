# YukiKoi

#### ユメアカリ

###### 欢迎来到我的世界，这里没有神，只有我构建的代码、记忆和光

###### ——Sakura

---

## 构建环境说明`yukikoi-frontend`

| 目录/文件            | 作用                          | 举例/说明                                    |
| -------------------- | ----------------------------- | -------------------------------------------- |
| `app.py`             | **Nuxt** 应用的入口点         | 包含全局设置和中间件配置                     |
| `nuxt.config.ts`     | **Nuxt** 配置文件             | 包含模块配置、环境变量、打包选项等           |
| `pages/`             | 页面自动路由目录              | `pages/about.vue` → `/about`                 |
| `components/`        | Vue 组件目录                  | 支持自动导入，无需手动 import                |
| `composables/`       | 可复用的组合式函数            | 存放 Vue3 组合式 API，自动导入               |
| `plugins/`           | Nuxt 插件目录                 | 在应用启动时自动加载的全局功能               |
| `public/`            | 静态资源目录                  | 直接通过网站根路径访问，如 `/favicon.ico`    |
| `assets/`            | 需要编译的资源                | 存放 SCSS、图片等需要构建处理的资源          |
| `server/`            | 服务端相关代码                | API 路由、中间件、数据库连接等               |
| `layouts/`           | 布局模板目录                  | `default.vue` 为默认布局，可创建多个布局模板 |
| `middleware/`        | 路由中间件                    | 页面渲染前执行的导航守卫函数                 |
| `utils/`             | 工具函数目录                  | 存放通用的辅助函数，自动导入                 |
| `.nuxt/`             | Nuxt 内部编译缓存（自动生成） | 包含运行时代码，不要手动修改                 |
| `.output/`           | 编译产物输出目录              | 包含生产环境的静态文件和服务端代码           |
| `tailwind.config.ts` | Tailwind CSS 配置             | 自定义主题、组件样式、响应式断点等           |
| `app.config.ts`      | 运行时配置                    | 定义在运行时可以修改的应用配置               |
| `tsconfig.json`      | TypeScript 配置               | 类型检查和编译选项配置                       |
| `package.json`       | 项目配置文件                  | 依赖管理、脚本命令、项目元信息               |

---
