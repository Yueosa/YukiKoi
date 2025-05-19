# 图标使用指南

## 目录
- [1. Font Awesome 图标](#1-font-awesome-图标)
- [2. SimpleIcons 品牌图标](#2-simpleicons-品牌图标)
- [3. RemixIcon UI图标](#3-remixicon-ui图标)
- [4. 使用场景对比](#4-使用场景对比)

---

## 1. Font Awesome 图标
### 1.1 版本信息
- 当前版本：5.15.3
- 适用场景：通用图标展示

### 1.2 常用图标示例
<span style="font-family: 'Font Awesome 5 Brands'; font-size: 24px;">

| icon                              | describe  |
| --------------------------------- | --------- |
| <i class="fab fa-github"></i>     | GitHub    |
| <i class="fab fa-twitter"></i>    | Twitter   |
| <i class="fab fa-facebook-f"></i> | Facebook  |
| <i class="fab fa-instagram"></i>  | Instagram |
| <i class="fab fa-youtube"></i>    | YouTube   |

</span>

👉 [在 Font Awesome 官网查看更多图标](https://fontawesome.com/v5/search)

---

## 2. SimpleIcons 品牌图标
### 2.1 特点
- 提供数千个品牌 Logo 图标
- 支持 CDN 调用
- 可自定义颜色

### 2.2 使用方式
```html
<img src="https://cdn.simpleicons.org/bilibili/FF6699" width="24" alt="Bilibili" />
<img src="https://cdn.simpleicons.org/github/181717" width="24" alt="GitHub" />
<img src="https://cdn.simpleicons.org/youtube/FF0000" width="24" alt="YouTube" />
```

📝 **使用说明：**
- CDN 链接格式：`https://cdn.simpleicons.org/图标名/颜色`
- 图标名必须小写
- 颜色使用 HEX 格式（如：FF6699）

---

## 3. RemixIcon UI图标
### 3.1 特点
- 现代扁平化风格
- 适合 UI 按钮和界面设计
- 提供线框和实心两种风格

### 3.2 使用方式
1. 引入样式：
```html
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
```

2. 使用图标：
```html
<i class="ri-github-fill" style="font-size: 24px;"></i>
<i class="ri-bilibili-fill" style="font-size: 24px;"></i>
<i class="ri-youtube-fill" style="color: red; font-size: 24px;"></i>
```

📝 **图标风格：**
- `-line`：线框图标
- `-fill`：实心图标

---

## 4. 使用场景对比

| 使用场景 | 推荐图标库 | 说明 |
|---------|------------|------|
| 社交媒体链接 | SimpleIcons | 品牌标识统一，专业度高 |
| 界面交互按钮 | RemixIcon | 风格统一，视觉美观 |
| 通用图标需求 | Font Awesome | 图标丰富，使用简单 |
| 中文平台图标 | SimpleIcons + iconfont | 可结合本地 SVG 使用 |

🎯 **温馨提示：** 可根据具体需求灵活选择图标库，也可以将图标下载到本地使用。
