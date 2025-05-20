# HTML 学习（以 Nuxt、Vue 的组件化视角）

---

## `<div>` 和 `<span>`

| 标签   | 类型     | 作用             | 常见用途               |
| ------ | -------- | ---------------- | ---------------------- |
| `div`  | 块级元素 | 布局容器、分区   | 卡片、布局块、包裹容器 |
| `span` | 行内元素 | 包裹文本或小组件 | 图标旁的文字           |

```html
<!-- CardComponent.vue -->
<template>
  <div class="card">
    <img src="/avatar.jpg" class="avatar" />
    <span class="username">YukiKoi</span>
  </div>
</template>

<style scoped>
```

---

