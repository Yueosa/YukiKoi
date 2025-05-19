
# 🌸 小恋的 SCSS 魔法图鉴 ✨

## 💰 变量魔法 `$`
```scss
$main-color: #ff9bb3;
$padding: 16px;

.container {
  background-color: $main-color;
  padding: $padding;
}
```

## 🧬 父子传承符号 `&`
```scss
.btn {
  color: #000;

  &:hover {
    color: $main-color;
  }

  &.active {
    font-weight: bold;
  }
}
```

## 🌳 树状嵌套术
```scss
.card {
  .title {
    font-size: 20px;
  }

  .content {
    font-size: 16px;

    p {
      margin-bottom: 10px;
    }
  }
}
```

## 🪞 混入术 `@mixin + @include`
```scss
@mixin center {
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  @include center;
}
```

## 📐 计算术 + 运算符
```scss
$base: 8px;

.block {
  padding: $base * 2; // = 16px
}
```

## 🎛️ 条件语法 `@if / @else if / @else`
```scss
$theme: dark;

body {
  @if $theme == dark {
    background: #000;
    color: #fff;
  } @else {
    background: #fff;
    color: #000;
  }
}
```

## 🧠 函数魔法 `@function` & 内置函数
```scss
// 自定义函数
@function double($n) {
  @return $n * 2;
}

p {
  margin: double(10px); // 20px
}

// 内置函数
$light: lighten(#00f, 20%);
```

## 🧩 模块化 `@use` / `@forward`
```scss
// _button.scss
@mixin fancy-button {
  background: pink;
}

// main.scss
@use "button";

.btn {
  @include button.fancy-button;
}
```

## 🐾 实用建议表格

| 功能 | 推荐方式 |
|------|----------|
| 重复样式 | `@mixin` |
| 相同颜色 / 主题变量 | `$变量` |
| 结构清晰 | 嵌套 + `&` |
| 大型项目 | `@use` + 分模块写法 |
