## 图标预览（来自 Font Awesome 5.15.3）

以下是本项目中可能使用的一些图标：

<span style="font-family: 'Font Awesome 5 Brands'; font-size: 24px;">

| icon                              | describe  |
| --------------------------------- | --------- |
| <i class="fab fa-github"></i>     | GitHub    |
| <i class="fab fa-twitter"></i>    | Twitte    |
| <i class="fab fa-facebook-f"></i> | Facebook  |
| <i class="fab fa-instagram"></i>  | Instagram |
| <i class="fab fa-youtube"></i>    | YouTube   |

</span>

👉 更多图标请参考 [Font Awesome 官网图标库](https://fontawesome.com/v5/search)

---

## 🎨 图标使用说明（SimpleIcons + RemixIcon）

本项目图标来自以下两个优秀的开源图标库：

- [SimpleIcons](https://simpleicons.org)：提供数千个品牌 Logo 图标（如 Bilibili、GitHub、YouTube）
- [RemixIcon](https://remixicon.com)：现代扁平化风格图标，适合 UI 按钮或图形展示

---

### 🔧 使用方式（适用于 Markdown / HTML 页面）

#### ✅ SimpleIcons：品牌 Logo 图标（使用 CDN）

```html
<img src="https://cdn.simpleicons.org/bilibili/FF6699" width="24" alt="Bilibili" />
<img src="https://cdn.simpleicons.org/github/181717" width="24" alt="GitHub" />
<img src="https://cdn.simpleicons.org/youtube/FF0000" width="24" alt="YouTube" />
```

- 结构：`https://cdn.simpleicons.org/图标名/颜色`
- 图标名为英文小写（如 `github`, `bilibili`, `twitter`）
- 可自由指定颜色（如 `FF6699` 粉色）

#### ✅ RemixIcon：轻量 UI 图标（用于按钮、图标组件）

1. 引入 CDN（本地开发也可以下载使用）：

```html
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
```

2. 使用图标类名：

```html
<i class="ri-github-fill" style="font-size: 24px;"></i>
<i class="ri-bilibili-fill" style="font-size: 24px;"></i>
<i class="ri-youtube-fill" style="color: red; font-size: 24px;"></i>
```

- 所有图标类名见：[https://remixicon.com](https://remixicon.com)
- 后缀说明：
  - `-line` 为线框图标（如 `ri-github-line`）
  - `-fill` 为实心图标（如 `ri-github-fill`）

---

### 🧩 推荐用途对比

| 场景           | 推荐图标库     | 说明                          |
|----------------|----------------|-------------------------------|
| 社交链接展示   | SimpleIcons     | 品牌 Logo，视觉统一           |
| 按钮 / UI 图标 | RemixIcon       | 更适合交互型组件，轻量美观     |
| 中文品牌（如知乎） | SimpleIcons + iconfont | 可自定义图标 + 本地 SVG 替代 |

---

🎯 *你可以根据实际场景自由选择组合，亦可本地缓存 SVG 进行离线部署。*
