<template>
  <div class="app-container">
    <NuxtRouteAnnouncer />
    <NuxtPage />
  </div>
</template>

<style>
/* 全局样式重置 */
html,
body,
#__nuxt {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
}

.app-container {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
